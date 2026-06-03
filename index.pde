// =====================================================
// INDEX PAGE
// =====================================================

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

  // Wallet

  fill(255,240,180);

  rect(120,650,200,50,20);

  fill(0);

  textSize(24);

  text("$ " + money,
       120,
       650);

  // Timer

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

  // Buildings

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

// =====================================================
// INDEX CLICKS
// =====================================================

void indexMousePressed()
{
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
