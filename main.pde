int time=720; //midi en minutes
int currentDay=6; //0..6
String[] days ={"Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi","Dimanche"};


void addTime(int timeToAdd){
  if((time+timeToAdd)>=1440){
    time=time+timeToAdd-1440;
    currentDay+=1;
  }else{
    time+=timeToAdd;
  }
  timepassed += timeToAdd;
  
  println("Il est",time/60,"H",time%60);
  //printDay();
}

void printDay(){
  println("Nous sommes : ",days[currentDay%7]);
}
