// Horizontal Movement
if (keyboard_check(ord("A"))) {
    image_xscale = 1; // Face left
}
if (keyboard_check(ord("D"))) {
    image_xscale = -1; // Face right
}

xsp = keyboard_check(ord("D")) - keyboard_check(ord("A"));
xsp *= move_speed; // Scale horizontal movement by the player's speed

// Ground Check
var onGround = place_meeting(x,y+1,obj_groundblue)

if onGround {
    ysp = 0; // Stop vertical movement when on the ground

    // Jumping
    if (keyboard_check(ord("W"))) {
        ysp = -jumpSpeed; // Apply jump speed
		sprite_index = Jump;       // Set jump animation
        image_speed = 0.2;         // Set animation speed
        show_debug_message("Jump triggered with ysp: " + string(ysp));
		audio_play_sound(snd_jump, 1, false); // Play hurt sound

    }
} else {
    // Apply Gravity
    if (ysp < 10) {
        ysp += 1; // Increment vertical speed (gravity)
    }
}

// Debugging to monitor vertical speed and ground status
show_debug_message("y: " + string(y) + ", ysp: " + string(ysp) + ", _on_ground: " + string(_on_ground));

// Apply Movement
x += xsp; // Horizontal movement
y += ysp; // Vertical movement

// Shooting
if (keyboard_check_pressed(vk_space) && instance_number(objBullet) < 20) {
    var _box, _ID;

    // Debugging image_xscale to verify player direction before shooting
    show_debug_message("image_xscale before shooting: " + string(image_xscale));

    // Determine bullet spawn position based on facing direction
    if (image_xscale == -1) { // Facing right
        _box = bbox_right; // Spawn on the right side
    } else if (image_xscale == 1) { // Facing left
        _box = bbox_left;  // Spawn on the left side
    }

    // Create the bullet instance
    _ID = instance_create_layer(_box - image_xscale * 6, y + 2, "Instances", objBullet);

    // Set bullet speed based on player direction
    _ID.hspeed = -image_xscale * 5; // Flip the sign due to reversed logic

    // Set shooting state and cooldown
    isShoot = true;
	audio_play_sound(snd_shoot, 1, false);
    alarm[0] = shootCooldown; // Cooldown for shooting (1 frames)
}

// Handle Animation States
if (onGround) {
    if (xsp != 0) {
        sprite_index = Walk; // Set walking sprite when moving horizontally
        image_speed = 0.2;   // Walking animation speed
    } else {
        sprite_index = Idle; // Set idle sprite when stationary
        image_speed = 0;     // Stop animation for idle
    }
} else {
    sprite_index = Jump;     // Set jump/fall sprite when airborne
    image_speed = 0.2;       // Set animation speed for jumping/falling
}

// Check for collision with the flag
if (onGround && place_meeting(x, y, objFlag)) {
    // Set the celebration sprite
    sprite_index = spr_miniman_celebrate;
	audio_play_sound(snd_gainpoint, 1, false); 

    // Set a timer to reset the sprite after a short duration
    alarm[1] = 30; // Duration of the celebration (30 frames = ~0.5 seconds)
}

// Check for collision with the spike
if (onGround && place_meeting(x, y, objSpike)) {
  room_restart()
}

// Check for collision with the portal
if (onGround && place_meeting(x, y, obj_portal)) {
   room_goto_next()
   audio_play_sound(snd_teleport, 1, false); // Play hurt sound
   
}

if (place_meeting(x, y, obj_portal) && room == Room3) { 
    instance_create_layer(x, y, "Instances", obj_gameover);
    instance_destroy();
}


// Debugging ground and vertical states
show_debug_message("ysp: " + string(ysp) + ", _on_ground: " + string(_on_ground));




//health reduction logic for player
if (place_meeting(x, y, objSpikedamage)) {
    if (global.hp > 0) { // Reduce hp only if it's above 0
        global.hp -= 3	; // Reduce hp on collision
        audio_play_sound(snd_playerhurt, 1, false); // Play hurt sound
    }
    if (global.hp <= 0) {
        audio_play_sound(snd_losegame, 1, false); // Play game over sound
		
		// Create the Game Over object
        instance_create_layer(x, y, "Instances", obj_gameover);
    }
}



// Score increase logic 
if (place_meeting(x, y, objFlagReward)) {
    global.playerScore += 50; // Increase score
    score_updated = true; // Set the flag to indicate score change
    instance_destroy(objFlagReward); // Destroy the collectible
	audio_play_sound(snd_gainpoint, 1, false); //play sound reward sound
}

if (place_meeting(x, y, obj_portal2)) {
	x = xstart;
	y = ystart;
	audio_play_sound(snd_teleport, 1, false); // Play hurt sound
}

// Update previous hp and score trackers
previous_hp = global.hp;
if (global.playerScore > previous_score) {
    previous_score = global.playerScore;
}


show_debug_message("hp: " + string(global.hp) + ", Score: " + string(global.playerScore));
