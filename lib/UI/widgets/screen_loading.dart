import 'package:flutter/material.dart';
import 'package:tezal_version_two/UI/widgets/custom_progress_indicator2.dart';

import 'app_bar.dart';

class ScreenLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("circular");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: MediaQuery.of(context).size.width),
          AppBarTitle(),
          SizedBox(height: 18.0),
          CustomProgressIndicator2(
            dotRadius: 10,
            radius: 45,
          ),
        ],
      ),
    );
  }
}
