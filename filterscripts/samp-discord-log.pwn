#include <a_samp>
#include <Pawn.CMD>
#include <discord-connector>

//weziza modular discord
new DCC_Channel:chatchannel;
new DCC_Channel:logchannel;

static DCC_Channel:commandChannel; // In this variable we will store the channel ID only where the commands will be registered and not anywhere else //
static DCC_Guild:guildName;
static DCC_Role:adminRole;
main() 
{
	SetTimer("onlineTimer", 1000, true);
	SetTimer("TDUpdates", 8000, true);
 	commandChannel = DCC_FindChannelById("YOURDISCORDCHANNEL"); // Now we will copy the channel ID where we want the commands to work! //
    guildName = DCC_FindGuildById("YOURDISCORDSERVERID"); // Now to get the guild ID //
    adminRole = DCC_FindRoleById("YOURDISCORDROLE"); // Now to fetch the role ID // So the command exclusive to the role only
    // Now the DCC_Channel is stored in the variable commandChannel //
}
public OnGameModeInit()
{
   chatchannel = DCC_FindChannelById("LOGGINGALLCHATCHANNEL"); // Discord channel ID
    logchannel = DCC_FindChannelById("LOGCHANNEL");
    DCC_SetBotPresenceStatus(DCC_BotPresenceStatus:IDLE);
    DCC_SetBotActivity("This is made by weziza <3");
}
public OnPlayerText(playerid, text[])
{	
    //discord, It will appears to channel that set to chatchannel id
 	new msg[128];
    format(msg, sizeof(msg), "```[CHAT] %s says :%s```", pData[playerid][pName], text);
    DCC_SendChannelMessage(chatchannel, msg);
}

public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags)
{
    //every command execute will shown to logchannel
    new msg[128];
    format(msg, sizeof(msg), "```[CMD]: %s(%d) has used the command '%s' (%s)```", pData[playerid][pName], playerid, cmd, params);
    DCC_SendChannelMessage(logchannel, msg);
}

public OnPlayerConnect(playerid)
{
    new msg[128];
	format(msg, sizeof(msg), "```(( %s, %s )) %s(%d) telah terhubung ke server.```", city, country, pData[playerid][pName], playerid);
	DCC_SendChannelMessage(logchannel, msg);

}

public OnPlayerDisconnect(playerid, reason)
{
    // Note : Make sure you declare the pData[playerid][pName] first.
	switch(reason)
	{
	    case 0:
	    {
	        new msg[128];
			format(msg, sizeof(msg), "```[LOGOUT] %s(%d) has leave from the server.(timeout/crash)```", pData[playerid][pName], playerid);
			DCC_SendChannelMessage(logchannel, msg);
		}
		case 1:
		{
	        new msg[128];
			format(msg, sizeof(msg), "```[LOGOUT] %s(%d) has leave from the server.(leaving)```", pData[playerid][pName], playerid);
			DCC_SendChannelMessage(logchannel, msg);
		}
		case 2:
		{
  			new msg[128];
			format(msg, sizeof(msg), "```[LOGOUT] %s(%d) has leave from the server.(Kick/Banned)```", pData[playerid][pName], playerid);
			DCC_SendChannelMessage(logchannel, msg);
		}
	}
}
public OnPlayerDeath(playerid, killerid, reason)
{
    // it will appear when every death happends
	new msg[128];
	format(msg, sizeof(msg), "```[DEATH LOG]%s telah dibunuh oleh %s dengan menggunakan %s```", playerid, killerid, reason);
	DCC_SendChannelMessage(logchannel, msg);
}
