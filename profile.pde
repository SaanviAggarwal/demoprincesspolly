
PImage profileIcon;
PImage character; 
PImage pinkDress; 
PImage yellowDress; 
PImage greenDress; 
PImage blueDress; 
PImage purpleDress; 
PImage crown1;
PImage crown2;
PImage crown3;
PImage crown4;
PImage crown5;

String profilePage = "dress";

PImage selectedDress = null;
PImage selectedCrown = null;

//draw

void drawProfilePage()
{
  background(240,220,255);

  drawWallet();
  drawTimer();
  drawHomeButton();

  fill(255);

  rect(width/2,50,500,70,20);

  fill(0);

  textSize(36);

  text("Princess Profile",
       width/2,
       50);
    //https://processing.org/reference/width.html
  image(character,width/2,310,220,350);

  if(selectedDress != null)
  {
    image(selectedDress,
          width/2,
          420,
          175,
          300);
  }

  if(selectedCrown != null)
  {
    image(selectedCrown,
          width/2,
          180,
          200,
          120);
  }

  if(profilePage.equals("dress"))
  {
    drawDressPage();
  }
  else
  {
    drawCrownPage();
  }
}

//dress

void drawDressPage()
{
  fill(0);

  textSize(26);

  text("Choose a Dress",
       width/2,
       120);

  image(pinkDress,200,500,120,160);
  image(blueDress,350,500,120,160);
  image(greenDress,500,500,120,160);
  image(yellowDress,650,500,120,160);
  image(purpleDress,800,500,120,160);

  fill(255);

  rect(width/2,650,200,60,20);

  fill(0);

  text("NEXT",width/2,650);
}

//crown

void drawCrownPage()
{
  fill(0);

  textSize(26);

  text("Choose a Crown",
       width/2,
       120);

  image(crown1,200,500,120,120);
  image(crown2,350,500,120,120);
  image(crown3,500,500,120,120);
  image(crown4,650,500,120,120);
  image(crown5,800,500,120,120);

  fill(255);

  rect(width/2,650,200,60,20);

  fill(0);

  text("FINISH",width/2,650);
}

//mouse

void profileMousePressed()
{
  if(homePressed())
  {
    currentPage = "index";
    return;
  }

  if(profilePage.equals("dress"))
  {
    if(dist(mouseX,mouseY,200,500) < 60)
      selectedDress = pinkDress;

    if(dist(mouseX,mouseY,350,500) < 60)
      selectedDress = blueDress;

    if(dist(mouseX,mouseY,500,500) < 60)
      selectedDress = greenDress;

    if(dist(mouseX,mouseY,650,500) < 60)
      selectedDress = yellowDress;

    if(dist(mouseX,mouseY,800,500) < 60)
      selectedDress = purpleDress;

    if(mouseX > width/2-100 &&
       mouseX < width/2+100 &&
       mouseY > 620 &&
       mouseY < 680)
    {
      profilePage = "crown";
    }
  }

  else if(profilePage.equals("crown"))
  {
    if(dist(mouseX,mouseY,200,500) < 60)
      selectedCrown = crown1;

    if(dist(mouseX,mouseY,350,500) < 60)
      selectedCrown = crown2;

    if(dist(mouseX,mouseY,500,500) < 60)
      selectedCrown = crown3;

    if(dist(mouseX,mouseY,650,500) < 60)
      selectedCrown = crown4;

    if(dist(mouseX,mouseY,800,500) < 60)
      selectedCrown = crown5;

    if(mouseX > width/2-100 &&
       mouseX < width/2+100 &&
       mouseY > 620 &&
       mouseY < 680)
    {
      profilePage = "dress";
    }
  }
}
