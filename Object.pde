class Object {

  private int x, y;
  private int[] objectColor = {255, 255, 255};
  private int objectLength, objectWidth;

  // Konstruktor mit Größe
  Object(int pLength, int pWidth) {
    setLength(pLength);
    setWidth(pWidth);
  }

  // Konstruktor mit Größe und Koordinaten
  Object(int pLength, int pWidth, int pX, int pY) {
    this(pLength, pWidth);
    setX(pX);
    setY(pY);
  }

  // Konstruktor mit Größe & Farben
  Object(int pLength, int pWidth, int[] pColor) {
    this(pLength, pWidth);
    setColor(pColor[0], pColor[1], pColor[2]);
  }

  // Konstruktor mit Größe, Koordinaten und Farben 
  Object(int pLength, int pWidth, int pX, int pY, int[] pColor) {
    this(pLength, pWidth, pColor);
    setX(pX);
    setY(pY);
  }

  void update() {
    // Male ein Rechteck mit Farben
    fill(objectColor[0], objectColor[1], objectColor[2]);
    rect(getX(), getY(), getWidth(), getLength());
  }

  // Getter: Color
  public void setColor(int pColorV1, int pColorV2, int pColorV3) {
    objectColor[0] = validateColor(pColorV1);
    objectColor[1] = validateColor(pColorV2);
    objectColor[2] = validateColor(pColorV3);
  }

  private int validateColor(int pColor) {
    if (pColor >= 0 && pColor <= 255) {
      return pColor;
    }
    return 0;
  }

  // Getter: Color
  public int[] getColor() {
    return objectColor;
  }

  // Getter: X
  public int getX() {
    return x;
  }

  // Setter: X
  public void setX(int pX) {
    if (pX >= -10 && pX <= 500) {
      x = pX;
    } else {
      println("Fehler! Der Parameter \"" + pX + "\"für setX stimmt nicht!");
    }
  }

  // Getter: Y
  public int getY() {
    return y;
  }

  // Getter: Y
  public void setY(int pY) {
    if (pY >= -10 && pY <= 500) {
      this.y = pY;
    } else {
      println("Fehler! Der Parameter \"" + pY + "\" für setY stimmt nicht!");
    }
  }

  public void setLength(int pLaenge) {
    if (pLaenge > 0) {
      objectLength = pLaenge;
    } else {
      println("Error! Die Länge einer Wand ist falsch");
    }
  }

  public int getLength() {
    return objectLength;
  }

  public void setWidth(int pobjectWidth) {
    if (pobjectWidth > 0) {
      objectWidth = pobjectWidth;
    } else {
      println("Error! Die objectWidth einer Wand ist falsch");
    }
  }

  public int getWidth() {
    return objectWidth;
  }
}
