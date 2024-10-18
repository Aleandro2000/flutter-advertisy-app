import 'package:advertisy/models/products.model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductsEvent extends Equatable {
  @override
  List<Products> get props => [];
}

class FetchProducts extends ProductsEvent {}
