import 'package:flutter/material.dart';

class CustomScollViewScreen extends StatelessWidget {
  const CustomScollViewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomScrollView - Slivers'),
        elevation: 0.0,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBarWidget(),
          const SliverListWidget(),
          // const SliverGridWidget(),
        ],
      ),
    );
  }
}

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.brown,
      forceElevated: true,
      expandedHeight: 250.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Parallax Effect',
        ),
        background: Image(
          image: AssetImage('assets/intro_3.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SliverListWidget extends StatelessWidget {
  const SliverListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        List.generate(30, (int index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text("${index + 1}"),
              backgroundColor: Colors.lightGreen,
              foregroundColor: Colors.white,
            ),
            title: Text('Row ${index + 1}'),
            subtitle: Text('Subtitle Row ${index + 1}'),
            trailing: Icon(Icons.star_border),
          );
        }),
      ),
    );
  }
}

class SliverGridWidget extends StatelessWidget {
  const SliverGridWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.child_friendly,
                    size: 48.0,
                    color: Colors.amber,
                  ),
                  Divider(),
                  Text('Grid ${index + 1}'),
                ],
              ),
            );
          },
          childCount: 12,
        ),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      ),
    );
  }
}
