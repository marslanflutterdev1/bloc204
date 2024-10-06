import 'package:equatable/equatable.dart';
import '../../data/products_model/products_model.dart';

abstract class ProductsState extends Equatable{
  @override
  List<Object> get props => [];
}

class ProductsLoadingState extends ProductsState{
  @override
  List<Object> get props => [];
}
class ProductsLoadedState extends ProductsState{

  final List<ProductsModel> productsModel;

  ProductsLoadedState(this.productsModel);

  @override
  List<Object> get props => [productsModel];


}
class ProductsErrorState extends ProductsState{

 final String errorMessage;

  ProductsErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];


}
