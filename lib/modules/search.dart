
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/painted_component.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'webview_screen.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder:(context,state){
        var cubit=NewsCubit.get(context);
        return  Container(
          height: double.infinity,
          child: Column(
            children:[
            Container(
              height: 50,
              child: TextFormField(
              controller: searchController ,
              style:Theme.of(context).textTheme.bodyText1 ,
              onChanged: (val){
                cubit.getSearch(val);
              },
              decoration: InputDecoration(
                label: Text('search',
                style: Theme.of(context).textTheme.bodyText1,
                ),
               focusColor: Colors.white,

                prefixIcon: Icon(Icons.search,
                color: Theme.of(context).iconTheme.color ,
                ),
              ),
          ),
            ),
//            Input(
//                controller: searchController,
//                text: 'search',
//                icon: Icons.search,
//                onChange: (val){
//                  NewsCubit.get(context).getSearch(val);
//                }
//            ) ,

              Expanded(
                child: Container(
                  child: (state is! NewsSearchLoadingState)
                      ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: cubit.search.length,
                      itemBuilder: (context, index) =>
                          Lista(
                              cubit.search[index],
                              WebViewScreen(cubit.search[index]['url']), context,),)
                      : const Center(
                        child: CircularProgressIndicator(),
                  )
                  ,
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
