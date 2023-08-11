import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/products_repository.dart';
import '../response/product_list_entity.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final _productsRepository = ProductsRepository();

  ProductsCubit() : super(ProductsLoadingState()) {
    _fetchProducts();
  }

  refreshProducts() {
    emit(ProductsLoadingState());
    _fetchProducts();
  }

  _fetchProducts() async {
    final response = await _productsRepository.fetchProducts();
    if (response != null) {
      emit(
        ProductsLoadedState(response),
      );
    } else {
      emit(
        ProductsFailedState('Failed To Load Products'),
      );
    }
  }
}
