import 'package:flutter/material.dart';
import 'package:store_app/features/cart/cubit/cart_cubit.dart';
import 'package:store_app/features/favorites/cubit/favorite_cubit.dart';
import 'package:store_app/features/home/data/model/laptop_model.dart';

class DesScreen extends StatelessWidget {
  const DesScreen({super.key, required this.laptopModel});
  final LaptopModel laptopModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Product Details"),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 24,
        ),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image.network(
                  laptopModel.productImage,
                ),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(
                    laptopModel.productName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      const Text(
                        "Price: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        laptopModel.productPrice.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                laptopModel.producrDescription,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                spacing: 8,
                children: [
                  CircleAvatar(
                    radius: 32,
                    child: IconButton(
                      onPressed: () {
                        FavoriteCubit.get(context).addToFavoriteCubit(
                          productId: laptopModel.productId,
                        );
                      },
                      icon: const Icon(
                        Icons.favorite_border,
                        size: 32,
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      onPressed: () {
                        CartCubit.get(context).getAddToCartCubit(
                            productId: laptopModel.productId);
                      },
                      padding: const EdgeInsets.all(16),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      child: const Row(
                        spacing: 16,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Add To Cart",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
