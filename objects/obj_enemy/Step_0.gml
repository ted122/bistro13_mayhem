move_spd = .8;
distanceToFollow = 100;
player_x = main_2.x;
player_y = main_2.y;

// Calculate distance between enemy and main_2
distance_to_player = point_distance(x, y, player_x, player_y);

if (distance_to_point(player_x, player_y) <= distanceToFollow) {
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

if (distance_to_player <= 30) {
    sprite_index = hit_enemy;
    image_speed = 0.5;
    move_spd = 0; 
} else {
    if (place_meeting(x, y, main_2)) {
        if (health > 0) {
            health -= 0.001;
            sprite_index = hit_enemy;
            image_speed = 0.5;
            move_spd = 0;
            alarm[0] = 10;
        }
    }

    if (alarm[0] > 0) {
        alarm[0] -= 1;
    } else {
        sprite_index = enemy;
        image_speed = 1;
        move_spd = .8; 
    }
}
