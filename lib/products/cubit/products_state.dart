part of 'products_cubit.dart';

abstract class ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  final List<ProductListEntity>? products;

  ProductsLoadedState(this.products);
}

class ProductsFailedState extends ProductsState {
  final String errorMessage;

  ProductsFailedState(this.errorMessage);
}
