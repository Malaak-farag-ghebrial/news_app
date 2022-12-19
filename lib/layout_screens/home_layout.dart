import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder:(context,state){
        var cubit = NewsCubit.get(context);
      return  Scaffold(
          appBar: AppBar(
            title: const Text('News app'),
            actions: [
              IconButton(
                  onPressed: (){
                 cubit.searchNav(i: 3);
                  },
                  icon: const Icon(Icons.search),
              ),
              IconButton(
                  onPressed: (){
                  cubit.changeThemeMode();
                  },
                  icon: const Icon(Icons.brightness_6),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
           bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex!=3? cubit.currentIndex :0,
              items: cubit.bottomItems ,
            onTap: (val){
                cubit.changeBtmNavIndex(index: val);
            },
          ),
        );
      }
    );
  }
}
