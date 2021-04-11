import 'package:flutter/material.dart';
import 'package:newsapp/constant/constants.dart';
import 'package:newsapp/models/categoryModel.dart';
import 'package:newsapp/viewModels/listViewModel.dart';
import 'package:newsapp/widgets/categoryTile.dart';
import 'package:newsapp/widgets/newsGrid.dart';
import 'package:provider/provider.dart';

class NewsHomeScreen extends StatefulWidget {
  @override
  _NewsHomeScreenState createState() => _NewsHomeScreenState();
}

class _NewsHomeScreenState extends State<NewsHomeScreen> {

  List<CategoryModel> categories = <CategoryModel>[];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Provider.of<ListViewModel>(context, listen: false).getTopHeadlines();
    setState(() {
      isLoading = false;
    });
    categories = Constants().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<ListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.3,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Know ',
              style: TextStyle(
                color: Colors.black
              ),
            ),
            Text(
              'Everything !!',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
        actions: [
          PopupMenuButton(
            onSelected: (country) {
              listViewModel.fetchNewsByCountry(country.toString());
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) {
              return Constants.Countries.keys
                  .map((v) => PopupMenuItem(
                        value: v,
                        child: Text(v),
                      ))
                  .toList();
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 70.0,
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        listViewModel.fetchNewsByCategory(categories[index].categoryName);
                        setState(() {

                        });
                      },
                      child: CategoryTile(
                        imageUrl: categories[index].imageUrl,
                        categoryName: categories[index].categoryName,
                      ),
                    );
                  },

                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 30.0,
                  bottom: 15.0,
                  top: 15.0,
                ),
                child: Text(
                  'Headlines',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                  child: NewsGrid(
                      articles: listViewModel.articles,
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
