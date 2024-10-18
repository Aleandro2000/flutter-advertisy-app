import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:advertisy/models/products.model.dart';

@immutable
abstract class ProductsState extends Equatable {
  @override
  List<Products> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final ProductsModel productsModel;

  ProductsLoaded(this.productsModel);

  @override
  List<Products> get props => productsModel.products ?? [];
}
