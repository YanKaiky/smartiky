import 'package:flutter/material.dart';
import 'package:smartiky/components/card.header.dart';
import 'package:smartiky/components/header.information.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 340,
        child: Stack(
          children: [
            HeaderInformation(),
            CardHeader(),
          ],
        ),
      ),
    );
  }
}
