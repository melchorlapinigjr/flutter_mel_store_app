import 'package:mel_store/core/api_service/api_service.dart';
import 'package:mel_store/core/api_service/api_service_impl.dart';
import 'package:mel_store/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:mel_store/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:mel_store/ui/views/home/home_view.dart';
import 'package:mel_store/ui/views/product_details/product_details_view.dart';
import 'package:mel_store/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: ProductDetailsView)
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiServiceImpl, asType: ApiService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
