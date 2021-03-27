import 'package:FoodDeliveryApp/model/MealsModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MealsContorller with ChangeNotifier {
  bool _isGetMealsLoading = false;
  bool get isGetMealsLoading => _isGetMealsLoading;

  bool _isAddMealsLoading = false;
  bool get isAddMealsLoading => _isAddMealsLoading;

  List<MealsModel> _allMeals = [];
  List<MealsModel> get allMeals => _allMeals;

  List<MealsModel> _cartItems = [];
  List<MealsModel> get cartItems => _cartItems;

  void addToCart(var id) {
    _cartItems.add(getById(id));
  }

  resetMeals() {
    _allMeals = [];
  }

  getMeals() async {
    _isGetMealsLoading = true;
    notifyListeners();

    Firestore.instance
        .collection("meals")
        .getDocuments()
        .then((QuerySnapshot shot) {
      shot.documents.forEach((i) {
        final MealsModel _newMeal = MealsModel(
          id: i.documentID,
          image: i['image'],
          name: i['title'],
          price: i['price'],
          fav: i['fav'],
        );
        _allMeals.add(_newMeal);
        notifyListeners();
      });
    });

    _isGetMealsLoading = false;
    notifyListeners();
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
