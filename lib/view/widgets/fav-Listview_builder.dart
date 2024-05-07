import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:singleapi_fetching/controller/controller/fav.dart';
import 'package:singleapi_fetching/model/objectbox/fav_model.dart';
import 'package:singleapi_fetching/view/pages/description_page.dart';

class FavListviewWidget extends ConsumerWidget {
  const FavListviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: ref.watch(newsProvider)!.length,
      itemBuilder: (context, index) {
        final data = ref.watch(newsProvider);
        return Slidable(
            endActionPane: ActionPane(motion: const StretchMotion(), children: [
              SlidableAction(
                backgroundColor: Color.fromARGB(255, 241, 131, 168),
                icon: Icons.favorite,
                label: 'Add to favorite',
                onPressed: (context) {
                  ref
                      .read(newsProvider.notifier)
                      .removeFromFav(data![index].id, context);
                },
              )
            ]),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DescriptionPage(
                                model: null,
                                favModel: data[index],
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
                                  image: NetworkImage(data![index].urlToImage ??
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
                                width: MediaQuery.sizeOf(context).width * 2 / 4,
                                child: Text(
                                  data[index].title.toString(),
                                  style: const TextStyle(
                                      // overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                width:
                                    MediaQuery.sizeOf(context).width * 2 / 3.7,
                                child: Text(
                                  data[index].description ?? 'No description',
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              Text(
                                '📆 ${data[index].publishedAt}',
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                          GestureDetector(
                              onTap: () => ref
                                  .read(newsProvider.notifier)
                                  .removeFromFav(data[index].id, context),
                              child: Icon(Icons.delete)),
                        ]),
                      )),
                )));
      },
    );
  }
}
