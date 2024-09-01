import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mercator_test/Models/Request/ApiResponse.dart';
import 'package:mercator_test/Models/Request/Status.dart';
import 'package:mercator_test/Models/Request/articleReqModel.dart';
import 'package:mercator_test/Models/Response/articles_model/article.dart';
import 'package:mercator_test/Utility/global_color.dart';
import 'package:mercator_test/View/Pages/SearchPage.dart';
import 'package:mercator_test/View/Pages/articleDetailPage.dart';
import 'package:mercator_test/View/Widgets/articleCard.dart';
import 'package:mercator_test/View/Widgets/mainline.dart';
import 'package:mercator_test/view_model/homeVm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Article>> articlelist;
  final searchController = TextEditingController();
  ArticlesReqModel req = ArticlesReqModel(
    id: -1,
    authorId: -1,
    start: 0,
    end: 30,
    keywordId: -1,
    onlyWithSource: false,
    type: "",
    platform: "",
    isLatin: false,
  );
  int currentStart = 0;
  int currentEnd = 30;
  bool isLoadingMore = false;
  List<Article> allArticles = [];

  Future<void> _loadMoreArticles() async {
    if (!isLoadingMore) {
      setState(() {
        isLoadingMore = true;
        currentStart = currentEnd;
        currentEnd += 10;
      });

      List<Article> moreArticles = await fetchArticlesData();
      setState(() {
        allArticles.addAll(moreArticles);
        isLoadingMore = false;
      });
    }
  }

  List<Article> _handleApiResponse(ApiResponse<List<Article>> response) {
    if (response.status == Status.COMPLETED) {
      return response.data!;
    } else {
      throw Exception(response);
    }
  }

  @override
  void initState() {
    super.initState();
    articlelist = fetchArticlesData();
  }

  Future<List<Article>> fetchArticlesData() async {
    final articlehome = HomeViewModel();
    req.start = currentStart;
    req.end = currentEnd;
    final response = await articlehome.getAppliedJobs(req);
    _loadMoreArticles();
    return _handleApiResponse(response);
  }

  Future<void> _refreshArticles() async {
    setState(() {
      currentStart = 0;
      currentEnd = 30;
      allArticles.clear();
      articlelist = fetchArticlesData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: RefreshIndicator(
          color: GlobalColors.mainColor,
          onRefresh: _refreshArticles,
          child: Stack(
            children: [
              const MainLine(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          "ما الأخبار اليوم؟",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(255, 246, 245, 245),
                              const Color.fromARGB(255, 62, 62, 62)
                                  .withOpacity(0.1)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextField(
                          controller: searchController,
                          onSubmitted: (query) {
                            if (query.isNotEmpty) {
                              articlelist.then((articles) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SearchPage(
                                        query: query, articles: articles),
                                  ),
                                );
                              });
                            }
                          },
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: SvgPicture.asset(
                                    "assets/images/filter.svg",
                                    color: Colors.black),
                              ),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: SvgPicture.asset(
                                "assets/images/Search.svg",
                                color: Colors.white,
                                fit: BoxFit.fill,
                              ),
                            ),
                            hintText: 'ابدأ البحث',
                            hintStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffffffff),
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12.0),
                          ),
                        ),
                      ),
                      const SizedBox(width: 40)
                    ],
                  ),
                  const SizedBox(height: 20),
                  FutureBuilder<List<Article>>(
                    future: articlelist,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: CircularProgressIndicator(
                              color: GlobalColors.mainColor,
                            )),
                          ],
                        ));
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Column(
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Text('Error: No Internet Connection'),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: GlobalColors.mainColor),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          articlelist = fetchArticlesData();
                                        });
                                      },
                                      child: Text("Try again ")),
                                ))
                          ],
                        ));
                        ;
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                            child: Text('No articles available'));
                      } else {
                        final filteredArticles = snapshot.data!
                            .where(
                                (article) => article.section == "خــارجــيــات")
                            .toList();

                        return Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text("أخبار الخارج",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: GlobalColors.mainColor)),
                              ),
                              SizedBox(height: 10),
                              if (filteredArticles.isNotEmpty)
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.22,
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  child: CarouselSlider.builder(
                                    itemCount: filteredArticles.length,
                                    itemBuilder: (context, index, realIndex) {
                                      final article = filteredArticles[index];
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ArticleDetailPage(
                                                  article: article,
                                                ),
                                              ));
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Stack(
                                              children: [
                                                Image.network(
                                                  article.mainImage ??
                                                      'https://via.placeholder.com/150',
                                                  fit: BoxFit.cover,
                                                  width: 1000.0,
                                                ),
                                                Positioned(
                                                  bottom: 0.0,
                                                  left: 0.0,
                                                  right: 0.0,
                                                  child: Container(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 10.0,
                                                        horizontal: 20.0),
                                                    child: Text(
                                                      article.name ?? "",
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    options: CarouselOptions(
                                      autoPlay: true,
                                      aspectRatio: 2.0,
                                      enlargeCenterPage: true,
                                    ),
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: const Text("جميع الأخبار",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: GlobalColors.mainColor)),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.41,
                                width: MediaQuery.of(context).size.width * 0.95,
                                child: NotificationListener<ScrollNotification>(
                                  onNotification:
                                      (ScrollNotification scrollInfo) {
                                    if (scrollInfo.metrics.pixels ==
                                            scrollInfo
                                                .metrics.maxScrollExtent &&
                                        !isLoadingMore) {
                                      _loadMoreArticles();
                                    }
                                    return false;
                                  },
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(height: 5);
                                    },
                                    itemCount: allArticles.length +
                                        (isLoadingMore ? 1 : 0),
                                    itemBuilder: (context, index) {
                                      if (index == allArticles.length) {
                                        return Center(
                                          child: CircularProgressIndicator(
                                            color: GlobalColors.mainColor,
                                          ),
                                        );
                                      }
                                      final article = allArticles[index];
                                      return ArticleCard(article, context);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
