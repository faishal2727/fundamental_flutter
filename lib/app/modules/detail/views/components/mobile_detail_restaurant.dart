import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fundamental_submission/app/modules/detail/controllers/detail_controller.dart';
import 'package:fundamental_submission/app/modules/detail/views/components/dropdown_menu.dart';
import 'package:fundamental_submission/app/modules/detail/views/components/rating.dart';
import 'package:fundamental_submission/app/theme/color.dart';

class MobileDetailRestaurant extends StatelessWidget {
  final DetailController detailController;
  const MobileDetailRestaurant({Key? key,required this.detailController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(defaultPadding * 0.75),
                  margin:
                      const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        width: 2, color: primaryColor.withOpacity(0.15)),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Icon(Icons.search, color: primaryColor),
                ),
              ),
              CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: "https://restaurant-api.dicoding.dev/images/medium/14",
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    detailController.detailRestaurant.name.toString(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(defaultPadding / 4),
                  padding: const EdgeInsets.all(defaultPadding / 4),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: primaryColor,
                  ),
                  child: Row(
                    children: [
                      Text(
                        detailController.detailRestaurant.city.toString(),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(height: 10),
                      ),
                      Text(
                        detailController.detailRestaurant.address.toString(),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Rating(rating: detailController.detailRestaurant.rating)
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                detailController.detailRestaurant.description.toString(),
              ),
            ),
          ),
          DropdownMenuz(listData: [], hint: "Categories")
        ],
      ),
    );
  }
}
