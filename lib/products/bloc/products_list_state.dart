part of 'products_list_bloc.dart';

abstract class ProductsListState {}

class ProductsListLoadingState extends ProductsListState {}

class ProductsListLoadedState extends ProductsListState {
  final List<ProductListEntity> products;

  ProductsListLoadedState(this.products);
}

class ProductsListFailedState extends ProductsListState {
  final String errorMessage;

  ProductsListFailedState(this.errorMessage);
}
