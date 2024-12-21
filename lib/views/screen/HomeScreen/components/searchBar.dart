import 'package:flutter/material.dart';
class Searchbar extends StatelessWidget {
  Searchbar({super.key, required this.controller});
  late SearchController controller = SearchController();
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      searchController: controller,
      isFullScreen: true,
      builder: (BuildContext context, controller){
        return Container(
          height: 35,
          child: SearchBar(
            elevation: WidgetStateProperty.all(0),
            backgroundColor: WidgetStateProperty.all(Color(0xFFD9D9D9)),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
            hintText:"Search",
            controller: controller,
            padding: const WidgetStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 20)
            ),
            onTap: (){
              controller.openView(

              );
            },
            onSubmitted: (String value){
              controller.closeView(value);
            },
            onChanged: (_){
              controller.openView();
            },
            leading: const Icon(Icons.search),
          ),
        );
      },

      viewLeading:IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back))
      ,
      viewTrailing: [
        IconButton(onPressed: (){
          controller.text="";
        }, icon: Icon(Icons.cancel_outlined))
      ],
      suggestionsBuilder: (BuildContext context, SearchController controller){
        return List<ListTile>.generate(5,(int index){
          final String item = 'Do giap $index';
          return ListTile(
            title: Text(item),
            onTap: (){

            },
          );

        });
      },
    );
  }
}
