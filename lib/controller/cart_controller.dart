import 'package:get/get.dart';
import 'package:getx/model/product.dart';

class CartController extends GetxController{
  var cartItem=<Product>[].obs;
  int get count=>cartItem.length;
  double get totalprice => cartItem.fold(0, (sum, item) => sum+item.price);
  addToCart(Product product){
    cartItem.add(product);
  }
}