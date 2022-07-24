import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx/controller/cart_controller.dart';
import 'package:getx/controller/value_controller.dart';
class ValueAdd extends StatelessWidget {
  final valueController=Get.put(ValueController());
  final cartController=Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ValueController>(
                builder: (controller) {
                  return ListView.builder(
                  itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        return Card(

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${valueController.products[index].productname}",
                                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                          ),
                                      Text("${valueController.products[index].productDescription}"
                                      ),
                                      Text("${valueController.products[index].productImage}"
                                      ),
                                    ],
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text("\$${valueController.products[index].price}",
                                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                                    ),
                                  ),

                                ],
                              ),
                              ElevatedButton(onPressed: (){
                                cartController.addToCart(controller.products[index]);

                              },
                                  child: Text("add to Cart"))
                            ],
                          ),

                        );
                      });
                }
              ),
            ),
            GetX<CartController>(
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("total amount :\$ ${controller.totalprice}",
                    style: const TextStyle(fontSize: 16,color: Colors.white),),
                );
              }
            ),
            FloatingActionButton.extended(onPressed: (){

            },
                icon: const Icon(Icons.add_shopping_cart),
                label: GetX<CartController>(

                  builder: (controller) {
                    return Text(controller.count.toString());
                  }
                ))
          ],
        ),

      ),


    );

  }

}
