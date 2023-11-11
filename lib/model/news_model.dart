class NewsModel {
  String? title;
  String? description;
  String? url;
  String? image;
  String? publishedAt;

  NewsModel(
      {required this.title,
      required this.description,
      required this.url,
      required this.image,
      required this.publishedAt});


  static List<NewsModel> fromNews(Map<String, dynamic> jsonData) {
    List<NewsModel> _newsList = [];

    for (var article in jsonData['articles']) {
      NewsModel newsModel = NewsModel(
        title: article['title'],
        description: article['description'],
        url: article['url'],
        image: article['image'],
        publishedAt: article['publishedAt'],
      );

      _newsList.add(newsModel);
    }

    return _newsList;
  }
}
