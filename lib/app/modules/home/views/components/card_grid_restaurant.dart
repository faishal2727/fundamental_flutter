import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fundamental_submission/app/model/restaurant.dart';
import 'package:fundamental_submission/app/theme/color.dart';

class CardGridRestaurant extends StatelessWidget {
  final Restaurant restaurant;
  final Function(String) id;
  const CardGridRestaurant({Key? key, required this.restaurant,required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
        child: Column(
          children: [
            SizedBox(
                height: 200,
                width: 320,
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
                    const SizedBox(height: 10),
                    Text(
                      "${restaurant.name}",
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      textAlign: TextAlign.center,
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
          ],
        ),
      ),
    );
  }
}
