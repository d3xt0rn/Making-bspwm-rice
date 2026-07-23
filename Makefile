.PHONY: backup install forceInstall help

CONFIG_DIR := $(HOME)/.config

backup:
	cd "$(CONFIG_DIR)" && \
	git init && \
	git add . && \
	git commit -m "backup"

install:
	cp -rn . "$(CONFIG_DIR)"

forceInstall:
	cp -rf . "$(CONFIG_DIR)"

help:
	@echo "Commands:"
	@echo "  backup       - Backup ~/.config into git"
	@echo "  install      - Copy configs without overwriting"
	@echo "  forceInstall - Copy configs and overwrite existing files"
