{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./common.nix
  ];

  home.packages = with pkgs; [
    go
  ];

  home.shellAliases = {
    home-manager-switch = "cd ~/.config/minimal;git add .;sudo nix run . -- switch --flake .#work;cd -";
    rbrew = "/opt/homebrew/bin/brew";
  };

  programs.zsh = {
    initContent = ''
      # cusom sudo function 
      function sudo() {
        admin=$(groups | grep -q -w admin &> /dev/null)
        if [ $? -ne 0 ]; then
              echo "custom sudo elevate"
              jamfconnect acc-promo --elevate
        fi
        /usr/bin/sudo "$@"
      }
    '';
  };

}
