// =====================================================
// icecream Store Variables 
PImage cone; 
PImage cup; 
PImage vanilla; 
PImage chocolate; 
PImage strawberry; 
PImage mango; 
PImage lime; 
// =====================================================

String icecreamPage = "container";

String customerOrder = "";

String icecreamMessage = "";

int icecreamReward = 0;

boolean orderCompleted = false;

// =====================================================
// DRAW PAGE
// =====================================================

void drawIcecreamStore()
{
  background(255,200,230);

  drawWallet();

  drawTimer();

  drawHomeButton();

  fill(255);

  rect(width/2,50,500,70,20);

  fill(0);

  textSize(36);

  text("Princess Polly Ice Cream Store",
       width/2,
       50);

  fill(0);

  textSize(24);

  text(icecreamMessage,
       width/2,
       120);

  if(icecreamPage.equals("container"))
  {
    drawContainerPage();
  }

  else if(icecreamPage.equals("flavor"))
  {
    drawFlavorPage();
  }

  else if(icecreamPage.equals("complete"))
  {
    drawCompletePage();
  }
}

// =====================================================
// CONTAINER PAGE
// =====================================================

void drawContainerPage()
{
  fill(0);

  textSize(30);

  text("Choose Cone Or Cup",
       width/2,
       180);

  image(cone,
        350,
        350,
        250,
        250);

  image(cup,
        850,
        350,
        250,
        250);

  textSize(22);

  text("+$5 Reward",
       350,
       520);

  text("+$10 Reward",
       850,
       520);
}

// =====================================================
// FLAVOR PAGE
// =====================================================

void drawFlavorPage()
{
  fill(0);

  textSize(28);

  text("Customer Wants:",
       width/2,
       160);

  fill(255);

  rect(width/2,
       220,
       300,
       60,
       20);

  fill(0);

  text(customerOrder,
       width/2,
       220);

  image(vanilla,150,420,150,150);
  image(chocolate,375,420,150,150);
  image(strawberry,600,420,150,150);
  image(mango,825,420,150,150);
  image(lime,1050,420,150,150);
}

// =====================================================
// COMPLETE PAGE
// =====================================================

void drawCompletePage()
{
  fill(0,180,0);

  textSize(40);

  text("Order Completed!",
       width/2,
       220);

  fill(0);

  textSize(30);

  text("You earned $" + icecreamReward,
       width/2,
       300);

  fill(255);

  rect(width/2,
       500,
       250,
       70,
       20);

  fill(0);

  textSize(26);

  text("PLAY AGAIN",
       width/2,
       500);
}

// =====================================================
// RANDOM ORDER
// =====================================================

void generateOrder()
{
  int randomOrder =
  int(random(5));

  if(randomOrder == 0)
  {
    customerOrder = "Vanilla";
  }
  else if(randomOrder == 1)
  {
    customerOrder = "Chocolate";
  }
  else if(randomOrder == 2)
  {
    customerOrder = "Strawberry";
  }
  else if(randomOrder == 3)
  {
    customerOrder = "Mango";
  }
  else
  {
    customerOrder = "Lime";
  }
}

// =====================================================
// CHECK FLAVOR
// =====================================================

void checkFlavor(String flavor)
{
  if(flavor.equals(customerOrder))
  {
    money += icecreamReward;

    icecreamMessage =
    "Correct Order!";

    orderCompleted = true;

    icecreamPage = "complete";
  }
  else
  {
    icecreamMessage =
    "Wrong Flavor! Try Again.";
  }
}

// =====================================================
// MOUSE
// =====================================================

void icecreamStoreMousePressed()
{
  if(homePressed())
  {
    currentPage = "index";
    return;
  }

  if(icecreamPage.equals("container"))
  {
    if(dist(mouseX,mouseY,350,350) < 125)
    {
      icecreamReward = 5;

      generateOrder();

      icecreamPage = "flavor";

      icecreamMessage =
      "Make the customer's order!";
    }

    if(dist(mouseX,mouseY,850,350) < 125)
    {
      icecreamReward = 10;

      generateOrder();

      icecreamPage = "flavor";

      icecreamMessage =
      "Make the customer's order!";
    }
  }

  else if(icecreamPage.equals("flavor"))
  {
    if(dist(mouseX,mouseY,150,420) < 75)
      checkFlavor("Vanilla");

    if(dist(mouseX,mouseY,375,420) < 75)
      checkFlavor("Chocolate");

    if(dist(mouseX,mouseY,600,420) < 75)
      checkFlavor("Strawberry");

    if(dist(mouseX,mouseY,825,420) < 75)
      checkFlavor("Mango");

    if(dist(mouseX,mouseY,1050,420) < 75)
      checkFlavor("Lime");
  }

  else if(icecreamPage.equals("complete"))
  {
    if(mouseX > width/2-125 &&
       mouseX < width/2+125 &&
       mouseY > 465 &&
       mouseY < 535)
    {
      icecreamPage = "container";

      customerOrder = "";

      icecreamMessage = "";

      orderCompleted = false;
    }
  }
}
