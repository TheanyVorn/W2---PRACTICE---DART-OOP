// EX-4.dart
enum DeliveryType { DELIVERY, PICKUP }

class Address {
  String street;
  String city;
  String zipCode;

  Address(this.street, this.city, this.zipCode);

  String get fullAddress {
    return '$street, $city, $zipCode';
  }
}

class Product {
  String name;
  double price;

  Product(this.name, this.price);
}

class Order {
  int id;
  List<Product> products;
  DeliveryType deliveryType;
  Address? deliveryAddress;

  // Named constructor, required id and type, products required, address optional.
  Order({
    required this.id,
    required this.products,
    required this.deliveryType,
    this.deliveryAddress,
  }) {
    // Check if delivery needs address
    if (deliveryType == DeliveryType.DELIVERY && deliveryAddress == null) {
      throw Exception('Need address for delivery');
    }
  }

  // Getter for total amount, sum prices.
  double get totalAmount {
    double total = 0;
    for (var p in products) {
      total += p.price;
    }
    return total;
  }

  // Method to get delivery info string.
  String get deliveryInfo {
    if (deliveryType == DeliveryType.PICKUP) {
      return 'Pick up at shop @BKK ';
    } else {
      // delivery
      return 'Deliver to ' + deliveryAddress!.fullAddress;
    }
  }
}

void main() {
  // Sample products
  Product book = Product('Dart Book', 20.0);
  Product shirt = Product('T Shirt', 15.0);

  // Pickup order, no address
  Order pickup = Order(
    id: 1,
    products: [book, shirt],
    deliveryType: DeliveryType.PICKUP,
  );
  print(
    'Order ' +
        pickup.id.toString() +
        ' total: \$' +
        pickup.totalAmount.toString() +
        ' , ' +
        'Info: ' +
        pickup.deliveryInfo +
        ' ',
  );

  // Delivery order, with address
  Address addr = Address('ToulTumPong', 'Phnom Penh', '12345');
  Order deliv = Order(
    id: 2,
    products: [book],
    deliveryType: DeliveryType.DELIVERY,
    deliveryAddress: addr, // address
  );
  print(
    'Order ' +
        deliv.id.toString() +
        ' total: \$' +
        deliv.totalAmount.toString() +
        ' , ' +
        'Info: ' +
        deliv.deliveryInfo,
  );
}
