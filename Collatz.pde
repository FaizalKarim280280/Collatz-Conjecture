import processing.pdf.*;

float xPos, yPos;
float angle = PI/20, len = 11;

void setup(){
 
  size(1920, 1080);
  //beginRecord(PDF, "dontKnowWhatIsThis.pdf");
  
  background(0);
  strokeWeight(1.3);
  
  for(long i =2; i<13000; i++){
    LongList list =  new LongList();
    
    resetMatrix();
    long n = i;
    translate(width/2+50, height-50);
    list.append(n);
    
    while(n!= 1){
       n = collatz(n);
       list.append(n);
    }
    
    list.reverse();
    float lcolor[] = {0, random(150), random(255)};  
    float rang = 1;
    
    for(long ele : list){
      //println(ele);
      if(ele % 2 == 0){
         rotate(rang *angle);
      } else {
         rotate(-rang * angle); 
      }
      
      stroke(lcolor[0], lcolor[1], lcolor[2],20);
      line(0,0,0, -len);
      
      translate(0, -len);
    }
    
    //if(i%1000 == 0)
    //  delay(100);
    
   }
   
   println("Done");
   //save("myCollatz2.png");
   //endRecord();
   
}


void draw(){
  //well nothing to do here yet
}

long collatz(long n){
  if(n%2 == 0){
    return n/2;
  } else{
     return (3*n + 1)/2; 
  }
}
