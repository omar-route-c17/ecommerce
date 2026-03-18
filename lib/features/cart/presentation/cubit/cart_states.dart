abstract class CartState {}

class CartInitial extends CartState {}

class AddProductToCartLoading extends CartState {}

class AddProductToCartSuccess extends CartState {}

class AddProductToCartError extends CartState {
  final String message;

  AddProductToCartError(this.message);
}

class GetCartLoading extends CartState {}

class GetCartSuccess extends CartState {}

class GetCartError extends CartState {
  final String message;

  GetCartError(this.message);
}

class UpdateProductQuantityLoading extends CartState {}

class UpdateProductQuantitySuccess extends CartState {}

class UpdateProductQuantityError extends CartState {
  final String message;

  UpdateProductQuantityError(this.message);
}

class RemoveProductFromCartLoading extends CartState {}

class RemoveProductFromCartSuccess extends CartState {}

class RemoveProductFromCartError extends CartState {
  final String message;

  RemoveProductFromCartError(this.message);
}
