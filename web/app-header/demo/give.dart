import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/paper_icon_button.dart';

import 'package:polymer_app_layout/app_toolbar.dart';
import 'package:polymer_app_layout/app_scroll_effects.dart';
import 'package:polymer_app_layout/app_scroll_effects/effects/resize_snapped_title.dart'; //will be included in app_scroll_effects >= 0.0.16 of app-layout
import 'package:polymer_app_layout/app_header.dart';

import 'package:polymer_app_layout_demos/demo/sample_content.dart';

main() async {
  await initPolymer();
}
