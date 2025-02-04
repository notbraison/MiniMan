// Movement Variables
xsp = 0;               // Horizontal speed  move_x
ysp = 0;               // Vertical speed    move_y

move_speed = 2;



// Enemy stats
cooldown =0;
enemyHp = 50;
enemyMaxHp = 50;

invincible=false;
chase=false;
runaway=false;
justrun=false;

show_debug_message("Enemy Created at: (" + string(x) + ", " + string(y) + ")");

image_alpha = 1; // Fully visible
image_scale = 1; // Normal size
