
if (alarm[1] <= 0) {
    // Set movement speed and distance to follow
    move_spd = .7;
    distanceToFollow = 900;
    
    // Get main_2 position
    player_x = main_2.x;
    player_y = main_2.y;

    distance_to_player = point_distance(y, x, player_x, player_y);

    if (distance_to_player <= distanceToFollow) {
        // Move towards main_2
        if (player_x > x && !place_meeting(x + move_spd, y, obj_wall)) {
            x += move_spd;
        } else if (player_x < x && !place_meeting(x - move_spd, y, obj_wall)) {
            x -= move_spd;
        }
        
        if (player_y > y && !place_meeting(x, y + move_spd, obj_wall)) {
            y += move_spd;
        } else if (player_y < y && !place_meeting(x, y - move_spd, obj_wall)) {
            y -= move_spd;
        }
    }
}

if (place_meeting(x + xspd, y, obj_inside)) {
   move_spd = 0;
}

if (place_meeting(x, y + yspd, obj_inside)) {
   move_spd = 0;
}




// Check collision with player
if (distance_to_player <= 30) {
	audio_play_sound(sound_taser, 0, false);
    sprite_index = spr_inside_hit;
    image_speed = 0.5;
} else {
    if (place_meeting(x, y, main_2)) {
        if (health > 0) {
            // Play sound and set alarm
            
            sprite_index = spr_inside_hit;
            move_spd = 0;
			
            alarm[1] = room_speed * 1; // Set alarm for 40 seconds
        }
    }

    // Decrease alarm countdown
    if (alarm[1] > 0) {
        alarm[1] -= 1;
    } else {
        sprite_index = spr_inside_guard;
        image_speed = 1;
    }
}
