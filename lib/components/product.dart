class Product{
  late String name;
  late String imgUrl;
  late double price;
  Product(String name, String imgUrl, double price){
    this.name =name;
    this.imgUrl = imgUrl;
    this.price=price;
  }
  String getName(){
    return name;
  }
  String getURL(){
    return imgUrl;
  }
  double getPrice(){
    return price;
  }

}