// =====================================================
// Restaurant Variables 
PImage snack1; 
PImage snack2;
PImage snack3;
PImage snack4;
PImage snack5;

PImage mainCourse1; 
PImage mainCourse2;
PImage mainCourse3;
PImage mainCourse4;
PImage mainCourse5;

PImage dessert1; 
PImage dessert2; 
PImage dessert3; 
PImage dessert4; 
PImage dessert5; 

PImage drink1; 
PImage drink2; 
PImage drink3; 
PImage drink4;
PImage drink5;

// =====================================================

String restaurantPage = "snack";

String restaurantWarning = "";

boolean snackChosen = false;
boolean mainChosen = false;
boolean dessertChosen = false;
boolean drinkChosen = false;

int snackPrice = 5;
int mainPrice = 12;
int dessertPrice = 4;
int drinkPrice = 3;

// =====================================================
// DRAW PAGE
// =====================================================

void drawRestaurantPage()
{
  background(255,230,200);

  drawWallet();
  drawTimer();
  drawHomeButton();

  fill(255);

  rect(width/2,50,500,70,20);

  fill(0);

  textSize(36);

  text("Princess Polly Restaurant",
       width/2,
       50);

  fill(255,100,100);

  textSize(20);

  text(restaurantWarning,
       width/2,
       110);

  // ==============================
  // SNACK PAGE
  // ==============================

  if(restaurantPage.equals("snack"))
  {
    fill(0);

    textSize(30);

    text("Choose A Snack",
         width/2,
         160);

    image(snack1,150,320,150,150);
    image(snack2,375,320,150,150);
    image(snack3,600,320,150,150);
    image(snack4,825,320,150,150);
    image(snack5,1050,320,150,150);

    text("$5",150,430);
    text("$5",375,430);
    text("$5",600,430);
    text("$5",825,430);
    text("$5",1050,430);

    if(snackChosen)
    {
      drawNextButton();
    }
  }

  // ==============================
  // MAIN COURSE
  // ==============================

  else if(restaurantPage.equals("main"))
  {
    fill(0);

    textSize(30);

    text("Choose A Main Course",
         width/2,
         160);

    image(mainCourse1,150,320,150,150);
    image(mainCourse2,375,320,150,150);
    image(mainCourse3,600,320,150,150);
    image(mainCourse4,825,320,150,150);
    image(mainCourse5,1050,320,150,150);

    text("$12",150,430);
    text("$12",375,430);
    text("$12",600,430);
    text("$12",825,430);
    text("$12",1050,430);

    if(mainChosen)
    {
      drawNextButton();
    }
  }

  // ==============================
  // DESSERT
  // ==============================

  else if(restaurantPage.equals("dessert"))
  {
    fill(0);

    textSize(30);

    text("Choose A Dessert",
         width/2,
         160);

    image(dessert1,150,320,150,150);
    image(dessert2,375,320,150,150);
    image(dessert3,600,320,150,150);
    image(dessert4,825,320,150,150);
    image(dessert5,1050,320,150,150);

    text("$4",150,430);
    text("$4",375,430);
    text("$4",600,430);
    text("$4",825,430);
    text("$4",1050,430);

    if(dessertChosen)
    {
      drawNextButton();
    }
  }

  // ==============================
  // DRINK
  // ==============================

  else if(restaurantPage.equals("drink"))
  {
    fill(0);

    textSize(30);

    text("Choose A Drink",
         width/2,
         160);

    image(drink1,150,320,150,150);
    image(drink2,375,320,150,150);
    image(drink3,600,320,150,150);
    image(drink4,825,320,150,150);
    image(drink5,1050,320,150,150);

    text("$3",150,430);
    text("$3",375,430);
    text("$3",600,430);
    text("$3",825,430);
    text("$3",1050,430);

    if(drinkChosen)
    {
      fill(0,180,0);

      textSize(30);

      text("Meal Complete!",
           width/2,
           550);

      drawNextButton();
    }
  }
}

// =====================================================
// NEXT BUTTON
// =====================================================

void drawNextButton()
{
  fill(255);

  rect(width/2,
       620,
       200,
       60,
       20);

  fill(0);

  textSize(26);

  text("NEXT",
       width/2,
       620);
}

// =====================================================
// FOOD PURCHASE
// =====================================================

boolean buyFood(int price)
{
  if(money >= price)
  {
    money -= price;
    return true;
  }

  restaurantWarning =
  "Not enough money!";

  return false;
}

// =====================================================
// FOOD HITBOXES
// =====================================================

boolean clickFoodRow()
{
  if(dist(mouseX,mouseY,150,320) < 75) return true;
  if(dist(mouseX,mouseY,375,320) < 75) return true;
  if(dist(mouseX,mouseY,600,320) < 75) return true;
  if(dist(mouseX,mouseY,825,320) < 75) return true;
  if(dist(mouseX,mouseY,1050,320) < 75) return true;

  return false;
}

// =====================================================
// MOUSE
// =====================================================

void restaurantMousePressed()
{
  restaurantWarning = "";

  if(homePressed())
  {
    currentPage = "index";
    return;
  }

  if(restaurantPage.equals("snack"))
  {
    if(clickFoodRow())
    {
      if(buyFood(snackPrice))
      {
        snackChosen = true;
      }
    }

    if(snackChosen &&
       mouseX > width/2-100 &&
       mouseX < width/2+100 &&
       mouseY > 590 &&
       mouseY < 650)
    {
      restaurantPage = "main";
    }
  }

  else if(restaurantPage.equals("main"))
  {
    if(clickFoodRow())
    {
      if(buyFood(mainPrice))
      {
        mainChosen = true;
      }
    }

    if(mainChosen &&
       mouseX > width/2-100 &&
       mouseX < width/2+100 &&
       mouseY > 590 &&
       mouseY < 650)
    {
      restaurantPage = "dessert";
    }
  }

  else if(restaurantPage.equals("dessert"))
  {
    if(clickFoodRow())
    {
      if(buyFood(dessertPrice))
      {
        dessertChosen = true;
      }
    }

    if(dessertChosen &&
       mouseX > width/2-100 &&
       mouseX < width/2+100 &&
       mouseY > 590 &&
       mouseY < 650)
    {
      restaurantPage = "drink";
    }
  }

  else if(restaurantPage.equals("drink"))
  {
    if(clickFoodRow())
    {
      if(buyFood(drinkPrice))
      {
        drinkChosen = true;
      }
    }

    if(drinkChosen &&
       mouseX > width/2-100 &&
       mouseX < width/2+100 &&
       mouseY > 590 &&
       mouseY < 650)
    {
      restaurantPage = "snack";

      snackChosen = false;
      mainChosen = false;
      dessertChosen = false;
      drinkChosen = false;

      currentPage = "index";
    }
  }
}
