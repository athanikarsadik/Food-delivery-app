import 'package:flutter/material.dart';
import 'package:food_delivery/models/popular_foods_model.dart';
import 'package:get/get.dart';

import '../data/repository/cart_repo.dart';
import '../models/cart_model.dart';
import '../utils/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
            id: value.id,
            name: value.name,
            img: value.img,
            price: value.price,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString());
      });

      if (totalQuantity <= 0) {
        _items.remove(product.id!);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          return CartModel(
              id: product.id,
              name: product.name,
              img: product.img,
              price: product.price,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString());
        });
      } else {
        Get.snackbar("Item count", "You should atleast add 1 item in the cart",
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
      }
    }
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id!)) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems{
    var totalQuantity = 0;
    _items.forEach((key, value) { 
      totalQuantity += value.quantity!; 
    });
    return totalQuantity;
  }

  List<CartModel> get getItems{
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

}
