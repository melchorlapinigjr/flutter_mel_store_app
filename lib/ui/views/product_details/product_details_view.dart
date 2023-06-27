import 'package:flutter/material.dart';
import 'package:mel_store/app/models/product_model.dart';
import 'package:mel_store/ui/common/ui_helpers.dart';
import 'package:mel_store/ui/enums/title_types.dart';
import 'package:mel_store/ui/views/product_details/product_details_viewmodel.dart';
import 'package:mel_store/ui/views/widgets/widgets.dart';
import 'package:stacked/stacked.dart';

class ProductDetailsView extends StackedView<ProductDetailsViewModel> {
  final ProductModel product;

  const ProductDetailsView({super.key, required this.product});

  @override
  Widget builder(
      BuildContext context, ProductDetailsViewModel viewModel, Widget? child) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      child: MyImageViewer(
                        imageUrl: product.imageUrl!,
                      ),
                    ),
                    horizontalSpaceMedium,
                    MyTitle(
                      title: product.name ?? 'No Name.',
                      type: TitleTypes.large,
                    ),
                  ],
                ),
                verticalSpaceMedium,
                Container(
                  height: 120,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTitle(
                          title:
                              product.description ?? 'No product description.')
                    ],
                  ),
                ),
                verticalSpaceMedium,
                Text('Other Details: ${product.brewersTips ?? 'No details...'}'),
                verticalSpaceLarge,
                MyButton(title: 'Back', onPressed: viewModel.onBackTap)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  ProductDetailsViewModel viewModelBuilder(BuildContext context) {
    return ProductDetailsViewModel();
  }
}
