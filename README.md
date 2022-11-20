# samp-discord-log
Filterscript that follow up everything from the game to specific discord channel

Migrating from https://github.com/weziza

# This is the stable version of https://github.com/weziza

## TODO LIST
- [x] OnPlayerDeath, OnPlayerConnect, OnPlayerChat, OnPlayerCommandPrefered, OnPlayerDisconnect are logged to specific channel
- [ ] Universal channel (changed from discord bot)

# Configuration
1. Get your [discord-connector from maddinat0r](https://github.com/maddinat0r/samp-discord-connector)
2. Dont forget we using [Pawn.CMD](https://github.com/katursis/Pawn.CMD/releases) here
3. Grab your discord token at portal developer
4. Setting up your token, channel, to yours
    - `DCC_FindChannelById` as your discord channel id
    - `discord_bot_token` in `server.cfg`

# Note
If you want make this filterscripts into your main gamemode files, it possible 
and if there any issue please make an issue so i can fix them, Thanks you
