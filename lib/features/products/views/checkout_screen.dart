import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sca_shopper/features/products/view_models/product_provider.dart';
import 'package:sca_shopper/features/products/views/product_details.dart';
import 'package:sca_shopper/shared/colors.dart';

import '../../../shared/constants.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout",
          style: style.copyWith(
            fontSize: 20,
            color: AppColors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Consumer<ProductProvider>(
            builder: (_, provider, __) {
              final keys = provider.map.keys.toList();
              return provider.map.keys.isEmpty
                  ? Center(
                      child: Text("Cart is Empty"),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.only(top: 30),
                      separatorBuilder: (_, __) => const Divider(
                        color: AppColors.greyColor,
                      ),
                      itemBuilder: (_, i) {
                        final each = provider.map[keys[i]];
                        return ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                each?.model.images?.firstOrNull ?? "",
                                height: 50,
                                width: 50,
                                errorBuilder: (_, __, ___) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.black.withOpacity(.1)),
                                    height: 50,
                                    width: 50,
                                    child: Icon(
                                      Icons.image_not_supported,
                                      color: AppColors.black.withOpacity(.3),
                                    ),
                                  );
                                },
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  each?.model.price?.convertToNaira() ?? "",
                                  style: style.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.delete_rounded,
                                  color: AppColors.redColor,
                                )
                              ],
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  each?.model.title ?? "",
                                  style: style.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  each?.model.description ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: style.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black.withOpacity(.4),
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AddToCart(
                                  model: each?.model,
                                ),
                              ],
                            ));
                      },
                      itemCount: keys.length,
                    );
            },
          ),
        ),
      ),
    );
  }
}
