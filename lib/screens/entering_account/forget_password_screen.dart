import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_version/utilities/app_colors.dart';
import 'package:flutter_version/utilities/theme_provider.dart';
import 'package:flutter_version/widgets/outlineTextField.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController phoneController = TextEditingController();
  bool isPhoneValid = false;

  @override
  void initState() {
    super.initState();
    phoneController.addListener(_validatePhoneNumber);
  }

  void _validatePhoneNumber() {
    final digits = phoneController.text.replaceAll(RegExp(r'\D'), '');
    setState(() {
      isPhoneValid = digits.length == 11;
    });
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return Scaffold(
      backgroundColor: AppColors.getBackgroundColor(isDark),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Text(AppLocalizations.of(context)!.retrievePassword,
                  style: GoogleFonts.cairo(
                      color: isDark ? Colors.white : Colors.grey[800],
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              outlineTextField(
                  hint: AppLocalizations.of(context)!.registeredPhone,
                  controller: phoneController,
                  icon: PhosphorIconsFill.phone,
                  isNumber: true,
                  context: context),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.mobilePhoneNote,
                    style: GoogleFonts.cairo(
                        color: AppColors.getSecondHintColor(isDark),
                        fontSize: 9,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 52,
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: isPhoneValid ? AppColors.buttonGradient : null,
                      color: isPhoneValid ? null : Colors.grey[700],
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: AppColors.white,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: isPhoneValid
                        ? () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.green,
                              content: Text(
                                AppLocalizations.of(context)!
                                    .passwordResetLinkSent,
                                style: GoogleFonts.cairo(color: Colors.white),
                              ),
                            ));
                          }
                        : null,
                    child: Text(
                      AppLocalizations.of(context)!.retrieve,
                      style: GoogleFonts.cairo(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
