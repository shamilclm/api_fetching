import 'package:flutter/material.dart';
import 'package:singleapi_fetching/model/api_model.dart';

class DescriptionPage extends StatelessWidget {
  final Article model;
  const DescriptionPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios)),
        titleSpacing: 0,
        title: const Text(
          'Back',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(model.urlToImage ??
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaUob4SHHVNhRBH-S7vhnPP8C6FLtbuyrwGVsUeXw1BPXqCHalzzqJ5XgVvVZ939LTkq4&usqp=CAU'),
                      fit: BoxFit.cover)),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_outline,
                      color: Colors.black,
                    )),
              ),
            ),
            Text(model.title)
          ],
        ),
      ),
    );
  }
}
