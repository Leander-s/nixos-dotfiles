{ config, lib, pkgs, ... }:
let
  cfg = config.my.gpu;
in {
  options.my.gpu = {
    vendor = lib.mkOption {
      type = lib.types.enum [ "nvidia" "amd" "none" ];
      default = "none";
      description = "GPU vendor for this host.";
    };

    nvidia.open = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Use open kernel modules (Turing/RTX 20+ only).";
    };
  };

  config = lib.mkMerge [
    # Common to any GPU
    (lib.mkIf (cfg.vendor != "none") {
      hardware.graphics = {
        enable = true;
        enable32Bit = true;  # 32-bit libs for Steam, Wine, etc.
      };
      hardware.enableRedistributableFirmware = true;
    })

    # NVIDIA
    (lib.mkIf (cfg.vendor == "nvidia") {
      services.xserver.videoDrivers = [ "nvidia" ];
      hardware.nvidia = {
        modesetting.enable = true;
        nvidiaSettings = true;
        powerManagement.enable = true;
        powerManagement.finegrained = false;
        open = false;
        package = config.boot.kernelPackages.nvidiaPackages.production;
      };
    })

    # AMD
    (lib.mkIf (cfg.vendor == "amd") {
      services.xserver.videoDrivers = [ "amdgpu" ];
      boot.initrd.kernelModules = [ "amdgpu" ];
      # ROCm/OpenCL support — uncomment per-host if you need compute
      # hardware.graphics.extraPackages = with pkgs; [ rocmPackages.clr.icd ];
    })
  ];
}
