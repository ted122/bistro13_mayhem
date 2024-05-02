// Create Event
initialized = false;

// Step Event
if (!initialized) {
    initialized = true;
    direction = 0; // Initial direction, assuming right
}

if (alarm[1] <= 0) {
    move_spd = .8;
    distanceToFollow = 500;
    
    player_x = main_2.x;
    player_y = main_2.y;

    distance_to_player = point_distance(y, x, player_x, player_y);

    if (distance_to_player <= distanceToFollow) {
        // Move towards main_2
        if (player_x > x && !place_meeting(x + move_spd, y, obj_wall)) {
            x += move_spd;
            direction = 0; // Set direction to right
        } else if (player_x < x && !place_meeting(x - move_spd, y, obj_wall)) {
            x -= move_spd;
            direction = 180; // Set direction to left
        }
        
        if (player_y > y && !place_meeting(x, y + move_spd, obj_wall)) {
            y += move_spd;
        } else if (player_y < y && !place_meeting(x, y - move_spd, obj_wall)) {
            y -= move_spd;
        }
    }
}

// Check if the player is in attack range
if (distance_to_player <= 30) {
    audio_play_sound(sound_taser, 0, false);
    sprite_index = hit_enemy;
    image_speed = 0.5;
} else {
    // Check if the player is touched
    if (place_meeting(x, y, main_2)) {
        if (health > 0) {
            // Play sound and set alarm
            audio_play_sound(sound_taser, 0, false);
            sprite_index = hit_enemy;
            image_speed = 0.5;
            move_spd = 0;
            alarm[1] = room_speed * 3;
        }
    }

    // Decrease alarm countdown
    if (alarm[1] > 0) {
        alarm[1] -= 1;
    } else {
        sprite_index = enemy;
        image_speed = 1;
    }
}


if (place_meeting(x + move_spd, y, obj_wall) || place_meeting(x - move_spd, y, obj_wall)) {
    show_debug_message("Hitting wall");
    direction += 180; 

 
    if (direction > 180) {
        direction -= 360;
    } else if (direction < -180) {
        direction += 360;
    }


    if (direction == 0 || direction == 180) {
        move_spd = abs(move_spd); 
    } else {
        move_spd = -abs(move_spd);
    }

    show_debug_message("Direction after hitting wall: " + string(direction));
}
