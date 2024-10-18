import 'package:advertisy/bloc/products/products_bloc.dart';
import 'package:advertisy/bloc/products/products_event.dart';
import 'package:advertisy/bloc/products/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:advertisy/template/product-card.template.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc()..add(FetchProducts()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ProductsLoaded) {
                final productsModel = state.productsModel;
                return ListView.builder(
                  itemCount: productsModel.products?.length ?? 0,
                  itemBuilder: (context, index) {
                    final item = productsModel.products![index];
                    return ProductCardTemplate(product: item);
                  },
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
