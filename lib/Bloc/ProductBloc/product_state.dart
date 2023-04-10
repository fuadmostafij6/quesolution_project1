part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable{}

class ProductInitial extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}



class ProductLoading extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class ProductLoaded extends ProductState {
  final ProductModel productModel;

  ProductLoaded(this.productModel);
  @override
  // TODO: implement props
  List<Object?> get props => [productModel];
}


class ProductError extends ProductState {
  final String error;

  ProductError(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
