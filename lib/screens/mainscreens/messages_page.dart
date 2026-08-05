import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_version/utilities/app_colors.dart';
import 'package:flutter_version/utilities/theme_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// This page used to host per-course chat directly. That has moved to a
/// "الشات" tab inside CourseDetailsPage. This page is now reserved for
/// chatting directly with a teacher, which is coming soon.
///
/// [courseId] is kept as an optional param purely for backward-compatibility
/// with any existing navigation calls (e.g. `MessagesPage(courseId: ...)`)
/// elsewhere in the app; it is no longer used. Once you've updated those
/// call sites to just call `MessagesPage()`, feel free to remove it.
class MessagesPage extends StatelessWidget {
  final String? courseId;

  const MessagesPage({Key? key, this.courseId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDark = themeProvider.isDarkMode;

    return Scaffold(
      backgroundColor: AppColors.getBackgroundColor(isDark),
      appBar: AppBar(
        title: Text(
          'المحادثات',
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.bold,
            color: AppColors.getTextColor(isDark),
          ),
        ),
        backgroundColor: AppColors.getBackgroundColor(isDark),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 96,
                width: 96,
                decoration: BoxDecoration(
                  color: AppColors.sky(isDark).withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  PhosphorIconsFill.chatCircleDots,
                  size: 44,
                  color: AppColors.sky(isDark),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'محادثة المدرس قريباً',
                style: GoogleFonts.cairo(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.getTextColor(isDark),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'نعمل على إتاحة إمكانية التواصل المباشر مع المدرس قريباً.\n'
                'يمكنك الآن الدردشة حول كل كورس من تبويب "الشات" داخل صفحة الكورس.',
                textAlign: TextAlign.center,
                style: GoogleFonts.cairo(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.getTextSecondaryColor(isDark),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
