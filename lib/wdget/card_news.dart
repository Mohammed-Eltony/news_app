import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';

class CardNews extends StatelessWidget {
   CardNews({required this.data});
  NewsModel data;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      clipBehavior: Clip.hardEdge,
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Image.network(
            '${data.image}',
            // height: 100,
            width: 110,
            height: 200,
            fit: BoxFit.fill,
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 250,
                  child: Text(
                    '${data.title}',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        color: Colors.green, fontSize: 18),
                  ),
                ),
                Container(
                  width: 250,
                  child: Text(
                    maxLines: 3,
                    "${data.description}",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 15),
                  ),
                ),

                Text(
                  "${DateTime.parse("${data.publishedAt}").toLocal().hour}:${DateTime.parse("${data.publishedAt}").toLocal().minute}",
                  style: TextStyle(
                      color: Colors.black26, fontSize: 15),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
