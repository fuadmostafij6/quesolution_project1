


import '../../Model/ProductModel/ProductModel.dart';
import 'package:http/http.dart' as http;
class ProductRepo{


  Future<ProductModel?> getProduct()async{

    String uri ="https://grocery.ebasket.com.bd/api/all-products";
    var response = await http.get(Uri.parse(uri));

    print(response.body);
    if(response.statusCode == 200){


      return productModelFromJson(response.body);

    }
    else{

      return null;
    }







  }
}