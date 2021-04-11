import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../..//widgets/mob_car_logo.dart';
import '../../../resources/resources.dart';
import '../../../widgets/custom_app_bar.dart';
import 'mobcar_copyright_message.dart';
import 'menu_button.dart';

const _textPadding = EdgeInsets.symmetric(
  vertical: 8,
  horizontal: 16,
);

class EndDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(R.images.jpg.drawerBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomAppBar(
            leading: MobCarLogo(),
            trailing: MenuButton(
              assetPath: R.images.svg.menuUnfold,
              onClick: () => Get.back(),
            ),
            color: Colors.transparent,
          ),
          ...[
            Padding(
              padding: _textPadding,
              child: Text(
                'Home Page',
                style: R.textThemes.currentRoute,
              ),
            ),
            ...List<String>.generate(5, (index) => 'Other page ${index + 1}')
                .map<Widget>((String pageName) => Padding(
                      padding: _textPadding,
                      child: Text(pageName,
                          style: R.textThemes.currentRoute),
                    ))
                .toList()
          ],
          Spacer(),
          SizedBox(height: 60, child: MobcarCopyrightMessage()),
        ],
      ),
    );
  }
}
