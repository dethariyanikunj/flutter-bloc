part of 'products_list_bloc.dart';

abstract class ProductsListEvent {}

class ProductsListFetchDataEvent extends ProductsListEvent {}

class ProductsListRefreshDataEvent extends ProductsListEvent {}

class ProductsListLoadMoreDataEvent extends ProductsListEvent {}
