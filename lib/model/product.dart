class Product {
  final String name;
  final String price;
  final String image;

  Product._({
    this.name,
    this.price,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product._(
      name: json['name'],
      price: json['price'],
      image: json['image'],
    );
  }

  static Map<String, dynamic> toMap(Product data) => {
    "name": data.name,
    "price": data.price,
    "image": data.image,
  };
}
