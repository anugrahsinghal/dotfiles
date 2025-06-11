# please change 'hostname' to your hostname
# ln -sf /etc/zsh/zshrc_local ~/.zshrc
# chown $(whoami):staff ~/.zshrc
deploy:
	nix build .#darwinConfigurations.F50DGCVW7C.system

	./result/sw/bin/darwin-rebuild switch --flake .#F50DGCVW7C
