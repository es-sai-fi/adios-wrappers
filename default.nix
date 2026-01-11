# If you're using npins, do `adiosPath = sources.adios.outPath;
# If you're using flakes, don't worry about it - this file will be called
# automaticlaly
{ adios }:

let
  adiosLib = (import "${adios}/default.nix").adios;

  importModules = import "${adios}/adios/lib/importModules.nix" {
    # Add my custom types
    adios = adiosLib // rec {
      types = adiosLib.types // {
        null = types.typedef "null" isNull;
        pathLike = types.union [
          types.path
          types.derivation
          types.string
        ];
      };
    };
  };
in
importModules ./modules
