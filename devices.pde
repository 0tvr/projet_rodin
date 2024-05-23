int dishWasherState = 0;//off
int washingMachineState = 0;
int dryerState = 0;
int mowerState=0;
int timepassed=0;

boolean[] machineProg={false,false,false, false};//dish, dryer, washer, mower
int[] machineSchedule={0,0,0,0};//dish, dryer, washer, mower heure de programmation

int timeSlotStart=1320;
int timeSlotEnd=360;

void DSprog(int scheduleTime, int machine){
  //machine : 0=dish, 1=dryer, 2=washer, 3=mower
  if((currentDay==5 ||currentDay==6) && machine !=3){
    machineSchedule[machine]=scheduleTime;
    machineProg[machine]=true;
    println("la machine a laver est programmée à :",scheduleTime/60,"H",scheduleTime%60);
  }else{
    if(machine>=0&&machine<=3){
      timeSlotStart=1320;
      timeSlotEnd=240;
    }else{
      timeSlotStart=420;
      timeSlotEnd=1020;
    }
    if(scheduleTime<=timeSlotEnd && scheduleTime>=timeSlotStart){
      machineSchedule[machine]=scheduleTime;
      machineProg[machine] = true;
      println("la machine a laver est programmée à :",time/60,time%60);
    }
  } 
}
//variable qui garde le temps qui reste
//fonction qui décompte le temps restant à partir du moment où la machine à starté

void dishWasher() {
    println("etat de la machine:", machineProg[0]);

    // Heure actuelle en minutes depuis minuit
    int currentTime = time % 1440;
    // Heure de programmation ajustée pour le passage de minuit
    int scheduledTime = machineSchedule[0];

    // Vérifie si la machine est programmée
    if (machineProg[0]) {
        // Vérifie si l'heure actuelle ou programmée est dans la période nocturne
        if ((currentTime >= 1320 || currentTime < 360) || (scheduledTime >= 1320 || scheduledTime < 360)) {
            // Assurez-vous que la machine ne s'active pas prématurément
            if (!(scheduledTime < 360 && currentTime >= 1320)) {
                // Vérifie si 30 minutes se sont écoulées
                if (timepassed >= 30) {
                    dishWasherState += 1;
                    println("cycle: ", dishWasherState);

                    // Réinitialise timepassed après le traitement
                    timepassed = 0;

                    // Réinitialisation du lave-vaisselle après 4 cycles
                    if (dishWasherState >= 4) {
                        dishWasherState = 0;
                        machineProg[0] = false;
                        println("finito pipo");
                    }
                }
            }
        }
    }
}




void dryer(){
  if(machineProg[1]==true && time%1440>=machineSchedule[1]){  
    if(dryerState==1){
      dryerState=0;
      machineProg[1]=false;
    }
    else{
      dryerState+=1;
    }
  }
}
void washingMachine(){
  if(machineProg[2]==true && time%1440>=machineSchedule[2]){  
    if(washingMachineState==3){
      washingMachineState=0;
      machineProg[2]=false;
    }
    else{
      washingMachineState+=1;
    }
  }
}

void mower(){
  if(machineProg[2]==true && time%1440>=machineSchedule[2]){  
    if(washingMachineState==3){
      washingMachineState=0;
      machineProg[2]=false;
    }
    else{
      washingMachineState+=1;
    }
  }
}
