// Step Event

var distance_to_player;


if (alarm[1] <= 0) {
    move_spd = 0.6;
    distanceToFollow = 900;


    if(instance_exists(main_2)) {
        var player_x = main_2.x;
        var player_y = main_2.y;

        distance_to_player = point_distance(x, y, player_x, player_y);

        if (distance_to_player <= distanceToFollow) {
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
}


if (instance_exists(main_2)) {
    if (distance_to_player <= 20) {
        image_speed = 0.5;
    } else {
        if (place_meeting(x, y, main_2)) {
            if (health > 0) {
                image_speed = 0.5;
                move_spd = 0;
                alarm[1] = room_speed * 3;
            }
        }

 
        if (alarm[1] > 0) {
            alarm[1] -= 1;
        } else {
            // Create light objects
            instance_create_layer(x, y, layer, obj_light); 
            instance_create_layer(x, y, layer, obj_light);
            instance_create_layer(x, y, layer, obj_light); 
            instance_create_layer(x, y, layer, obj_light); 
			
			instance_create_layer(x, y, layer, obj_light); 

            image_speed = 1; 
        }
    }
}
