String inputHour = ""; // Texte saisi par l'utilisateur
String inputMinute = ""; // Texte saisi par l'utilisateur
boolean focusInputHour = false; // Si le champ d'entrée a le focusInputHoutInputHout
boolean focusInputMinute = false;
int scheduleTime=0;


void drawInputBox() {
  // Dessiner le champ de texte
  stroke(0);
  fill(255);
  rect(200, 80, 150, 40);
  fill(0);
  if (focusInputHour) {
    text(inputHour + "|", 210, 110); // Affiche un curseur clignotant
  } else {
    text(inputHour, 210, 110);
  }
}
void drawInputBox2() {
  // Dessiner le champ de texte
  stroke(0);
  fill(255);
  rect(400, 80, 150, 40);
  fill(0);
  if (focusInputMinute) {
    text(inputMinute + "|", 410, 110); // Affiche un curseur clignotant
  } else {
    text(inputMinute, 410, 110);
  }
}

void keyPressed() {
  if (focusInputHour) {
    if (keyCode == BACKSPACE) {
      if (inputHour.length() > 0) {
        inputHour = inputHour.substring(0, inputHour.length() - 1);
      }
    } else if (keyCode == ENTER || keyCode == RETURN) {
      // Traitement du texte lorsque l'utilisateur appuie sur Entrée
      int rslt = int(inputHour);
      println("Nombre entier saisi : " + rslt);
      focusInputHour = false;
    } else {
      // Ajoute uniquement les chiffres ou le signe moins (pour les nombres négatifs)
      if ((key >= '0' && key <= '9')) {
        inputHour += key;
      }
    }
  }
  if (focusInputMinute) {
    if (keyCode == BACKSPACE) {
      if (inputMinute.length() > 0) {
        inputMinute = inputMinute.substring(0, inputMinute.length() - 1);
      }
    } else if (keyCode == ENTER || keyCode == RETURN) {
      // Traitement du texte lorsque l'utilisateur appuie sur Entrée
      int rslt2 = int(inputMinute);
      println("Nombre entier saisi : " + rslt2);
      focusInputMinute = false;
    } else {
      // Ajoute uniquement les chiffres ou le signe moins (pour les nombres négatifs)
      if ((key >= '0' && key <= '9')) {
        inputMinute += key;
      }
    }
  }
}
