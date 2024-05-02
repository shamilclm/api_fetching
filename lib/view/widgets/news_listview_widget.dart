import 'package:flutter/material.dart';
import 'package:singleapi_fetching/model/api_model.dart';
import 'package:singleapi_fetching/view/pages/description_page.dart';

class NewsListviewWidget extends StatelessWidget {
  final List<Article> model;
  const NewsListviewWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DescriptionPage(
                              model: model[index],
                            ))),
                child: Card(
                    elevation: 9,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(model[index].urlToImage ??
                                    'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 2 / 3.7,
                              child: Text(
                                model[index].title,
                                style: const TextStyle(
                                    // overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                              width: MediaQuery.sizeOf(context).width * 2 / 3.7,
                              child: Text(
                                model[index].description ?? 'No description',
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                            Text(
                              '📆 ${model[index].publishedAt}',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                      ]),
                    )),
              ));
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: model.length);
  }
}
