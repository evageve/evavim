{
  description = "Nvim flake config";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    nixpkgs,
    nvf,
    ...
  } @ inputs: {
    packages.x86_64-linux.default =
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [./nvf-configuration.nix];
      })
      .neovim;

   
};

}
