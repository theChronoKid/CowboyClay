// Checks if the instance that called this is lo blocking.
// Compares the instance's object_index to a list of objects and compares its sprite to a list of applicable sprites.
// Returns true if lo blocking and false if not.
function get_lo_block(){
	var a = noone;
	
	switch object_index {
		case global.player_object:
			a = global.player_lo_block_sprites;
			break;
		case global.moose_object:
			a = global.moose_lo_block_sprites;
			break;
	}
	
	// If no definition for that object exists
	if a == noone {
		show_debug_message("Attempted to check lo block for object not found in reference.");
		return false;
	}
	
	for (var i = 0; i < array_length(a); i++) {
		if sprite_index == a[i] return true;
	}
	return false;
}

// Sprites where the player is lo blocking
global.player_lo_block_sprites = [
								 global.player_animation_lo_block,
								 global.player_animation_lo_block_success
								 ];

// Sprites where Moose is lo blocking
global.moose_lo_block_sprites = [
								spr_moose_blockLo,
								spr_moose_blockLo_helmless,
								spr_moose_blockLo_empty,
								spr_moose_walkBlock,
								spr_moose_walkBlock_noHelm
								];