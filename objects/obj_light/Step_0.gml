
motion_add(direction, speed);


lifetime -= 1;


if (lifetime <= 0) {
    instance_destroy();
}
if (place_meeting(x, y, main_2)) {
	instance_destroy();
}
