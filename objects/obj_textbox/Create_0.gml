depth = -9999;

textbox_width = 200;
textbox_height = 64;
border = 8;
line_sep = 12;
line_width = textbox_width - border*2;
txtb_spr = text_box;
txtb_img = 0;
txtb_img_spd = 6/60;


page = 0
text [0] = " WELCOME TO BISTRO 13  (PRESS TAB TO CONTINUE) ";
text [1] = "   YOU NEED TO HAND IN 15 MEALS TO THE ADMIN ";
text [2] = " DO YOUR BEST TO AVOID THE GUARDS";
text [3] = "  MOVE WITH W,A,S,D PRESS SPACE FOR YOUR ABILITY";
text [4] = " GOING INTO BUILDINGS CAN HEAL YOU 50HP";
text [5] = "  GOOD LUCK!!!!!!!";


text_length[0] = string_length(text[0])
draw_char = 0;
text_spd = 1; 

setup = false;