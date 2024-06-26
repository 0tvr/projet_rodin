int btnX = 50;
int btnY = 50;
int btnWidth = 120;
int btnHeight = 40;
int rslt=0;

void setup() {
  size(1080,720);
  textSize(20);
}




void draw() {
  background(255);
  drawButton(btnX, btnY, "Add 5");
  drawButton(btnX, btnY + 50, "Add 30");
  drawButton(btnX, btnY + 100, "Add 60");
  //
  drawButton(btnX+200, btnY+100, "Lavoir");
  drawButton(btnX+200, btnY+150, "Lavelinge");
  drawButton(btnX+400, btnY+100, "Sechoir");
  drawButton(btnX+400, btnY+150, "Tondeuse");

  drawInputBox();
  drawInputBox2();
}

void drawButton(int x, int y, String label) {
  fill(200);
  stroke(0);
  rect(x, y, btnWidth, btnHeight);
  fill(0);
  textAlign(CENTER, CENTER);
  text(label, x + btnWidth / 2, y + btnHeight / 2);
}

void mousePressed() {
  if (mouseX > btnX && mouseX < btnX + btnWidth) {
    if (mouseY > btnY && mouseY < btnY + btnHeight) {
      addTime(5);
    } else if (mouseY > btnY + 50 && mouseY < btnY + 90) {
      addTime(30);
      dishWasher();
    } else if (mouseY > btnY + 100 && mouseY < btnY + 140) {
      addTime(60);
    } else if (mouseY > btnY + 200 && mouseY < btnY + 320) {
  }
  
  
  
  }
  // Gérer le  du champ de texte
    if (mouseX > 200 && mouseX < 350 && mouseY > 80 && mouseY < 120) {
      focusInputHour= true;
    } else {
      focusInputHour = false;
    }
    if (mouseX > 400 && mouseX < 750 && mouseY > 80 && mouseY < 120) {
      focusInputMinute = true;
    } else {
      focusInputMinute = false;
    }
  // Première condition pour le bouton "Machinelaver"
  if (mouseX > btnX + 200 && mouseX < btnX + 200 + btnWidth && mouseY > btnY + 100 && mouseY < btnY + 100 + btnHeight) {
    if(checkInput(int(inputHour), int(inputMinute))==true){
      scheduleTime = (int(inputHour)*60)%1440+(int(inputMinute))%60;
      DSprog(scheduleTime,0);
      focusInputMinute = true;
    }else{
      inputHour="MSG_ERR";
      inputMinute="MSG_ERR";
    }
  }
  // Deuxième condition pour le bouton "Lavelinge"
  else if (mouseX > btnX + 200 && mouseX < btnX + 200 + btnWidth && mouseY > btnY + 150 && mouseY < btnY + 150 + btnHeight) {
    println("AOAO");
  }
  // Troisième condition pour le bouton "Sechoir"
  else if (mouseX > btnX + 400 && mouseX < btnX + 400 + btnWidth && mouseY > btnY + 100 && mouseY < btnY + 100 + btnHeight) {
    println("AOAO");
  }
  // Quatrième condition pour le bouton "Tondeuse"
  else if (mouseX > btnX + 400 && mouseX < btnX + 400 + btnWidth && mouseY > btnY + 150 && mouseY < btnY + 150 + btnHeight) {
    println("AOAO");
  }
}

boolean checkInput(int inputHour, int inputMinute){
  if(inputMinute>=60){
    return false;
  }
  if(inputHour>=24){
    return false;
  }
  return true;
}
