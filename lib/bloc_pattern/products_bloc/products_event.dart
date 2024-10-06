import 'package:equatable/equatable.dart';

abstract class ProductsEvent extends Equatable{

  @override
  List<Object> get props => [];

}

class ProductsFetchDataEvent extends ProductsEvent{
  @override
  List<Object> get props => [];
}