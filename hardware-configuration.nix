# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.initrd.luks.devices.crypted.device = "/dev/disk/by-uuid/1c86ab68-2e9a-462c-b740-e5e5fd67f5fa";

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/f7258abb-9574-47b2-8211-977689fd139f";
      fsType = "btrfs";
      options = [ "subvol=root" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/f7258abb-9574-47b2-8211-977689fd139f";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  hardware.pulseaudio.support32Bit = config.hardware.pulseaudio.enable;

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/2785-BD08";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/137769ea-cf3e-4df1-8b85-1c2dd0987a74"; }
    ];

  nix.maxJobs = lib.mkDefault 8;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  # High-DPI console
  console.font = lib.mkDefault "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
}
