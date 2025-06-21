{...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initContent = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      source $HOME/.zshrc
    '';
    autocd = true;
    # zprof.enable = true;
    dotDir = ".config/zsh";

    # completion = {
    #   enable = true;
    #   autoUpdate = true;
    #   cache = {
    #     enable = true;
    #     path = ".zsh/cache";
    #   };
    # };
    # history = {
    #   enable = true;
    #   size = 100000;
    #   file = ".zsh/history";
    #   options = [
    #     "append"
    #     "share"
    #     "extended"
    #     "ignoredups"
    #     "ignorespace"
    #   ];
    # };
    # promptInit = ''
    #   autoload -U promptinit; promptinit
    #   prompt starship
    # '';
    # extraConfig = ''
    #   # enable zsh completion for kubectl
    #   fpath+=${config.programs.kubectl.package}/share/zsh/site-functions
    #   autoload -U compinit && compinit
    #   # enable zsh completion for git
    #   fpath+=${config.programs.git.package}/share/zsh/site-functions
    #   autoload -U compinit && compinit
    #   # enable zsh completion for yazi
    #   fpath+=${config.programs.yazi.package}/share/zsh/site-functions
    #   autoload -U compinit && compinit
    #   # enable zsh completion for eza
    #   fpath+=${config.programs.eza.package}/share/zsh/site-functions
    # '';
    # extraSessionVariables = {
    #   EDITOR = "nvim";
    #   VISUAL = "nvim";
    #   MANPAGER = "glow";
    #   PAGER = "glow";
    #   GIT_EDITOR = "nvim";
    #   GIT_PAGER = "glow";
    #   GIT_CONFIG_GLOBAL = "${config.home.homeDirectory}/.config/git/config";
    #   GIT_CONFIG_SYSTEM = "${config.home.homeDirectory}/.config/git/system";
    #   GIT_CONFIG_WORK = "${config.home.homeDirectory}/work/.gitconfig";
    #   GIT_CONFIG_GLOBAL_WORK = "${config.home.homeDirectory}/.config/git/work/config";
    #   GIT_CONFIG_SYSTEM_WORK = "${config.home.homeDirectory}/.config/git/work/system";
    #   GIT_CONFIG_GLOBAL_PERSONAL = "${config.home.homeDirectory}/.config/git/personal/config";  
    # };
    # extraSessionFiles = [
    #   "${config.home.homeDirectory}/.config/zsh/aliases.zsh"
    #   "${config.home.homeDirectory}/.config/zsh/functions.zsh"
    # ];
  };

  # home.file.".zshenv".enable = false;

  home.shellAliases = {
    k = "kubectl";

    urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
    urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
  };
}
