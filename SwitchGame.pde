// Game Design and Development by: Nils Reichardt //<>//
// Maps created by: Moritz Knaack
// Version: 1.4

int level = 3;
int[] showLevelColor = {244, 66, 241};

// Versuche für das Level
int[] tries = {-1, 0, 0, 0};

// Zeige die Zahl des Levels
int[] showLevelNumber = {-1, 2, 5, 4};

// Bälle
Ball[] ball = {new Ball(20, 250, 250), new Ball(20, 20, 450), new Ball(20, 230, 330), new Ball(20, 5, 470)};

// Ziele
Object[] finish = {new Object(20, 20, 350, 40), new Object(20, 20, 110, 450), new Object(20, 20, 230, 467), new Object(20, 20, 65, 470)};

// Wände (Array Deklarieren)
ArrayList<Object>[] walls = new ArrayList[4];

boolean isStarted = false;
boolean isFinished = false;
boolean isOver = false;


void setup() {

  size(500, 500);

  // Setze den Speed der Bälle
  ball[1].setSpeed(2);
  ball[2].setSpeed(2);
  ball[3].setSpeed(3);

  // Array "walls" intialisieren
  for(int i = 0; i < walls.length; i++) {
    walls[i] = new ArrayList<Object>();
  }

  // Setzte alle Wände in ArrayList - Level 0
  walls[0].add(new Object(300, 20, 40, 40));

  // Setze alle Wände in ArrayList - Level 1
  walls[1].add(new Object(231, 20, 66, 66));
  walls[1].add(new Object(20, 264, 66, 297));
  walls[1].add(new Object(165, 20, 165, 66));
  walls[1].add(new Object(20, 165, 165, 66));
  walls[1].add(new Object(86, 20, 320, 0));
  walls[1].add(new Object(363, 20, 420, 51));
  walls[1].add(new Object(20, 100, 340, 198));
  walls[1].add(new Object(20, 374, 66, 396));
  walls[1].add(new Object(103, 20, 66, 396));

  // Setze die Level-Anzeige in die Liste der Wände - Level 1
  walls[1].add(new Object(20, 37, 240, 176, showLevelColor));
  walls[1].add(new Object(100, 20, 267, 176, showLevelColor));

  // Setze alle Wände in ArrayList - Level 2
  walls[2].add(new Object(400, 20, 33, 33));
  walls[2].add(new Object(20, 417, 33, 433));
  walls[2].add(new Object(400, 20, 100, 0));
  walls[2].add(new Object(400, 20, 360, 0));
  walls[2].add(new Object(400, 20, 430, 33));
  walls[2].add(new Object(20, 170, 155, 370));

  // Setzte die Levelanzeige in die Liste der Wände - Level 2
  walls[2].add(new Object(20, 50, 220, 130, showLevelColor));
  walls[2].add(new Object(40, 20, 220, 150, showLevelColor));
  walls[2].add(new Object(20, 50, 220, 170, showLevelColor));
  walls[2].add(new Object(40, 20, 250, 110, showLevelColor));
  walls[2].add(new Object(20, 50, 220, 90, showLevelColor));

  // v: 8/9
  // h: 8/5

  // Setze alle Wände in ArrayList - Level 3
  walls[3].add(new Object(400, 20, 33, 99));
  walls[3].add(new Object(20, 280, 33, 99));
  walls[3].add(new Object(180, 20, 165, 99));
  walls[3].add(new Object(99, 20, 99, 400));
  walls[3].add(new Object(20, 400, 99, 400));
  walls[3].add(new Object(20, 145, 99, 330));
  walls[3].add(new Object(185, 20, 95, 165));
  walls[3].add(new Object(185, 20, 231, 165));
  walls[3].add(new Object(132, 20, 297, 99));
  walls[3].add(new Object(20, 231, 231, 270));
  walls[3].add(new Object(90, 20, 429, 330));
  walls[3].add(new Object(90, 20, 297, 330));
  walls[3].add(new Object(20, 70, 429, 330));
  walls[3].add(new Object(80, 20, 363, 270));

  // Setzte die Levelanzeige in die Liste der Wände - Level 2
  walls[3].add(new Object(110, 20, 430, 35, showLevelColor));
  walls[3].add(new Object(20, 50, 380, 35, showLevelColor));
  walls[3].add(new Object(20, 50, 380, 80, showLevelColor));
  walls[3].add(new Object(20, 50, 380, 125, showLevelColor));

  setupGame();
  startCountdown();
}

// Prüfe, ob Ball am Ziel ist
boolean isAtFinish() {
  // Rechne Differenz von X aus
  int differenzX = ball[level].getX() - finish[level].getX();

  // Rechne Diffenez von Y aus
  int differenzY = ball[level].getY() - finish[level].getY();

  int lengthFinish = finish[level].getLength() - 1;
  int widthFinish = finish[level].getWidth() - 1;

  return (differenzX >= -widthFinish && differenzX <= widthFinish) && (differenzY >= -lengthFinish && differenzY <= lengthFinish);
}

// Prüfe, ob Ball an eine Wand gelaufen ist
boolean isAtWall() {

  for (int i = 0; i < walls[level].size(); i++) {

    // Rechne Differze von X aus
    int differenzX = ball[level].getX() - walls[level].get(i).getX();

    // Rechne Differze von Y aus
    int differenzY = ball[level].getY() - walls[level].get(i).getY();

    int widthWand = walls[level].get(i).getLength() - 1;
    int breiteWand = walls[level].get(i).getWidth() - 1;

    // Prüfe, ob Wand vertikal ausgerichtet ist
    if (walls[level].get(i).getLength() > walls[level].get(i).getWidth()) {
      if ((differenzX >= -breiteWand && differenzX <= breiteWand) && (differenzY >= -ball[level].getLength() && differenzY <= widthWand)) {
        return true;
      }
    } else {
      if ((differenzX >= -ball[level].getLength() && differenzX <= breiteWand) && (differenzY >= -widthWand && differenzY <= widthWand)) {
        return true;
      }
    }
  }

  return false;
}

// Wird jeden Frame ausgeführt
void draw() {
  if (!isOver) {
    if (isFinished) {
      // Disko!
      background(random(255), random(255), random(255));
      delay(100);
    } else {
      if (isStarted) {

        // Prüfe, ob Ball gegen Wand und das Ende der Welt gelaufen ist
        if (ball[level].isAtEdge() || isAtWall()) {
          tries[level] += 1;
          stopGame();
        } else {

          // Prüfe, ob Ball am Ziel ist
          if (isAtFinish()) {
            nextLevel();
            if (level != 3) {
              thread("startCountdown");
            }
          } else {
            background(000, 255, 255);
            ball[level].move();
          }
        }

        // Update alle Wände und das Ziel
        for (int i = 0; i < walls[level].size(); i++) {
          walls[level].get(i).update();
        }
        finish[level].update();
      }
    }
  } else {
    // Ziel ist vorbei; Zeige Random gesetzte Bälle
    Ball b = new Ball(20, (int) random(480), (int) random(480), (int) random(255), (int) random(255), (int) random(255));
    b.update();
  }
}


void keyPressed() {

  // Drehe nach Rechts
  if (keyCode == RIGHT && isStarted) {
    ball[level].turn("rechts");
  }

  // Drehe nach Links
  if (keyCode == LEFT && isStarted) {
    ball[level].turn("links");
  }

  // Restart the Game
  if (isFinished) {
    restartGame();
  }

  // Setze das Spiel fort
  if (!isStarted || key == 'g') {
    continueGame();
    deleteLevelNumber();
  }

  // Pausiere das Spiel
  if (key == 'p') {
    pauseGame();
  }

  // Setze das Spiel zurück (auf Level 0)
  if (key == 'n') {
    level = 0;

    // Setze alle Versuche zurück
    for (int i = 0; i < tries.length; i++) {
      tries[i] = 0;
    }

    setupGame();
    thread("startCountdown");
  }
}


void mousePressed() {
  println("MouseX: " + mouseX + "; MouseY: " + mouseY); // ONLY FOR DEBUG

  // Restart the Game; Wenn Game-Over Screen angezeigt wird
  if (isFinished) {
    restartGame();
  }
}


void nextLevel() {

  // Benötigte Versuche für das Level ausgeben
  if (level != 0)
    println("Du hast " + tries[level-1] + " Versuche für das Level " + level + " gebraucht");

  if (level == 3) {
    println(""); // Leere Zeile ausgeben
    println("Super! Du hast gewonnen! Alle Level konntest du meistern! :)");

    // Alle Versuche addieren
    int totalTries = tries[1] + tries[2] + tries[3];
    println("Insgesamt hast du für alle Level " + totalTries + " Versuche gebraucht!");
    
    // Beende das Spiel
    background(000, 255, 255);
    isOver = true;

    // Lade alte Spielstände aus der Datei
    String file = "";
    String[] lines = loadStrings("results.txt");
    for (int i = 0; i < lines.length; i++) {
      file = file + lines[i] + " ";
    }

    // Füge die neuen Spielstände zu den alten Spielständen hinzu
    String result = "#user" + lines.length + ";" + tries[1] + ";" + tries[2] + ";" + tries[3] + ";" + totalTries +";";
    file = file + result;

    // Schreibe alle Spielstände in die results.txt
    String[] list = split(file, ' ');
    saveStrings("results.txt", list);
  } else {

    // Platz in der Konsole schaffen
    for (int i = 0; i < 5; i++) {
      println("");
    }

    level++;
    setupGame();
  }
}

void restartGame() {
  setupGame();
  thread("startCountdown");
}

void continueGame() {
  isStarted = true;
}


void pauseGame() {
  isStarted = false;
}


// Baue das Spiel auf
void setupGame() {

  println("Es geht gleich los! Du bist im Level: " + level);

  background(000, 255, 255);
  isStarted = true;
  isFinished = false;
  isOver = false;

  // Setzte den Ball wieder zurück auf seine Startposition
  ball[level].setX(ball[level].getStartX());
  ball[level].setY(ball[level].getStartY());

  // Setze Farben
  ball[level].setColor(255, 0, 3);
  finish[level].setColor(255, 255, 3);

  // Setze die Blickrichtung des aktuellen Balls nach Oben
  ball[level].setViewingDirection(0);

  // Update Objekte
  ball[level].update();
  finish[level].update();
  for (int i = 0; i < walls[level].size(); i++) {
   walls[level].get(i).update();
  }
}


void startCountdown() {
  pauseGame();
  for (int i = 3; i >= 0; i--) {
    if (i != 0) {
      if (!isStarted)
        println(i);
      if (!isStarted)
        delay(1000);
    } else {
      if (!isStarted) {
        continueGame();
        println("Auf gehts!");
        deleteLevelNumber();
      }
    }
  }
}

// Löscht die Level Anzeige aus der ArrayList
void deleteLevelNumber() {
  if (level != 0 && tries[level] == 0) {
    for (int i = 0; i < showLevelNumber[level]; i++) {
      walls[level].remove(walls[level].size() - 1);
    }
  }
}


void stopGame() {
  isStarted = false;
  isFinished = true;
}
