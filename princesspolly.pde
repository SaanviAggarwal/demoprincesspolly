// =====================================================
// PRINCESS POLLY WORLD
// MAIN FILE
// =====================================================

// ---------- PAGE SYSTEM ----------

String currentPage = "index";

// ---------- MONEY + TIMER ----------

int money = 100;

int dayTime = 1800; // 30 mins

// ---------- STORE BUTTON SIZE ----------

int storeW = 170;
int storeH = 120;

// =====================================================
// SETUP
// =====================================================

void setup()
{
  size(1200,700);

  imageMode(CENTER);

  rectMode(CENTER);

  textAlign(CENTER,CENTER);

  loadImages();
}

// =====================================================
// DRAW
// =====================================================

void draw()
{
  updateTimer();

  if(currentPage.equals("index"))
  {
    drawIndexPage();
  }

  else if(currentPage.equals("salon"))
  {
    drawSalonPage();
  }

  else if(currentPage.equals("restaurant"))
  {
    drawRestaurantPage();
  }

  else if(currentPage.equals("petstore"))
  {
    drawPetShopPage();
  }

  else if(currentPage.equals("icecream"))
  {
    drawIcecreamStore();
  }

  else if(currentPage.equals("carwash"))
  {
    drawCarWash();
  }

  else if(currentPage.equals("airport"))
  {
    drawAirportPage();
  }

  else if(currentPage.equals("profile"))
  {
    drawProfilePage();
  }
}

// =====================================================
// TIMER
// =====================================================

void updateTimer()
{
  if(frameCount % 60 == 0 && dayTime > 0)
  {
    dayTime--;
  }
}

// =====================================================
// SHARED HUD
// =====================================================

void drawWallet()
{
  fill(255,240,180);

  rect(120,50,180,50,20);

  fill(0);

  textSize(24);

  text("$ " + money,120,50);
}

void drawTimer()
{
  int minutes = dayTime / 60;

  int seconds = dayTime % 60;

  String timerText =
  nf(minutes,2) + ":" + nf(seconds,2);

  fill(255);

  rect(1050,120,180,50,20);

  fill(0);

  textSize(24);

  text(timerText,1050,120);
}

void drawHomeButton()
{
  fill(255);

  rect(1050,50,150,50,20);

  fill(0);

  textSize(24);

  text("HOME",1050,50);
}

// =====================================================
// MOUSE ROUTING
// =====================================================

void mousePressed()
{
  if(currentPage.equals("index"))
  {
    indexMousePressed();
  }

  else if(currentPage.equals("salon"))
  {
    salonMousePressed();
  }

  else if(currentPage.equals("restaurant"))
  {
    restaurantMousePressed();
  }

  else if(currentPage.equals("petstore"))
  {
    petShopMousePressed();
  }

  else if(currentPage.equals("icecream"))
  {
    icecreamStoreMousePressed();
  }

  else if(currentPage.equals("carwash"))
  {
    carWashMousePressed();
  }

  else if(currentPage.equals("airport"))
  {
    airportMousePressed();
  }

  else if(currentPage.equals("profile"))
  {
    profileMousePressed();
  }
}

// =====================================================
// HOME BUTTON CHECK
// =====================================================

boolean homePressed()
{
  return mouseX > 975 &&
         mouseX < 1125 &&
         mouseY > 25 &&
         mouseY < 75;
}

// =====================================================
// STORE HITBOX
// =====================================================

boolean overButton(int x,int y)
{
  return mouseX > x-storeW/2 &&
         mouseX < x+storeW/2 &&
         mouseY > y-storeH/2 &&
         mouseY < y+storeH/2;
}
