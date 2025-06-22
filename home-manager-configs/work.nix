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
    home-manager-switch = "cd ~/.config;git add .;sudo nix run . -- switch --flake .#work;cd -";
    rbrew = "/opt/homebrew/bin/brew"; # real brew to bypass ocm brew
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
    dotDir = ".zsh-config-hm";
    oh-my-zsh.enable = lib.mkForce false; # disable oh-my-zsh on work machine
  };


  home.file = {
    # to remove the this you can add a line in ~/.zshenv to `source ${dotDir}/.zshenv`
    # we will use this to source the zshenv file manually in our config
    ".zdotdir".text = ''
      export HM_ZDOTDIR="$HOME/${config.programs.zsh.dotDir}"
    '';
    # add these lines to your ~/.zshrc
    # source ~/.zdotdir
    # source $HM_ZDOTDIR/.zshenv

    # disable the default zshenv file created by home-manager and go manually source it in our config
    ".zshenv".enable = false;
  };


}
