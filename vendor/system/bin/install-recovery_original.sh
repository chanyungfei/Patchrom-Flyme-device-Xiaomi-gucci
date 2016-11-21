#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 12113920 285ffa8102e8bb78f9e0b2a603bc68cd757e5c9e 9848832 f96413e791bbce0550c7eed61a72feff7304b704
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:12113920:285ffa8102e8bb78f9e0b2a603bc68cd757e5c9e; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:9848832:f96413e791bbce0550c7eed61a72feff7304b704 EMMC:/dev/block/bootdevice/by-name/recovery 285ffa8102e8bb78f9e0b2a603bc68cd757e5c9e 12113920 f96413e791bbce0550c7eed61a72feff7304b704:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
