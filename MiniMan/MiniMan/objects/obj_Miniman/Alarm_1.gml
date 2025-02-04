/// @description Insert description here
// You can write your code in this editor
// Reset sprite to idle or appropriate state
if (xsp != 0) {
    sprite_index = Walk; // Walking sprite if moving
    image_speed = 0.2;   // Walking animation speed
} else {
    sprite_index = Idle; // Idle sprite if stationary
    image_speed = 0;     // Stop animation for idle
}
