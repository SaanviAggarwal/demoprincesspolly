
PImage handsImg;
PImage feetImg;

PImage nailClipperImg;
PImage nailFileImg;

PImage redBottle;
PImage blueBottle;
PImage greenBottle;
PImage yellowBottle;
PImage purpleBottle;
PImage pinkBottle;

String salonChoice = "";

boolean clipped = false;
boolean filed = false;

boolean clipMoney = false;
boolean fileMoney = false;

boolean colorChosen = false;

int clipTimer = 0;
int fileTimer = 0;

boolean clippingStarted = false;
boolean filingStarted = false;

color nailColor = color(255,150,200);

void drawSalonPage()
{
  background(255,220,230);

  drawWallet();
  drawTimer();
  drawHomeButton();

  fill(255);
  rect(width/2,50,500,70,20);

  fill(0);
  textSize(36);

  text("Princess Polly Nail Salon",
       width/2,
       50);

  if(salonChoice.equals(""))
  {
    drawChoicePage();
  }
  else
  {
    drawSalonGame();
  }
}

void drawChoicePage()
{
  fill(255);

  rect(320,350,300,350,20);
  rect(880,350,300,350,20);

  fill(0);

  textSize(32);

  text("HANDS",320,170);
  text("FEET",880,170);

  image(handsImg, 320,350,220,220);

  image(feetImg,880, 350,220,220);

  textSize(24);

  text("Choose Hands Or Feet", width/2,620);
}

void drawSalonGame()
{
  if(!clipped || !filed)
  {
    if(salonChoice.equals("hands"))
    {
      image(handsImg,
            width/2,
            320,
            500,
            350);
    }

    if(salonChoice.equals("feet"))
    {
      image(feetImg,width/2,320,500,350);
    }
  }

  if(!clipped)
  {
    fill(0);

    textSize(28);

    text("Hold mouse for 5 seconds to clip nails",width/2,100);

    image(nailClipperImg, mouseX, mouseY, 180, 180);

    if(mousePressed && !clippingStarted)
    {
      clipTimer = millis();
      clippingStarted = true;
    }

    if(clippingStarted)
    {
      int secondsLeft =
      max(0,5-(millis()-clipTimer)/1000);

      text(secondsLeft,
           width/2,
           150);

      if(millis()-clipTimer > 5000)
      {
        clipped = true;

        if(!clipMoney)
        {
          money += 2;
          clipMoney = true;
        }
      }
    }
  }

  else if(!filed)
  {
    fill(0);

    textSize(28);

    text("Hold mouse for 5 seconds to file nails",
         width/2,
         100);

    image(nailFileImg,mouseX,mouseY,80,180);

    if(mousePressed && !filingStarted)
    {
      fileTimer = millis();
      filingStarted = true;
    }

    if(filingStarted)
    {
      int secondsLeft =
      max(0,5-(millis()-fileTimer)/1000);

      text(secondsLeft,
           width/2,
           150);

      if(millis()-fileTimer > 5000)
      {
        filed = true;

        if(!fileMoney)
        {
          money += 2;
          fileMoney = true;
        }
      }
    }
  }

  else
  {
    fill(0);

    textSize(32);

    text("Paint The Nails",
         width/2,
         100);

    fill(nailColor);

    ellipse(230,330,40,70);
    ellipse(290,300,40,70);
    ellipse(350,285,40,70);
    ellipse(410,300,40,70);
    ellipse(470,340,40,70);

    ellipse(580,330,40,70);
    ellipse(640,300,40,70);
    ellipse(700,285,40,70);
    ellipse(760,300,40,70);
    ellipse(830,340,40,70);

    image(redBottle,180,620,100,130);
    image(blueBottle,340,620,100,130);
    image(greenBottle,500,620,100,130);
    image(yellowBottle,660,620,100,130);
    image(purpleBottle,820,620,100,130);
    image(pinkBottle,980,620,100,130);

    if(colorChosen)
    {
      fill(255);

      rect(600,530,200,60,20);

      fill(0);

      textSize(28);

      text("FINISH",600,530);
    }
  }
}

void salonMousePressed()
{
  if(homePressed())
  {
    salonChoice = "";

    clipped = false;
    filed = false;

    clipMoney = false;
    fileMoney = false;

    clippingStarted = false;
    filingStarted = false;

    colorChosen = false;

    nailColor = color(255,150,200);

    currentPage = "index";
    return;
  }

  if(salonChoice.equals(""))
  {
    if(mouseX > 170 &&
       mouseX < 470 &&
       mouseY > 175 &&
       mouseY < 525)
    {
      salonChoice = "hands";
    }

    if(mouseX > 730 &&
       mouseX < 1030 &&
       mouseY > 175 &&
       mouseY < 525)
    {
      salonChoice = "feet";
    }
  }

  if(clipped && filed)
  {
    if(dist(mouseX,mouseY,180,620) < 60)
    {
      nailColor = color(255,0,0);
      colorChosen = true;
    }

    if(dist(mouseX,mouseY,340,620) < 60)
    {
      nailColor = color(0,100,255);
      colorChosen = true;
    }

    if(dist(mouseX,mouseY,500,620) < 60)
    {
      nailColor = color(0,200,100);
      colorChosen = true;
    }

    if(dist(mouseX,mouseY,660,620) < 60)
    {
      nailColor = color(255,230,0);
      colorChosen = true;
    }

    if(dist(mouseX,mouseY,820,620) < 60)
    {
      nailColor = color(170,0,255);
      colorChosen = true;
    }

    if(dist(mouseX,mouseY,980,620) < 60)
    {
      nailColor = color(255,100,180);
      colorChosen = true;
    }

    if(colorChosen)
    {
      if(mouseX > 500 &&
         mouseX < 700 &&
         mouseY > 500 &&
         mouseY < 560)
      {
        salonChoice = "";

        clipped = false;
        filed = false;

        clipMoney = false;
        fileMoney = false;

        clippingStarted = false;
        filingStarted = false;

        nailColor = color(255,150,200);
        colorChosen = false;

        currentPage = "index";
      }
    }
  }
}

