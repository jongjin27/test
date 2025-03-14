import 'dart:io';

class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class ShoppingMall {
  List<Product> products = [
    Product("셔츠", 45000),
    Product("원피스", 30000),
    Product("반팔티", 35000),
    Product("반바지", 38000),
    Product("양말", 5000)
  ];

  Map<String, int> cart = {};
  int totalPrice = 0;

  void showProductList() {
    print("\n상품 목록:");
    for (var product in products) {
      print("${product.name} / ${product.price}원");
    }
  }

  void addToCart() {
    print("\n상품 이름을 입력해 주세요 !");
    String? productName = stdin.readLineSync();

    if (productName == null || productName.isEmpty) {
      print("입력값이 올바르지 않아요 !");
      return;
    }

    var product = products.firstWhere(
        (p) => p.name == productName,
        orElse: () => Product("", 0));

    if (product.name == "") {
      print("존재하지 않는 상품입니다 !");
      return;
    }

    print("상품 개수를 입력해 주세요 !");
    String? countInput = stdin.readLineSync();

    try {
      int count = int.parse(countInput!);
      if (count <= 0) {
        print("0개보다 많은 개수의 상품만 담을 수 있어요 !");
        return;
      }

      cart[product.name] = (cart[product.name] ?? 0) + count;
      totalPrice += product.price * count;
      print("장바구니에 상품이 담겼어요 !");
    } catch (e) {
      print("올바른 숫자를 입력해 주세요 !");
    }
  }

  void showTotalPrice() {
    print("\n장바구니에 ${totalPrice}원 어치를 담으셨네요 !");
  }
}

void main() {
  ShoppingMall shop = ShoppingMall();
  bool isRunning = true;

  while (isRunning) {
    print("\n------------------------------------------------");
    print("[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료");
    print("------------------------------------------------");

    print("원하는 기능의 번호를 입력하세요: ");
    String? input = stdin.readLineSync();

    switch (input) {
      case "1":
        print("\n[1] 상품 목록 보기");
        shop.showProductList();
        break;
      case "2":
        print("\n[2] 장바구니에 담기");
        shop.addToCart();
        break;
      case "3":
        print("\n[3] 장바구니에 담긴 상품의 총 가격 보기");
        shop.showTotalPrice();
        break;
      case "4":
        print("\n이용해 주셔서 감사합니다~ 안녕히 가세요 !");
        isRunning = false;
        break;
      default:
        print("\n지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..");
    }
  }
}