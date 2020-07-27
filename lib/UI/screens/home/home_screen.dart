import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezal_version_two/UI/widgets/app_bar.dart';
import 'package:tezal_version_two/UI/widgets/custom_scroll_view.dart';
import 'package:tezal_version_two/UI/widgets/error_screen.dart';
import 'package:tezal_version_two/UI/widgets/screen_loading.dart';
import 'package:tezal_version_two/blocs/auth_bloc/auth_bloc.dart';
import 'package:tezal_version_two/blocs/home_bloc/home_bloc.dart';
import 'package:tezal_version_two/data/models/container.dart' as container;

class HomeScreen extends StatefulWidget {
  static String route = "home_screen";
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  String selectCategory = "мыломоющие";
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLoaded) _listenLoaded();
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) _listenInitial(context);
          if (state is HomeLoaded) return _buildLoaded(state);
          if (state is HomeError) return ErrorScreen(state.message.toString());
          return ScreenLoading();
        },
      ),
    );
  }

  void _listenInitial(BuildContext context) {
    context.bloc<HomeBloc>().add(FetchHomeScreen());
  }

  Widget _buildLoaded(HomeLoaded state) {
    var tabs =
        state.homeScreenModel.categories.map((c) => Tab(text: c.name)).toList();
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
            //leading: ,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  print("Press search");
                },
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  print("Press more_vert");
                },
              ),
            ],
            title: AppBarTitle(),
            bottom: PreferredSize(
              child: TabBar(
                tabs: tabs,
                isScrollable: true,
              ),
              preferredSize: Size.fromHeight(30),
            )),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: Icon(
                  Icons.face,
                  size: 48.0,
                  color: Colors.white,
                ),
                accountName:
                    Text('TEMP', style: TextStyle(color: Colors.white)),
                accountEmail: Text('Temp.test@domainname.com',
                    style: TextStyle(color: Colors.white)),
                otherAccountsPictures: <Widget>[
                  Icon(
                    Icons.bookmark_border,
                    color: Colors.white,
                  )
                ],
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/intro_3.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              _menuListTileWidget(),
            ],
          ),
        ),
        body: TabBarView(
          children: List.generate(tabs.length,
              (i) => _buildTab(state.homeScreenModel.categories[i].id, state)),
        ),
      ),
    );
  }

  Widget _menuListTileWidget() {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.cake),
          title: Text('Birthdays', style: TextStyle(color: Colors.black)),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.sentiment_satisfied),
          title: Text('Gratitude', style: TextStyle(color: Colors.black)),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.alarm),
          title: Text('Reminders', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }

  Widget _buildTab(int categoryId, HomeLoaded state) {
    List<container.Container> containers =
        state.homeScreenModel.getContainerByCategoryId(categoryId);

    return ListView(
        padding: EdgeInsets.zero,
        children: List.generate(
          containers.length,
          (index) {
            return Card(
              elevation: 3,
              child: ListTile(
                leading: Icon(Icons.directions_car),
                title: Text(
                  'Контейнер № ${containers[index].name}${containers[index].number}',
                  style: TextStyle(fontSize: 18),
                ),
                //subtitle: Text('Very Cool'),
                trailing: IconButton(
                  icon: Icon(Icons.bookmark),
                  onPressed: () {
                    print("Press save");
                  },
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CustomScollViewScreen(),
                    ),
                  );
                },
                onLongPress: () => print('Long press on row $index'),
              ),
            );
          },
        ));
  }

  void _listenLoaded() {
    context.bloc<AuthBloc>().add(CheckUser());
  }
}
