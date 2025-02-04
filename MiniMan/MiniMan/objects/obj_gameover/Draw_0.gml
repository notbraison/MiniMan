draw_set_font(Font2);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

// Draw the Game Over text
draw_text(room_width / 2, room_height / 2 - 50, "GAME OVER");

// Display final score
draw_text(room_width / 2, room_height / 2, "Final Score: " + string(global.playerScore));
