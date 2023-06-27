import 'package:flutter/material.dart';
import 'package:mel_store/ui/enums/title_types.dart';
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
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children: viewModel.products
                      .map((product) => InkWell(
                            onTap: () => viewModel.onProductTap(product),
                            child: ProductThumbnail(
                                name: product.name ?? 'No Name.',
                                imageUrl: product.imageUrl!),
                          ))
                      .toList(),
                  crossAxisCount: 2,
                ),
              ),
        bottomNavigationBar: Container(
          height: 64,
          color: Colors.grey,
          alignment: AlignmentDirectional.center,
          child: MyTitle(
            title: 'Total Products: ${viewModel.products.length}',
            type: TitleTypes.medium,
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
