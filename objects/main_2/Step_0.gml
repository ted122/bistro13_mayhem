// Initialize variables
var transformed = false;
var move_spd = 2;
var max_health = 100;
global.meals = 15;
var playerScore = 100;


var spaceCooldown = 0; 


var right_key = keyboard_check(ord("D"));
var left_key = keyboard_check(ord("A"));
var up_key = keyboard_check(ord("W"));
var down_key = keyboard_check(ord("S"));

if (keyboard_check_pressed(ord("K"))) {
    transformed = true;
    if (sprite_index != spr_nurse) {
        sprite_index = spr_nurse;
    }
} else if (keyboard_check_pressed(ord("V")) && sprite_index != spr_culinary) {
    sprite_index = spr_culinary;
} else if (keyboard_check_pressed(ord("B")) && sprite_index != spr_fire) {
    sprite_index = spr_fire;
}

var xspd = (right_key - left_key) * move_spd;
var yspd = (down_key - up_key) * move_spd;

if (place_meeting(x + xspd, y, obj_wall)) {
    xspd = 0;
}

if (place_meeting(x, y + yspd, obj_wall)) {
    yspd = 0;
}

if (place_meeting(x + xspd, y, wall_time)) {
    xspd = 0;
}

if (place_meeting(x, y + yspd, wall_time)) {
    yspd = 0;
}

if (place_meeting(x + xspd, y + yspd, obj_enemy) || place_meeting(x + xspd, y + yspd, obj_inside)) {
    if (health > 0) {
        health -= 1;
        show_debug_message("Health: " + string(health));
        move_spd = 0;
        alarm[0] = 30;

        if (health <= 0) {
            with (obj_enemy) {
                instance_destroy();
            }
            instance_destroy();
        } else {
            xspd = 1;
            yspd = 1;
        }
    }
}


if (!instance_exists(obj_textbox) && !instance_exists(obj_boss_talk)) {
    if (place_meeting(x + xspd, y + yspd, obj_boss)) {
        if (health > 0) {
            health -= 99;
            show_debug_message("Health: " + string(health));
            move_spd = 0;
            alarm[0] = 30;

            if (health <= 0) {
                with (obj_boss) {
                    instance_destroy();
                }
                instance_destroy();
            } else {
                xspd = 1;
                yspd = 1;
            }
        }
    }

    if (place_meeting(x + xspd, y + yspd, obj_light)) {
        if (health > 0) {
            health -= 5;
            show_debug_message("Health: " + string(health));
            move_spd = 0;
            alarm[0] = 30;

            if (health <= 0) {
                with (obj_light) {
                    instance_destroy();
                }
                instance_destroy();
            } else {
                xspd = 1;
                yspd = 1;
            }
        }
    }
	
// Check if main_2 is not moving
if (place_meeting(x, y, main_2)) {
    // Check if main_2's position has changed since the last step
    var main_2_is_moving = (x != xprevious || y != yprevious);
    if (!main_2_is_moving) {
        // If main_2 is not moving, pause its animation
        main_2.image_speed = 0;
    } else {
        // If main_2 is moving, resume its animation
        main_2.image_speed = 1;
    }

}



    // Check if space bar is pressed and cooldown is over
    if (keyboard_check_pressed(vk_space) && spaceCooldown <= 0) { 
        if (transformed) {
            if (health < 50) {
                health += 50;
            } else {
                health = max_health;
            }
            show_debug_message("Health: " + string(health));
        } else {
            // Teleportation logic
            sprite_index = main_glitch;
            var dash_speed = move_spd * 40;
            var dash_xspd = (right_key - left_key) * dash_speed;
            var dash_yspd = (down_key - up_key) * dash_speed;
            alarm[1] = room_speed * 2;
            if (!place_meeting(x + dash_xspd, y, obj_wall)) {
                xspd += dash_xspd;
            }
            if (!place_meeting(x, y + dash_yspd, obj_wall)) {
                yspd += dash_yspd;
            }
            // Set cooldown timer
            spaceCooldown = 10 * room_speed; 
        }
    }


    if (spaceCooldown > 0) {
        spaceCooldown--;
    }

    x += xspd;
    y += yspd;

    if (alarm[0] > 0) {
        alarm[0] -= 1;
        move_spd = 2;
    }

    if (alarm[1] > 0) {
        alarm[1] -= 1;
    }

    if (place_meeting(x, y, main_2) && place_meeting(x, y, obj_heal_wrp) && !instance_exists(obj_heal_wrp)) {
        global.meals -= 1;
    }

    if (place_meeting(x, y, obj_heal_wrp)) {
        show_debug_message("High Score: " + string(global.meals));
    }
}


if (instance_exists(obj_boss_talk)) {

    if (place_meeting(x, y, obj_boss_talk)) {
   
    }
}