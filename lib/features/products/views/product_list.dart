import 'package:flutter/material.dart';
import 'package:sca_shopper/shared/colors.dart';

import '../../../shared/constants.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, this.id});

  final String? id;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    print("Gotten value is ${widget.id}");
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.white),
          backgroundColor: AppColors.appColor,
          title: Text(
            "Product List",
            style: style.copyWith(
              fontSize: 20,
              color: AppColors.white,
            ),
          ),
        ),
        body: SizedBox());
  }
}
