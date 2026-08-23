{ config, pkgs, ... }:

{
  # 1. Arch Drive (Btrfs)
  fileSystems."/mnt/arch-drive" = {
    device = "/dev/disk/by-uuid/e73846e9-aa38-4cb9-878d-65bbda51ebe8";
    fsType = "btrfs";
    options = [ "defaults" "nofail" "x-gvfs-show" ];
  };

  # 2. SAMSUNG DRIVE THING (NTFS)
  fileSystems."/mnt/samsung-drive-thing" = {
    device = "/dev/disk/by-uuid/2C640D04640CD28E";
    fsType = "ntfs3"; # Modern kernel NTFS driver
    options = [ "defaults" "nofail" "x-gvfs-show" "uid=1000" "gid=100" ];
  };

  # 3. SAMSUNG DRIVE (Btrfs)
  fileSystems."/mnt/samsung-drive" = {
    device = "/dev/disk/by-uuid/dd265d2c-fb8e-498b-956a-7370334618b4";
    fsType = "btrfs";
    options = [ "defaults" "nofail" "x-gvfs-show" ];
  };

  # 4. CRUCIAL DRIVE (Btrfs)
   fileSystems."/mnt/crucial-drive" = {
    device = "/dev/disk/by-uuid/2d9484a9-8710-4ea2-9da8-60be9d6b75a3";
    fsType = "btrfs";
    options = [ "subvol=@games" "compress=zstd" "noatime" "nofail" "x-gvfs-show" ];
  };
}
