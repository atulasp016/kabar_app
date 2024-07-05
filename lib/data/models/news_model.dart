class NewsData {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewsData({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsData.fromJson(Map<String, dynamic> json) {
    List<Articles> mArticles = [];

    for (Map<String, dynamic> eachNews in json['articles']) {
      mArticles.add(Articles.fromJson(eachNews));
    }
    return NewsData(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: mArticles,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles,
    };
  }
}

class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      source: Source.fromJson(json['source']),
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'source': source,
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }
}

class Source {
  String? id;
  String? name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
