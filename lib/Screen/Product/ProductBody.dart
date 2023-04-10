import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Bloc/ProductBloc/product_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
Widget productBody() {
  return BlocProvider(
    create: (context) => ProductBloc()..add(AllProductEvent()),
    child: BlocBuilder<ProductBloc, ProductState>(
      builder: (BuildContext context, state) {
        if (state is ProductLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductLoaded) {
          var dataList = state.productModel.products;
          return

            ListView.builder(

              itemCount: dataList!.length,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index){
                var data = dataList[index];
                if(data.price!<100) {
                  return
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        CachedNetworkImage(
                          imageUrl: "${data.image!.original}",
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                        Text("${data.name}"),
                        Text("${data.description??""}"),
                      ],
                    );
                }
                else{

                  return Container();

                }




          });
        } else if (state is ProductError) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return Container();
        }
      },
    ),
  );
}
