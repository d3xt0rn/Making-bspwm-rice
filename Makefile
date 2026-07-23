.PHONY: backup install forceInstall help

CONFIG_DIR := $(HOME)/.config
HOME_DIR := $(HOME)

backup:
	cd "$(CONFIG_DIR)" && \
	git init && \
	git add . && \
	git commit -m "backup" && \
	cp $HOME/.xinitrc $HOME/.xinitrc.bak

install:
	cp -rn home/* "$(HOME_DIR)" && \
	cp -rn config/* "$(CONFIG_DIR)"

forceInstall:
	cp -rf home/* "$(HOME_DIR)" && \
	cp -rf config/* "$(CONFIG_DIR)"

help:
	@echo "Commands:"
	@echo "  backup       - Backup ~/.config into git and and copy your ~/.xinitrc as ~/.xinitrc.bak"
	@echo "  install      - Copy configs without overwriting"
	@echo "  forceInstall - Copy configs and overwrite existing files"
