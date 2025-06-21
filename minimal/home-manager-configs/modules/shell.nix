{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initExtraBeforeCompInit = ''
      # shell speed optimizations
      for profile in ''${(z)NIX_PROFILES}; do
        fpath[$fpath[(i)$profile/share/zsh/site-functions]]=()
        fpath[$fpath[(i)$profile/share/zsh/$ZSH_VERSION/functions]]=()
        fpath[$fpath[(i)$profile/share/zsh/vendor-completions]]=()
      done
    '';
    initContent = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"

      eval "$(/opt/homebrew/bin/brew shellenv)"

      source $HOME/.atuin.zsh
      source $HOME/.iterm2_shell_integration.zsh

      source $HOME/.zshrc
    '';
    autocd = true;
    # zprof.enable = true;
    oh-my-zsh.enable = true; # over-ridden to false in work
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
