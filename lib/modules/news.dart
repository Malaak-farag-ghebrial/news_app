import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/webview_screen.dart';

import '../component/painted_component.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return (state is! NewsBusinessLoadingState)
            ? Column(
          mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.country.length,
                      itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        cubit.selectCountry(index);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        decoration: BoxDecoration(
                          color: cubit.selectedCountry == index? Theme.of(context).primaryColorLight : Theme.of(context).primaryColorLight.withOpacity(0.2),
                       borderRadius: BorderRadius.circular(5)
                        ),
                        child: Text(cubit.country[index],
                        style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    );
                  }),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,

                  physics: const BouncingScrollPhysics(),
                  itemCount: cubit.news.length,
                  itemBuilder: (context, index) => Lista(cubit.news[index],WebViewScreen(cubit.news[index]['url']), context)),
                ),
              ],
            )
            : const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
