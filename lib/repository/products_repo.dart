import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data/products_model/products_model.dart';


class ProductsRepo{

    Future<List<ProductsModel>>  fetchProductsDataRepo()async{
       var response =   await http.get(Uri.parse("https://fakestoreapi.com/products"));
       if(response.statusCode == 200){
       // Parsed no. of map into List-Of-Map.
       var decodeData = await jsonDecode(response.body) as List<dynamic>;
       var productsData =  decodeData.map((e) => ProductsModel.fromJson(e)).toList();
        return productsData;
       }else{
         throw Exception("Data Not Found");
       }
     }
}