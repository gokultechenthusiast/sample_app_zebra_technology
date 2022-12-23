import 'package:flutter/material.dart';
import 'package:sample_app_zebra_technology/domain/Entities/entity.dart';

class CategoryFlowerListView extends StatelessWidget {
  final List categoryFlowerList;
  const CategoryFlowerListView({
    Key? key,
    required this.categoryFlowerList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        child: Column(
          children: List<Widget>.generate(categoryFlowerList.length, (index) {
            return Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    Text(
                      categoryFlowerList[index]["tag"],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_right_alt,
                      color: Colors.black,
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List<Widget>.generate(
                        (categoryFlowerList[index]["flowerList"] as List<Flowers>).length,
                        (index2) {
                      return SizedBox(
                        width: 200,
                        child: Card(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Image.network(
                                (categoryFlowerList[index]["flowerList"]
                                        as List<Flowers>)[index2]
                                    .picture,
                                height: 100,
                                width: 100,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset("assets/flower.jpeg"),

                                /// default image
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  (categoryFlowerList[index]["flowerList"]
                                          as List<Flowers>)[index2]
                                      .description,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
