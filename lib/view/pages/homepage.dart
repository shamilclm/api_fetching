import 'package:flutter/material.dart';
import 'package:singleapi_fetching/controller/services/api_service.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(),
        body: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.black,
            tabs: [
              Row(
                children: [
                  Icon(
                    Icons.menu_sharp,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("News")
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.favorite,
                    size: 30,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Favs")
                ],
              )
            ]),
        // body: FutureBuilder(
        //   builder: (context, snapshot) {
        //     return Text(snapshot.data!.last.title);
        //   },
        //   future: ApiService().fetchdata(),
        // ),
      ),
    );
  }
}
