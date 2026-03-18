import 'package:ecommerce/features/cart/domain/entities/cart_product.dart';
import 'package:equatable/equatable.dart';

class CartItemData extends Equatable {
  final int count;
  final CartProduct product;
  final int price;

  const CartItemData({
    required this.count,
    required this.product,
    required this.price,
  });

  @override
  List<Object?> get props => [product, count];
}
