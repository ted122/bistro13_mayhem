// Define transformed variable and initialize it
var transformed = false;

// Other variable declarations
var move_spd = 2;
var right_key = keyboard_check(ord("D"));
var left_key = keyboard_check(ord("A"));
var up_key = keyboard_check(ord("W"));
var down_key = keyboard_check(ord("S"));

if (keyboard_check_pressed(ord("K"))) {
    transformed = true;
    if (sprite_index != spr_nurse) {
        sprite_index = spr_nurse;
    }
} 
else if (keyboard_check_pressed(ord("V")) && sprite_index != spr_culinary) {
    sprite_index = spr_culinary;
} 
else if (keyboard_check_pressed(ord("B")) && sprite_index != spr_fire) {
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

if (place_meeting(x + xspd, y + yspd, obj_enemy)) {
    if (health > 0) {
        health -= 1;
        show_debug_message("Health: " + string(health)); 
        move_spd = 0;
        alarm[0] = 30;
    }
    if (health <= 0) {
        with (obj_enemy) {
            instance_destroy(); 
        }
        instance_destroy(); 
    }
    else {
        xspd = 0;
        yspd = 0;
    }
}

if (place_meeting(x + xspd, y + yspd, obj_inside)) {
    if (health > 0) {
        health -= 1;
        show_debug_message("Health: " + string(health)); 
        move_spd = 0;
        alarm[0] = 30;
    }
    if (health <= 0) {
        with (obj_inside) {
            instance_destroy(); 
        }
        instance_destroy(); 
    }
    else {
        xspd = 0;
        yspd = 0;
    }
}

if (keyboard_check_pressed(vk_space)) {
    if (transformed) {
        // Action when K is pressed and Space is pressed (healing)
        if (health < 50) {
            health += 50;
        } else {
            health = max_health;
        }
        show_debug_message("Health: " + string(health));
    } else {
        // Default action when Space is pressed (dash)
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
    }
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
