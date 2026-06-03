// =====================================================
// AIRPORT VARIABLES
// =====================================================

String airportMessage = "";

boolean worldUnlocked = false;

// =====================================================
// DRAW AIRPORT PAGE
// =====================================================

void drawAirportPage()
{
  background(180);

  image(airportImg,
        width/2,
        height/2,
        width,
        height);

  drawWallet();
  drawTimer();
  drawHomeButton();

  fill(255);

  rect(width/2,50,500,70,20);

  fill(0);

  textSize(36);

  text("Princess Polly Airport",
       width/2,
       50);

  fill(255,220,220);

  rect(width/2,120,700,60,20);

  fill(0);

  textSize(20);

  text(airportMessage,
       width/2,
       120);

  fill(255);

  rect(width/2,350,300,120,20);

  fill(0);

  textSize(24);

  if(worldUnlocked)
  {
    text("NEW WORLD\nUNLOCKED!",
         width/2,
         350);
  }
  else
  {
    text("$100,000\nUnlock New World",
         width/2,
         350);
  }
}

// =====================================================
// MOUSE
// =====================================================

void airportMousePressed()
{
  if(homePressed())
  {
    currentPage = "index";
    return;
  }

  if(mouseX > width/2-150 &&
     mouseX < width/2+150 &&
     mouseY > 290 &&
     mouseY < 410)
  {
    if(worldUnlocked)
    {
      airportMessage = "New worlds coming soon!";
      return;
    }

    if(money >= 100000)
    {
      money -= 100000;
      worldUnlocked = true;
      airportMessage = "World unlocked! Check back soon.";
    }
    else
    {
      airportMessage = "Need $" + (100000 - money) + " more!";
    }
  }
}
