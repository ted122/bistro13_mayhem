
right_key = keyboard_check(ord("D"));
left_key = keyboard_check(ord("A"));
up_key = keyboard_check(ord("W"));
down_key = keyboard_check(ord("S"));

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
    var dash_speed = move_spd * 40;
    var dash_xspd = (right_key - left_key) * dash_speed;
    var dash_yspd = (down_key - up_key) * dash_speed;

    if !place_meeting(x + dash_xspd, y, obj_wall) {
        xspd += dash_xspd;
    }

    if !place_meeting(x, y + dash_yspd, obj_wall) {
        yspd += dash_yspd;
    }
}

x += xspd;
y += yspd;
