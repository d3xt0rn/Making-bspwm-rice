backup:
	cd $$HOME/.config/;
	git init;
	git add . ;
	git commit -m "backup";

install:
	cp ./ $$HOME/.config/

forseInstall:
	cp -f ./ $$HOME/.config/

help:
	@echo "Cmd list:"
	@echo "backup < Pls run this before installing if you dont wana lost your configs"
	@echo "install < copy configs to $$HOME/.config/"
	@echo "forseInstall < replase configs in $$HOME/.config/"
