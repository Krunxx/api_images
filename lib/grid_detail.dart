import 'package:flutter/material.dart';
import 'model/photo.dart';

class GridDetails extends StatefulWidget {
  final Photo photo;
  const GridDetails({required this.photo});

  @override
  State<GridDetails> createState() => _GridDetailsState();
}

class _GridDetailsState extends State<GridDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //animation transtion
            Hero(
              tag: "image${widget.photo.id}",
              child: FadeInImage.assetNetwork(
                  placeholder: "lib/images/spongebob.gif",
                  image: widget.photo.url ?? ""
              ),
            ),
            const SizedBox(height: 100),
            OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Back"))
          ],
        ),
      ),
    );
  }
}
