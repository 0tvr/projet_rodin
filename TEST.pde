String inputText = ""; // Texte saisi par l'utilisateur
boolean focus = false; // Si le champ d'entrée a le focus
int heureeeee=0;


void drawInputBox() {
  // Dessiner le champ de texte
  stroke(0);
  fill(255);
  rect(200, 80, 300, 40);

  fill(0);
  if (focus) {
    text(inputText + "|", 210, 110); // Affiche un curseur clignotant
  } else {
    text(inputText, 210, 110);
  }
}

void keyPressed() {
  if (focus) {
    if (keyCode == BACKSPACE) {
      if (inputText.length() > 0) {
        inputText = inputText.substring(0, inputText.length() - 1);
      }
    } else if (keyCode == ENTER || keyCode == RETURN) {
      // Traitement du texte lorsque l'utilisateur appuie sur Entrée
      int rslt = int(inputText);
      println("Nombre entier saisi : " + rslt);
      focus = false;
    } else {
      // Ajoute uniquement les chiffres ou le signe moins (pour les nombres négatifs)
      if ((key >= '0' && key <= '9')) {
        inputText += key;
      }
    }
  }
}
