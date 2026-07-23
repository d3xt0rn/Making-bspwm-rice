.PHONY: backup install forceInstall help

HOME_DIR   := $(HOME)
CONFIG_DIR := $(HOME)/.config
CP         := cp

backup:
	@if [ ! -d "$(CONFIG_DIR)/.git" ]; then \
		cd "$(CONFIG_DIR)" && git init; \
	fi
	cd "$(CONFIG_DIR)" && \
	git add . && \
	git diff --cached --quiet || git commit -m "backup"
	@if [ -f "$(HOME_DIR)/.xinitrc" ]; then \
		$(CP) "$(HOME_DIR)/.xinitrc" "$(HOME_DIR)/.xinitrc.bak"; \
	fi

install:
	$(CP) -rn ./home/. "$(HOME_DIR)"
	$(CP) -rn ./config/. "$(CONFIG_DIR)"

forceInstall:
	$(CP) -rf ./home/. "$(HOME_DIR)"
	$(CP) -rf ./config/. "$(CONFIG_DIR)"

help:
	@echo "Available commands:"
	@echo "  backup       - Backup ~/.config into a git repository and save ~/.xinitrc"
	@echo "  install      - Install configs without overwriting existing files"
	@echo "  forceInstall - Install configs and overwrite existing files"
