int level = 3; //<>//

// Versuche für das Level
int triesLevel1 = 0;
int triesLevel2 = 0;
int triesLevel3 = 0;

// Bälle
Ball ballLevel0 = new Ball(20);
Ball ballLevel1 = new Ball(20);
Ball ballLevel2 = new Ball(20);
Ball ballLevel3 = new Ball(20);

// Ziele
Object finishLevel0 = new Object(20, 20);
Object finishLevel1 = new Object(20, 20);
Object finishLevel2 = new Object(20, 20);
Object finishLevel3 = new Object(20, 20);

// Wände - Level 0
Object wall1Level0 = new Object(300, 20);

// Wände - Level 1
Object wall1Level1 = new Object(231, 20);
Object wall2Level1 = new Object(20, 264);
Object wall3Level1 = new Object(165, 20);
Object wall4Level1 = new Object(20, 165);
Object wall5Level1 = new Object(86, 20);
Object wall6Level1 = new Object(363, 20);
Object wall7Level1 = new Object(20, 100);
Object wall8Level1 = new Object(20, 374);
Object wall9Level1 = new Object(103, 20);

// Wände - Level 2
Object wall1Level2 = new Object(400, 20);
Object wall2Level2 = new Object(20, 417);
Object wall3Level2 = new Object(400, 20);
Object wall4Level2 = new Object(400, 20);
Object wall5Level2 = new Object(400, 20);
Object wall6Level2 = new Object(20, 170);

// Wände - Level 3
Object wall1Level3 = new Object(400, 20);
Object wall2Level3 = new Object(20, 280);
Object wall3Level3 = new Object(180, 20);
Object wall4Level3 = new Object(198, 20);
Object wall5Level3 = new Object(99, 20);
Object wall6Level3 = new Object(20, 400);
Object wall7Level3 = new Object(20, 145);
Object wall8Level3 = new Object(185, 20);
Object wall9Level3 = new Object(132, 20);
Object wall10Level3 = new Object(220, 20);
Object wall11Level3 = new Object(20, 231);
Object wall12Level3 = new Object(90, 20);
Object wall13Level3 = new Object(90, 20);
Object wall14Level3 = new Object(20, 70);
Object wall15Level3 = new Object(20, 103);
Object wall16Level3 = new Object(80, 20);

// ArrayListen der Wände
ArrayList<Object> level0Walls = new ArrayList<Object>();
ArrayList<Object> level1Walls = new ArrayList<Object>();
ArrayList<Object> level2Walls = new ArrayList<Object>();
ArrayList<Object> level3Walls = new ArrayList<Object>();

boolean isStarted = false;
boolean isFinished = false;
boolean isOver = false;

void setup() {

  size(500, 500);

  // Setze die Bälle - Level 0
  ballLevel0.setStartX(250);
  ballLevel0.setStartY(250);

  // Setzte die Bälle - Level 1
  ballLevel1.setStartX(250);
  ballLevel1.setStartY(250);

  // Setze die Bälle - Level 2
  ballLevel2.setStartY(250);
  ballLevel2.setStartX(250);
  ballLevel2.setSpeed(2);

  // Setze die Bälle - Level 3
  ballLevel3.setStartX(5);
  ballLevel3.setStartY(470);
  ballLevel3.setSpeed(3);

  // Setze die Ziele - Level 1
  finishLevel0.setX(350);
  finishLevel0.setY(40);

  // Setze die Ziele - Level 2
  finishLevel1.setX(480);
  finishLevel1.setY(40);

  // Setze die Ziele - Level 3
  finishLevel2.setX(480);
  finishLevel2.setY(40);

  // Setze die Ziele - Level 4
  finishLevel3.setX(65);
  finishLevel3.setY(470);

  // Setzte alle Wände in ArrayList - Level 0
  level0Walls.add(wall1Level0);

  // Setze alle Wände in ArrayList - Level 1
  level1Walls.add(wall1Level1);
  level1Walls.add(wall2Level1);
  level1Walls.add(wall3Level1);
  level1Walls.add(wall4Level1);
  level1Walls.add(wall5Level1);
  level1Walls.add(wall6Level1);
  level1Walls.add(wall7Level1);
  level1Walls.add(wall8Level1);
  level1Walls.add(wall9Level1);

  // Setze alle Wände in ArrayList - Level 2
  level2Walls.add(wall1Level2);
  level2Walls.add(wall2Level2);
  level2Walls.add(wall3Level2);
  level2Walls.add(wall4Level2);
  level2Walls.add(wall5Level2);
  level2Walls.add(wall6Level2);

  // Setze alle Wände in ArrayList - Level 3
  level3Walls.add(wall1Level3);
  level3Walls.add(wall2Level3);
  level3Walls.add(wall3Level3);
  level3Walls.add(wall4Level3);
  level3Walls.add(wall5Level3);
  level3Walls.add(wall6Level3);
  level3Walls.add(wall7Level3);
  level3Walls.add(wall8Level3);
  level3Walls.add(wall9Level3);
  level3Walls.add(wall10Level3);
  level3Walls.add(wall11Level3);
  level3Walls.add(wall12Level3);
  level3Walls.add(wall13Level3);
  level3Walls.add(wall14Level3);
  level3Walls.add(wall15Level3);
  level3Walls.add(wall16Level3);

  // Setze die Wände - Level 0
  wall1Level0.setX(40);
  wall1Level0.setY(40);

  // Setze die Wände - Level 1
  wall1Level1.setX(66);
  wall1Level1.setY(66);
  wall2Level1.setX(66);
  wall2Level1.setY(297);
  wall3Level1.setX(165);
  wall3Level1.setY(66);
  wall4Level1.setX(165);
  wall4Level1.setY(66);
  wall5Level1.setX(320);
  wall5Level1.setY(0);
  wall6Level1.setX(420);
  wall6Level1.setY(51);
  wall7Level1.setX(340);
  wall7Level1.setY(198);
  wall8Level1.setX(66);
  wall8Level1.setY(396);
  wall9Level1.setX(66);
  wall9Level1.setY(396);

  // Setze die Wände - Level 2
  wall1Level2.setX(33);
  wall1Level2.setY(33);
  wall2Level2.setX(33);
  wall2Level2.setY(433);
  wall3Level2.setX(80);
  wall3Level2.setY(0);
  wall3Level2.setX(100);
  wall3Level2.setY(0);
  wall4Level2.setX(360);
  wall4Level2.setY(0);
  wall5Level2.setX(430);
  wall5Level2.setY(33);
  wall6Level2.setX(155);
  wall6Level2.setY(370);  

  // Setze die Wände - Level 3
  wall1Level3.setX(33);
  wall1Level3.setY(99); 
  wall2Level3.setX(33);
  wall2Level3.setY(99); 
  wall3Level3.setX(99);
  wall3Level3.setY(165); 
  wall4Level3.setX(165);
  wall4Level3.setY(99); 
  wall5Level3.setX(99);
  wall5Level3.setY(400); 
  wall6Level3.setX(99);
  wall6Level3.setY(400); 
  wall7Level3.setX(99);
  wall7Level3.setY(330); 
  wall8Level3.setX(231);
  wall8Level3.setY(165); 
  wall9Level3.setX(297);
  wall9Level3.setY(99); 
  wall10Level3.setX(396);
  wall10Level3.setY(0); 
  wall11Level3.setX(231);
  wall11Level3.setY(264); 
  wall12Level3.setX(297);
  wall12Level3.setY(330); 
  wall13Level3.setX(429);
  wall13Level3.setY(330); 
  wall14Level3.setX(429);
  wall14Level3.setY(330); 
  wall15Level3.setX(396);
  wall15Level3.setY(200); 
  wall16Level3.setX(363);
  wall16Level3.setY(264);

  setupGame();
  startCountdown();
}


// Prüfe, ob Ball am Ziel ist
boolean isAtFinish() {
  // Rechne Differenz von X aus
  int differenzX = getCurrentBall().getX() - getCurrentFinish().getX();

  // Rechne Diffenez von Y aus
  int differenzY = getCurrentBall().getY() - getCurrentFinish().getY();

  int laengeZiel = getCurrentFinish().getLength() - 1;
  int breiteZiel = getCurrentFinish().getWidth() - 1;

  return (differenzX >= -breiteZiel && differenzX <= breiteZiel) && (differenzY >= -laengeZiel && differenzY <= laengeZiel);
}

// Prüfe, ob Ball an eine Wand gelaufen ist
boolean isAtWall() {

  for (int i = 0; i < getCurrentWalls().size(); i++) {

    // Rechne Differze von X aus
    int differenzX = getCurrentBall().getX() - getCurrentWalls().get(i).getX();

    // Rechne Differze von Y aus
    int differenzY = getCurrentBall().getY() - getCurrentWalls().get(i).getY();

    int widthWand = getCurrentWalls().get(i).getLength() - 1;
    int breiteWand = getCurrentWalls().get(i).getWidth() - 1;

    // Prüfe, ob Wand vertikal ausgerichtet ist
    if (getCurrentWalls().get(i).getLength() > getCurrentWalls().get(i).getWidth()) {
      if ((differenzX >= -breiteWand && differenzX <= breiteWand) && (differenzY >= -getCurrentBall().getLength() && differenzY <= widthWand)) {
        return true;
      }
    } else {
      if ((differenzX >= -getCurrentBall().getLength() && differenzX <= breiteWand) && (differenzY >= -widthWand && differenzY <= widthWand)) {
        return true;
      }
    }
  }

  return false;
}


void draw() {

  if (!isOver) {
    if (isFinished) {
      background(random(255), random(255), random(255));
      delay(100);
    } else {
      if (isStarted) {
        
        // Prüfe, ob Ball gegen Wand und das Ende der Welt gelaufen ist
        if (getCurrentBall().isAtEdge() || isAtWall()) {
          countUpCurrentTries();
          stopGame();
        } else {

          // Prüfe, ob Ball am Ziel ist
          if (isAtFinish()) {
            nextLevel();
            if(level != 3) {
              thread("startCountdown");
            }
          } else {
            background(000, 255, 255);
            getCurrentBall().gehe();
          }
        }

        // Update alle Wände und das Ziel
        for (int i = 0; i < getCurrentWalls().size(); i++) {
          getCurrentWalls().get(i).update();
        }
        getCurrentFinish().update();
      }
    }
  } else {
    Ball b = new Ball(20);
    
    b.setX((int)random(480));
    b.setY((int)random(480));
    
    b.setColor((int) random(255), (int) random(255), (int) random(255));
    
    b.update();
  }
}


void keyPressed() {

  if (keyCode == RIGHT && isStarted) {
    getCurrentBall().dreheNach("rechts");
  }

  if (keyCode == LEFT && isStarted) {
    getCurrentBall().dreheNach("links");
  }
  
  if (isFinished) {
    setupGame();
    thread("startCountdown");
  }
  
  if (!isStarted || key == 'g') {
    continueGame();
  }

  if (key == 'p') {
    pauseGame();
  }

  if (key == 'n') {
    level = 0;

    setupGame();
    thread("startCountdown");
  }
}


void mousePressed() {
  println("MouseX: " + mouseX + "; MouseY: " + mouseY);
  if (isFinished) {
    setupGame();
    thread("startCountdown");
  }
}


void nextLevel() {

  // Benötigte Versuche für das Level ausgeben
  if (level != 0)
    println("Du hast " + getCurrentTries() + " Versuche für das Level " + level + " gebraucht");

  if (level == 3) {
    println(""); // Leere Zeile ausgeben
    println("Super! Du hast gewonnen! Alle Level konntest du meistern! :)");
    
    int totalTries = triesLevel1 + triesLevel2 + triesLevel3;
    println("Insgesamt hast du für alle Level " + totalTries + " gebraucht!");
    background(000, 255, 255);
    isOver = true;
  } else {
    level++;
    setupGame();
  }
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
  getCurrentBall().setX(getCurrentBall().getStartX());
  getCurrentBall().setY(getCurrentBall().getStartY());

  // Setze Farben
  getCurrentBall().setColor(255, 0, 3);
  getCurrentFinish().setColor(255, 255, 3);
  for (int i = 0; i < getCurrentWalls().size(); i++) {
    getCurrentWalls().get(i).setColor(255, 255, 255);
  }

  // Update Objekte
  getCurrentBall().update();
  getCurrentFinish().update();
  for (int i = 0; i < getCurrentWalls().size(); i++) {
    getCurrentWalls().get(i).update();
  }

  // Setze die Blickrichtung des aktuellen Balls nach Oben
  getCurrentBall().setViewingDirection(0);
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
      }
    }
  }
}


void stopGame() {
  isStarted = false;
  isFinished = true;
}

// Gibt das Array mit den Wänden des aktuellen Levels zurück
ArrayList<Object> getCurrentWalls() {
  switch(level) {
  case 0:
    return level0Walls;
  case 1:
    return level1Walls;
  case 2:
    return level2Walls;
  case 3:
    return level3Walls;
  default:
    return null;
  }
}

Object getCurrentFinish() {
  switch(level) {
  case 0:
    return finishLevel0;
  case 1:
    return finishLevel1;
  case 2:
    return finishLevel2;
  case 3:
    return finishLevel3;
  default:
    return null;
  }
}

Ball getCurrentBall() {
  switch(level) {
  case 0:
    return ballLevel0;
  case 1:
    return ballLevel1;
  case 2:
    return ballLevel2;
  case 3:
    return ballLevel3;
  default:
    return null;
  }
}

int getCurrentTries() {
  switch(level) {
  case 1:
    return triesLevel1;
  case 2:
    return triesLevel2;
  case 3:
    return triesLevel3;
  default:
    return -1;
  }
}

int countUpCurrentTries() {
  switch(level) {
  case 1:
    return triesLevel1++;
  case 2:
    return triesLevel2++;
  case 3:
    return triesLevel3++;
  default:
    return -1;
  }
}
