/// @description Insert description here
// You can write your code in this editor

//increase window size
window_set_size(1280,720)
//vertical and horizontal speed
xsp=0
ysp=0

move_and_collide(xsp,ysp,OGroundBlue)

//player and enemy collisions


if place_meeting(x,y,Oplayer){
//restart room
room_restart()
}