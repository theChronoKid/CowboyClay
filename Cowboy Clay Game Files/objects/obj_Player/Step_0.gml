// @description All code run each frame

if !global.paused
{	
	// Physics
	Friction(PickPlayerFrict());
	Gravity(PickPlayerGravi(), global.player_gravityMax);
	
	if currentState != PlayerState.LOCK && currentState != PlayerState.DEAD
	{
		// State system
		PlayerPickupSword();
		UpdatePlayerState();
		PlayerStateBasedMethods();
		PlayerInvulnerability();
	}
	else if currentState == PlayerState.LOCK
	{
		GoToPlayerIdle();
	}
	else if currentState == PlayerState.DEAD obj_Moose.currentState = MooseState.LOCK;
	
	if keyboard_check_pressed(ord("R"))
	{
		room_goto_previous();
	}
	
	// Animation
	SwitchPlayerArmedAnims();
	PlayPlayerAnimation();
	SetPlayerFacingDirection();
}
CheckEnvironCollisions(spr_player_collision);

if currentState == PlayerState.WALKING
{
	if armed
	{
		if audio_is_playing(sfx_player_run_armed) == false audio_play_sound(sfx_player_run_armed, 50,true);
		if audio_is_playing(sfx_player_run) audio_stop_sound(sfx_player_run);
	}
	else 
	{
		if audio_is_playing(sfx_player_run) == false audio_play_sound(sfx_player_run,50,true);
		if audio_is_playing(sfx_player_run_armed) audio_stop_sound(sfx_player_run_armed);
	}
}
else
{
	if audio_is_playing(sfx_player_run) audio_stop_sound(sfx_player_run);
	if audio_is_playing(sfx_player_run_armed) audio_stop_sound(sfx_player_run_armed);
}