{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initContent = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      source $HOME/.zshrc
      
      source $HOME/.atuin.zsh
      source "$HOME/.iterm2_shell_integration.zsh"
    '';
    autocd = true;
    # zprof.enable = true;
    dotDir = ".config/zsh";
  };

  # to remove the this you can add a line in ~/.zshenv to `source ${dotDir}/.zshenv`
  home.file = {
    ".atuin.zsh".source = ../../assets/common/.atuin.zsh;
    ".iterm2_shell_integration.zsh".source = ../../assets/common/.iterm2_shell_integration.zsh;
  };

  home.shellAliases = {
    k = "kubectl";

    urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
    urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";

    home-manager-edit = "code ~/.config ~/.config/{flake,{configurations,homes}/{common,work}}.nix";
  };
}
