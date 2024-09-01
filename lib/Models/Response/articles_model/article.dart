class Article {
  String? id;
  String? customUrlTitle;
  String? name;
  String? date;
  String? time;
  String? dateCreated;
  String? description;
  bool? hasDescription;
  String? mainImage;
  String? mainImageSrc;
  String? detailsImage;
  String? detailsImageSrc;
  String? videoImage;
  String? videoImageSrc;
  dynamic featured;
  dynamic templateId;
  String? team1;
  String? score1;
  String? team2;
  String? score2;
  String? section;
  String? source;
  String? sourceImage;
  String? sourceImageSrc;
  String? author;
  String? authorImage;
  String? authorImageSrc;
  String? websiteUrl;
  dynamic shareUrl;
  bool? important;
  String? hasVideo;
  List<dynamic>? keywords;
  List<dynamic>? photos;
  List<dynamic>? videos;

  Article({
    this.id,
    this.customUrlTitle,
    this.name,
    this.date,
    this.time,
    this.dateCreated,
    this.description,
    this.hasDescription,
    this.mainImage,
    this.mainImageSrc,
    this.detailsImage,
    this.detailsImageSrc,
    this.videoImage,
    this.videoImageSrc,
    this.featured,
    this.templateId,
    this.team1,
    this.score1,
    this.team2,
    this.score2,
    this.section,
    this.source,
    this.sourceImage,
    this.sourceImageSrc,
    this.author,
    this.authorImage,
    this.authorImageSrc,
    this.websiteUrl,
    this.shareUrl,
    this.important,
    this.hasVideo,
    this.keywords,
    this.photos,
    this.videos,
  });

  @override
  String toString() {
    return 'Article(id: $id, customUrlTitle: $customUrlTitle, name: $name, date: $date, time: $time, dateCreated: $dateCreated, description: $description, hasDescription: $hasDescription, mainImage: $mainImage, mainImageSrc: $mainImageSrc, detailsImage: $detailsImage, detailsImageSrc: $detailsImageSrc, videoImage: $videoImage, videoImageSrc: $videoImageSrc, featured: $featured, templateId: $templateId, team1: $team1, score1: $score1, team2: $team2, score2: $score2, section: $section, source: $source, sourceImage: $sourceImage, sourceImageSrc: $sourceImageSrc, author: $author, authorImage: $authorImage, authorImageSrc: $authorImageSrc, websiteUrl: $websiteUrl, shareUrl: $shareUrl, important: $important, hasVideo: $hasVideo, keywords: $keywords, photos: $photos, videos: $videos)';
  }

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json['id'] as String?,
        customUrlTitle: json['customUrlTitle'] as String?,
        name: json['name'] as String?,
        date: json['date'] as String?,
        time: json['time'] as String?,
        dateCreated: json['dateCreated'] as String?,
        description: json['description'] as String?,
        hasDescription: json['hasDescription'] as bool?,
        mainImage: json['mainImage'] as String?,
        mainImageSrc: json['mainImageSrc'] as String?,
        detailsImage: json['detailsImage'] as String?,
        detailsImageSrc: json['detailsImageSrc'] as String?,
        videoImage: json['videoImage'] as String?,
        videoImageSrc: json['videoImageSrc'] as String?,
        featured: json['featured'] as dynamic,
        templateId: json['templateId'] as dynamic,
        team1: json['team1'] as String?,
        score1: json['score1'] as String?,
        team2: json['team2'] as String?,
        score2: json['score2'] as String?,
        section: json['section'] as String?,
        source: json['source'] as String?,
        sourceImage: json['sourceImage'] as String?,
        sourceImageSrc: json['sourceImageSrc'] as String?,
        author: json['author'] as String?,
        authorImage: json['authorImage'] as String?,
        authorImageSrc: json['authorImageSrc'] as String?,
        websiteUrl: json['websiteUrl'] as String?,
        shareUrl: json['shareURL'] as dynamic,
        important: json['important'] as bool?,
        hasVideo: json['hasVideo'] as String?,
        keywords: json['keywords'] as List<dynamic>?,
        photos: json['photos'] as List<dynamic>?,
        videos: json['videos'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'customUrlTitle': customUrlTitle,
        'name': name,
        'date': date,
        'time': time,
        'dateCreated': dateCreated,
        'description': description,
        'hasDescription': hasDescription,
        'mainImage': mainImage,
        'mainImageSrc': mainImageSrc,
        'detailsImage': detailsImage,
        'detailsImageSrc': detailsImageSrc,
        'videoImage': videoImage,
        'videoImageSrc': videoImageSrc,
        'featured': featured,
        'templateId': templateId,
        'team1': team1,
        'score1': score1,
        'team2': team2,
        'score2': score2,
        'section': section,
        'source': source,
        'sourceImage': sourceImage,
        'sourceImageSrc': sourceImageSrc,
        'author': author,
        'authorImage': authorImage,
        'authorImageSrc': authorImageSrc,
        'websiteUrl': websiteUrl,
        'shareURL': shareUrl,
        'important': important,
        'hasVideo': hasVideo,
        'keywords': keywords,
        'photos': photos,
        'videos': videos,
      };
}
