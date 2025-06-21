{pkgs, ...}: {
  home.packages = with pkgs; [
  #   # archives
  #   zip
  #   xz
  #   unzip
  #   p7zip

  #   # utils
    ripgrep # recursively searches directories for a regex pattern
  #   jq # A lightweight and flexible command-line JSON processor
  #   yq-go # yaml processer https://github.com/mikefarah/yq
    fzf # A command-line fuzzy finder
    uv # manage python virtual environments
    fd # A simple, fast and user-friendly alternative to 'find'
    bat # A cat clone with wings, syntax highlighting, and Git integration

  #   aria2 # A lightweight multi-protocol & multi-source command-line download utility
  #   socat # replacement of openbsd-netcat
  #   nmap # A utility for network discovery and security auditing

    # misc
    cowsay
    zoxide
    atuin
    direnv
  #   file
  #   which
    tree
  #   gnused
  #   gnutar
  #   gawk
  #   zstd
  #   caddy
  #   gnupg

  #   # productivity
    glow # markdown previewer in terminal
  ];

  programs = {
    # modern vim
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
      viAlias = true;
      withPython3 = true;
    };

    # A modern replacement for ‘ls’
    # useful in bash/zsh prompt, not in nushell.
    eza = {
      enable = true;
      git = true;
      icons = "auto";
      enableZshIntegration = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    atuin = {
      enable = true;
      enableZshIntegration = true;
      flags = [
        "--disable-up-arrow"
        "--disable-ctrl-r"
      ];
    };

    # terminal file manager
    # yazi = {
    #   enable = true;
    #   enableZshIntegration = true;
    #   settings = {
    #     manager = {
    #       show_hidden = true;
    #       sort_dir_first = true;
    #     };
    #   };
    # };

    # skim provides a single executable: sk.
    # Basically anywhere you would want to use grep, try sk instead.
    #skim = {
    #  enable = true;
    #  enableBashIntegration = true;
    #};
  };
}
