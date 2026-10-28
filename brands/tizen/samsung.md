# Samsung (Tizen OS) — separate track, no ADB, no replacement launcher

Samsung TVs run Tizen, not Android. There is no ADB and no third-party
launcher can take over Home. Any guide promising a "clean launcher on
Samsung" is wrong. This track does what is actually possible, in
order of effect:

## 1. Settings (remote only, works on every Samsung)

- Support → Terms & Policy → turn OFF Viewing Information Services
  (ACR: what you watch is no longer reported).
- Settings → General → Privacy → turn OFF personalized ads / interest
  -based advertising.
- Samsung TV Plus: remove/hide its channels and disable autorun.
- Smart Hub: turn OFF autorun; hide sponsored rows where the UI allows.

## 2. DNS-level ad blocking (measured, not claimed 100%)

- Point the TV (or the whole LAN) at AdGuard DNS or a Pi-hole and add
  Samsung ad/tracking domains to the blocklist.
- Measure effect by blocked-request counts on the DNS server. Never
  claim "all ads blocked": Samsung serves some promotions from its
  own first-party endpoints that DNS blocking cannot remove.

## 3. sdb via Tizen Studio (developer mode, model-dependent)

- Enable developer mode: Apps → press `12345` → Developer Mode ON →
  enter the PC IP → restart TV.
- Connect with `sdb` from Tizen Studio and list packages; uninstall or
  disable only apps the TV allows you to remove. Many Tizen system
  apps cannot be removed — record per model + firmware what worked
  and what refused, instead of publishing a universal list.

## 4. Fallback: HDMI stick (honest about what it is)

- If you want a genuinely clean home screen, plug in a Chromecast /
  Fire TV Stick and run the Android track of this repo on the stick.
  That cleans the stick, not the Samsung TV — say so plainly.
