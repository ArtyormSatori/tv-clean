# Prompt for a coding assistant (paste + fill in your TV model)

> Help me clean up my Android TV and make it faster.
> My TV is a <brand and model>.
>
> 1. Before you change anything, tell me in plain words: this turns
>    off system apps, and that has some risk. A few TVs got stuck at
>    the logo or kept restarting. The undo scripts turn everything
>    back on. Ask me to confirm I want to go ahead.
> 2. Connect to my TV over Wi-Fi. Walk me through anything I need to
>    tap on the TV (developer mode, USB debugging, "Allow debugging?").
> 3. Run `sh scripts/detect.sh <TV_IP>` and
>    `sh scripts/candidates.sh <TV_IP>`. Before changing anything,
>    list every app in plain language: safe to turn off, needed by
>    the TV, and apps I use. Check free memory.
> 4. Ask me before every change. Turn apps off instead of deleting
>    them (`pm disable-user`, never uninstall). Keep the restore
>    record `tools/restore.sh` can use.
> 5. Never turn off: Google Play services, Google Play, Settings,
>    System UI, setup apps, keyboard, Bluetooth, HDMI inputs, the TV
>    input/tuner framework, MediaTek TV middleware, or whatever
>    currently answers Home. On Google TV, never turn off the stock
>    Home (`com.google.android.apps.tv.launcherx`) unless I opt in
>    explicitly. If unsure, leave it on.
> 6. Install the home screen of my choice (default: cleanyourtv
>    launcher; light alternative: tvhome) and make it the default.
> 7. Turn off animations, set sleep after 5 minutes. Ask me if the TV
>    is OLED — if so, keep the screensaver on.
> 8. Wait 30 seconds after the last change, restart the TV once, and
>    check it boots normally before saying you are done. Show free
>    memory before and after.
> 9. Remind me to turn USB / Network / Wireless debugging OFF (or
>    Developer options entirely) when done. Left on, other devices on
>    my network can ask to control the TV.
>
> For a Samsung (Tizen), LG (webOS), Roku or VIDAA TV, do NOT use this
> Android flow — follow `brands/` for that platform instead.
