class MenuModel {
  final String name;
  final int price;
  final String image;

  MenuModel({
    required this.name,
    required this.price,
    required this.image,
  });
}

List<MenuModel> menuListMakanan = [
  MenuModel(name: "Croissant", price: 28000, image: "images/crossaint.jpg"),
  MenuModel(name: "Pain au Chocolate", price: 29000, image: "images/pain_choco.jpg"),
  MenuModel(name: "Chicken Sandwich", price: 30000, image: "images/chicken.jpg"),
  MenuModel(name: "Burger Beef Sandwich", price: 35000, image: "images/burger.jpg"),
  MenuModel(name: "Cheesecake", price: 20000, image: "images/cheesscake.jpg"),
  MenuModel(name: "Chocolate Cake", price: 20000, image: "images/chococake.jpg"),
  MenuModel(name: "Spaghetti Carbonara", price: 37000, image: "images/spageheti.jpg"),
  MenuModel(name: "French Fries", price: 15000, image: "images/kentang.jpg"),
  MenuModel(name: "Fried Shrimp", price: 20000, image: "images/udang.jpg"),
  MenuModel(name: "Scrambled Egg", price: 20000, image: "images/omelete.jpg"),
];

List<MenuModel> menuListMinuman = [
  MenuModel(name: "Cappuccino", price: 18000, image: "images/capucino.jpg"),
  MenuModel(name: "Latte", price: 20000, image: "images/latte.jpg"),
  MenuModel(name: "Americano", price: 17000, image: "images/americano.jpg"),
  MenuModel(name: "Coffe Susu", price: 15000, image: "images/coffe_susu.jpg"),
  MenuModel(name: "Matcha", price: 20000, image: "images/matcha.jpg"),
  MenuModel(name: "Matcha Latte", price: 20000, image: "images/matcha_latte.jpg"),
  MenuModel(name: "Carabian Espresso", price: 17000, image: "images/carabian_espresso.jpg"),
  MenuModel(name: "Teh Tarik", price: 12000, image: "images/tehTarik.jpg"),
  MenuModel(name: "Chocolatos", price: 30000, image: "images/chocolatos.jpg"),
  MenuModel(name: "Gula Aren", price: 25000, image: "images/gula_aren.jpg"),
];