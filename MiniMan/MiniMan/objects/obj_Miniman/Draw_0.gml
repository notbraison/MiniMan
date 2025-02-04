
// Draw the player sprite
draw_self();

if(global.hp<maxHp){
draw_healthbar(x-16,y-16,x+16,y-20,(global.hp/maxHp)*100,c_black,c_red,c_green,0,true,true);	
}