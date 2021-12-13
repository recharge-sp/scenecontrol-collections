# aff syntax
`scenecontrol(0,bgcreate,x);`: create background from x.jpg (x has to be number)  
`scenecontrol(timing,bgshow,x,duration);` show x.jpg in duration (background has to be created first)  
`scenecontrol(timing,bghide,x,duration);` hide x.jpg in duration (background has to be created first)  

# Example
`scenecontrol(0,bgcreate,0);`: create background from 0.jpg  
`scenecontrol(0,bgcreate,1);`: create background from 1.jpg  
`scenecontrol(1000,bgshow,0,500);`: show 0.jpg in 500ms at 2000ms  
`scenecontrol(2000,bgshow,1,500);`: show 1.jpg in 500ms at 2000ms  
`scenecontrol(2500,bghide,0,1);`: hide 0.jpg in 1ms at 2500ms  
`scenecontrol(3000,bghide,1,500);`: hide 1.jpg in 500ms at 3000ms
