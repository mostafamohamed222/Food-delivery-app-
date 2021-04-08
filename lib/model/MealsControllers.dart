import 'package:FoodDeliveryApp/model/MealsModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MealsContorller with ChangeNotifier {
  bool _isGetMealsLoading = false;
  bool get isGetMealsLoading => _isGetMealsLoading;

  bool _isAddMealsLoading = false;
  bool get isAddMealsLoading => _isAddMealsLoading;

  List<MealsModel> _allMeals = [];
  List<MealsModel> get allMeals => _allMeals;

  List<MealsModel> _cartItems = [];
  List<MealsModel> get cartItems => _cartItems;

  int _quantity = 0;
  int get quantity => _quantity;

  void incrementQuantity() {
    _quantity++;
    notifyListeners();
  }

  void decrementQuantity() {
    if (_quantity == 0) {
      return;
    }
    _quantity--;
    notifyListeners();
  }

  void resetQuantity() {
    _quantity = 0;
    notifyListeners();
  }

  Future<void> fetchData() async {
    const String url =
        "https://fooddeliveryapptest-ef073-default-rtdb.firebaseio.com/meals.json";
    _isGetMealsLoading = true;
    notifyListeners();
    try {
      http.Response res = await http.get(url);
      final data = json.decode(res.body) as Map<String, dynamic>;
      data.forEach((key, value) {
        final MealsModel _newMeal = MealsModel(
          id: key,
          image: value['image'],
          name: value['title'],
          price: value['price'],
          fav: value['fav'],
        );
        _allMeals.add(_newMeal);
      });
      _isGetMealsLoading = false;
      notifyListeners();
    } catch (e) {}
  }

  void addToCart(var id, int numberOfMeals) {
    MealsModel meal = getById(id);
    for (MealsModel i in _cartItems) {
      if (i.id == meal.id) {
        i.numberOfMeals += numberOfMeals;
        print("find it");
        return;
      }
    }
    _cartItems.add(
      MealsModel(
          id: meal.id,
          fav: meal.fav,
          image: meal.image,
          name: meal.name,
          price: meal.price,
          numberOfMeals: numberOfMeals),
    );
    notifyListeners();
  }

  double cartItemPrice() {
    double ret = 0;
    for (var i in _cartItems) {
      ret += (i.price * i.numberOfMeals);
    }
    return ret;
  }

  resetMeals() {
    _allMeals = [];
  }

  addMeal(String title, double price, String image, bool fav) async {
    _isAddMealsLoading = true;
    notifyListeners();

    Map<String, dynamic> _data = {
      'title': title,
      'price': price,
      'image': image,
      'fav': fav,
    };

    Firestore.instance.collection("meals").add(_data);

    _isAddMealsLoading = false;
    notifyListeners();
  }

  MealsModel getById(var id) {
    for (var index in _allMeals) {
      if (id == index.id) {
        return index;
      }
    }
    return null;
  }
}
