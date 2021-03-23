import 'package:FoodDeliveryApp/model/MealsModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scoped_model/scoped_model.dart';

class MealsContorller extends Model {
  bool _isGetMealsLoading = false;
  bool get isGetMealsLoading => _isGetMealsLoading;

  List<MealsModel> _allMeals = [];
  List<MealsModel> get allMeals => _allMeals;

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
      });
    });
    _isGetMealsLoading = false;
    notifyListeners();
  }
}
