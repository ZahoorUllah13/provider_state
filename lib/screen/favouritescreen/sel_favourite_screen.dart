import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';
class SelectFavourite extends StatefulWidget {
  const SelectFavourite({Key? key}) : super(key: key);

  @override
  _SelectFavouriteState createState() => _SelectFavouriteState();
}

class _SelectFavouriteState extends State<SelectFavourite> {
  @override
  Widget build(BuildContext context) {
    final favouriteprovider=Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('favourite Screen'),
      ),
      body: Column(
        children: [
          Expanded(

            child: ListView.builder(
                itemCount: favouriteprovider.selectitem.length,
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
