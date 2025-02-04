// Initialize Variables and Ground Check
var _on_ground = place_meeting(x, y + 2, objSolid); // Check if the player is grounded

// Gravity
if (!_on_ground) {
    ysp += 0.1; // Increment vertical speed for gravity
} else {
    // Snap to the ground to avoid sinking
    while (!place_meeting(x, y + 1, objSolid)) {
        y += 1;
    }
    ysp = 0; // Reset vertical speed when on the ground
}

// Movement Input
var _move_left = keyboard_check(ord("A"));
var _move_right = keyboard_check(ord("D"));
var _jump = keyboard_check_pressed(ord("W"));

// Horizontal Movement
if (_move_left) {
    xsp = -1;          // Move left
    image_xscale = 1;  // Face left
} else if (_move_right) {
    xsp = 1;           // Move right
    image_xscale = -1; // Face right
} else {
    xsp = 0; // Stop moving if no keys are pressed
}

// Handle Jumping and Ground Animation
if (_on_ground) {
    if (_jump) {
        ysp = -2.0;          // Apply jump speed
        sprite_index = Jump; // Set jump animation
        image_speed = 0.2;   // Set animation speed
        show_debug_message("Jump triggered with ysp: " + string(ysp));
    } else if (xsp != 0) {
        sprite_index = Walk; // Set walking animation
        image_speed = 0.2;   // Set animation speed
    } else {
        sprite_index = Idle; // Set idle animation
        image_speed = 0;     // Stop animation
    }
} else {
    // Airborne
    sprite_index = Jump;     // Set jump animation
    image_speed = 0.2;       // Set animation speed
}

// Apply Vertical Movement
if (!place_meeting(x, y + ysp, objSolid)) {
    y += ysp; // Move vertically if no collision
} else {
    // Snap to ground on collision
    while (!place_meeting(x, y + 1, objSolid)) {
        y += 1;
    }
    ysp = 0; // Stop vertical movement
}

// Apply Horizontal Movement
if (!place_meeting(x + xsp, y, objSolid)) {
    x += xsp; // Move horizontally if no collision
} else {
    xsp = 0; // Stop horizontal movement if collision occurs
}

// Shooting Logic
if (keyboard_check_pressed(ord("X")) && instance_number(objBullet) < 3) {
    var _box, _ID;

    // Debugging image_xscale
    show_debug_message("image_xscale before shooting: " + string(image_xscale));

    // Determine spawn position based on facing direction
    if (image_xscale == -1) { // Facing right
        _box = bbox_right; // Spawn on the right side
    } else if (image_xscale == 1) { // Facing left
        _box = bbox_left;  // Spawn on the left side
    }

    // Create the bullet instance
    _ID = instance_create_layer(_box - image_xscale * 6, y + 2, "Instances", objBullet);

    // Set bullet speed based on direction
    _ID.hspeed = -image_xscale * 5; // Flip the sign due to reversed logic

    // Set shooting flag and cooldown
    isShoot = true;
    alarm[0] = 20; // Cooldown for shooting
}

// Handle Sprites Based on Shooting State
if (_on_ground) {
    if (isShoot) {
        Idle = SpriteIdleShoot;
        Walk = SpriteWalkShoot;
    } else {
        Idle = SpriteIdle;
        Walk = SpriteWalk;
    }
} else {
    if (isShoot) {
        Jump = SpritejumpShoot;
    } else {
        Jump = SpriteJump;
    }
}

// Final Sprite Setting
if (_on_ground) {
    if (xsp != 0) {
        sprite_index = Walk;
        image_speed = 0.2;
    } else {
        sprite_index = Idle;
        image_speed = 0;
    }
} else {
    sprite_index = Jump;
    image_speed = 0.2;
}
