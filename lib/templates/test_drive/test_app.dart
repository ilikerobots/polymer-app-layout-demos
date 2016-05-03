@HtmlImport('x_app.html')
library polymer_app_layout_demos.lib.templates.test_drive.test_app;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' ;

import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/iron_pages.dart';
import 'package:polymer_elements/iron_selector.dart';
import 'package:polymer_elements/iron_iconset_svg.dart';
import 'package:polymer_elements/paper_fab.dart';
import 'package:polymer_elements/paper_checkbox.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/shadow.dart';

import 'package:polymer_app_layout/app_drawer_layout.dart';
import 'package:polymer_app_layout/app_drawer.dart';
import 'package:polymer_app_layout/app_scroll_effects.dart';
import 'package:polymer_app_layout/app_header.dart';
import 'package:polymer_app_layout/app_header_layout.dart';
import 'package:polymer_app_layout/app_toolbar.dart';
import 'package:polymer_app_layout/app_scrollpos_control.dart';
import 'package:polymer_app_layout/app_scroll_effects.dart';
import 'package:polymer_app_layout/app_scroll_effects/effects/resize_snapped_title.dart';

import 'package:polymer_app_layout_demos/demo/sample_content.dart';


@PolymerRegister('test-app')
class TestApp extends PolymerElement with PolymerMixin, PolymerBase, JsProxy {

  @property bool condenses = true;
  @property bool parallaxBackground = true;
  @Property(observer: 'updateFixed') bool fixed = true;
  @Property(observer: 'updateReveals') bool reveals = false;
  @Property(observer: 'updateShadow') bool shadow = false;
  @Property(observer: 'updateBlendBackground') bool blendBackground = true;
  @Property(observer: 'updateFadeBackground') bool fadeBackground = false;
  @Property(observer: 'updateResizeSnappedTitle') bool resizeSnappedTitle = true;
  @Property(observer: 'updateResizeTitle') bool resizeTitle = true;
  @Property(observer: 'updateWaterfall') bool waterfall = true;

  TestApp.created() : super.created() {
    polymerCreated();
  }

  @reflectable
  dynamic updateFixed(bool n, bool o) {
      fixed = n;
      if (fixed) set("reveals", false);
    }

  @reflectable
  dynamic updateReveals(bool n, bool o) {
      reveals = n;
      if (reveals) set("fixed", false);
    }

  @reflectable
  dynamic updateBlendBackground(bool n, bool o) {
      blendBackground = n;
      if (blendBackground) set("fadeBackground", false);
    }

  @reflectable
  dynamic updateFadeBackground(bool n, bool o) {
      fadeBackground = n;
      if (fadeBackground) set("blendBackground", false);
    }

  @reflectable
  dynamic updateResizeSnappedTitle(bool n, bool o) {
      resizeSnappedTitle = n;
      if (resizeSnappedTitle) set("resizeTitle", false);
    }

  @reflectable
  dynamic updateResizeTitle(bool n, bool o) {
       resizeTitle = n;
      if (resizeTitle) set("resizeSnappedTitle", false);
    }

  @reflectable
  dynamic updateShadow(bool n, bool o) {
       shadow = n;
      if (shadow) set("waterfall", false);
    }

  @reflectable
  dynamic updateWaterfall(bool n, bool o) {
       waterfall = n;
      if (waterfall) set("shadow", false);
    }

  @Observe('condenses, parallaxBackground')
  void updateEffects(bool nCondenses, bool nParallaxBackground) {
    condenses = nCondenses;
    parallaxBackground = nParallaxBackground;
  }

  @reflectable
  String getEffects(b, f, p, rS, rT, w) {
      return [
        this.blendBackground ? 'blend-background ' : '',
        this.fadeBackground ? 'fade-background ' : '',
        this.parallaxBackground ? 'parallax-background ' : '',
        this.resizeSnappedTitle ? 'resize-snapped-title ' : '',
        this.resizeTitle ? 'resize-title ' : '',
        this.waterfall ? 'waterfall ' : ''
      ].join('');
    }
}


