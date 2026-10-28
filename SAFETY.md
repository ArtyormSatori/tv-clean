# Safety rules (non-negotiable)

1. Disable, never uninstall. Every change is backed up and restorable
   with `tools/restore.sh` (cleanyourtv record) or `scripts/undo.sh`.
2. Never disable: Google Play services (`com.google.android.gms`),
   `com.google.android.gsf`, Play (`com.android.vending`), Settings,
   System UI, setup apps, keyboard, Bluetooth, HDMI/tuner framework,
   TV input service, MediaTek TV middleware. On Google TV, never
   disable the stock Home (`com.google.android.apps.tv.launcherx`)
   unless you explicitly opt in — doing so has bricked TVs into a
   boot loop (cleanyourtv #239).
3. Home guard: the disable step refuses to turn off whatever currently
   answers Home. If it refuses, stop and investigate — do not force it
   with `FORCE_HOME=1` unless you have another way into the TV.
4. Ask before every change. `scripts/clean.sh` prints the candidate
   classification and waits for an explicit YES.
5. After a firmware update, re-run `scripts/check.sh --fix`: updates
   re-enable bloat.
6. OLED: keep the screensaver on. Never leave a static home screen up
   for hours.
7. When finished, turn USB/network/wireless debugging OFF on the TV.
   Left on, other devices on your network can ask to control it.
8. Risk warning: a few TVs have stuck at the logo or boot-looped after
   disabling the wrong system app. This is not professional advice;
   you are responsible for your own TV. The undo path is the reason
   rule 1 exists.
