// Step Event

// Check if the alarm is not active
if (alarm[1] <= 0) {
    // Set movement speed and distance to follow
    move_spd = 1;
    distanceToFollow = 900;
    
    // Get main_2 position
    var player_x = main_2.x;
    var player_y = main_2.y;

    var distance_to_player = point_distance(y, x, player_x, player_y);

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

/*
// Check if the boss should stop and fire
if (distance_to_player <= 30) {
    image_speed = 0.5;
} else {
    if (place_meeting(x, y, main_2)) {
        if (health > 0) {
            // Play sound and set alarm
            image_speed = 0.5;
            move_spd = 0;
            alarm[1] = room_speed * 3;
        }
    }


    // Decrease alarm countdown
    if (alarm[1] > 0) {
        alarm[1] -= 1;
    } else {
        // When alarm expires, fire obj_light in all directions
        instance_create(x, y, obj_light); // Create obj_light at boss position
        instance_create(x, y, obj_light); // Create obj_light at boss position
        instance_create(x, y, obj_light); // Create obj_light at boss position
        instance_create(x, y, obj_light); // Create obj_light at boss position
        // Add more instance_create calls if needed
        image_speed = 1; // Resume normal animation speed
    }
}
*/