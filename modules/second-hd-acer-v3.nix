{
  # /dev/sdbx
  # UUID=    
  # /media/store  
  # ext4            
  # defaults,nofail,x-systemd.device-timeout=5    0 2

  fileSystems."/media/store" = { 
    device = "/dev/disk/by-uuid/b98a7ceb-2b22-42f5-8e0d-078810b7fee9";
    fsType = "ext4";
    options = [ "defaults" "noatime" "nofail" "x-systemd.device-timeout=5" ];
  };
}