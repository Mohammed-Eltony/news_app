import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/wdget/card_news.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> with TickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Home',
    ),
    Tab(text: 'Sport'),
    Tab(text: 'new'),
  ];

  late final TabController _tabController;



  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
    getData(namePage: 'news');
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
   List<NewsModel>? data ;
 getData({String namePage = 'news'})async{
  NewsServices newsServices = await NewsServices();
  List<NewsModel>? newData = await newsServices.getNews(nameNews: namePage);
  print("===================");
  print(data
    ?..forEach((element) {
      print(element.title);
    }));

  if (newData != null) {
    setState(() {
      data = newData;
    });
  }else{
    print("==================");
  }

}
  String? namePage;

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2C3C5D),
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text("News"),
          bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: Color(0xffEDC80A),
              unselectedLabelColor: Colors.white,
              indicatorColor: Color(0xffEDC80A),
              onTap: (value) async {
                switch (value) {
                  case 0:
                    namePage = "news";
                    print(namePage);
                    break;
                  case 1:
                    namePage = "sport";
                    print(namePage);
                    break;
                  default:
                    print("no");
                }
                getData(namePage: namePage!);

              },
              labelStyle: TextStyle(fontSize: 18, color: Colors.white),
              tabs: myTabs),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Container(
                color: Colors.green,
                child: data == null? Text(""):ListView.builder(
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    return CardNews(data: data![index]);
                  },
                )),
            Container(
                color: Colors.redAccent,
                child: data == null? Text(""):ListView.builder(
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    return CardNews(data: data![index]);
                  },
                )),
           Center(
             child: Text("data"),
           )
          ],
        ),
      ),
    );
  }

}
