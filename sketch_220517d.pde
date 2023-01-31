PImage pic;
int spacing=50;
int[][] myArray = new int[8][8]; 

int xNum=0;
int yNum=0;
int yRound=0;

int times = 0;
  
void setup(){

  pic = loadImage("2.JPG");
  pic.resize(width,height);

  size(450,450);
  background(255);
  colorMode(HSB);

  for(int i=0; i<8; i++){ //row=8, col=8;initialise two-dimensional array
    for(int j=0; j<8; j++){
      myArray[i][j]=0;
    }
  }
  
  for(int x=spacing; x<width; x+=spacing){
    for(int y=spacing; y<height; y+=spacing){
      color c=pic.get(x,y);
      myArray[xNum][yNum]=(int)brightness(c);
      yNum++;
    }
    yNum=0;
    yRound++;
    xNum++;
  }
  println("row=", xNum, "column=", yRound);
  
  //for(int i = 0; i<myArray.length; i++){
  //  println(myArray[i]);
  //}
  
  for(int i=0; i<8; i++){ //row=8, col=8; print the data of two-dimensional array
    for(int j=0; j<8; j++){
      if(myArray[j][i]<100){
        print("[0"+myArray[j][i]+"],");
      }
      else
        print("["+myArray[j][i]+"],");
      }
     print("\n");
  }
}

void draw(){
  if (mousePressed == true) {
    if(times%2==0){
      image(pic, 0, 0);
      loadPixels();
      for(int i = 0; i<pixels.length; i++){
        pixels[i]=color(hue(pixels[i]),0, brightness(pixels[i]), 5);
      }
      updatePixels();
    }
    else{
      image(pic, 0, 0);
      loadPixels();
      for(int i = 0; i<pixels.length; i++){
        pixels[i]=color(hue(pixels[i]),saturation(pixels[i]), brightness(pixels[i]));
      }
      updatePixels();
    }
  }
  
  else{
    background(255);
    xNum=0;
    yNum=0;  
    
    for(int x=spacing; x<width; x+=spacing){
      for(int y=spacing; y<height; y+=spacing){
        color c=pic.get(x,y);
        fill(brightness(c));
        myArray[xNum][yNum]=(int)brightness(c);
        stroke(0);
        //rect(x, y, spacing*0.7, spacing*0.7); 
        ellipse(x, y, spacing*0.7, spacing*0.7); 
        yNum++;
      }
      yNum=0;
      yRound++;
      xNum++;
    }    
  }
}

void mouseReleased(){
  times++;
}
