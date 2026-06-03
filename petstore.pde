// =====================================================
// PET STORE VARIABLES
PImage dog;
PImage cat;
PImage bunny;
PImage turtle;
PImage horse;


// food flicks

PImage dogFood;
PImage catFood;
PImage bunnyFood;
PImage turtleFood;
PImage horseFood;


//  ACCESSORY pics

PImage dogAccessory;
PImage catAccessory;
PImage bunnyAccessory;
PImage turtleAccessory;
PImage horseAccessory;
// =====================================================

String chosenPet = "";

String petMessage = "";

String petPage = "choose";

boolean ownsPet = false;

boolean boughtFood = false;
boolean boughtAccessory = false;

// =====================================================
// PRICES
// =====================================================

int dogPrice = 30;
int catPrice = 25;
int bunnyPrice = 20;
int turtlePrice = 15;
int horsePrice = 50;

int foodPrice = 10;
int accessoryPrice = 15;

// =====================================================
// DRAW PET STORE
// =====================================================

void drawPetShopPage()
{
  background(255,240,230);

  drawWallet();
  drawTimer();
  drawHomeButton();

  fill(255);

  rect(width/2,50,500,70,20);

  fill(0);

  textSize(36);

  text("Princess Polly Pet Store",
       width/2,
       50);

  fill(255,220,220);

  rect(width/2,110,700,40,20);

  fill(0);

  textSize(20);

  text(petMessage,
       width/2,
       110);

  if(petPage.equals("choose"))
  {
    drawPetSelectionPage();
  }

  else if(petPage.equals("items"))
  {
    drawPetItemsPage();
  }
}

// =====================================================
// PET PAGE
// =====================================================

void drawPetSelectionPage()
{
  fill(0);

  textSize(30);

  text("Choose Your Pet!",
       width/2,
       170);

  image(dog,150,320,170,170);
  text("$30",150,450);

  image(cat,350,320,170,170);
  text("$25",350,450);

  image(bunny,550,320,170,170);
  text("$20",550,450);

  image(turtle,750,320,170,170);
  text("$15",750,450);

  image(horse,950,320,170,170);
  text("$50",950,450);

  fill(255);

  rect(width/2,
       620,
       200,
       60,
       20);

  fill(0);

  textSize(28);

  text("NEXT →",
       width/2,
       620);
}

// =====================================================
// ITEMS PAGE
// =====================================================

void drawPetItemsPage()
{
  fill(0);

  textSize(30);

  text("Your Pet: " + chosenPet,
       width/2,
       160);

  text("Food",
       300,
       220);

  if(chosenPet.equals("dog"))
    image(dogFood,300,350,200,200);

  if(chosenPet.equals("cat"))
    image(catFood,300,350,200,200);

  if(chosenPet.equals("bunny"))
    image(bunnyFood,300,350,200,200);

  if(chosenPet.equals("turtle"))
    image(turtleFood,300,350,200,200);

  if(chosenPet.equals("horse"))
    image(horseFood,300,350,200,200);

  text("$10",
       300,
       500);

  text("Accessory",
       850,
       220);

  if(chosenPet.equals("dog"))
    image(dogAccessory,850,350,200,200);

  if(chosenPet.equals("cat"))
    image(catAccessory,850,350,200,200);

  if(chosenPet.equals("bunny"))
    image(bunnyAccessory,850,350,200,200);

  if(chosenPet.equals("turtle"))
    image(turtleAccessory,850,350,200,200);

  if(chosenPet.equals("horse"))
    image(horseAccessory,850,350,200,200);

  text("$15",
       850,
       500);

  if(boughtFood)
  {
    fill(0,180,0);

    textSize(22);

    text("Purchased!",
         300,
         560);
  }

  if(boughtAccessory)
  {
    fill(0,180,0);

    textSize(22);

    text("Purchased!",
         850,
         560);
  }
}

// =====================================================
// BUY PET
// =====================================================

void buyPet(String petName,
            int petPrice)
{
  if(ownsPet)
  {
    petMessage =
    "You already own a pet!";

    return;
  }

  if(money >= petPrice)
  {
    money -= petPrice;

    chosenPet = petName;

    ownsPet = true;

    petMessage =
    "You bought a " + petName + "!";
  }
  else
  {
    petMessage =
    "Not enough money!";
  }
}

// =====================================================
// MOUSE
// =====================================================

void petShopMousePressed()
{
  if(homePressed())
  {
    currentPage = "index";
    return;
  }

  if(petPage.equals("choose"))
  {
    if(dist(mouseX,mouseY,150,320) < 85)
    {
      buyPet("dog",dogPrice);
    }

    if(dist(mouseX,mouseY,350,320) < 85)
    {
      buyPet("cat",catPrice);
    }

    if(dist(mouseX,mouseY,550,320) < 85)
    {
      buyPet("bunny",bunnyPrice);
    }

    if(dist(mouseX,mouseY,750,320) < 85)
    {
      buyPet("turtle",turtlePrice);
    }

    if(dist(mouseX,mouseY,950,320) < 85)
    {
      buyPet("horse",horsePrice);
    }

    if(mouseX > width/2-100 &&
       mouseX < width/2+100 &&
       mouseY > 590 &&
       mouseY < 650)
    {
      if(ownsPet)
      {
        petPage = "items";
      }
      else
      {
        petMessage =
        "Buy a pet first!";
      }
    }
  }

  else if(petPage.equals("items"))
  {
    if(dist(mouseX,mouseY,300,350) < 100)
    {
      if(!boughtFood)
      {
        if(money >= foodPrice)
        {
          money -= foodPrice;

          boughtFood = true;

          petMessage =
          "Your pet has been fed!";
        }
        else
        {
          petMessage =
          "Not enough money for food!";
        }
      }
    }

    if(dist(mouseX,mouseY,850,350) < 100)
    {
      if(!boughtAccessory)
      {
        if(money >= accessoryPrice)
        {
          money -= accessoryPrice;

          boughtAccessory = true;

          petMessage =
          "Accessory purchased!";
        }
        else
        {
          petMessage =
          "Not enough money!";
        }
      }
    }
  }
}
