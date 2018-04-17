class UpgradeButton{
  BigDecimal price, cps;
  BigInteger dispPrice;
  int slot;
  String name, priceString;
  
  UpgradeButton(BigDecimal price, BigDecimal cps, String name, int slot){
    this.price = price;
    this.slot = slot;
    this.name = name;
    this.cps = cps;
  }
  
  void show(){
    dispPrice = price.toBigInteger();
    
    priceString = (dispPrice.toString().length() >= 5) ? formatSci(price, 3) : dispPrice.toString();
    
    fill(upgradeColor);
    rect(5, 80 + ((slot - 1) * 45), 175, 40);
    fill(upgradeTextColor);
    textAlign(LEFT);
    textSize(20);
    text(name, 10, 97 + ((slot - 1) * 45));
    text("$" + priceString, 10, 117 + ((slot - 1) * 45));
  }
}