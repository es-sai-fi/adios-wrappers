{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    adios.url = "github:llakala/adios/providers-and-consumers"; # My personal branch, adding callable impls and mutators
  };

  outputs = inputs: {
    wrapperModules = import ./default.nix {
      adios = inputs.adios;
    };
  };
}
