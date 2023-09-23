import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:getlinked/features/landing/views/mobile_landing_view.dart';
import 'package:getlinked/responsize/screen_type_layout.dart';
import 'package:getlinked/theme/palette.dart';

class LandingView extends ConsumerWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Palette.bgPurpleColor,
      body: ScreenTypeLayoutWrapper(
        mobile: MobileLandingView(),
        tablet: SizedBox.shrink(),
        desktop: SizedBox.shrink(),
      ),
    );
  }
}
