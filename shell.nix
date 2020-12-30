{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  inherit (lib) optional optionals;
in

mkShell {
  buildInputs = [ elixir git postgresql ]
                ++ optional stdenv.isLinux libnotify # For ExUnit Notifier on Linux.
                ++ optional stdenv.isLinux inotify-tools; # For file_system on Linux.
  shellHook = ''
      export PGDATA="$PWD/db"
    '';
}