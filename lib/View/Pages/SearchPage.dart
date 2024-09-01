import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mercator_test/Models/Response/articles_model/article.dart';
import 'package:mercator_test/Utility/global_color.dart';
import 'package:mercator_test/View/Widgets/articleCard.dart';

class SearchPage extends StatefulWidget {
  final String query;
  final List<Article> articles;

  const SearchPage({required this.query, required this.articles, Key? key})
      : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedSection = "All";
  DateTimeRange? _selectedDateRange;
  late List<Article> _filteredArticles;

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.query;
    _filteredArticles = widget.articles;
    _filterArticles();
  }

  void _filterArticles() {
    setState(() {
      _filteredArticles = widget.articles.where((article) {
        final matchesQuery = article.name!.toLowerCase().contains(_searchController.text.toLowerCase());
        return matchesQuery;
      }).toList();
    });
  }

  void _selectDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      initialDateRange: _selectedDateRange ?? DateTimeRange(
        start: DateTime.now().subtract(Duration(days: 7)),
        end: DateTime.now(),
      ),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDateRange) {
      setState(() {
        _selectedDateRange = picked;
        _filterArticles(); // Note: Date range filter is removed here
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColors.mainColor,
        title: TextField(
          controller: _searchController,
          onChanged: (value) {
            _filterArticles();
          },
          decoration: InputDecoration(
            hintText:'ابدأ البحث',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                _searchController.clear();
                _filterArticles();
              },
            ),
          ),
        ),
       
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: GlobalColors.CardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: GlobalColors.mainColor)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: DropdownButton<String>(
                  isExpanded: true,
                  underline: Container(),
                  dropdownColor: GlobalColors.CardColor,
                  value: _selectedSection,
                  items: <String>['All', 'مــحــلــيــات', 'خــارجــيــات'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedSection = newValue!;
                    
                      _filterArticles();
                    });
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10,);
                },
                itemCount: _filteredArticles.length,
                itemBuilder: (context, index) {
                  return ArticleCard(_filteredArticles[index], context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
