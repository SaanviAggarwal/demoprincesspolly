PImage profileIcon;
PImage character;

PImage crown1;
PImage crown2;
PImage crown3;
PImage crown4;
PImage crown5;

PImage selectedCrown = null;

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
  text("Princess Profile", width/2, 50);

  image(character, width/2, 380, 220, 350);

  if(selectedCrown != null)
  {
    image(selectedCrown,
          width/2,
          250,
          200,
          120);
  }

  fill(0);
  textSize(26);
  text("Choose a Crown", width/2, 120);

  image(crown1, 180, 250, 120, 120);
  image(crown2, 180, 400, 120, 120);
  image(crown3, 180, 550, 120, 120);

  image(crown4, 1020, 300, 120, 120);
  image(crown5, 1020, 500, 120, 120);

  fill(255);
  rect(width/2, 650, 200, 60, 20);

  fill(0);
  text("FINISH", width/2, 650);
}

void profileMousePressed()
{
  if(homePressed())
  {
    currentPage = "index";
    return;
  }

  if(dist(mouseX, mouseY, 180, 250) < 60)
  {
    selectedCrown = crown1;
  }

  if(dist(mouseX, mouseY, 180, 400) < 60)
  {
    selectedCrown = crown2;
  }

  if(dist(mouseX, mouseY, 180, 550) < 60)
  {
    selectedCrown = crown3;
  }

  if(dist(mouseX, mouseY, 1020, 300) < 60)
  {
    selectedCrown = crown4;
  }

  if(dist(mouseX, mouseY, 1020, 500) < 60)
  {
    selectedCrown = crown5;
  }

  if(mouseX > width/2-100 &&
     mouseX < width/2+100 &&
     mouseY > 620 &&
     mouseY < 680)
  {
    println("Profile Finished");
  }
}
