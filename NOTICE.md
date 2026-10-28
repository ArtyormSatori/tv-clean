# Attribution (MIT sources)

tv-clean combines two MIT-licensed projects. Their licenses are kept in
full; nothing below strips credit.

- Engine scripts `scripts/detect.sh`, `candidates.sh`, `check.sh`,
  `undo.sh` and launcher `launchers/tvhome/` (sources, resources,
  manifest, build script, app list): derived from
  Ansub/tv-detox, commit 670a5ab130fa98478698692950013e7ffafa1fff,
  Copyright (c) 2026 Ansub Khan, MIT.
- Tooling `tools/disable.sh`, `restore.sh`, `tv.py`, `recovery.py`,
  `theme.sh` and launcher `launchers/cleanyourtv/` plus `themes/*/`
  configs: derived from Gathin23/cleanyourtv,
  commit 095b71ad93d99ea28d94d97b06385709d354b795, Copyright (c) 2026
  Gathin, MIT.
- `scripts/clean.sh`, `tests/syntax.sh`, `brands/*`, `docs` and this
  file are new work for tv-clean (MIT).

## Binary assets NOT included in this repository

The GitHub push route used for v1 accepts UTF-8 text only, so these
upstream binary assets are excluded and must be fetched from the
upstream releases when building:

- `launchers/cleanyourtv/app/src/main/res/drawable-nodpi/banner.jpg`
- `launchers/cleanyourtv/app/src/main/res/font/outfit.ttf` (OFL, see
  FONT-LICENSE-OFL.txt in the launcher dir)
- `launchers/cleanyourtv/app/src/main/res/mipmap-xhdpi/ic_launcher.jpg`
- `launchers/cleanyourtv/gradle/wrapper/gradle-wrapper.jar`
  (run `gradle wrapper` or use a system Gradle instead)
- `themes/*/wallpaper.jpg` and `themes/*/screenshot.jpg` (theme configs
  are included; wallpapers/screenshots come from the upstream repo)

Nothing else was dropped. If a build needs one of these, the upstream
project remains the source of truth.
