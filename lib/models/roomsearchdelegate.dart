import 'package:bhs__companion__app/models/map_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [];

  RoomSearchDelegate() {
    //!* Can change searchterms from here (?). Useful if needed to be pulled from a file.
    searchTerms = RoomData.dataMap.keys.toList(); //! Unoptimized?
  }


  @override
  List<Widget>? buildActions(BuildContext context) { //clears search text?
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) { //pop out of search menu?
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var location in searchTerms) {
      if(location.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(location);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            close(context, result);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) { //show the queries
    List<String> matchQuery = [];
    for (var location in searchTerms) {
      if(location.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(location);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            close(context, result);
            Provider.of<MapProvider>(context, listen: false).showResultsBottomSheet(Provider.of<MapProvider>(context, listen: false).mapBuildContext??context, RoomData.dataMap[matchQuery[index]]??MapObjectData("_error_02_", 1));
          },
        );
      },
    );
  }

}