class CartItem {
  final String id;
  final String productId;
  final String name;
  final int quantity;
  final double price;

  CartItem({
    required this.productId,
    required this.name,
    required this.id,
    required this.quantity,
    required this.price,
  });
}
