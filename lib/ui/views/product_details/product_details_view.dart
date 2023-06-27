import 'package:flutter/material.dart';
import 'package:mel_store/ui/common/ui_helpers.dart';
import 'package:mel_store/ui/enums/title_types.dart';
import 'package:mel_store/ui/views/product_details/product_details_viewmodel.dart';
import 'package:mel_store/ui/views/widgets/widgets.dart';
import 'package:stacked/stacked.dart';

import '../../../core/models/product_model.dart';

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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 120,
                      child: MyImageViewer(
                        imageUrl: product.imageUrl!,
                      ),
                    ),
                    Flexible(
                      child: MyTitle(
                        title: product.name ?? 'No Name.',
                        type: TitleTypes.large,
                        shouldOverflow: false,
                      ),
                    ),
                  ],
                ),
                verticalSpaceMedium,
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16)),
                  child: MyTitle(
                    title: product.description ?? 'No product description.',
                    shouldOverflow: false,
                  ),
                ),
                verticalSpaceMedium,
                Text(
                    'Other Details: ${product.brewersTips ?? 'No details...'}'),
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
