import 'package:newsapp/models/categoryModel.dart';

class Constants {

  static const apiKey = "bd197bcc3e594ab488add3b11016d3fd";
  static const apiTopHeadlines = "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey";

  static String headlinesFor(String country) {
    return "https://newsapi.org/v2/top-headlines?country=$country&apiKey=$apiKey";
  }

  static String headlinesForCategory(String category) {
    return "https://newsapi.org/v2/top-headlines?category=$category&apiKey=$apiKey";
  }

  static const Map<String,String> Countries = {
    'USA': 'us',
    'China': 'cn',
    'Russia': 'ru',
    'UK': 'gb',
  };

  List<CategoryModel> getCategories () {

    // new list
    List<CategoryModel> categories = <CategoryModel>[];
    CategoryModel category = CategoryModel(imageUrl: '', categoryName: '');


    category.categoryName = "Entertainment";
    category.imageUrl = 'https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80';
    categories.add(category);


    category = new CategoryModel(categoryName: '', imageUrl: '');
    category.categoryName = "Business";
    category.imageUrl = "https://images.unsplash.com/39/lIZrwvbeRuuzqOoWJUEn_Photoaday_CSD%20(1%20of%201)-5.jpg?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
    categories.add(category);


    category = new CategoryModel(categoryName: '', imageUrl: '');
    category.categoryName = "Sports";
    category.imageUrl =  "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
    categories.add(category);


    category = new CategoryModel(categoryName: '', imageUrl: '');
    category.categoryName = "General";
    category.imageUrl = 'https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60';
    categories.add(category);


    category = new CategoryModel(categoryName: '', imageUrl: '');
    category.categoryName = "Health";
    category.imageUrl = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
    categories.add(category);


    category = new CategoryModel(categoryName: '', imageUrl: '');
    category.categoryName = "Science";
    category.imageUrl =  "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
    categories.add(category);


    category = new CategoryModel(categoryName: '', imageUrl: '');
    category.categoryName = "Technology";
    category.imageUrl = 'https://images.unsplash.com/photo-1518770660439-4636190af475?ixid=MXwxMjA3fDB8MHxzZWFyY2h8N3x8dGVjaG5vbG9neXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60';
    categories.add(category);

    return categories;

  }
}
