library navigation_dot_bar;

import 'package:flutter/material.dart';

class SideNavigationBar extends StatefulWidget {

  final List<SideNavigationBarItem> items;
  final Color color;

  SideNavigationBar({
    @required this.items,
    this.color,
    Key key
  }) : super(key: key);

  _SideNavigationBarState createState() => _SideNavigationBarState();
}

class _SideNavigationBarState extends State<SideNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //  child: child,
    );
  }

  List<_NavigationIconButton> _createNavigationIconButtonList(Map<int, SideNavigationBarItem> mapItem){
    List<_NavigationIconButton> children = List<_NavigationIconButton>();
    mapItem.forEach((index, item) =>
        children.add(_NavigationIconButton(
          item.icon, 
          widget.color,
          item.onTap
        ))
    );
    return children;
  }

}

typedef NavigationIconButtonTapCallback = void Function();

class SideNavigationBarItem {
  final IconData icon;
  final Color iconColor;
  final IconData transformIcon;
  final bool transform;
  final NavigationIconButtonTapCallback onTap;

  const SideNavigationBarItem({
    @required this.icon,
    this.iconColor,
    this.transformIcon,
    this.transform,
    this.onTap
  });
}

class _NavigationIconButton extends StatefulWidget {

  final IconData _icon;
  final Color _colorIcon;
  final NavigationIconButtonTapCallback _onTapInternalButton;

  const _NavigationIconButton(
    this._icon, 
    this._colorIcon, 
    this._onTapInternalButton, 
    {Key key})
    : super(key: key);

  @override
  _NavigationIconButtonState createState() => _NavigationIconButtonState();

}

class _NavigationIconButtonState extends State<_NavigationIconButton> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _scaleAnimation;
  double _opacityIcon = 1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _scaleAnimation = Tween<double>(begin: 1, end: 0.93).animate(_controller);
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTapDown: (_) {
        _controller.forward();
        setState(() { _opacityIcon = 0.7; });
      },
      onTapUp: (_) {
        _controller.reverse();
        setState(() { _opacityIcon = 1; });
      },
      onTapCancel: () {
        _controller.reverse();
        setState(() { _opacityIcon = 1; });
      },
      onTap: () {
        widget._onTapInternalButton();
      },
      child: ScaleTransition(
          scale: _scaleAnimation,
          child: AnimatedOpacity(
              opacity: _opacityIcon,
              duration: Duration(milliseconds: 200),
              child: Icon(widget._icon, color: widget._colorIcon)
          )
      )
  );
}