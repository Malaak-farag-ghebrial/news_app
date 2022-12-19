
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../component/painted_component.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'webview_screen.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
      builder: (context,state){
        var cubit = NewsCubit.get(context).sports;
        return (state is! NewsSportsLoadingState)?
        ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: cubit.length,
            itemBuilder: (context,index)=>Lista(cubit[index],WebViewScreen(cubit[index]['url']),context)): Center(child: const CircularProgressIndicator(),);
      },
    );
  }
}
