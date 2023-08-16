import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/products_repository.dart';
import '../response/product_list_entity.dart';

part 'products_list_event.dart';

part 'products_list_state.dart';

class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  final productsRepository = ProductsRepository();

  ProductsListBloc() : super(ProductsListLoadingState()) {
    on<ProductsListFetchDataEvent>(
      (event, emit) async {
        await _onFetchOrRefreshDataEvent(emit);
      },
    );
    on<ProductsListRefreshDataEvent>(
      (event, emit) async {
        emit(ProductsListLoadingState());
        await _onFetchOrRefreshDataEvent(emit);
      },
    );
    on<ProductsListLoadMoreDataEvent>(
      (event, emit) {
        // Todo
      },
    );
    _fetchProducts();
  }

  _fetchProducts() {
    add(ProductsListFetchDataEvent());
  }

  refreshProducts() {
    add(ProductsListRefreshDataEvent());
  }

  _onFetchOrRefreshDataEvent(
    Emitter<ProductsListState> emit,
  ) async {
    final response = await productsRepository.fetchProducts();
    if (response != null) {
      emit(ProductsListLoadedState(response));
    } else {
      emit(ProductsListFailedState('Failed to load Products'));
    }
  }
}
