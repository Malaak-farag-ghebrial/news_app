import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/webview_screen.dart';

import '../component/painted_component.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context).business;
        return (state is! NewsBusinessLoadingState)
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cubit.length,
                itemBuilder: (context, index) => Lista(cubit[index],WebViewScreen(cubit[index]['url']), context))
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
