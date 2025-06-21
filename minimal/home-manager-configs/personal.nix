{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./common.nix
  ];

  home.packages = with pkgs; [
    jdk21
    go
    graphviz
    ollama
    python311
  ];
}