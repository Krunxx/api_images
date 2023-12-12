import 'package:api_image/cell/grid_cell.dart';
import 'package:api_image/grid_detail.dart';
import 'package:api_image/network/network_request.dart';
import 'package:flutter/material.dart';

import 'model/photo.dart';

void main(){
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  gridView(AsyncSnapshot<List<Photo>> snapshot){
    return Padding(
    padding: EdgeInsets.all(5),
    child: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: snapshot.data!.map((photo) {
        return GestureDetector(
          child: GridTile(
            child: PhotoCell(photo),
          ),
          onTap: () {
            gotoDetailPage(context, photo);
          },
        );
      }).toList(),
    ),
    );
  }

  gotoDetailPage(BuildContext context, Photo photo){
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => GridDetails(photo: photo) )
    );
  }

  circularProgress(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Image Navigator")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: FutureBuilder<List<Photo>>(
              future: NetworkRequest.fetchPhotos(),
              builder: (context, snapshot){
                if(snapshot.hasError){
                  return Text("Error ${snapshot.error}");
                }else if(snapshot.hasData){
                  return gridView(snapshot);
                }
                return circularProgress();
              }
            ),
          ),
        ],
      ),
    );
  }
}

