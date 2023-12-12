// import 'package:api_image/cell/grid_cell.dart';
// import 'package:api_image/grid_detail.dart';
// import 'package:api_image/network/network_request.dart';
// import 'package:flutter/material.dart';
//
// import 'model/photo.dart';
//
// void main(){
//   runApp(const MainApp());
// }
//
// class MainApp extends StatelessWidget {
//   const MainApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: HomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   final TextEditingController _searchController = TextEditingController();
//   List<Photo> _filteredPhotos = [];
//
//   gridView(AsyncSnapshot<List<Photo>> snapshot){
//     return Padding(
//       padding: EdgeInsets.all(5),
//       child: GridView.count(
//         crossAxisCount: 2,
//         childAspectRatio: 1,
//         mainAxisSpacing: 4,
//         crossAxisSpacing: 4,
//         children: snapshot.data!.map((photo) {
//           return GestureDetector(
//             child: GridTile(
//               child: PhotoCell(photo),
//             ),
//             onTap: () {
//               gotoDetailPage(context, photo);
//             },
//           );
//         }).toList(),
//       ),
//     );
//   }
//
//   gotoDetailPage(BuildContext context, Photo photo) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (BuildContext context) => GridDetails(photo: photo),
//       ),
//     );
//   }
//
//   circularProgress() {
//     if (_filteredPhotos.isEmpty) {
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     } else {
//       return SizedBox.shrink();
//     }
//   }
//
//   void _filterPhotos() {
//     final query = _searchController.text.toLowerCase();
//     setState(() {
//       var snapshot;
//       _filteredPhotos = (snapshot.data ?? [])
//           .where((photo) =>
//       photo.title!.toLowerCase().contains(query) ||
//           photo.url!.toLowerCase().contains(query))
//           .toList();
//     });
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("API Image")),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Flexible(
//             child: Column(
//               children: [
//                 TextField(
//                   controller: _searchController,
//                   decoration: InputDecoration(
//                     labelText: 'Search',
//                     suffixIcon: IconButton(
//                       icon: Icon(Icons.clear),
//                       onPressed: () {
//                         _searchController.clear();
//                         _filterPhotos();
//                       },
//                     ),
//                   ),
//                   onChanged: (value) {
//                     _filterPhotos();
//                   },
//                 ),
//                 FutureBuilder<List<Photo>>(
//                   future: NetworkRequest.fetchPhotos(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasError) {
//                       return Text("Error ${snapshot.error}");
//                     } else if (snapshot.hasData) {
//                       return gridView(snapshot);
//                     }
//                     return circularProgress();
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
