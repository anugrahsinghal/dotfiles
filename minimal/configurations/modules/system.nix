{ pkgs, username, ... }:

###################################################################################
#
#  macOS's System configuration
#
#  All the configuration options are documented here:
#    https://daiderd.com/nix-darwin/manual/index.html#sec-options
#
###################################################################################
{
  system = {
    primaryUser = username; # TODO
    stateVersion = 5;
    # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
    # activationScripts.postUserActivation.activateSettings.text = ''
    activationScripts.activateSettings.text = ''
      	# activateSettings -u will reload the settings from the database and apply them to the current session,
              # so we do not need to logout and login again to make the changes take effect.
              defaults write -globalDomain NSStatusItemSelectionPadding -int 1
              defaults write -globalDomain NSStatusItemSpacing -int 2
              # revert it
              #defaults -currentHost delete -globalDomain NSStatusItemSelectionPadding
              #defaults -currentHost delete -globalDomain NSStatusItemSpacing
      	
      	# Trackpad: swipe between pages with three fingers
      	defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerHorizSwipeGesture -int 1
      	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 1

              /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
      	# Enable App Exposé
      	defaults write com.apple.dock showAppExposeGestureEnabled -bool true
      	killall Dock
    '';

    defaults = {
      #CustomSystemPreferences = {
      #"com.apple.trackpad" = {
      #	scaling = 2;
      #	"threeFingerHorizSwipeGesture" = 1;
      #	"threeFingerTapGesture" = 2;
      #};
      #"com.apple.driver.AppleBluetoothMultitouch.trackpad" = {
      #	TrackpadThreeFingerHorizSwipeGesture = 1;
      #	TrackpadThreeFingerTapGesture = 2;
      #	TrackpadThreeFingerVertSwipeGesture = 3;
      #};
      # manual steps - TODO - figure out
      # defaults read com.apple.driver.AppleBluetoothMultitouch.trackpad
      #    TrackpadThreeFingerHorizSwipeGesture = 1;
      #    TrackpadThreeFingerVertSwipeGesture = 3;
      #"NSGlobalDomain" = {
      #	NSStatusItemSelectionPadding = 1;
      #	NSStatusItemSpacing = 2;
      #};
      #};
      # menuExtraClock.Show24Hour = true;  # show 24 hour clock
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        ApplePressAndHoldEnabled = false;
        AppleMeasurementUnits = "Inches";
        AppleMetricUnits = 1;
        KeyRepeat = 2;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        _HIHideMenuBar = true;
        "com.apple.mouse.tapBehavior" = 1;
        "com.apple.trackpad.enableSecondaryClick" = true;
        "com.apple.trackpad.forceClick" = false;
        "com.apple.trackpad.scaling" = 2.0;
        AppleEnableSwipeNavigateWithScrolls = true;
        AppleKeyboardUIMode = 2;
      };
      alf = {
        allowdownloadsignedenabled = 1;
        allowsignedenabled = 1;
      };
      trackpad = {
        TrackpadThreeFingerTapGesture = 2;
      };

      # other macOS's defaults configuration.
      # ......
      dock = {
        autohide = true;
        orientation = "right";
        persistent-apps = [
          #{app = "/Applications/<>.app"}
          { app = "/Applications/Google Chrome.app"; }
          { app = "/Applications/Brave Browser.app"; }
          { app = "/Applications/Slack.app"; }
          { app = "/Applications/iTerm.app"; }
        ];
        show-process-indicators = true;
        show-recents = false;
        wvous-br-corner = 1;
        tilesize = 42;
      };
      finder = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
        FXDefaultSearchScope = "SCcf";
        FXPreferredViewStyle = "clmv";
        QuitMenuItem = true;
        ShowPathbar = true;
        ShowStatusBar = true;
      };
      menuExtraClock = {
        ShowDayOfMonth = false;
      };

    };
  };

  # Add ability to used TouchID for sudo authentication
  security.pam.services.sudo_local.enable = true;
  security.pam.services.sudo_local.touchIdAuth = true;
  # Create /etc/zshrc that loads the nix-darwin environment.
  # this is required if you want to use darwin's default shell - zsh
  # programs.zsh.enable = true;

}
