import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'products_event.dart';
import 'products_state.dart';
import 'package:advertisy/services/product.service.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<FetchProducts>((event, emit) async {
      try {
        emit(ProductsLoading());
        final productsModel = await getProducts();
        emit(ProductsLoaded(productsModel!));
      } catch (err) {
        if (kDebugMode) {
          print(err);
        }
      }
    });
  }
}
