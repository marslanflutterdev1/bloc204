import 'package:bloc/bloc.dart';
import 'package:bloc204/repository/products_repo.dart';
import 'package:bloc204/bloc_pattern/products_bloc/products_event.dart';
import 'package:bloc204/bloc_pattern/products_bloc/products_state.dart';
 class ProductsBloc extends Bloc<ProductsEvent, ProductsState>{
   final ProductsRepo productsRepo;
  ProductsBloc(this.productsRepo): super(ProductsLoadingState()){
    on<ProductsFetchDataEvent>((event, emit) async {
      emit(ProductsLoadingState());
      try{
        var data =await productsRepo.fetchProductsDataRepo();
        emit(ProductsLoadedState(data));

    } catch(e){
        emit(ProductsErrorState(errorMessage: e.toString()));

    }

    }

    );
  }

}