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
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  'News',
                  style: TextStyle(
                    fontSize: 50.0,
                  ),
                ),
              ),
              Divider(
                color: Color(0xffff8a30),
                height: 40.0,
                thickness: 8.0,
                indent: 30.0,
                endIndent: 20.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0,top: 15.0,bottom: 15.0,),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
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
                  top: 20.0,
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
