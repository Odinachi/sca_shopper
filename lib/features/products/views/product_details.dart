import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sca_shopper/features/products/view_models/product_provider.dart';
import 'package:sca_shopper/models/response_model/product_model.dart';
import 'package:sca_shopper/shared/constants.dart';

import '../../../shared/colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, this.model});

  final ProductModel? model;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.appColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider.builder(
                itemCount: widget.model?.images?.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  final img = widget.model?.images?[itemIndex];
                  return SizedBox(
                    height: height * .5,
                    width: width,
                    child: Image.network(
                      img ?? "",
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) {
                        return Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.black.withOpacity(.1)),
                          height: height * .5,
                          width: width,
                          child: Icon(
                            Icons.image_not_supported,
                            color: AppColors.black.withOpacity(.3),
                          ),
                        );
                      },
                    ),
                  );
                },
                options: CarouselOptions(
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  aspectRatio: 1,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                widget.model?.title ?? "",
                style: style.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.model?.price?.convertToNaira() ?? "",
                    style: style.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.appColor,
                      fontSize: 20,
                    ),
                  ),
                  AddToCart(model: widget.model)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.model?.description ?? "",
                style: style.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.black.withOpacity(.3),
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddToCart extends StatelessWidget {
  const AddToCart({
    super.key,
    required this.model,
  });

  final ProductModel? model;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (_, provider, __) {
        return Row(
          children: [
            InkWell(
              onTap: () {
                provider.addItem(model);
              },
              child: Icon(
                Icons.add_circle_outline,
                size: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                // provider.productList
                //     .where((e) => e.id == model?.id)
                //     .length
                //     .toString(),

                (provider.map[model?.id]?.count ?? 0).toString(),
                style: style.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.appColor,
                  fontSize: 20,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                provider.removeItem(model);
              },
              child: Icon(
                Icons.remove_circle_outline,
                size: 30,
              ),
            ),
          ],
        );
      },
    );
  }
}
