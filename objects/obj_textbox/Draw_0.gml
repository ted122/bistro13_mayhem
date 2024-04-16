accept_key = keyboard_check(vk_tab);

textbox_x = camera_get_view_x(view_camera[0] );
textbox_y = camera_get_view_y(view_camera[0] ) + 144;

if setup == false
	{
		
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left)
	
	page_number = array_length(text);
	for(var _p = 0; _p < page_number; _p++)
	{
		
		text_length[_p] = string_length(text[_p]);
		text_x_offset[_p] = 44;
		 		 
	
	text_length[_p] = string_length(text[_p]);
	
	text_x_offset[_p] = 44;
	
		 }
		 
	}
	
	
	
	if draw_char < text_length[page]
	{
		draw_char += text_spd;
		draw_char = clamp (draw_char, 0, text_length[page]);
	}
	
if accept_key
	{
			
			if draw_char == text_length[page]
			{
			if page < page_number -1 
			 {
			 page++
			 draw_char = 0;
			 }
			 
			 else 
			 {
			instance_destroy();
			}
			
		}
			else {
		draw_char = text_length[page]	
		}
		
		}
		
		
txtb_img += txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr)
txtb_spr_h = sprite_get_height(txtb_spr)

draw_sprite_ext(txtb_spr, txtb_img, textbox_x + text_x_offset[page], textbox_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1);

var _drawtext = string_copy(text[page],1, draw_char);
draw_text_ext(textbox_x + text_x_offset[page] + border, textbox_y + border, _drawtext, line_sep, line_width);