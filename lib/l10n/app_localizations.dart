import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @myAccount.
  ///
  /// In ar, this message translates to:
  /// **'حسابي'**
  String get myAccount;

  /// No description provided for @exams.
  ///
  /// In ar, this message translates to:
  /// **'امتحانات'**
  String get exams;

  /// No description provided for @courses.
  ///
  /// In ar, this message translates to:
  /// **'كورساتي'**
  String get courses;

  /// No description provided for @videos.
  ///
  /// In ar, this message translates to:
  /// **'فيديوهات'**
  String get videos;

  /// No description provided for @home.
  ///
  /// In ar, this message translates to:
  /// **'الرئيسية'**
  String get home;

  /// No description provided for @userName.
  ///
  /// In ar, this message translates to:
  /// **'اسم المستخدم'**
  String get userName;

  /// No description provided for @online.
  ///
  /// In ar, this message translates to:
  /// **'اونلاين'**
  String get online;

  /// No description provided for @editGroup.
  ///
  /// In ar, this message translates to:
  /// **'تعديل المجموعة'**
  String get editGroup;

  /// No description provided for @save.
  ///
  /// In ar, this message translates to:
  /// **'حفظ'**
  String get save;

  /// No description provided for @contactTeacherWhatsapp.
  ///
  /// In ar, this message translates to:
  /// **'عبر واتساب'**
  String get contactTeacherWhatsapp;

  /// No description provided for @contactTeacherFacebook.
  ///
  /// In ar, this message translates to:
  /// **'عبر فيسبوك'**
  String get contactTeacherFacebook;

  /// No description provided for @contactSupport.
  ///
  /// In ar, this message translates to:
  /// **'تواصل مع الدعم الفني'**
  String get contactSupport;

  /// No description provided for @logout.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الخروج'**
  String get logout;

  /// No description provided for @companyCodeNote.
  ///
  /// In ar, this message translates to:
  /// **'رقم المحاضر مثال \'110490\''**
  String get companyCodeNote;

  /// No description provided for @companyCodeNote1.
  ///
  /// In ar, this message translates to:
  /// **'ليس الرقم الطويل المخصص لشراء الكورس'**
  String get companyCodeNote1;

  /// No description provided for @teacherWhatsappMessage.
  ///
  /// In ar, this message translates to:
  /// **'مرحباً مستر , أريد استفسار.'**
  String get teacherWhatsappMessage;

  /// No description provided for @supportWhatsappMessage.
  ///
  /// In ar, this message translates to:
  /// **'مرحباً , أريد استفسار.'**
  String get supportWhatsappMessage;

  /// No description provided for @language.
  ///
  /// In ar, this message translates to:
  /// **'اللغة'**
  String get language;

  /// No description provided for @changeLanguage.
  ///
  /// In ar, this message translates to:
  /// **'تغيير اللغة'**
  String get changeLanguage;

  /// No description provided for @groupModifiedSuccess.
  ///
  /// In ar, this message translates to:
  /// **'تم تعديل المجموعة بنجاح ✅'**
  String get groupModifiedSuccess;

  /// No description provided for @reviewErrors.
  ///
  /// In ar, this message translates to:
  /// **'مراجعة الاخطاء'**
  String get reviewErrors;

  /// No description provided for @gradesHistory.
  ///
  /// In ar, this message translates to:
  /// **'سجل الدرجات'**
  String get gradesHistory;

  /// No description provided for @errorModifyingGroup.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ أثناء تعديل المجموعة'**
  String get errorModifyingGroup;

  /// No description provided for @pleaseEnterUsernamePassword.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال اسم المستخدم وكلمة المرور'**
  String get pleaseEnterUsernamePassword;

  /// No description provided for @loginSuccess.
  ///
  /// In ar, this message translates to:
  /// **'تم تسجيل الدخول بنجاح'**
  String get loginSuccess;

  /// No description provided for @invalidLogin.
  ///
  /// In ar, this message translates to:
  /// **'بيانات تسجيل الدخول غير صحيحة'**
  String get invalidLogin;

  /// No description provided for @welcome.
  ///
  /// In ar, this message translates to:
  /// **'مرحباً بك'**
  String get welcome;

  /// No description provided for @loginToPlatform.
  ///
  /// In ar, this message translates to:
  /// **'سجل الدخول للوصول إلي كورساتك'**
  String loginToPlatform(String appName);

  /// No description provided for @username.
  ///
  /// In ar, this message translates to:
  /// **'اسم المستخدم'**
  String get username;

  /// No description provided for @nameNote.
  ///
  /// In ar, this message translates to:
  /// **'الاسم الأول واسم العائلة يكونوا باللغة العربية'**
  String get nameNote;

  /// No description provided for @usernameNote.
  ///
  /// In ar, this message translates to:
  /// **'اسم المستخدم يكون حروف وأرقام بالإنجليزية بدون مسافات'**
  String get usernameNote;

  /// No description provided for @password.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور'**
  String get password;

  /// No description provided for @login.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get login;

  /// No description provided for @mobilePhoneNote.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف يجب أن يكون 11 رقمًا يبدأ بـ 01'**
  String get mobilePhoneNote;

  /// No description provided for @dontHaveAccount.
  ///
  /// In ar, this message translates to:
  /// **'ليس لديك حساب؟ '**
  String get dontHaveAccount;

  /// No description provided for @createAccount.
  ///
  /// In ar, this message translates to:
  /// **'أنشئ حسابك الآن'**
  String get createAccount;

  /// No description provided for @firstName.
  ///
  /// In ar, this message translates to:
  /// **'الاسم الأول'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In ar, this message translates to:
  /// **'اسم العائلة'**
  String get lastName;

  /// No description provided for @companyCode.
  ///
  /// In ar, this message translates to:
  /// **'كود المحاضر'**
  String get companyCode;

  /// No description provided for @confirmPassword.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد كلمة المرور'**
  String get confirmPassword;

  /// No description provided for @next.
  ///
  /// In ar, this message translates to:
  /// **'التالي'**
  String get next;

  /// No description provided for @passwordMinLength.
  ///
  /// In ar, this message translates to:
  /// **'يجب ان يكون الرقم السري مكون من 8 أرقام على الأقل'**
  String get passwordMinLength;

  /// No description provided for @fillAllFields.
  ///
  /// In ar, this message translates to:
  /// **'يرجى ملء جميع الحقول'**
  String get fillAllFields;

  /// No description provided for @companyCodeInvalid.
  ///
  /// In ar, this message translates to:
  /// **'كود المحاضر غير صحيح'**
  String get companyCodeInvalid;

  /// No description provided for @companyCodeError.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ في التحقق من كود المحاضر'**
  String get companyCodeError;

  /// No description provided for @companyCodeMinLength.
  ///
  /// In ar, this message translates to:
  /// **'كود المحاضر يجب أن يكون 3 أحرف على الأقل'**
  String get companyCodeMinLength;

  /// No description provided for @usernameMinLength.
  ///
  /// In ar, this message translates to:
  /// **'اسم المستخدم يجب أن يكون 3 أحرف على الأقل'**
  String get usernameMinLength;

  /// No description provided for @passwordMismatch.
  ///
  /// In ar, this message translates to:
  /// **'كلمات المرور غير متطابقة'**
  String get passwordMismatch;

  /// No description provided for @usernameAlpha.
  ///
  /// In ar, this message translates to:
  /// **'اسم المستخدم يجب أن يحتوي على حرف واحد على الأقل'**
  String get usernameAlpha;

  /// No description provided for @errorOccurred.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ أثناء تنفيذ العملية'**
  String errorOccurred(String error);

  /// No description provided for @studentPhone.
  ///
  /// In ar, this message translates to:
  /// **'رقم هاتف الطالب'**
  String get studentPhone;

  /// No description provided for @parentPhone.
  ///
  /// In ar, this message translates to:
  /// **'رقم هاتف ولي الأمر'**
  String get parentPhone;

  /// No description provided for @selectGroupOptional.
  ///
  /// In ar, this message translates to:
  /// **'اختر المجموعة (اختياري)'**
  String get selectGroupOptional;

  /// No description provided for @selectAcademicYear.
  ///
  /// In ar, this message translates to:
  /// **'اختر السنة الدراسية'**
  String get selectAcademicYear;

  /// No description provided for @noLevelsAvailable.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد مستويات متاحة'**
  String get noLevelsAvailable;

  /// No description provided for @accountCreatedSuccess.
  ///
  /// In ar, this message translates to:
  /// **'تم إنشاء الحساب بنجاح!'**
  String get accountCreatedSuccess;

  /// No description provided for @registerError.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ في التسجيل'**
  String get registerError;

  /// No description provided for @enterValidStudentPhone.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال رقم طالب صحيح مكون من 11 رقمًا'**
  String get enterValidStudentPhone;

  /// No description provided for @enterValidParentPhone.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال رقم ولي أمر صحيح مكون من 11 رقمًا'**
  String get enterValidParentPhone;

  /// No description provided for @selectAcademicYearError.
  ///
  /// In ar, this message translates to:
  /// **'يرجى اختيار السنة الدراسية'**
  String get selectAcademicYearError;

  /// No description provided for @loadingLevels.
  ///
  /// In ar, this message translates to:
  /// **'جاري تحميل المستويات'**
  String get loadingLevels;

  /// No description provided for @selected.
  ///
  /// In ar, this message translates to:
  /// **'تم اختيار'**
  String get selected;

  /// No description provided for @retrievePassword.
  ///
  /// In ar, this message translates to:
  /// **'استرجاع كلمة المرور'**
  String get retrievePassword;

  /// No description provided for @registeredPhone.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف المسجل'**
  String get registeredPhone;

  /// No description provided for @retrieve.
  ///
  /// In ar, this message translates to:
  /// **'استرجاع'**
  String get retrieve;

  /// No description provided for @passwordResetLinkSent.
  ///
  /// In ar, this message translates to:
  /// **'سيتم إرسال رابط استرجاع كلمة المرور'**
  String get passwordResetLinkSent;

  /// No description provided for @loading.
  ///
  /// In ar, this message translates to:
  /// **'جارِ التحميل...'**
  String get loading;

  /// No description provided for @user.
  ///
  /// In ar, this message translates to:
  /// **'مستخدم'**
  String get user;

  /// No description provided for @updateRequired.
  ///
  /// In ar, this message translates to:
  /// **'تحديث مطلوب'**
  String get updateRequired;

  /// No description provided for @updateRequiredMessage.
  ///
  /// In ar, this message translates to:
  /// **'يجب عليك تحديث التطبيق إلى أحدث إصدار لاستخدامه.'**
  String get updateRequiredMessage;

  /// No description provided for @undefined.
  ///
  /// In ar, this message translates to:
  /// **'غير محدد'**
  String get undefined;

  /// No description provided for @myCourses.
  ///
  /// In ar, this message translates to:
  /// **'كورساتي'**
  String get myCourses;

  /// No description provided for @categories.
  ///
  /// In ar, this message translates to:
  /// **'التصنيفات'**
  String get categories;

  /// No description provided for @availableCoursesForPurchase.
  ///
  /// In ar, this message translates to:
  /// **'كورسات متاحة للشراء'**
  String get availableCoursesForPurchase;

  /// No description provided for @currentPoints.
  ///
  /// In ar, this message translates to:
  /// **'نقاطك الحالية'**
  String get currentPoints;

  /// No description provided for @pointsCount.
  ///
  /// In ar, this message translates to:
  /// **'{count} نقطة'**
  String pointsCount(int count);

  /// No description provided for @examsResults.
  ///
  /// In ar, this message translates to:
  /// **'سجل الدرجات'**
  String get examsResults;

  /// No description provided for @teachers.
  ///
  /// In ar, this message translates to:
  /// **'المعلمين'**
  String get teachers;

  /// No description provided for @noCoursesAvailable.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد كورسات حالياً'**
  String get noCoursesAvailable;

  /// No description provided for @priceWithCurrency.
  ///
  /// In ar, this message translates to:
  /// **'{price} ج.م'**
  String priceWithCurrency(Object price);

  /// No description provided for @teacherLabel.
  ///
  /// In ar, this message translates to:
  /// **'المعلم: {name}'**
  String teacherLabel(String name);

  /// No description provided for @noCoursesPurchased.
  ///
  /// In ar, this message translates to:
  /// **'لم تشترِ أي كورسات بعد'**
  String get noCoursesPurchased;

  /// No description provided for @shortClips.
  ///
  /// In ar, this message translates to:
  /// **'مقاطع قصيرة'**
  String get shortClips;

  /// No description provided for @selectedLabel.
  ///
  /// In ar, this message translates to:
  /// **'تم اختيار: {label}'**
  String selectedLabel(String label);

  /// No description provided for @unknownExam.
  ///
  /// In ar, this message translates to:
  /// **'امتحان غير معروف'**
  String get unknownExam;

  /// No description provided for @currentExams.
  ///
  /// In ar, this message translates to:
  /// **'الامتحانات الحالية'**
  String get currentExams;

  /// No description provided for @noCurrentExams.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد امتحانات حالياً'**
  String get noCurrentExams;

  /// No description provided for @upcomingExams.
  ///
  /// In ar, this message translates to:
  /// **'الامتحانات القادمة'**
  String get upcomingExams;

  /// No description provided for @noUpcomingExams.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد امتحانات قادمة'**
  String get noUpcomingExams;

  /// No description provided for @pastExams.
  ///
  /// In ar, this message translates to:
  /// **'الامتحانات السابقة'**
  String get pastExams;

  /// No description provided for @noPastExams.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد امتحانات سابقة'**
  String get noPastExams;

  /// No description provided for @cannotEnterExamYet.
  ///
  /// In ar, this message translates to:
  /// **'لا يمكنك الدخول للامتحان بعد ✅'**
  String get cannotEnterExamYet;

  /// No description provided for @noTitle.
  ///
  /// In ar, this message translates to:
  /// **'بدون عنوان'**
  String get noTitle;

  /// No description provided for @noSubject.
  ///
  /// In ar, this message translates to:
  /// **'بدون مادة'**
  String get noSubject;

  /// No description provided for @unknown.
  ///
  /// In ar, this message translates to:
  /// **'غير معروف'**
  String get unknown;

  /// No description provided for @noPurchasedCourses.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد كورسات حالياً'**
  String get noPurchasedCourses;

  /// No description provided for @purchasedVideos.
  ///
  /// In ar, this message translates to:
  /// **'الفيديوهات المشتراة'**
  String get purchasedVideos;

  /// No description provided for @noPurchasedVideos.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد فيديوهات مشتراة حالياً'**
  String get noPurchasedVideos;

  /// No description provided for @lessons.
  ///
  /// In ar, this message translates to:
  /// **'الدروس'**
  String get lessons;

  /// No description provided for @files.
  ///
  /// In ar, this message translates to:
  /// **'الملفات'**
  String get files;

  /// No description provided for @live.
  ///
  /// In ar, this message translates to:
  /// **'لايف'**
  String get live;

  /// No description provided for @rank.
  ///
  /// In ar, this message translates to:
  /// **'الترتيب'**
  String get rank;

  /// No description provided for @purchaseFailed.
  ///
  /// In ar, this message translates to:
  /// **'فشل في الشراء. تأكد من الكود.'**
  String get purchaseFailed;

  /// No description provided for @failedToFetchRank.
  ///
  /// In ar, this message translates to:
  /// **'فشل في جلب بيانات الترتيب'**
  String get failedToFetchRank;

  /// No description provided for @ongoingExamsLabel.
  ///
  /// In ar, this message translates to:
  /// **'امتحانات جارية:'**
  String get ongoingExamsLabel;

  /// No description provided for @upcomingExamsLabel.
  ///
  /// In ar, this message translates to:
  /// **'امتحانات قادمة:'**
  String get upcomingExamsLabel;

  /// No description provided for @endedExamsLabel.
  ///
  /// In ar, this message translates to:
  /// **'امتحانات منتهية:'**
  String get endedExamsLabel;

  /// No description provided for @start.
  ///
  /// In ar, this message translates to:
  /// **'ابدأ'**
  String get start;

  /// No description provided for @examEnded.
  ///
  /// In ar, this message translates to:
  /// **'الامتحان قد انتهى بالفعل'**
  String get examEnded;

  /// No description provided for @cannotStartExam.
  ///
  /// In ar, this message translates to:
  /// **'لا يمكن بدء الامتحان حالياً'**
  String get cannotStartExam;

  /// No description provided for @courseContent.
  ///
  /// In ar, this message translates to:
  /// **'محتويات الكورس'**
  String get courseContent;

  /// No description provided for @noExamsAvailable.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد امتحانات متاحة حالياً'**
  String get noExamsAvailable;

  /// No description provided for @soon.
  ///
  /// In ar, this message translates to:
  /// **'قريباً'**
  String get soon;

  /// No description provided for @noFilesAvailable.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد ملفات حالياً'**
  String get noFilesAvailable;

  /// No description provided for @pdfFiles.
  ///
  /// In ar, this message translates to:
  /// **'ملفات PDF'**
  String get pdfFiles;

  /// No description provided for @pdfFile.
  ///
  /// In ar, this message translates to:
  /// **'ملف PDF'**
  String get pdfFile;

  /// No description provided for @mustBuyCourseFirst.
  ///
  /// In ar, this message translates to:
  /// **'يجب شراء الكورس أولاً'**
  String get mustBuyCourseFirst;

  /// No description provided for @imageGroups.
  ///
  /// In ar, this message translates to:
  /// **'مجموعات الصور'**
  String get imageGroups;

  /// No description provided for @imageGroup.
  ///
  /// In ar, this message translates to:
  /// **'مجموعة صور'**
  String get imageGroup;

  /// No description provided for @failedToLoadPdf.
  ///
  /// In ar, this message translates to:
  /// **'فشل تحميل ملف PDF'**
  String get failedToLoadPdf;

  /// No description provided for @invalidFile.
  ///
  /// In ar, this message translates to:
  /// **'الملف غير صالح أو فارغ'**
  String get invalidFile;

  /// No description provided for @student.
  ///
  /// In ar, this message translates to:
  /// **'طالب'**
  String get student;

  /// No description provided for @exerciseNotAvailable.
  ///
  /// In ar, this message translates to:
  /// **'التمرين غير متاح حالياً'**
  String get exerciseNotAvailable;

  /// No description provided for @exercises.
  ///
  /// In ar, this message translates to:
  /// **'تمارين'**
  String get exercises;

  /// No description provided for @comments.
  ///
  /// In ar, this message translates to:
  /// **'تعليقات'**
  String get comments;

  /// No description provided for @watchVideo.
  ///
  /// In ar, this message translates to:
  /// **'مشاهدة الفيديو'**
  String get watchVideo;

  /// No description provided for @exercise.
  ///
  /// In ar, this message translates to:
  /// **'تمرين'**
  String get exercise;

  /// No description provided for @typeQuestionHint.
  ///
  /// In ar, this message translates to:
  /// **'اكتب سؤالك هنا...'**
  String get typeQuestionHint;

  /// No description provided for @voiceMessage.
  ///
  /// In ar, this message translates to:
  /// **'رسالة صوتية'**
  String get voiceMessage;

  /// No description provided for @teacherReply.
  ///
  /// In ar, this message translates to:
  /// **'رد المعلم: {reply}'**
  String teacherReply(String reply);

  /// No description provided for @noAdditionalVideos.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد فيديوهات إضافية حالياً'**
  String get noAdditionalVideos;

  /// No description provided for @mainVideo.
  ///
  /// In ar, this message translates to:
  /// **'الفيديو الرئيسي'**
  String get mainVideo;

  /// No description provided for @additionalVideoCount.
  ///
  /// In ar, this message translates to:
  /// **'فيديو إضافي {count}'**
  String additionalVideoCount(int count);

  /// No description provided for @noExamsResultsYet.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد نتائج اختبارات حتى الآن'**
  String get noExamsResultsYet;

  /// No description provided for @generalExam.
  ///
  /// In ar, this message translates to:
  /// **'امتحان عام'**
  String get generalExam;

  /// No description provided for @test.
  ///
  /// In ar, this message translates to:
  /// **'اختبار'**
  String get test;

  /// No description provided for @yourScoreLabel.
  ///
  /// In ar, this message translates to:
  /// **'درجتك: {score}'**
  String yourScoreLabel(Object score);

  /// No description provided for @details.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل'**
  String get details;

  /// No description provided for @failedToDisplayAnswers.
  ///
  /// In ar, this message translates to:
  /// **'تعذر عرض الإجابات'**
  String get failedToDisplayAnswers;

  /// No description provided for @examResultTitle.
  ///
  /// In ar, this message translates to:
  /// **'نتيجة الاختبار'**
  String get examResultTitle;

  /// No description provided for @yourScoreWithTotal.
  ///
  /// In ar, this message translates to:
  /// **'نتيجتك: {score} / {total}'**
  String yourScoreWithTotal(Object score, Object total);

  /// No description provided for @notAnswered.
  ///
  /// In ar, this message translates to:
  /// **'لم تجب'**
  String get notAnswered;

  /// No description provided for @notAvailable.
  ///
  /// In ar, this message translates to:
  /// **'غير متاحة'**
  String get notAvailable;

  /// No description provided for @yourAnswerLabel.
  ///
  /// In ar, this message translates to:
  /// **'إجابتك:'**
  String get yourAnswerLabel;

  /// No description provided for @correctAnswerLabel.
  ///
  /// In ar, this message translates to:
  /// **'الإجابة الصحيحة:'**
  String get correctAnswerLabel;

  /// No description provided for @questionScoreLabel.
  ///
  /// In ar, this message translates to:
  /// **'الدرجة: {score} / {total}'**
  String questionScoreLabel(Object score, Object total);

  /// No description provided for @failedToFetchServerTime.
  ///
  /// In ar, this message translates to:
  /// **'فشل في جلب توقيت السيرفر'**
  String get failedToFetchServerTime;

  /// No description provided for @remainingTimeLabel.
  ///
  /// In ar, this message translates to:
  /// **'الوقت المتبقي'**
  String get remainingTimeLabel;

  /// No description provided for @timeSpentLabel.
  ///
  /// In ar, this message translates to:
  /// **'الوقت المستغرق'**
  String get timeSpentLabel;

  /// No description provided for @minutesShort.
  ///
  /// In ar, this message translates to:
  /// **'د'**
  String get minutesShort;

  /// No description provided for @noQuestions.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد أسئلة'**
  String get noQuestions;

  /// No description provided for @questionIndex.
  ///
  /// In ar, this message translates to:
  /// **'سؤال {index}/{total}'**
  String questionIndex(Object index, Object total);

  /// No description provided for @failedToLoadImage.
  ///
  /// In ar, this message translates to:
  /// **'تعذر تحميل الصورة'**
  String get failedToLoadImage;

  /// No description provided for @trueValue.
  ///
  /// In ar, this message translates to:
  /// **'صح'**
  String get trueValue;

  /// No description provided for @falseValue.
  ///
  /// In ar, this message translates to:
  /// **'خطأ'**
  String get falseValue;

  /// No description provided for @enterAnswerHint.
  ///
  /// In ar, this message translates to:
  /// **'أدخل إجابتك هنا'**
  String get enterAnswerHint;

  /// No description provided for @completeAnswerHint.
  ///
  /// In ar, this message translates to:
  /// **'أكمل الإجابة...'**
  String get completeAnswerHint;

  /// No description provided for @typeDialogueHint.
  ///
  /// In ar, this message translates to:
  /// **'اكتب الحوار هنا...'**
  String get typeDialogueHint;

  /// No description provided for @previous.
  ///
  /// In ar, this message translates to:
  /// **'السابق'**
  String get previous;

  /// No description provided for @finish.
  ///
  /// In ar, this message translates to:
  /// **'تسليم الحل'**
  String get finish;

  /// No description provided for @noRanksAvailable.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد رتب حالياً'**
  String get noRanksAvailable;

  /// No description provided for @yourCurrentPoints.
  ///
  /// In ar, this message translates to:
  /// **'نقاطك الحالية: {points}'**
  String yourCurrentPoints(Object points);

  /// No description provided for @teacherCourses.
  ///
  /// In ar, this message translates to:
  /// **'كورسات {name}'**
  String teacherCourses(String name);

  /// No description provided for @noCoursesForTeacher.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد كورسات لهذا المعلم'**
  String get noCoursesForTeacher;

  /// No description provided for @liveStreamTitle.
  ///
  /// In ar, this message translates to:
  /// **'البث المباشر'**
  String get liveStreamTitle;

  /// No description provided for @liveLabel.
  ///
  /// In ar, this message translates to:
  /// **'مباشر'**
  String get liveLabel;

  /// No description provided for @commentsLabel.
  ///
  /// In ar, this message translates to:
  /// **'التعليقات'**
  String get commentsLabel;

  /// No description provided for @writeCommentHint.
  ///
  /// In ar, this message translates to:
  /// **'اكتب تعليقك...'**
  String get writeCommentHint;

  /// No description provided for @voiceUploadSuccess.
  ///
  /// In ar, this message translates to:
  /// **'تم رفع التعليق الصوتي بنجاح'**
  String get voiceUploadSuccess;

  /// No description provided for @voiceUploadFailed.
  ///
  /// In ar, this message translates to:
  /// **'فشل رفع الملف الصوتي!'**
  String get voiceUploadFailed;

  /// No description provided for @userLabel.
  ///
  /// In ar, this message translates to:
  /// **'مستخدم'**
  String get userLabel;

  /// No description provided for @noNumberLabel.
  ///
  /// In ar, this message translates to:
  /// **'بدون رقم'**
  String get noNumberLabel;

  /// No description provided for @whatsappError.
  ///
  /// In ar, this message translates to:
  /// **'لا يمكن فتح واتساب. تأكد من تثبيت التطبيق على جهازك.'**
  String get whatsappError;

  /// No description provided for @whatsappNotSupported.
  ///
  /// In ar, this message translates to:
  /// **'واتساب غير مدعوم على هذا النظام.'**
  String get whatsappNotSupported;

  /// No description provided for @technicalSupport.
  ///
  /// In ar, this message translates to:
  /// **'الدعم الفني'**
  String get technicalSupport;

  /// No description provided for @supportEmailBody.
  ///
  /// In ar, this message translates to:
  /// **'مرحباً، أحتاج مساعدة في ...'**
  String get supportEmailBody;

  /// No description provided for @secondary.
  ///
  /// In ar, this message translates to:
  /// **'الثانوية'**
  String get secondary;

  /// No description provided for @preparatory.
  ///
  /// In ar, this message translates to:
  /// **'الاعدادية'**
  String get preparatory;

  /// No description provided for @primary.
  ///
  /// In ar, this message translates to:
  /// **'الابتدائية'**
  String get primary;

  /// No description provided for @level1.
  ///
  /// In ar, this message translates to:
  /// **'المستوى الأول'**
  String get level1;

  /// No description provided for @level2.
  ///
  /// In ar, this message translates to:
  /// **'المستوى الثاني'**
  String get level2;

  /// No description provided for @level3.
  ///
  /// In ar, this message translates to:
  /// **'المستوى الثالث'**
  String get level3;

  /// No description provided for @level4.
  ///
  /// In ar, this message translates to:
  /// **'المستوى الرابع'**
  String get level4;

  /// No description provided for @level5.
  ///
  /// In ar, this message translates to:
  /// **'المستوى الخامس'**
  String get level5;

  /// No description provided for @level6.
  ///
  /// In ar, this message translates to:
  /// **'المستوى السادس'**
  String get level6;

  /// No description provided for @pointsLabel.
  ///
  /// In ar, this message translates to:
  /// **'نقاطك: {points}'**
  String pointsLabel(int points);

  /// No description provided for @pointsTitle.
  ///
  /// In ar, this message translates to:
  /// **'النقاط: {points}'**
  String pointsTitle(int points);

  /// No description provided for @accountInfo.
  ///
  /// In ar, this message translates to:
  /// **'معلومات الحساب'**
  String get accountInfo;

  /// No description provided for @nameLabel.
  ///
  /// In ar, this message translates to:
  /// **'الاسم:'**
  String get nameLabel;

  /// No description provided for @usernameLabel.
  ///
  /// In ar, this message translates to:
  /// **'اسم المستخدم:'**
  String get usernameLabel;

  /// No description provided for @phoneLabel.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف:'**
  String get phoneLabel;

  /// No description provided for @studentData.
  ///
  /// In ar, this message translates to:
  /// **'بيانات الطالب'**
  String get studentData;

  /// No description provided for @loginData.
  ///
  /// In ar, this message translates to:
  /// **'بيانات الدخول'**
  String get loginData;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
