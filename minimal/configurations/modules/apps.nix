{ pkgs, ...}: {

  ##########################################################################
  #
  #  Install all apps and packages here.
  #
  #  NOTE: Your can find all available options in:
  #    https://daiderd.com/nix-darwin/manual/index.html
  #
  # TODO Fell free to modify this file to fit your needs.
  #
  ##########################################################################

  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  environment.systemPackages = with pkgs; [
    # git - work needs homebrew git

    # essentials
    
    comma
    jq

    # extra tools
    tldr
    httpie
    cowsay
    tree
    spacer
  ];

  # TODO To make this work, homebrew need to be installed manually, see https://brew.sh
  #
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      # cleanup = "zap";
    };

    taps = [
#"atko-eng/private"
"aws/aws"
"cirruslabs/cli"
"codecrafters-io/tap"
"hmarr/tap"
"mvndaemon/mvnd"
"pirj/noclamshell"
"sourcegraph/src-cli"
"zkondor/dist"    
];

    # `brew install`
    # TODO Feel free to add your favorite apps here.
    brews = [
      # "aria2"  # download tool
"ansifilter"
"awscli"
"awscli-local"
"bash-completion"
"bazelisk"
"btop"
"cirruslabs/cli/tart"
"cmake"
"codecrafters-io/tap/codecrafters"
"coreutils"
"cpanminus"
"difftastic"
"fastfetch"
"fnm"
"gh"
"gnu-tar"
"gnupg"
"helm"
"hmarr/tap/codeowners"
"k9s"
"kubernetes-cli"
"lima"
"lnav"
"make"
"mtr"
"nethack"
"perl"
"pinentry-mac"
"pirj/noclamshell/noclamshell"
"pre-commit"
"python-packaging"
#"python-yq" - yq conflict
"shunit2"
"sourcegraph/src-cli/src-cli"
"sysbench"
"terraform"
"watch"
    ];

    # `brew install --cask`
    # TODO Feel free to add your favorite apps here.
    casks = [
"alt-tab"
"betterdisplay"
"brave-browser"
"chipmunk"
"fastdmg"
"hidock"
"iina"
"iterm2"
"itsycal"
"jetbrains-toolbox"
"lens"
"meetingbar"
"raycast"
"scroll-reverser"
"shottr"
"staruml"
"stats"
"visual-studio-code"
"visual-studio-code@insiders"
#"whatsapp" # - blocked in okta network
"whisky"
"zettlr"
"znotch"      
    ];
  };
}
