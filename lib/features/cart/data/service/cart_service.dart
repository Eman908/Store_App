// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:store_app/features/cart/data/model/cart_model.dart';

// class CartService {
//   final Dio dio = Dio();

//   addCart({required String productId}) async {
//     Response response = await dio.post(
//       'https://elwekala.onrender.com/cart/add',
//       data: {"nationalId": getId, "productId": productId, "quantity": "1"},
//     );
//     var jsonData = response.data;
//     log(jsonData.toString());
//     return jsonData;
//   }

//   deleteProduct({required String productId}) async {
//     Response response = await dio.delete(
//       'https://elwekala.onrender.com/cart/delete',
//       data: {"nationalId": getId, "productId": productId, "quantity": "1"},
//     );
//     var jsonData = response.data;
//     return jsonData;
//   }

//   getCartProducts() async {
//     Response response = await dio.get(
//         'https://elwekala.onrender.com/cart/allProducts',
//         data: {"nationalId": getId});

//     try {
//       if (response.statusCode == 200) {
//         var jsonData = response.data;
//         List allProducts = jsonData["products"];
//         List<CartModel> allProductsList =
//             allProducts.map((e) => CartModel.fromJson(e)).toList();

//         return allProductsList;
//       }
//     } on DioException catch (e) {
//       if (e.response != null) {
//         return e.response!.data;
//       }
//     }
//   }
// }
