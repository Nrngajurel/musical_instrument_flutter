class CatalogModel {
  static final items = [
    Product(
        id: 1,
        name: "iPhone 12 Pro",
        desc: "Apple iPhone 12th generation",
        price: 999,
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc")
  ];
}

class Product {
  final int id;
  final String name;
  final String desc;
  final num price;
  String image;

  Product(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.image});
}
