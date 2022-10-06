import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/provider/favourite_provider.dart';
import 'package:provider_state/screen/favouritescreen/sel_favourite_screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}
class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('favourite Screen'),
        actions: [
          SizedBox(width: 20,),
          InkWell(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>const SelectFavourite()
              ));
            },
              child: Icon(Icons.favorite))
        ],
      ),
      body: Column(
        children: [
          Expanded(

            child: ListView.builder(
              itemCount: 1000,
                itemBuilder: (context,index){
               return Consumer<FavouriteProvider>(builder: (context, value, child){
                  return ListTile(
                    onTap: (){
                      if(value.selectitem.contains(index)){
                        value.removeItem(index);
                      }else{
                        value.addItem(index);
                      }
                    },
                    title: Text('item'+index.toString()),
                    trailing: Icon(
                       value.selectitem.contains(index)?
                        Icons.favorite:Icons.favorite_border_outlined),
                  );
                });
            }),
          )
        ],
      ),
    );
  }
}
