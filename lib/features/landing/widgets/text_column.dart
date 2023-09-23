import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getlinked/shared/app_extensions.dart';

class TextColumn extends StatelessWidget {
  const TextColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310.w,
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Innovation and Creativity',
                  style: TextStyle(
                    color: const Color(0xFFFF25B8),
                    fontSize: 13.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    height: 1.6,
                  ),
                ),
                TextSpan(
                  text: ':',
                  style: TextStyle(
                    color: const Color(0xFFFF25B8),
                    fontSize: 13.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 1.6,
                  ),
                ),
                TextSpan(
                  text:
                      ' Evaluate the uniqueness and creativity of the solution. Consider whether it addresses a real-world problem in a novel way or introduces innovative features.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 1.6,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          20.sbH,
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Functionality: ',
                  style: TextStyle(
                    color: const Color(0xFFFF25B8),
                    fontSize: 13.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    height: 1.6,
                  ),
                ),
                TextSpan(
                  text:
                      'Assess how well the solution works. Does it perform its intended functions effectively and without major issues? Judges would consider the completeness and robustness of the solution.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 1.6,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          20.sbH,
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Impact and Relevance: ',
                  style: TextStyle(
                    color: const Color(0xFFFF25B8),
                    fontSize: 13.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    height: 1.6,
                  ),
                ),
                TextSpan(
                  text:
                      'Determine the potential impact of the solution in the real world. Does it address a significant problem, and is it relevant to the target audience? Judges would assess the potential social, economic, or environmental benefits.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 1.6,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          20.sbH,
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Technical Complexity: ',
                  style: TextStyle(
                    color: const Color(0xFFFF25B8),
                    fontSize: 13.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    height: 1.6,
                  ),
                ),
                TextSpan(
                  text:
                      'Evaluate the technical sophistication of the solution. Judges would consider the complexity of the code, the use of advanced technologies or algorithms, and the scalability of the solution.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 1.6,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          20.sbH,
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Adherence to Hackathon Rules: ',
                  style: TextStyle(
                    color: const Color(0xFFFF25B8),
                    fontSize: 13.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    height: 1.6,
                  ),
                ),
                TextSpan(
                  text:
                      'Judges will Ensure that the team adhered to the rules and guidelines of the hackathon, including deadlines, use of specific technologies or APIs, and any other competition-specific requirements',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 1.6,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
