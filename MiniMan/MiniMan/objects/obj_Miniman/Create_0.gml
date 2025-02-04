/// @description Insert description here
// You can write your code in this editor
// Movement Variables
xsp = 0;               // Horizontal speed  move_x
ysp = 0;               // Vertical speed    move_y

move_speed = 3;


jumpSpeed = 13;      // Speed of jump


// State Variables
//gravity=1;
_on_ground = false;    // Check if the player is on the ground
isShoot = false;       // Check if the player is shooting

// Sprites
Idle = spr_miniman_idle;            // Default idle sprite
Walk = spr_miniman_run;            // Walking sprite
Jump = spr_miniman_jump;            // Jumping sprite
ShootIdle = spr_miniman_shoot;  // Shooting while idle
ShootWalk = spr_miniman_walkshoot;  // Shooting while walking
ShootJump = spr_miniman_jump_shoot;  // Shooting while jumping

// Shooting Settings
shootCooldown = 20;          // Shooting cooldown in frames

// Player stats
cooldown =0;
global.hp = 100;
maxHp = 100;
global.playerScore = 0;


// State tracking
previous_score = 0;       // To track changes in score
previous_hp = global.hp; // To track changes in health
score_updated = false;    // For visual feedback when the score changes

//if game needs a restart basically end of game
restart = false;


image_alpha = 1; // Fully visible
image_scale = 1; // Normal size