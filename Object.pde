class Object {

  private int x = 25;
  private int y = 25;

  private int colorV1;
  private int colorV2;
  private int colorV3;
  
  private int objectLength;
  private int objectWidth;

  // Konstruktor mit Größe
  Object(int pLaenge, int pObjectWidth) {
    setLength(pLaenge);
    setWidth(pObjectWidth);
  }
  
  // Konstruktor mit Größe & Farben
  Object(int pLaenge, int pObjectWidth, int colorV2, int colorV3) {
    this(pLaenge, pObjectWidth);
    setColor(colorV1, colorV2, colorV3);
  }

  void update() {
    fill(getColorV1(), getColorV2(), getColorV3());
    rect(getX(), getY(), getWidth(), getLength());
  }

  // Getter: Color
  public void setColor(int colorV1, int colorV2, int colorV3) {
    this.colorV1 = validateColor(colorV1);
    this.colorV2 = validateColor(colorV2);
    this.colorV3 = validateColor(colorV3);
  }
  
  private int validateColor(int pColor) {
    if (pColor >= 0 && pColor <= 255) {
      return pColor;
    }
    return 0;
  }
  
  // Getter: Color1
  public int getColorV1() {
    return colorV1;
  }
  
  // Getter: Color2
  public int getColorV2() {
    return colorV2;
  }
  
  // Getter: Color3
  public int getColorV3() {
    return colorV3;
  }

  // Getter: X
  public int getX() {
    return x;
  }

  // Setter: X
  public void setX(int x) {
    if (x >= -10 && x <= width - getWidth()) {
      this.x = x;
    } else {
      println("Fehler! Der Parameter für setX stimmt nicht!");
    }
  }

  // Getter: Y
  public int getY() {
    return y;
  }

  // Getter: Y
  public void setY(int y) {
    if (y >= -10 && y <= height - getLength()) {
      this.y = y;
    } else {
      println("Fehler! Der Parameter für setY stimmt nicht!");
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
