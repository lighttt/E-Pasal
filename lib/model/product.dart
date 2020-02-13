class Product {
  final String id;
  final String title;
  final double price;
  final String description;
  final String imageURL;
  bool isFavourite;

  Product(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.imageURL,
      this.isFavourite});
}
