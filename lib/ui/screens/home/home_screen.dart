import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/resources.dart';
import '../../widgets/coloured_button.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/mob_car_logo.dart';
import 'widgets/car_editor_modal.dart';
import 'widgets/car_list_view.dart';
import 'widgets/menu_button.dart';
import 'widgets/mobcar_copyright_message.dart';
import 'widgets/end_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: EndDrawer(),
      appBar: CustomAppBar(
        preferredSize: Size.fromHeight(60),
        leading: MobCarLogo(),
        trailing: MenuButton(
          assetPath: R.images.svg.menuFold,
          onClick: () => _scaffoldKey.currentState.openEndDrawer(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.black,
              Color(0xFF262626),
              Color(0xFF262626),
              Colors.black,
            ])),
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            color: Color(0xFFE5E5E5),
            constraints: BoxConstraints(maxWidth: 686),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 35,
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Title 1',
                      style: R.textThemes.title1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Title 2',
                          style: R.textThemes.title2,
                        ),
                        Spacer(),
                        ColouredButton(
                          message: 'Add new',
                          color: Colors.black,
                          onClick: () => Get.dialog(
                            CarEditorModal(),
                            barrierDismissible: false,
                          ),
                        )
                      ]),
                ),
                SizedBox(height: 8),
                Flexible(child: CarListView()),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.black,
        height: 60,
        child: MobcarCopyrightMessage(),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
