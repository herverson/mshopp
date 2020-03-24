import 'package:flutter/material.dart';
import 'package:mshopp/blocs/home_bloc.dart';
import 'package:mshopp/ui/widgets/category_list.dart';
import 'package:mshopp/ui/widgets/list_product.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeBloc>.value(
          value: HomeBloc() 
        )
      ],
      child: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = Provider.of<HomeBloc>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20,),
            Text(
              "Categorias",
              style: Theme.of(context).textTheme.headline
            ),
            SizedBox(),
            CategoryList(
              categories: homeBloc.categories,
            ),
            Text(
              "Mais vendidos!",
              style: Theme.of(context).textTheme.headline
            ),
            SizedBox(),
            ProductList(
              products: homeBloc.products,
            )
          ],
        ),
      )
    );
  }
}