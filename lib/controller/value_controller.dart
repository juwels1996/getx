import 'package:get/get.dart';

import '../model/product.dart';

class ValueController extends GetxController{
  var products=<Product>[].obs;
  @override
  void onInit(){
    super.onInit();
    fetchProducts();
  }
  void fetchProducts()async{
    await Future.delayed(Duration(seconds: 1));
    var productsResult=[
      Product(
          id: 1,
          productname: "Shoes",
          productImage: "productImage",
          productDescription: "Unisex Shoes for both male & female",
          price: 50),
      Product(
          id: 2,
          productname: "Earphone",
          productImage: "productImage",
          productDescription: "Unisex Shoes for both male & female",
          price: 75),
      Product(
          id: 3,
          productname: "Iphone 13 pro max",
          productImage: "productImage",
          productDescription: "Apple made it",
          price:999)
    ];
    products.value=productsResult;
  }

}