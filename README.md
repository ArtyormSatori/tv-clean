# tv-clean

Your TV, minus the ads. One repo combining the ADB cleaning engines
of [tv-detox](https://github.com/Ansub/tv-detox) and
[cleanyourtv](https://github.com/Gathin23/cleanyourtv), plus honest
support tracks for TVs those projects cannot cover (Samsung Tizen,
LG webOS, Roku, VIDAA).

Vietnamese version: [README.vi.md](README.vi.md).

## What you get

- **Android TV / Google TV (full):** debloat over Wi-Fi with ADB +
  a clean replacement home screen. Nothing is uninstalled — apps are
  disabled for the user, and one command restores everything.
- **Samsung Tizen / LG webOS (partial, honest):** no ADB and no
  replacement launcher exist on these platforms. What works is
  settings hardening (ACR and personalized ads OFF), DNS-level ad
  blocking, and sdb/ares app management where the TV allows it. See
  `brands/tizen/samsung.md` and `brands/webos/lg.md`.
- **Roku / Hisense VIDAA (settings + DNS only):** see
  `brands/closed/roku-vidaa.md`.

## Quick start (Android TV / Google TV)

1. On the TV: Settings → Device Preferences → About → press **Build**
   7 times → Developer options → **USB debugging** ON (plus Network /
   Wireless debugging if shown). Keep the TV on, same Wi-Fi as your PC.
2. `sh scripts/detect.sh <TV_IP>` — pre-check: maker, model, Android
   version, RAM, current Home. Changes nothing.
3. `sh scripts/candidates.sh <TV_IP>` — read-only classification of
   every app: never / keep / safe / review.
4. Build your debloat list from the `safe` set (one package per line)
   and run:
   `sh scripts/clean.sh <TV_IP> <list.txt> [--launcher cleanyourtv|tvhome]`
   It asks for an explicit YES before changing anything.
5. Verify with `sh scripts/check.sh <TV_IP>` (use `--fix` after a
   firmware update — updates re-enable bloat).
6. Restore anytime: `sh tools/restore.sh <list.txt>` or
   `sh scripts/undo.sh <TV_IP>`.
7. When finished, turn USB/network debugging OFF on the TV.

Default launcher is the cleanyourtv launcher (Apple-TV-style, themes,
inputs menu, burn-in-safe clock screensaver). `tvhome` is the lighter
alternative (apps + HDMI + clock). Build them from
`launchers/cleanyourtv/` (Gradle) and `launchers/tvhome/` (build.sh).

## Safety

Read [SAFETY.md](SAFETY.md) first. The short version: disable, never
uninstall; never touch Play services, Settings, System UI, setup apps,
HDMI/tuner framework or the current Home; a few TVs have boot-looped
after the wrong app was disabled, which is why backup + restore exist.

## Layout

- `scripts/` — tv-detox-derived engine: detect, candidates, check, undo
- `tools/` — cleanyourtv-derived tooling: disable, restore, tv.py,
  recovery, theme
- `launchers/` — cleanyourtv launcher (default) + tvhome (light)
- `themes/` — theme configs (wallpapers/screenshots are upstream
  binaries, see NOTICE.md)
- `brands/` — per-platform packs and guides (TCL pack is measured on
  real hardware only — no guessed package names)

## Attribution

Both upstream projects are MIT. See [NOTICE.md](NOTICE.md) for exact
commits and what was excluded (binary assets the push route cannot
carry). New work in this repo is also MIT.
