import 'package:flutter/material.dart';

class TwoAninmatedBuilders extends StatefulWidget {
  final List<Listenable> animations;
  final Widget Function() builder;
  const TwoAninmatedBuilders({
    Key key,
    @required this.animations,
    this.builder,
  }) : super(key: key);
  @override
  _TwoAninmatedBuildersState createState() => _TwoAninmatedBuildersState();
}

class _TwoAninmatedBuildersState extends State<TwoAninmatedBuilders> {
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
