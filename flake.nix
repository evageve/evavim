{
  description = "Nvim flake config";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nvf.url = "github:notashelf/nvf";

    
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    ...
  } @ inputs: {
    packages.x86_64-linux.default =
        let system = "x86_64-linux";
        pkgs = import nixpkgs {
          inherit system;
        };

        in 
      (nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [./nvf-configuration.nix];
      })
      .neovim;

   
};

}
