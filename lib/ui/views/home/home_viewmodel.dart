import 'package:mel_store/app/app.dialogs.dart';
import 'package:mel_store/app/app.locator.dart';
import 'package:mel_store/app/app.router.dart';
import 'package:mel_store/core/api_service/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/models/product_model.dart';

class HomeViewModel extends BaseViewModel {
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final ApiService _apiService = locator<ApiService>();
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
      // Fetch products
      products = await _apiService.getProducts();
      notifyListeners();
    } catch (e) {
      _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'Error',
        description: e.toString(),
      );
    }
  }

  void onProductTap(ProductModel product) {
    // navigate to product details page
    _navigationService.navigateTo(Routes.productDetailsView,
        arguments: ProductDetailsViewArguments(product: product),
        transition: TransitionsBuilders.fadeIn);
  }
}
