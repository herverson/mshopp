import 'package:mshopp/ui/widgets/progress_indicator.dart';
import 'package:flutter/widgets.dart';

class Loader extends StatelessWidget {
  final object;
  final Function callback;

  Loader({@required this.object, @required this.callback});

  @override
  Widget build(BuildContext context) {
    if (object == null)
      return Center(
        child: MyProgressIndicator(),
      );

    if (object.length == 0)
      return Center(
        child: Text("Nenhum item encontrado"),
      );

    return callback();
  }
}
