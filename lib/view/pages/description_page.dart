import 'package:flutter/material.dart';
import 'package:singleapi_fetching/model/api_model.dart';
import 'package:singleapi_fetching/model/objectbox/fav_model.dart';

class DescriptionPage extends StatelessWidget {
  final Article? model;
  final FavsEntityModel? favModel;

  const DescriptionPage({super.key, required this.model, this.favModel});

  @override
  Widget build(BuildContext context) {
    bool isFav() {
      return favModel != null;
    }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(isFav()
                            ? favModel!.urlToImage
                            : model!.urlToImage ??
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaUob4SHHVNhRBH-S7vhnPP8C6FLtbuyrwGVsUeXw1BPXqCHalzzqJ5XgVvVZ939LTkq4&usqp=CAU'),
                        fit: BoxFit.cover)),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_outline,
                        color: Colors.red,
                      )),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                isFav() ? favModel!.title : model!.title.toString(),
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '📆${isFav() ? favModel!.publishedAt : model!.publishedAt}',
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(isFav() ? favModel!.content : model!.content),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
