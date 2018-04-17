import java.math.*;
import java.text.*;

int ex = 0;
boolean newMousePress = true;
boolean scientific = false;
String cashString;
int buttonPage = 1;
color upgradeColor = color(175);
color upgradeTextColor = color(0);
BigInteger dispCash = new BigInteger("0");
BigDecimal cash = new BigDecimal("0");
BigDecimal clickCash = new BigDecimal("1");
BigDecimal cps = new BigDecimal("023840380420");
UpgradeButton test = new UpgradeButton(new BigDecimal("10"), new BigDecimal("1"), "Test", 1);
UpgradeButton test2 = new UpgradeButton(new BigDecimal("100"), new BigDecimal("10"), "Test #2", 2);

void setup(){
  size(500, 500);
}

void draw(){
  background(240);
  
  handleUpgradeButtons();
  
  updateCash();
  showCash();
}

void handleUpgradeButtons(){
  fill(200, 200, 255);
  rect(0, 75, 200, height - 76);
  
  if(buttonPage == 1){
    test.show();
    test2.show();
  }
}

void updateCash(){
  if(mousePressed && newMousePress){
    cash = cash.add(clickCash);
    newMousePress = false;
  } else if(!mousePressed && !newMousePress){
    newMousePress = true;
  }
  
  cash = cash.add(cps.divide(new BigDecimal(frameRate), 25, RoundingMode.HALF_UP));
}

void showCash(){
  dispCash = cash.toBigInteger();
  cashString = (dispCash.toString().length() >= 9) ? formatSci(cash, 3) : dispCash.toString();
  textAlign(RIGHT);
  textSize(30);
  text(cashString, 220, 30);
}

String formatSci(BigDecimal x, int decimals){    //Modified thing found from stackexchange answer https://stackoverflow.com/questions/18027047/forcing-bigdecimals-to-use-scientific-notation/25794946
  NumberFormat formatter = new DecimalFormat("0.0E0");
  formatter.setRoundingMode(RoundingMode.HALF_UP);
  formatter.setMinimumFractionDigits(decimals);
  return formatter.format(x);
}