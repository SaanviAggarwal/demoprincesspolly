// Store graphics
PImage salonImg;
PImage petShopImg;
PImage iceCreamImg;
PImage restaurantImg;
PImage bedroomImg;
PImage carWashImg;
PImage airportImg;
PImage profilePageImg;

boolean showInfo = false;

void drawIndexPage()
{
  background(135,206,235);

  image(grassBackground,
        width/2,
        height/2,
        width,
        height);

  fill(255);

  textSize(42);

  text("Princess Polly World",
       width/2,
       50);

  image(profileIcon,
        60,
        60,
        70,
        70);

  noFill();

  stroke(255);

  strokeWeight(3);

  ellipse(60,60,75,75);

  noStroke();

  // INFO BUTTON (FIXED POSITION - NO OVERLAP WITH TIMER)
  fill(255);
  rect(width - 80, 120, 120, 40, 15);

  fill(0);
  textSize(18);
  text("INFO", width - 80, 120);

  // WALLET
  fill(255,240,180);
  rect(120,650,200,50,20);

  fill(0);
  textSize(24);
  text("$ " + money,
       120,
       650);

  // TIMER (unchanged)
  int minutes = dayTime/60;
  int seconds = dayTime%60;

  String timerText =
  nf(minutes,2) + ":" + nf(seconds,2);

  fill(255);
  rect(1050,50,180,50,20);

  fill(0);
  text(timerText,
       1050,
       50);

  // =========================
  // SHOPS (HIDDEN WHEN INFO OPEN)
  // =========================

  if(!showInfo)
  {
    image(salonImg,
          200,
          230,
          200,
          220);

    image(petShopImg,
          450,
          180,
          220,
          220);

    image(iceCreamImg,
          780,
          250,
          170,
          150);

    image(restaurantImg,
          1000,
          220,
          275,
          250);

    image(carWashImg,
          950,
          500,
          200,
          175);

    image(airportImg,
          300,
          450,
          300,
          250);
  }

 //info

  if(showInfo)
  {
    fill(0, 0, 0, 180);
    rect(width/2, height/2, width, height);

    fill(255);
    rect(width/2, height/2, 700, 400, 20);

    fill(0);

    textSize(28);

    text("Welcome to Princess Polly World!",
         width/2,
         height/2 - 140);

    textSize(18);

    text("Explore stores and earn money\n\n" +
         " Nail Salon: clip, file, paint nails\n" +
         "Restaurant: build full meals\n" +
         "Pet Store: buy pets & items\n" +
         " Ice Cream Shop: match orders\n" +
         "Car Wash: clean cars step by step\n" +
         "Airport: unlock new world\n\n" +
         "Click HOME anytime to return",
         width/2,
         height/2);
  }
}

//click

void indexMousePressed()
{
  // INFO BUTTON CLICK (ONLY ON INDEX)
  if(currentPage.equals("index"))
  {
    if(mouseX > width - 140 &&
       mouseX < width - 20 &&
       mouseY > 100 &&
       mouseY < 140)
    {
      showInfo = !showInfo;
      return;
    }
  }

  // CLOSE INFO IF OPEN (ANY CLICK OUTSIDE)
  if(showInfo)
  {
    showInfo = false;
    return;
  }

  // Profile

  if(dist(mouseX,
          mouseY,
          60,
          60) < 40)
  {
    currentPage = "profile";
  }

  // Pet Store

  if(overButton(450,180))
  {
    currentPage = "petstore";
  }

  // Ice Cream

  if(overButton(780,250))
  {
    currentPage = "icecream";
  }

  // Restaurant

  if(overButton(1000,220))
  {
    currentPage = "restaurant";
  }

  // Car Wash

  if(overButton(950,500))
  {
    currentPage = "carwash";
  }

  // Airport

  if(overButton(300,450))
  {
    currentPage = "airport";
  }

  // Nail Salon

  if(mouseX > 100 &&
     mouseX < 300 &&
     mouseY > 120 &&
     mouseY < 340)
  {
    currentPage = "salon";
  }
}
