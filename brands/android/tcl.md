# TCL — TO MEASURE (no package list yet)

Most TCL TVs run Android TV or Google TV, so the ADB engine applies
unchanged. What is missing is a measured bloat list: nobody on this
project has run the measurement on a real TCL unit yet.

## How to measure (on a real TCL TV)

1. Enable developer mode + USB/network debugging (Settings → Device
   Preferences → About → press Build 7 times).
2. `sh scripts/detect.sh <TV_IP>` — record maker, model, Android
   version, RAM, current Home.
3. `sh scripts/candidates.sh <TV_IP>` — classify every package as
   never/keep/safe/review. Do NOT disable anything yet.
4. From the `safe` set, identify TCL-specific packages (TCL Channel,
   TCL Home, TCL account/telemetry, preloaded storefronts) and record
   each package name + what it does + whether disabling it breaks
   anything (HDMI, tuner, remote, voice).
5. Only then write the pack: one package per line with a comment
   stating what was verified, on which model + firmware.

Until step 5 is done, this file intentionally contains no package
names. Guessing TCL package names would violate the project's safety
rules.
