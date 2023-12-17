import 'package:flutter/material.dart';

Widget Lista(article,screen,context) => InkWell(
  onTap: (){
    Navigation(context, screen);
  },
  child:   Padding(

        padding: const EdgeInsets.all(15.0),

        child: Row(

          children: [

            Container(

              width: 120,

              height: 120,

              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(10),),
              child:article['urlToImage'] !=  null? Image.network('${article['urlToImage'] ?? ''}',fit: BoxFit.cover):Image.asset('assets/news.jpg',fit: BoxFit.cover) ,

            ),

            const SizedBox(

              width: 20,

            ),

            Expanded(

              child: SizedBox(

                height: 120,

                child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Expanded(

                      child: Text(

                       '${ article['title']}',

                        maxLines: 3,

                        overflow: TextOverflow.ellipsis,

                        textAlign: TextAlign.right,

                       // textDirection: TextDirection.rtl,

                        style: Theme.of(context).textTheme.bodyLarge,

                      ),

                    ),

                    Text(

                      '${article['publishedAt']}',

                      style: const TextStyle(color: Colors.grey),

                    )

                  ],

                ),

              ),

            )

          ],

        ),

      ),
);


Widget Input({
  required TextEditingController  controller,
  required String text,
  required IconData icon,
  Function? onChange,
  Function? validate
})=> TextFormField(
controller: controller ,
  onChanged: onChange!(),
  validator: validate!(),
  decoration: InputDecoration(
    label: Text(text),
    prefixIcon: Icon(icon),
  ),
);


 Navigation(context,screen)=> Navigator.push(context, MaterialPageRoute(builder: (context)=>screen));