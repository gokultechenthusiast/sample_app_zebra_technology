import 'package:sample_app_zebra_technology/domain/Entities/entity.dart';

abstract class GetCategorizedFlowerList {
  List call({required List<Flowers> flowerList});
}

class GetCategorizedFlowerListImpl implements GetCategorizedFlowerList {
  @override
  List call({required List<Flowers> flowerList}) {
    /// this function is to catagories the list for the custom UI
    List categorizedList = [];
    Map<String, dynamic> categoryMap = {};

    /// creating a category hash
    for (var flower in flowerList) {
      for (var tag in flower.tag) {
        if (categoryMap.containsKey(tag)) {
          List<Flowers> tempList = categoryMap[tag];
          tempList.add(flower);
        } else {
          List<Flowers> tagList = [];
          tagList.add(flower);
          categoryMap[tag] = tagList;
        }
      }
    }
    // from category hash create a category list
    categoryMap.forEach((key, value) {
      List<Flowers> tagList = value;
      Map<String, dynamic> subCategoryItem = {
        "tag": key,
        "flowerList": tagList,
      };
      categorizedList.add(subCategoryItem);
    });

    /// returns a lot which contain tag and list of flowers respective to tags
    return categorizedList;
  }
}
