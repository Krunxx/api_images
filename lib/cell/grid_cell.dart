import 'package:flutter/material.dart';
import '../model/photo.dart';

class PhotoCell extends StatelessWidget {
  // Use `required` for named parameters.
  final Photo photo;
  const PhotoCell(this.photo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white70,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Hero(
                    tag: "image${photo.id}",
                    child: FadeInImage.assetNetwork(
                      placeholder: "lib/images/spongebob.gif",
                      image: photo.thumbnailUrl ?? "",
                      width: 20,
                      height: 100,
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.all(20),
              //   child: Text(
              //     photo.title ?? "",
              //     maxLines: 1,
              //     softWrap: true,
              //     textAlign: TextAlign.center,
              //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
