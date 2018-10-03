class Ball extends Object {

  private int startX = 25;
  private int startY = 25;

  private int speed = 1;

  private int viewingDirection = 3;

  Ball(int pSize) {
    super(pSize, pSize);
  }

  // Setter: startX
  public void setStartX(int pStartX) {
    if (pStartX >= 0) {
      startX = pStartX;
      setX(getStartX());
    } else {
      println("Fehler! Der Parameter für setStartX ist falsch!");
    }
  }

  // Getter: startX
  public int getStartX() {
    return startX;
  }

  // Setter: startY
  public void setStartY(int pStartY) {
    if (pStartY >= 0) {
      startY = pStartY;
      setY(getStartY());
    } else {
      println("Fehler! Der Parameter für setStartX ist falsch!");
    }
  }

  // Getter: startY
  public int getStartY() {
    return startY;
  }

  // Drehe in nach Rechts oder Links - [pViewingDirection] muss "links" oder "rechts sein"
  public void turn(String pViewingDirection) {
    switch(pViewingDirection) {
    case "rechts":
      if (viewingDirection == 3) {
        viewingDirection = 0;
      } else {
        viewingDirection++;
      }
      break;
    case "links":
      if (viewingDirection == 0) {
        viewingDirection = 3;
      } else {
        viewingDirection--;
      }
      break;
    default:
      println("Fehler! Der Ball kann sich nur nach links oder rechts drehen!");
      break;
    }
  }

  public void move() {
    switch(viewingDirection) {
    case 0:
      setY(getY() - getSpeed());
      break;
    case 1:
      setX(getX() + getSpeed());
      break;
    case 2:
      setY(getY() + getSpeed());
      break;
    case 3:
      setX(getX() - getSpeed());
      break;
    }

    this.update();
  }

  // Prüfen, ob am Rand ist
  public boolean isAtEdge() {
    if (getX() <= 0 || getX() == windowXY - getLength() || getY() <= 0 || getY() == windowXY - getLength())
      return true;
    else
      return false;
  }

  // Setter: Viweing Direction
  public void setViewingDirection(int pViewingDirection) {
    if (pViewingDirection >= 0 && pViewingDirection <= 3) {
      viewingDirection = pViewingDirection;
    } else {
      println("Fehler! Der Parameter für setViewingDirection ist falsch!");
    }
  }

  // Getter: Speed
  public int getSpeed() {
    return speed;
  }

  // Setter: Speed
  public void setSpeed(int speed) {
    if (speed >= 0 && speed<= 50) {
      this.speed = speed;
    }
  }
}
