 
{
  # https://www.kernel.org/doc/Documentation/blockdev/zram.txt
  # Compression algorithm. `lzo` has good compression,
  # but is slow. lz4 has bad compression, but is fast.
  # zstd is both good compression and fast, but requires newer kernel.
  # You can check what other algorithms are supported by your zram device with
  # {command} cat /sys/class/block/zram*/comp_algorithm
  zramSwap = {
    enable = true;
    # one of "lzo", "lz4", "zstd"
    algorithm = "zstd";
    # Priority of the zram swap devices.
    # It should be a number higher than the priority of your disk-based swap devices
    # (so that the system will fill the zram swap devices before falling back to disk swap).
    priority = 5;
    # Maximum total amount of memory that can be stored in the zram swap devices (as a percentage of your total memory).
    # Defaults to 1/2 of your total RAM. Run zramctl to check how good memory is compressed.
    # This doesn’t define how much memory will be used by the zram swap devices.
    memoryPercent = 50;
  };  

  # recommended settings from https://wiki.archlinux.org/title/Zram
  # Optimizing swap on zram
  # Since zram behaves differently than disk swap, 
  # we can configure the system's swap to take full potential of the zram advantages:
  boot.kernel.sysctl = {
    "vm.swappiness" = 180;
    "vm.watermark_boost_factor" = 0;
    "vm.watermark_scale_factor" = 125;
    "vm.page-cluster" = 0;
  };
}
