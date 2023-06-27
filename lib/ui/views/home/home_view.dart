import 'package:flutter/material.dart';
import 'package:mel_store/ui/views/home/widgets/product_thumbnail.dart';
import 'package:stacked/stacked.dart';

import '../widgets/widgets.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const MyTitle(
            title: 'Welcome to Mel Store',
          ),
        ),
        body: viewModel.isBusy
            ? const MyLoadingIndicator()
            : SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: GridView.count(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  mainAxisSpacing: 1,
                  children: viewModel.products
                      .map((product) => ProductThumbnail(
                          name: product.name!, imageUrl: product.imageUrl!))
                      .toList(),
                  crossAxisCount: 2,
                ),
              ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.runStartupLogic();
    super.onViewModelReady(viewModel);
  }
}
