import 'package:flutter/material.dart';
import 'package:mercator_test/Models/Response/articles_model/article.dart';
import 'package:mercator_test/Utility/global_color.dart';
import 'package:mercator_test/View/Pages/articleDetailPage.dart';

Widget ArticleCard( Article article,BuildContext context){
return InkWell(
  onTap: () {
      Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ArticleDetailPage(
                                 article: article,
                                  ),
                                ));
  },
  child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color: GlobalColors.CardColor,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(
                                                    width: 100,
                                                    height: 100,
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(12),
                                                      child: Image.network(article.mainImage ?? "", fit: BoxFit.fill)),
                                                  ),
                                                  SizedBox(width: 16),
                                                  Container(
                                                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(height: 10),
                                                        Text(
                                                          article.name ?? "",
                                                          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
                                                        ),
                                                        Text(
                                                          overflow: TextOverflow.ellipsis,
                                                          article.description ?? "",
                                                          style: const TextStyle( color: Color.fromARGB(255, 129, 129, 129), fontSize: 14, fontWeight: FontWeight.w400),
                                                        ),
                                                        SizedBox(height: 10),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          children: [
                                                            Text(
                                                              article.dateCreated ?? "",
                                                              style: TextStyle(color: GlobalColors.mainColor, fontSize: 12, fontWeight: FontWeight.w300),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
);
}

