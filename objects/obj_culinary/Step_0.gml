move_spd = 2;
right_key = keyboard_check(ord("D"));
left_key = keyboard_check(ord("A"));
up_key = keyboard_check(ord("W"));
down_key = keyboard_check(ord("S"));
k_key = keyboard_check(ord("K")); // Check for the K key
v_key = keyboard_check(ord("V")); // Check for the V key

if (k_key) { // Check if the K key is pressed
    sprite_index = spr_nurse; // Change the sprite to spr_nurse
}
else if (v_key) { // Check if the V key is pressed
    sprite_index = spr_culinary; // Change the sprite to spr_culinary
}

xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;

if place_meeting(x + xspd, y, obj_wall) {
    xspd = 0;
}

if place_meeting(x, y + yspd, obj_wall) {
    yspd = 0;
}

if place_meeting(x + xspd, y + yspd, obj_enemy) {
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

if keyboard_check_pressed(vk_space) {
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

x += xspd;
y += yspd;

if (alarm[0] > 0) {
    alarm[0] -= 1;
    move_spd = 2;
}

if (alarm[1] > 0) {
    alarm[1] -= 1;
}
