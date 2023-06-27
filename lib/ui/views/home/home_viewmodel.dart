import 'package:flutter/cupertino.dart';
import 'package:mel_store/app/app.bottomsheets.dart';
import 'package:mel_store/app/app.dialogs.dart';
import 'package:mel_store/app/app.locator.dart';
import 'package:mel_store/app/models/product_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();

  List<ProductModel> products = [];

  // Screen startup logics
  void runStartupLogic() async {
    setBusy(true);
    await getProducts();
    setBusy(false);
  }

  // get products
  Future<void> getProducts() async {
    try {
      products = [
        ProductModel(
            id: 0,
            name: 'Beer',
            imageUrl: 'https://images.punkapi.com/v2/keg.png'),
        ProductModel(
            id: 2,
            name: 'Red Horse',
            imageUrl: 'https://images.punkapi.com/v2/keg.png'),
        ProductModel(
            id: 3,
            name: 'Tiquela',
            imageUrl: 'https://images.punkapi.com/v2/keg.png'),
        ProductModel(
            id: 4,
            name: 'Chevas Regal',
            imageUrl: 'https://images.punkapi.com/v2/keg.png'),
        ProductModel(
            id: 5,
            name: 'Cola',
            imageUrl: 'https://images.punkapi.com/v2/keg.png'),
      ];
      notifyListeners();
    } catch (e) {
      _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'Error',
        description: e.toString(),
      );
    }
  }
}
