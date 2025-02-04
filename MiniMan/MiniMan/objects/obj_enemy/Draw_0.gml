draw_self(); // Draw the enemy's sprite

// Debug: Draw the enemy's direction
//draw_text(x, y - 10, "Dir: " + string(direction));draw_self(); // Draw the enemy's sprite

// Debug: Draw the enemy's direction
//draw_text(x, y - 10, "Dir: " + string(direction));

if(enemyHp<enemyMaxHp){
draw_healthbar(x-16,y-16,x+16,y-20,(enemyHp/enemyMaxHp)*100,c_black,c_red,c_green,0,true,true);	
}