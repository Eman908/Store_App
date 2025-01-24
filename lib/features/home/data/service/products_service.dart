import 'package:dio/dio.dart';
import 'package:store_app/features/home/data/model/laptop_model.dart';
import 'package:store_app/features/home/data/model/products_model.dart';

class ProductsService {
  final Dio dio = Dio();
  productsData({required String endPoint}) async {
    Response response =
        await dio.get('https://fakestoreapi.com/products/category/$endPoint');
    List jsonData = response.data;
    if (response.statusCode == 200) {
      List<ProductsModel> repo =
          jsonData.map((e) => ProductsModel.fromJson(e)).toList();
      return repo;
    } else {
      throw Exception('sorry');
    }
  }

  laptopsData() async {
    Response response = await dio.get(
      'https://elwekala.onrender.com/product/Laptops',
    );

    try {
      if (response.statusCode == 200) {
        List jsonData = response.data["product"];
        List<LaptopModel> repo =
            jsonData.map((e) => LaptopModel.fromJson(e)).toList();
        return repo;
      } else {
        throw Exception();
      }
    } on DioException catch (e) {
      if (e.response != null) {
        return e.response!.data;
      } else {
        throw Exception();
      }
    }
  }
}
