import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project/Model/ProductModel/ProductModel.dart';

import '../../NetWork/ProductRepo/ProductRepo.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, call) async {
      ProductModel? productModel;

      call(ProductLoading());

      productModel = await ProductRepo().getProduct();
      if (productModel != null && productModel.products!.isNotEmpty) {
        call(ProductLoaded(productModel));
      } else {
        call(ProductError("No Data"));
      }
    });
  }
}
