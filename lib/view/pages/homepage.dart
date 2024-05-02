import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:singleapi_fetching/controller/services/api_service.dart';
import 'package:singleapi_fetching/view/widgets/news_listview_widget.dart';
import 'package:singleapi_fetching/view/widgets/tabbar_widget.dart';

class Homepage extends HookConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTabIndex = useState<int>(0);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          title: TabBar(
              onTap: (value) {
                selectedTabIndex.value = value;
                log('tab index = ${selectedTabIndex.value}');
              },
              labelPadding: const EdgeInsets.all(16),
              unselectedLabelColor: Colors.black,
              labelColor: Colors.black,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              tabs: [
                TabWidget(
                  icon: Icons.list,
                  iconColor: Colors.black,
                  text: 'News',
                  index: 0,
                  selectedIndex: selectedTabIndex.value,
                ),
                TabWidget(
                  icon: Icons.favorite,
                  iconColor: Colors.red,
                  text: 'Favs',
                  index: 1,
                  selectedIndex: selectedTabIndex.value,
                )
              ]),
        ),
        body: TabBarView(
          children: [
            FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return NewsListviewWidget(model: snapshot.data!);
                } else if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text('Error');
                } else {
                  return const CircularProgressIndicator();
                }
              },
              future: ApiService().fetchdata(),
            ),
            Text("podaa")
          ],
        ),
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
