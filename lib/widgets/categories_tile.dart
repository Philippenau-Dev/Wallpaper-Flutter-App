import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/controller/search_controller.dart' as ctrl;

class CategoriesTile extends StatelessWidget {
  final String imgUrl;
  final String title;

  CategoriesTile({
    required this.imgUrl,
    required this.title,
  });

  final _controller = Get.put(ctrl.SearchController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.searchWallPapers(this.title);
        _controller.searchController.clear();
        Get.toNamed('/search');
      },
      child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xfff5f8fd),
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: kIsWeb
                      ? Image.network(
                          this.imgUrl,
                          width: 100,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                      : CachedNetworkImage(
                          imageUrl: this.imgUrl,
                          width: 100,
                          height: 50,
                          fit: BoxFit.cover,
                        )),
            ),
            Container(
              child: Text(
                this.title,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
