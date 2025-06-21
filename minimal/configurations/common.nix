{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./modules/default.nix
  ];

  # causes error - so remove for now
  # system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  nixpkgs.config.allowUnfree = true;
}