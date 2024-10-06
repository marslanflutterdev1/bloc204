import 'package:bloc204/bloc_pattern/products_bloc/products_bloc.dart';
import 'package:bloc204/bloc_pattern/products_bloc/products_event.dart';
import 'package:bloc204/bloc_pattern/products_bloc/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(ProductsFetchDataEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    debugPrint("From Start Widget Build All");
    return Scaffold(
      appBar: AppBar(
        title:const Text("Products Screen"),
      ),
      body: SafeArea(
          child: BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
             if(state is ProductsLoadingState){
               return const Center(
                 child: CircularProgressIndicator(color: Colors.yellowAccent,strokeWidth: 5,),
               );
             }else if(state is ProductsLoadedState){
               return ListView.builder(
                 itemCount: state.productsModel.length,
                 itemBuilder: (BuildContext context, int index) {
                   debugPrint("Text Widget Build Only");
                   return Center(child: Text(state.productsModel[index].id.toString(),style: const TextStyle(color: Colors.yellowAccent,fontSize: 40),));
                 },
               );
             }else if(state is ProductsErrorState){
               ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                   content: Text(state.errorMessage,style: const TextStyle(color: Colors.yellowAccent),),
                 ),
               );
             }
             return const Scaffold(
               body: Center(
                 child:Text("Nothing...",style: TextStyle(color: Colors.yellowAccent),),
               ),
             );
            },
          )
      ),
    );
  }
}