import 'package:experiments_with_web/app_level/assets/assets.dart';
import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/extensions/hover_extension.dart';
import 'package:experiments_with_web/app_level/extensions/textstyle_extension.dart';
import 'package:experiments_with_web/app_level/services/linker_service.dart';
import 'package:experiments_with_web/app_level/utilities/screen_size.dart';
import 'package:experiments_with_web/locator.dart';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flare_flutter/flare_actor.dart';

class BgWidget extends StatelessWidget {
  const BgWidget({Key key, @required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    //

    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        FlareActor(
          WebAssets.flareBkgrd.assetName,
          // alignment: Alignment.centerLeft,
          fit: BoxFit.cover,
          animation: 'Untitled',
        ),
        const Positioned(
          bottom: 0.0,
          child: _CustomText(data: 'Flattered with Flutter'),
        ),
        ...children,
      ],
    );
  }
}

class _CustomText extends StatelessWidget {
  const _CustomText({Key key, this.data}) : super(key: key);

  final String data;

  static final _linkService = locator<LinkerService>();
  static final _screenQueries = ScreenQueries.instance;

  @override
  Widget build(BuildContext context) {
    //

    final _height = _screenQueries.customHeightPercent(
      context,
      80.0 / ApplevelConstants.stdHeight,
    );

    return Container(
      alignment: AlignmentDirectional.center,
      height: _height,
      width: _screenQueries.width(context),
      color: Colors.black54,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: () => _linkService.openLink(BrandLinks.website),
            child: Text(
              data,
              style: TextStyle(color: Colors.white).size(18.0),
            ),
          ),
          IconButton(
            color: Colors.white,
            icon: FaIcon(FontAwesomeIcons.youtube),
            onPressed: () => _linkService.openLink(BrandLinks.youtube),
          ).showCursorOnHover,
          IconButton(
            color: Colors.white,
            icon: FaIcon(FontAwesomeIcons.medium),
            onPressed: () => _linkService.openLink(BrandLinks.medium),
          ).showCursorOnHover,
          IconButton(
            color: Colors.white,
            icon: FaIcon(FontAwesomeIcons.dev),
            onPressed: () => _linkService.openLink(BrandLinks.devTo),
          ).showCursorOnHover,
        ],
      ),
    );
  }
}
