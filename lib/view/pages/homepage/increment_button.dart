import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_button.dart';
import 'data/ProviderModel/myCounter.dart';

class incrementButton extends StatelessWidget {
  bool inc;
  incrementButton({this.inc = true, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        textButton: inc ? "➕" : "➖",
        onPressed: () => {
              inc
                  ? context.read<MyCounter>().inc()
                  : context.read<MyCounter>().dec()
            });
  }
}
