// Set text properties
draw_set_font(Font2); // Optional: Set a custom font
draw_set_halign(fa_center); // Center horizontally
draw_set_valign(fa_middle); // Center vertically

// Draw the score text
draw_set_color(c_red); // Set text color to red
draw_text(700, 100, "Score: " + string(global.playerScore)); // Display the actual score

// Reset draw settings
draw_set_halign(fa_left);
draw_set_valign(fa_top);
