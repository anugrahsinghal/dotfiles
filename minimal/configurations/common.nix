{
  pkgs,
  inputs,
  ...
}: {
  imports = with pkgs; [
    ./../modules/nix-core.nix
    ./../modules/system.nix
    ./../modules/apps.nix

    ./../modules/host-users.nix
  ];

  # system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # nixpkgs.config.allowUnfree = true;
}