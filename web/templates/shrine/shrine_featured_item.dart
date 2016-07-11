@HtmlImport('shrine_featured_item.html')
library shrine.lib.shrine_featured_item;

import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';

/// Uses [PaperInput]
@PolymerRegister('shrine-featured-item')
class ShrineFeaturedItem extends PolymerElement with PolymerMixin, PolymerBase, JsProxy {

  ShrineFeaturedItem.created() : super.created();

  @Property(observer: 'itemChanged') Map item = null;

  @reflectable
  dynamic itemChanged(item, olditem) {
    this.style.visibility = item != null && item['title'] != null ? 'visible' : 'hidden';
    this.$['img'].src = '';
    this.$['img'].src = item != null ? item['imageUrl'] : '';
  }

}
