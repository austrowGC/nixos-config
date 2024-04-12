{
  description = "NixOS systems configurations";

  inputs =
    { nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
      nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
      nixos-hardware.url = "github:nixos/nixos-hardware/master";

      nur =
        { url = "github:nix-community/NUR";
        };

      nixgl =
        { url = "github:guibou/nixGL";
          inputs.nixpkgs.follows = "nixpkgs";
        };
      
      home-manager =
        { url = "github:nix-community/home-manager/release-23.11";
          inputs.nixpkgs.follows = "nixpkgs";
        };

      home-manager-unstable =
        { url = "github:nix-community/home-manager";
          inputs.nixpkgs.follows = "nixpkgs-unstable";
        };

      hyprland =
        { url = "github:hyprwm/Hyprland";
          inputs.nixpkgs.follows = "nixpkgs-unstable";
        };

      hyprlock =
        { url = "github:hyprwm/hyprlock";
          inputs.nixpkgs.follows = "nixpkgs-unstable";
        };

      hypridle = 
        { url = "github:hyprwm/hypridle";
          inputs.nixpkgs.follows = "nixpkgs-unstable";
        };

      nixvim =
        { url = "github:nix-community/nixvim/nixos-23.11";
          inputs.nixpkgs.follows = "nixpkgs";
        };
        
      nixvim-unstable =
        { url = "github:nix-community/nixvim";
          inputs.nixpkgs.follows = "nixpkgs-unstable";
        };

      

    };

  outputs =
  inputs @ { self, nixpkgs, nixpkgs-unstable, nixos-hardware , home-manager, home-manager-unstable, nur, nixgl, nixvim, nixvim-unstable, hyprland, hyprlock, hypridle, ...
  }:
  let
    vars = {
      user = "austrowgc";
      location = "$HOME/.setup";
      terminal = "kitty";
      editor = "nvim";
    };
  in {
    nixosConfigurations =
    (
      import ./hosts {
        inherit (nixpkgs) lib;
        inherit inputs nixpkgs nixpkgs-unstable nixos-hardware home-manager nur nixvim hyprland hyprlock hypridle vars;
      }
    );
  };
}
