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

PImage grassBackground;
// =====================================================
// SETUP
// =====================================================

void setup()
{
  size(1200,700);

  imageMode(CENTER);

  rectMode(CENTER);

  textAlign(CENTER,CENTER);

  grassBackground = loadImage("grass.png");

  profileIcon = loadImage("profile.png");

  //Main Page 
  salonImg = loadImage("salon.png");
  petShopImg = loadImage("petStore.png");
  iceCreamImg = loadImage("icecream.png");
  restaurantImg = loadImage("restaurant.png");
  bedroomImg = loadImage("castle.png");
  carWashImg = loadImage("carWash1.png");
  airportImg = loadImage("airport.png");
  carWashBackground = loadImage("blackBackground.png");
  handsImg = loadImage("hands.png");
  feetImg = loadImage("feet.png");
  
  //Car Wash
  carWashBackground = loadImage("blackBackground.png");
  car = loadImage("car.png"); 
  hose = loadImage("hose.png");
  soapSponge = loadImage("soapySponge.png");
  cloth = loadImage("cloth.png");

  // NAil Salon
  nailClipperImg = loadImage("nailClipper.png");
  nailFileImg = loadImage("nailFiler.png");
  
  redBottle = loadImage("redNailPolish.png");
  blueBottle = loadImage("blueBottle.png");
  greenBottle = loadImage("greenNailPolish.png");
  yellowBottle = loadImage("yellowNailPolish.png");
  purpleBottle = loadImage("purpleBottle.png");
  pinkBottle = loadImage("pinkBottle.png");
  
  // Pet Store
  dog = loadImage("dog.png");
  cat = loadImage("cat.png");
  bunny = loadImage("bunny.png");
  turtle = loadImage("turtle.png");
  horse = loadImage("horse.png");
  
  dogFood = loadImage("dogFood.png");
  catFood = loadImage("catFood.png");
  bunnyFood = loadImage("bunnyFood.png");
  turtleFood = loadImage("turtleFood.png");
  horseFood = loadImage("horseFood.png");
  
  dogAccessory = loadImage("dogItem.png");
  catAccessory = loadImage("catItem.png");
  bunnyAccessory = loadImage("bunnyItem.png");
  turtleAccessory = loadImage("turtleItem.png");
  horseAccessory = loadImage("horseItem.png");
    
  //Restaurant
    snack1 = loadImage("granola.png"); 
    snack2 = loadImage("candyBar.png");
    snack3 = loadImage("fruitCup.png");
    snack4 = loadImage("popcorn.png");
    snack5 = loadImage("chips.png");
  
    mainCourse1 = loadImage("ramen.png"); 
    mainCourse2 = loadImage("sushi.png");
    mainCourse3 = loadImage("soup.png");
    mainCourse4 = loadImage("spagetti.png");
    mainCourse5 = loadImage("pizza.png");
  
    dessert1 = loadImage("cakePop.png"); 
    dessert2 = loadImage("cake.png"); 
    dessert3 = loadImage("brownie.png"); 
    dessert4 = loadImage("cookies.png"); 
    dessert5 = loadImage("cupcake.png"); 
  
    drink1 = loadImage("yellowDrink.png"); 
    drink2 = loadImage("water.png"); 
    drink3 = loadImage("sunsetDrink.png"); 
    drink4 = loadImage("champagne.png");
    drink5 = loadImage("cola.png");
    
  //Icecream Store 
    cone = loadImage("cone.png");
    cup = loadImage("cup.png");
    vanilla = loadImage("vanilla.png");
    chocolate = loadImage("chocolate.png");
    strawberry = loadImage("strawberry.png");
    mango = loadImage("mango.png");
    lime = loadImage("lime.png");
  
  //profile 
    character = loadImage ("character.png"); 
    pinkDress = loadImage ("pinkDress.png"); 
    yellowDress = loadImage ("yellowDress.png"); 
    greenDress = loadImage ("greenDress.png"); 
    blueDress = loadImage ("blueDress.png"); 
    purpleDress = loadImage ("purpleDress.png"); 
    crown1 = loadImage ("crown1.png");
    crown2 = loadImage ("crown2.png");
    crown3 = loadImage ("crown3.png");
    crown4 = loadImage ("crown4.png");
    crown5 = loadImage ("crown5.png");
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
