#include maps/mp/_utility;
#include maps/mp/_visionset_mgr;
#include maps/mp/_music;
#include common_scripts/utility;
#include maps/mp/gametypes_zm/_hud_util;
#include maps/mp/gametypes_zm/_hud_message;
#include maps/mp/gametypes_zm/_gv_actions;
#include maps/mp/zombies/_zm_utility;
#include maps/mp/zombies/_zm_audio;
#include maps/mp/animscripts/zm_combat;
#include maps/mp/animscripts/zm_utility;
#include maps/mp/animscripts/utility;
#include maps/mp/animscripts/shared;
#include maps/mp/_visionset_mgr;
#include maps/mp/zombies/_zm;
#include maps/mp/zombies/_zm_equipment;
#include maps/mp/zombies/_zm_weap_cymbal_monkey;
#include maps/mp/zombies/_zm_weapons;
#include maps/mp/zombies/_zm_clone;
#include maps/mp/zombies/_zm_laststand;
#include maps/mp/zombies/_zm_utility;
#include common_scripts/utility;
#include maps/mp/_utility;
#include maps/mp/zombies/_zm_perks;
#include maps/mp/gametypes_zm/_clientids;
#include maps/mp/zm_prison_sq_final;  
#include maps/mp/zombies/_zm_afterlife;

init()
{
	if(getDvar("mapname") == "zm_prison") 
	{
		SetDvar( "scr_zm_enable_bots", "0" );
		level thread onPlayerConnect();	
	}
}

onPlayerConnect()
{
	level waittill("connected", player);
    player thread onPlayerSpawned();
} 


onPlayerSpawned()
{
    self.stopThreading = false;
    self endon("disconnect");
	self iPrintln("Motd SOLO EE script by HD Erick Games#3960");
	level waittill_multiple( "nixie_final_" + 386, "nixie_final_" + 481, "nixie_final_" + 101, "nixie_final_" + 872 );
	wait 10;
	for(;;)
	{	
		self endon( "stage_final" );
		players = getplayers();
		if(players.size == 1){	
			SetDvar( "scr_zm_enable_bots", "1" );
			addtestclient();	
			SetDvar( "scr_zm_enable_bots", "0" );
			wait 5;
		}
		self thread infiniteafter();
		wait 5;
	}
}

infiniteafter()
{
	foreach( p in level.players )
	{
		p.infinite_mana = 1;
		if ( level.final_flight_activated ){
			p afterlife_remove();
		}
	}

}