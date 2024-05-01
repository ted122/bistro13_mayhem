/// Room Creation Event
var inst;
inst = instance_create_layer(x, y, "Instances", obj_boss);

inst.move_spd = 26; 
inst.image_speed = 1;
inst.health = 100; 

inst.x = irandom(room_width);
inst.y = irandom(room_height); 

inst.alarm[0] = room_speed * 5;
