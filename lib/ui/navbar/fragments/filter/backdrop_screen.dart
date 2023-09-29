import 'package:bbarr/ui/navbar/fragments/filter/backdrop_container.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BackdropScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _BackdropState();
}

class _BackdropState extends State<BackdropScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final _headerHeight = 32.0;

  bool get _isPanelVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  Widget _drawMaterial(BuildContext context, BoxConstraints constraints) {
    final animation = _getPanelAnimation(constraints);
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Stack(
        children: [
          Center(
            child: Text("Here should be the listview"),
          ),
          PositionedTransition(
            rect: animation,
            child: Material(
              borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(50.0),
                  topRight: const Radius.circular(50.0)),
              elevation: 24.0,
              color: Theme.of(context).secondaryHeaderColor,
              child: Column(children: <Widget>[
                Container(
                  height: _headerHeight,
                  child: Center(
                      child: IconButton(
                    onPressed: () {
                      _controller.fling(velocity: _isPanelVisible ? -1.0 : 1.0);
                    },
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: _controller.view,
                    ),
                  )),
                ),
                Expanded(
                  child: Center(child: Text("No filter fields for now :("))
                )
              ]),
            ),
          )
        ],
      ),
    );
  }

  Animation<RelativeRect> _getPanelAnimation(BoxConstraints constraints) {
    final double height = constraints.biggest.height;
    final double top = height - _headerHeight;
    final double bottom = -_headerHeight;
    return RelativeRectTween(
      begin: RelativeRect.fromLTRB(0.0, top, 0.0, bottom),
      end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 100), value: 0.1, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: _drawMaterial);
  }
}
