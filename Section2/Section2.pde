int levels;
color bg,fg;

void setup() {
  size(800, 600);
  levels = 1;
}

/*Create Pascal's Gasket (google an image of this)
  The outer triangle are the vertices: (v1x, v1y), (v2x,v2y), (v3x, v3y)
  levels:
  0 = regular triangle
  1 = triforce (looks like 3 triangles)
  2 = each of the 3 triangles will be cut into 3 triangles.
  etc.
*/
void gasket(int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {  
  if(levels>=0){
        float x1=(v1x+v2x)/2;
        float y1=(v1y+v2y)/2;
        float x2=(v3x+v2x)/2;
        float y2=(v3y+v2y)/2;
        float x3=(v1x+v3x)/2;
        float y3=(v1y+v3y)/2;
        fill(219,254,184);
        triangle(x1,y1,x2,y2,x3,y3);
        gasket(levels-1,v1x, v1y, x1, y1, x3, y3); 
        gasket(levels-1,x1, y1, v2x, v2y, x2, y2);
        gasket(levels-1,x2, y2, x3, y3,v3x,v3y); 
      }
}
void koch(int levels,float x1,float y1,float x2,float y2){
  line(x1,y1,x2,y2);
  if (levels>0){
  float Ux=x2-x1;
  float Uy=y2-y1;
  float Vx=y1-y2;
  float Vy=x2-x1;
  stroke(147,177,167);
  line(x1+Ux*1/3,y1+Uy*1/3,x1+Ux*2/3,y1+Uy*2/3);
  stroke(0,0,0);
  koch(levels-1,x1,y1,x1+Ux*1/3,y1+Uy*1/3);
  koch(levels-1,x1+Ux*2/3,y1+Uy*2/3,x2,y2);
  koch(levels-1,x1+Ux*1/3,y1+Uy*1/3,x1+Ux*1/2+(sqrt(3)/6)*Vx,y1+Uy*1/2+(sqrt(3)/6)*Vy);
  koch(levels-1,x1+Ux*1/2+(sqrt(3)/6)*Vx,y1+Uy*1/2+(sqrt(3)/6)*Vy,x1+Ux*2/3,y1+Uy*2/3);
  }
}
  
void draw() { 
  background(153,194,162);  
  fill(255);
  text("Click the mouse to increase levels, press a key to decrease levles",20,20);
  if(levels>=0){
    fill(197,237,172);
    triangle(0, height-10, width, height-10, width/2, 10);  
    gasket(levels-1,0, height-10, width, height-10, width/2, 10);
    koch(levels,width-10, height/2,10, height/3 );
  }
  
  
 //other fractal you can do! This requires a bit more math, or you can look up the coordinates.
}

void mouseClicked(){ 
 levels ++;  
}

void keyPressed(){
 levels --; 
}
