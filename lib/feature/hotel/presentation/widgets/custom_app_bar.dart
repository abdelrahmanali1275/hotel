import 'package:flutter/material.dart';
import 'package:hotel_app/core/app_strings.dart';
import 'package:hotel_app/core/app_style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    int selectedIndex=0;
    List strings=[
      AppStrings.ratingAndRecommended,
      AppStrings.ratingAndRecommended,
      AppStrings.ratingAndRecommended,
      AppStrings.ratingAndRecommended,
      AppStrings.ratingAndRecommended,
      AppStrings.ratingAndRecommended,
      AppStrings.ratingAndRecommended,
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            style: const ButtonStyle(
              iconSize: MaterialStatePropertyAll(20),
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Column(
                  children: [
                    Container(),
                  ],
                ),

              );
            },
            child: const Row(
              children: [
                Icon(Icons.filter_list_outlined),
                Text(AppStrings.filters)
              ],
            )),
        TextButton(
            style: const ButtonStyle(
              iconSize: MaterialStatePropertyAll(20),
            ),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => buildStatefulBuilder(strings, selectedIndex),
                  backgroundColor: Colors.white);
            },
            child: const Row(
              children: [Icon(Icons.sort), Text(AppStrings.sort)],
            )),
      ],
    );
  }

  StatefulBuilder buildStatefulBuilder(List<dynamic> strings, int selectedIndex) {
    return StatefulBuilder(builder: (context, setState) => Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,

                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )),

                  child: Column(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: const BoxDecoration(
                            color: Colors.white,

                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Spacer(),
                              const Text("Sort By",style: AppStyle.style18,),
                              const Spacer(),

                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.close))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: List.generate(
                              strings.length,
                                  (index) => ListTile(
                                onTap: () {
                                  setState((){
                                    selectedIndex=index;
                                  });

                                },
                                title:  Text(strings[index]),
                                trailing:selectedIndex==index? IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.done,color: Colors.blue,)):null,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),);
  }
}
