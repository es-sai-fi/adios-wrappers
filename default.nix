# If you're using npins, do `adiosPath = sources.adios.outPath;
# If you're using flakes, don't worry about it - this file will be called
# automaticlaly
{ pkgs, adiosPath }:

let
  adios = (import "${adiosPath}/default.nix").adios;

  importModules = import "${adiosPath}/adios/lib/importModules.nix" {
    # Add my custom types
    adios = adios // rec {
      types = adios.types // {
        null = types.typedef "null" isNull;
        pathLike = types.union [
          types.path
          types.derivation
          types.string
        ];
      };
    };
  };

  root = {
    name = "root";
    modules = importModules ./modules;
  };

  tree = (adios root).eval {
    options = {
      "/nixpkgs" = {
        inherit pkgs;
      };
    };
  };
in
# We have each wrapper `foo` point to all its options, so you can do
# `(import ./wrappers {}).foo.some-option`
tree.root.modules
