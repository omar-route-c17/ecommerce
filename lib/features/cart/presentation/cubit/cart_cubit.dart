import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/use_cases/add_product_to_cart.dart';
import 'package:ecommerce/features/cart/domain/use_cases/get_cart.dart';
import 'package:ecommerce/features/cart/domain/use_cases/remove_product_from_cart.dart';
import 'package:ecommerce/features/cart/domain/use_cases/update_product_quantity.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CartCubit extends Cubit<CartState> {
  final AddProductToCart _addProductToCart;
  final GetCart _getCart;
  final UpdateProductQuantity _updateProductQuantity;
  final RemoveProductFromCart _removeProductFromCart;
  late Cart cart;

  CartCubit(
    this._addProductToCart,
    this._getCart,
    this._updateProductQuantity,
    this._removeProductFromCart,
  ) : super(CartInitial());

  Future<void> addProduct(String productId) async {
    emit(AddProductToCartLoading());
    final result = await _addProductToCart(productId);
    result.fold(
      (failure) => emit(AddProductToCartError(failure.message)),
      (_) => emit(AddProductToCartSuccess()),
    );
  }

  Future<void> getCart() async {
    emit(GetCartLoading());
    final result = await _getCart();
    result.fold((failure) => emit(GetCartError(failure.message)), (cart) {
      this.cart = cart;
      emit(GetCartSuccess());
    });
  }

  Future<void> updateProductQuantity(String productId, int quantity) async {
    emit(UpdateProductQuantityLoading());
    final result = await _updateProductQuantity(productId, quantity);
    result.fold(
      (failure) => emit(UpdateProductQuantityError(failure.message)),
      (cart) {
        this.cart = cart;
        emit(UpdateProductQuantitySuccess());
      },
    );
  }

  Future<void> removeProduct(String productId) async {
    emit(RemoveProductFromCartLoading());
    final result = await _removeProductFromCart(productId);
    result.fold(
      (failure) => emit(RemoveProductFromCartError(failure.message)),
      (cart) {
        this.cart = cart;
        emit(RemoveProductFromCartSuccess());
      },
    );
  }
}
