import 'package:mel_store/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductDetailsViewModel extends BaseViewModel{

  final NavigationService _navigationService = locator<NavigationService>();

  void onBackTap(){
    _navigationService.back();
  }
}