{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./modules/apps.nix
    ./modules/host-users.nix
    ./modules/nix-core.nix
    ./modules/system.nix
  ];

  # system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # nixpkgs.config.allowUnfree = true;
}