// Initialize global.k_pressed if it hasn't been initialized yet
if (!variable_global_exists("k_pressed")) {
    global.k_pressed = false;
}

// Initialize global.v_pressed if it hasn't been initialized yet
if (!variable_global_exists("v_pressed")) {
    global.v_pressed = false;
}

// Initialize global.b_pressed if it hasn't been initialized yet
if (!variable_global_exists("b_pressed")) {
    global.b_pressed = false;
}

// Check if the 'K' key is pressed
if (keyboard_check_pressed(ord("K"))) {
    // Set a global variable to indicate that 'K' has been pressed
    global.k_pressed = true;
}

// Check if the 'V' key is pressed
if (keyboard_check_pressed(ord("V"))) {
    // Set a global variable to indicate that 'V' has been pressed
    global.v_pressed = true;
}

// Check if the 'B' key is pressed
if (keyboard_check_pressed(ord("B"))) {
    // Set a global variable to indicate that 'B' has been pressed
    global.b_pressed = true;
}

// Define the default sprites
var default_ability_sprite = spr_binary_blink;
var default_passive_sprite = script_surge;

// Change the sprites if 'K' key has been pressed
if (global.k_pressed) {
    default_ability_sprite = resilient_regeneration; 
    default_passive_sprite = reflexive_recovery;
}

// Change the sprites if 'V' key has been pressed
else if (global.v_pressed) {
    default_ability_sprite = kitchen_camouflage; 
    default_passive_sprite = chefs_reserve;
}

// Change the sprites if 'B' key has been pressed
else if (global.b_pressed) {
    default_ability_sprite = rescue_resilience; 
    default_passive_sprite = ember_endurance;
}

// Draw default ability sprite
var player = instance_find(main_2, 0);
var spr_ability = default_ability_sprite;

if (player != noone) {
    var player_x = player.x;
    var player_y = player.y;

    var hud_offset_x = room_width / 15.6; 
    var hud_offset_y = room_height + 130; 
	
	var scale_factor = 2.5;

    draw_sprite_ext(spr_ability, 0, hud_offset_x, hud_offset_y, scale_factor, scale_factor, 0, c_white, 1);
}

// Draw default passive sprite
var player_surge = instance_find(main_2, 0); 
var spr_passive = default_passive_sprite; 
if (player_surge != noone) {
    var player_x_surge = player_surge.x;
    var player_y_surge = player_surge.y;

    var hud_offset_x_surge = room_width + 250.6; 
    var hud_offset_y_surge = room_height + 130; 
	
	var scale_factor_surge = 2.5;

    draw_sprite_ext(spr_passive, 0, hud_offset_x_surge, hud_offset_y_surge, scale_factor_surge, scale_factor_surge, 0, c_white, 1);
}

// Create health variable and set default value
//health = 100;

// Draw health sprite
var hud_offset_x_health = room_width + 170; 
var hud_offset_y_health = 34;
var scale_factor_health = 3.5;
var health_sprite = spr_health;

if (player != noone) {

    if (place_meeting(x, y, obj_enemy) || place_meeting(x, y, obj_inside) || place_meeting(x, y, obj_boss) || place_meeting(x, y, obj_light)) {
        health -= 1; 
    }


    if (health <= 30) {
        health_sprite = spr_health_low;
    } else if (health <= 50) {
        health_sprite = spr_health_half; 
    }
}

draw_sprite_ext(health_sprite, 0, hud_offset_x_health, hud_offset_y_health, scale_factor_health, scale_factor_health, 0, c_white, 1);




var meal = 15;
var meal_sprite = spr_15;

var hud_offset_x_spr_15 = 10;
var hud_offset_y_spr_15 = 10;
var scale_factor_spr_15 = 6.5;

if (player != noone) {

    if (place_meeting(x, y, obj_heal_wrp) || place_meeting(x, y, obj_warp) ) {
        meal -= 1;
    }

    meal_sprite = choose(
        meal == 15, spr_15,
        meal == 14, spr_14,
        meal == 13, spr_13,
        meal == 12, spr_12,
        meal == 11, spr_11,
        meal <= 10, spr_10
        // Add more conditions as needed
    );
}

draw_sprite_ext(meal_sprite, 0, hud_offset_x_spr_15, hud_offset_y_spr_15, scale_factor_spr_15, scale_factor_spr_15, 0, c_white, 1);
