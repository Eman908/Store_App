import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/favorites/cubit/favorite_cubit.dart';
import 'package:store_app/features/favorites/cubit/favorite_state.dart';
import 'package:store_app/features/favorites/view/widgets/favorite_success.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("My Favorites"),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 24,
        ),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteScreenSuccess) {
            return ListView.builder(
              itemCount: state.favData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: FavoriteSuccessscreen(
                    fav: state.favData[index],
                    onPressed: () {
                      FavoriteCubit.get(context).deleteFavCubit(
                        productId: state.favData[index].productId,
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
