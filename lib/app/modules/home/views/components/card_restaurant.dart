import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fundamental_submission/app/model/restaurant.dart';
import 'package:fundamental_submission/app/theme/color.dart';

class CardRestaurant extends StatelessWidget {
  final Restaurant restaurant;
  final Function(String) id;
  const CardRestaurant({Key? key, required this.restaurant,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => id(restaurant.id),
      child: Container(
        margin: const EdgeInsets.only(top: defaultPadding),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
          borderRadius: const BorderRadius.all(
            Radius.circular(defaultPadding),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
                height: 100,
                width: 100,
                child: Hero(
                  tag: restaurant.name,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl:
                          "https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}",
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                    ),
                  ),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      restaurant.city,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
            const Icon(Icons.arrow_right)
          ],
        ),
      ),
    );
  }
}
