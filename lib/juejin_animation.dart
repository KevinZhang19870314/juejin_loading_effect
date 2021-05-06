import 'package:flutter/material.dart';

import 'utils.dart';

class JueJinAnimation extends StatelessWidget {
  JueJinAnimation({Key key, this.animationController, this.controller})
      : offsetForColorChanges = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.700, curve: Curves.easeIn),
          ),
        ),
        scale = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.700, 1.00, curve: Curves.easeIn),
          ),
        ),
        super(key: key);

  final AnimationController animationController;
  final Animation<double> controller;
  final Animation<double> offsetForColorChanges;
  final Animation<double> scale;

  @override
  Widget build(BuildContext context) {
    _playAnimation();

    return AnimatedBuilder(
      animation: controller,
      builder: _buildAnimation,
    );
  }

  void _playAnimation() {
    animationController.reset();
    animationController.forward();
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    final sw = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Utils.buildJuejinSvg(Colors.grey),
        Positioned(
          left: 0,
          top: 0,
          child: ScaleTransition(
            scale: scale,
            child: Container(
              alignment: Alignment.center,
              width: sw,
              height: 70,
              color: Colors.blue.withAlpha(50),
            ),
          ),
        ),
        Positioned(
          left: sw / 2 - 22.5,
          top: 11.5,
          child: ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              widthFactor: 1.0,
              heightFactor: offsetForColorChanges.value,
              child: Utils.buildJuejinSvg(Colors.blue),
            ),
          ),
        ),
      ],
    );
  }
}
