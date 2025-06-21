{
  pkgs,
  inputs,
  nixpkgs,
  ...
}: {
  imports = [
    ./common.nix
  ];

  # managed by determinate nix
  # environment.variables = {
  #   NIX_SSL_CERT_FILE = "/Users/alex/.config/private/okta.pem";
  # };
  
}