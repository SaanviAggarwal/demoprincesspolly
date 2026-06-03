//varibales

int washStage = 0;

boolean earnedWashMoney = false;

//draw

void drawCarWash()
{
  background(200);

  image(carWashBackground,
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

  text("Princess Polly Car Wash",
       width/2,
       50);

  image(car,
        width/2,
        360,
        600,
        350);

  fill(0);

  textSize(24);

  if(washStage == 0)
  {
    text("Step 1: Use the hose!",
         width/2,
         120);

    image(hose,
          150,
          550,
          180,
          180);
  }

  else if(washStage == 1)
  {
    text("Step 2: Use the sponge!",
         width/2,
         120);

    image(soapSponge,
          150,
          550,
          180,
          180);
  }

  else if(washStage == 2)
  {
    text("Step 3: Dry the car!",
         width/2,
         120);

    image(cloth,
          150,
          550,
          180,
          180);
  }

  else
  {
    fill(0,180,0);

    textSize(40);

    text("CAR CLEANED!",
         width/2,
         120);

    if(!earnedWashMoney)
    {
      money += 25;
      earnedWashMoney = true;
    }

    fill(0);

    textSize(26);

    text("+$25 earned",
         width/2,
         180);
  }
}

//mouse

void carWashMousePressed()
{
  if(homePressed())
  {
    currentPage = "index";
    return;
  }

  if(washStage == 0 &&
     dist(mouseX,mouseY,150,550) < 90)
  {
    washStage = 1;
  }

  else if(washStage == 1 &&
          dist(mouseX,mouseY,150,550) < 90)
  {
    washStage = 2;
  }

  else if(washStage == 2 &&
          dist(mouseX,mouseY,150,550) < 90)
  {
    washStage = 3;
  }

  else if(washStage >= 3)
  {
    washStage = 0;
    earnedWashMoney = false;
  }
}
