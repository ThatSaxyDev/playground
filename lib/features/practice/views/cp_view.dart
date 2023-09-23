import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getlinked/shared/app_extensions.dart';
import 'package:getlinked/shared/app_fonts.dart';
import 'package:getlinked/theme/palette.dart';

class CPView extends ConsumerStatefulWidget {
  const CPView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CPViewState();
}

class _CPViewState extends ConsumerState<CPView> {
  ScrollController scrollMerchant = ScrollController();

  void asEdeyHot() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    scrollMerchant.addListener(asEdeyHot);
  }

  @override
  void dispose() {
    scrollMerchant.removeListener(asEdeyHot);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Boredom'.txt24(fontW: F.w6, fontFamily: AppFonts.clash),
        surfaceTintColor: Colors.transparent,
      ),
      body: CustomScrollView(
        controller: scrollMerchant,
        slivers: [
          SliverToBoxAdapter(
            child: 15.sbH,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                  margin: 15.padH,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: Colors.red,
                        width: 4,
                      )),
                  width: 150.h,
                  child: Center(
                    child: (index + 1).toString().padLeft(3, '0').txt(
                          size: 50.sp,
                          fontW: F.w7,
                          fontFamily: AppFonts.uni,
                          color: Palette.neutralWhite,
                        ),
                  ),
                ),
              ),
            ),
          ),
          SliverAppBar(
            elevation: 0,
            centerTitle: false,
            title: 'Productive Boredom'
                .txt18(fontW: F.w5, fontFamily: AppFonts.uni),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            pinned: true,
            surfaceTintColor: Colors.transparent,
          ),
          SliverToBoxAdapter(
            child: 50.sbH,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 15,
              (context, index) {
                double itemPositionOffset = index * (150.h / 2);

                double difference = scrollMerchant.offset - itemPositionOffset;

                double percent = 1 - (difference / (150.h / 2));
                double opacity = switch (percent) {
                  > 1 => 1,
                  < 0 => 0,
                  _ => percent,
                };
                double scale = percent > 1 ? 1 : percent;

                return Align(
                  heightFactor: 0.6,
                  child: Opacity(
                    opacity: opacity,
                    child: Transform(
                      transform: Matrix4.identity()..scale(scale, 1),
                      alignment: Alignment.center,
                      child: Container(
                        margin: 15.padH,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.r),
                              topRight: Radius.circular(20.r),
                            ),
                            border: Border.all(
                              color: Colors.red,
                              width: 4,
                            )),
                        height: 150.h,
                        child: Center(
                          child: (index + 1).toString().padLeft(3, '0').txt(
                                size: 50.sp,
                                fontW: F.w7,
                                fontFamily: AppFonts.uni,
                                color: Palette.neutralWhite,
                              ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

