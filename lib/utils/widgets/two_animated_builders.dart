import 'package:flutter/material.dart';

class TwoAnimatedBuilders extends StatefulWidget {
  final List<Listenable> animations;
  final Widget Function() builder;
  const TwoAnimatedBuilders({
    Key key,
    @required this.animations,
    this.builder,
  }) : super(key: key);
  @override
  _TwoAnimatedBuildersState createState() => _TwoAnimatedBuildersState();
}

class _TwoAnimatedBuildersState extends State<TwoAnimatedBuilders> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animations.first,
      builder: (context, _) {
        return AnimatedBuilder(
          animation: widget.animations.last,
          builder: (context, _) {
            return widget.builder();
          },
        );
      },
    );
  }
}
