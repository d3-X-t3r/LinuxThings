## Potential Fix 1
Ref: https://bbs.archlinux.org/viewtopic.php?pid=2202200#p2202200

1. Test before suspend: `systemctl bluetooth disable` or `rfkill block all`
2. If resume works, make the fix permanent:

   ``` 
   [Unit]
   Description=Disable wifi/bluetooth on suspend
   Before=suspend.target hibernate.target hybrid-sleep.target suspend-then-hibernate.target
   
   [Service]
   ExecStart=/usr/bin/rfkill block all
   
   [Install]
   WantedBy=suspend.target hibernate.target hybrid-sleep.target suspend-then-hibernate.target
   ```
   
3. Alternate fix: try disabling wifi and bluetooth in UEFI

## Potential Fix 2 for Systemd 256 Bug

Create a drop-in config `/etc/systemd/system/systemd-suspend.service.d/disable_freeze_user_session.conf` with the following:

   ```
   [Service]
   Environment="SYSTEMD_SLEEP_FREEZE_USER_SESSIONS=false"
   ```

References:
1. https://github.com/systemd/systemd/issues/33626
2. https://bbs.archlinux.org/viewtopic.php?pid=2180537#p2180537
3. More workarounds: https://bugzilla.redhat.com/show_bug.cgi?id=2321268 


