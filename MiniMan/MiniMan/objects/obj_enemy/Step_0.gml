// AI Movement Logic

// Just Run
if justrun=true {
    move_towards_point(obj_Miniman.x,obj_Miniman.y,move_speed);
} else {

// Initial Proximity Trigger for Chase
if runaway=false && chase=false && distance_to_object(obj_Miniman) < 200 {
    chase=true;
    runaway=false;
}

// New Proximity Trigger for Chase (Only one for life of instance)
if chase=true && runaway=false && distance_to_object(obj_Miniman) < 400{
    move_towards_point(obj_Miniman.x,obj_Miniman.y,move_speed);
}

// If obj_Miniman is more than 400 pixels away, stop Chase
if chase=true && runaway=false && distance_to_object(obj_Miniman) > 400 {
    move_towards_point(obj_Miniman.x,obj_Miniman.y,move_speed);
}

// Flee in random direction away from obj_Miniman after Collision Event with obj_Miniman
if chase=false && runaway=true {
    move_towards_point(obj_Miniman.x,obj_Miniman.y,move_speed);
   var playerdirection = point_direction(x,y,obj_Miniman.x,obj_Miniman.y);
    direction = (playerdirection + (180 + random(40)) );
}
}

// Stop and Start Animation
if speed = 0 {
    image_speed = 0;
} else {
    image_speed = 2;
};