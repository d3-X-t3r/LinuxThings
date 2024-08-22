# Linux Gaming Tips/Notes <WORK IN PROGRESS>
*Just a collection of random notes and my experiences in my Linux gaming journey.*

## Fix Steam Scaling
Add the following line to your `/etc/environment` file: `STEAM_FORCE_DESKTOPUI_SCALING=<scale>`   
Example using 200% scaling: `STEAM_FORCE_DESKTOPUI_SCALING=2.0`

## NTFS
TODO: btrfs notes

UUID=448AF05D47A357CC /run/media/mr/WSD/ ntfs3 users,force,defaults,nofail,uid=1000,gid=100,rw,user,exec,umask=002,dmask=002,fmask=002 0 0

The ntfs3 type must be compatible with your kernel or it will fail on the next reboot.

you can use LiquorixKernel. https://liquorix.net/

If it is exfat, you put exfat there.

It is really these folders that are the problem that Steam cannot start on unsupported partitions. fstab:

https://github.com/ValveSoftware/Proton/wiki/Using-a-NTFS-disk-with-Linux-and-Windows
https://docs.kernel.org/filesystems/ntfs3.html

#Steam

/home/mr/.local/share/Steam/steamapps/compatdata/ /run/media/mr/WSD/Program\040Files\040(x86)/Steam/steamapps/compatdata none defaults,bind 0 0

/home/mr/.local/share/Steam/steamapps/shadercache/ /run/media/mr/WSD/Program\040Files\040(x86)/Steam/steamapps/shadercache none defaults,bind 0 0

Because in exfat you cannot create symbolic links and in ntfs because it does not accept symbols in names.

I think it also works if you create a symbolic link of those folders to your steam linux directory.
