// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get myAccount => 'حسابي';

  @override
  String get exams => 'امتحانات';

  @override
  String get courses => 'كورساتي';

  @override
  String get videos => 'فيديوهات';

  @override
  String get home => 'الرئيسية';

  @override
  String get userName => 'اسم المستخدم';

  @override
  String get online => 'اونلاين';

  @override
  String get editGroup => 'تعديل المجموعة';

  @override
  String get save => 'حفظ';

  @override
  String get contactTeacherWhatsapp => 'عبر واتساب';

  @override
  String get contactTeacherFacebook => 'عبر فيسبوك';

  @override
  String get contactSupport => 'تواصل مع الدعم الفني';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get companyCodeNote => 'رقم المحاضر مثال \'110490\'';

  @override
  String get companyCodeNote1 => 'ليس الرقم الطويل المخصص لشراء الكورس';

  @override
  String get teacherWhatsappMessage => 'مرحباً مستر , أريد استفسار.';

  @override
  String get supportWhatsappMessage => 'مرحباً , أريد استفسار.';

  @override
  String get language => 'اللغة';

  @override
  String get changeLanguage => 'تغيير اللغة';

  @override
  String get groupModifiedSuccess => 'تم تعديل المجموعة بنجاح ✅';

  @override
  String get reviewErrors => 'مراجعة الاخطاء';

  @override
  String get gradesHistory => 'سجل الدرجات';

  @override
  String get errorModifyingGroup => 'حدث خطأ أثناء تعديل المجموعة';

  @override
  String get pleaseEnterUsernamePassword =>
      'يرجى إدخال اسم المستخدم وكلمة المرور';

  @override
  String get loginSuccess => 'تم تسجيل الدخول بنجاح';

  @override
  String get invalidLogin => 'بيانات تسجيل الدخول غير صحيحة';

  @override
  String get welcome => 'مرحباً بك';

  @override
  String loginToPlatform(String appName) {
    return 'سجل الدخول للوصول إلي كورساتك';
  }

  @override
  String get username => 'اسم المستخدم';

  @override
  String get nameNote => 'الاسم الأول واسم العائلة يكونوا باللغة العربية';

  @override
  String get usernameNote =>
      'اسم المستخدم يكون حروف وأرقام بالإنجليزية بدون مسافات';

  @override
  String get password => 'كلمة المرور';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get mobilePhoneNote => 'رقم الهاتف يجب أن يكون 11 رقمًا يبدأ بـ 01';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟ ';

  @override
  String get createAccount => 'أنشئ حسابك الآن';

  @override
  String get firstName => 'الاسم الأول';

  @override
  String get lastName => 'اسم العائلة';

  @override
  String get companyCode => 'كود المحاضر';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get next => 'التالي';

  @override
  String get passwordMinLength =>
      'يجب ان يكون الرقم السري مكون من 8 أرقام على الأقل';

  @override
  String get fillAllFields => 'يرجى ملء جميع الحقول';

  @override
  String get companyCodeInvalid => 'كود المحاضر غير صحيح';

  @override
  String get companyCodeError => 'حدث خطأ في التحقق من كود المحاضر';

  @override
  String get companyCodeMinLength => 'كود المحاضر يجب أن يكون 3 أحرف على الأقل';

  @override
  String get usernameMinLength => 'اسم المستخدم يجب أن يكون 3 أحرف على الأقل';

  @override
  String get passwordMismatch => 'كلمات المرور غير متطابقة';

  @override
  String get usernameAlpha =>
      'اسم المستخدم يجب أن يحتوي على حرف واحد على الأقل';

  @override
  String errorOccurred(String error) {
    return 'حدث خطأ أثناء تنفيذ العملية';
  }

  @override
  String get studentPhone => 'رقم هاتف الطالب';

  @override
  String get parentPhone => 'رقم هاتف ولي الأمر';

  @override
  String get selectGroupOptional => 'اختر المجموعة (اختياري)';

  @override
  String get selectAcademicYear => 'اختر السنة الدراسية';

  @override
  String get noLevelsAvailable => 'لا توجد مستويات متاحة';

  @override
  String get accountCreatedSuccess => 'تم إنشاء الحساب بنجاح!';

  @override
  String get registerError => 'حدث خطأ في التسجيل';

  @override
  String get enterValidStudentPhone =>
      'يرجى إدخال رقم طالب صحيح مكون من 11 رقمًا';

  @override
  String get enterValidParentPhone =>
      'يرجى إدخال رقم ولي أمر صحيح مكون من 11 رقمًا';

  @override
  String get selectAcademicYearError => 'يرجى اختيار السنة الدراسية';

  @override
  String get loadingLevels => 'جاري تحميل المستويات';

  @override
  String get selected => 'تم اختيار';

  @override
  String get retrievePassword => 'استرجاع كلمة المرور';

  @override
  String get registeredPhone => 'رقم الهاتف المسجل';

  @override
  String get retrieve => 'استرجاع';

  @override
  String get passwordResetLinkSent => 'سيتم إرسال رابط استرجاع كلمة المرور';

  @override
  String get loading => 'جارِ التحميل...';

  @override
  String get user => 'مستخدم';

  @override
  String get updateRequired => 'تحديث مطلوب';

  @override
  String get updateRequiredMessage =>
      'يجب عليك تحديث التطبيق إلى أحدث إصدار لاستخدامه.';

  @override
  String get undefined => 'غير محدد';

  @override
  String get myCourses => 'كورساتي';

  @override
  String get categories => 'التصنيفات';

  @override
  String get availableCoursesForPurchase => 'كورسات متاحة للشراء';

  @override
  String get currentPoints => 'نقاطك الحالية';

  @override
  String pointsCount(int count) {
    return '$count نقطة';
  }

  @override
  String get examsResults => 'سجل الدرجات';

  @override
  String get teachers => 'المعلمين';

  @override
  String get noCoursesAvailable => 'لا توجد كورسات حالياً';

  @override
  String priceWithCurrency(Object price) {
    return '$price ج.م';
  }

  @override
  String teacherLabel(String name) {
    return 'المعلم: $name';
  }

  @override
  String get noCoursesPurchased => 'لم تشترِ أي كورسات بعد';

  @override
  String get shortClips => 'مقاطع قصيرة';

  @override
  String selectedLabel(String label) {
    return 'تم اختيار: $label';
  }

  @override
  String get unknownExam => 'امتحان غير معروف';

  @override
  String get currentExams => 'الامتحانات الحالية';

  @override
  String get noCurrentExams => 'لا توجد امتحانات حالياً';

  @override
  String get upcomingExams => 'الامتحانات القادمة';

  @override
  String get noUpcomingExams => 'لا توجد امتحانات قادمة';

  @override
  String get pastExams => 'الامتحانات السابقة';

  @override
  String get noPastExams => 'لا توجد امتحانات سابقة';

  @override
  String get cannotEnterExamYet => 'لا يمكنك الدخول للامتحان بعد ✅';

  @override
  String get noTitle => 'بدون عنوان';

  @override
  String get noSubject => 'بدون مادة';

  @override
  String get unknown => 'غير معروف';

  @override
  String get noPurchasedCourses => 'لا توجد كورسات حالياً';

  @override
  String get purchasedVideos => 'الفيديوهات المشتراة';

  @override
  String get noPurchasedVideos => 'لا توجد فيديوهات مشتراة حالياً';

  @override
  String get lessons => 'الدروس';

  @override
  String get files => 'الملفات';

  @override
  String get live => 'لايف';

  @override
  String get rank => 'الترتيب';

  @override
  String get purchaseFailed => 'فشل في الشراء. تأكد من الكود.';

  @override
  String get failedToFetchRank => 'فشل في جلب بيانات الترتيب';

  @override
  String get ongoingExamsLabel => 'امتحانات جارية:';

  @override
  String get upcomingExamsLabel => 'امتحانات قادمة:';

  @override
  String get endedExamsLabel => 'امتحانات منتهية:';

  @override
  String get start => 'ابدأ';

  @override
  String get examEnded => 'الامتحان قد انتهى بالفعل';

  @override
  String get cannotStartExam => 'لا يمكن بدء الامتحان حالياً';

  @override
  String get courseContent => 'محتويات الكورس';

  @override
  String get noExamsAvailable => 'لا توجد امتحانات متاحة حالياً';

  @override
  String get soon => 'قريباً';

  @override
  String get noFilesAvailable => 'لا توجد ملفات حالياً';

  @override
  String get pdfFiles => 'ملفات PDF';

  @override
  String get pdfFile => 'ملف PDF';

  @override
  String get mustBuyCourseFirst => 'يجب شراء الكورس أولاً';

  @override
  String get imageGroups => 'مجموعات الصور';

  @override
  String get imageGroup => 'مجموعة صور';

  @override
  String get failedToLoadPdf => 'فشل تحميل ملف PDF';

  @override
  String get invalidFile => 'الملف غير صالح أو فارغ';

  @override
  String get student => 'طالب';

  @override
  String get exerciseNotAvailable => 'التمرين غير متاح حالياً';

  @override
  String get exercises => 'تمارين';

  @override
  String get comments => 'تعليقات';

  @override
  String get watchVideo => 'مشاهدة الفيديو';

  @override
  String get exercise => 'تمرين';

  @override
  String get typeQuestionHint => 'اكتب سؤالك هنا...';

  @override
  String get voiceMessage => 'رسالة صوتية';

  @override
  String teacherReply(String reply) {
    return 'رد المعلم: $reply';
  }

  @override
  String get noAdditionalVideos => 'لا توجد فيديوهات إضافية حالياً';

  @override
  String get mainVideo => 'الفيديو الرئيسي';

  @override
  String additionalVideoCount(int count) {
    return 'فيديو إضافي $count';
  }

  @override
  String get noExamsResultsYet => 'لا توجد نتائج اختبارات حتى الآن';

  @override
  String get generalExam => 'امتحان عام';

  @override
  String get test => 'اختبار';

  @override
  String yourScoreLabel(Object score) {
    return 'درجتك: $score';
  }

  @override
  String get details => 'تفاصيل';

  @override
  String get failedToDisplayAnswers => 'تعذر عرض الإجابات';

  @override
  String get examResultTitle => 'نتيجة الاختبار';

  @override
  String yourScoreWithTotal(Object score, Object total) {
    return 'نتيجتك: $score / $total';
  }

  @override
  String get notAnswered => 'لم تجب';

  @override
  String get notAvailable => 'غير متاحة';

  @override
  String get yourAnswerLabel => 'إجابتك:';

  @override
  String get correctAnswerLabel => 'الإجابة الصحيحة:';

  @override
  String questionScoreLabel(Object score, Object total) {
    return 'الدرجة: $score / $total';
  }

  @override
  String get failedToFetchServerTime => 'فشل في جلب توقيت السيرفر';

  @override
  String get remainingTimeLabel => 'الوقت المتبقي';

  @override
  String get timeSpentLabel => 'الوقت المستغرق';

  @override
  String get minutesShort => 'د';

  @override
  String get noQuestions => 'لا توجد أسئلة';

  @override
  String questionIndex(Object index, Object total) {
    return 'سؤال $index/$total';
  }

  @override
  String get failedToLoadImage => 'تعذر تحميل الصورة';

  @override
  String get trueValue => 'صح';

  @override
  String get falseValue => 'خطأ';

  @override
  String get enterAnswerHint => 'أدخل إجابتك هنا';

  @override
  String get completeAnswerHint => 'أكمل الإجابة...';

  @override
  String get typeDialogueHint => 'اكتب الحوار هنا...';

  @override
  String get previous => 'السابق';

  @override
  String get finish => 'تسليم الحل';

  @override
  String get noRanksAvailable => 'لا يوجد رتب حالياً';

  @override
  String yourCurrentPoints(Object points) {
    return 'نقاطك الحالية: $points';
  }

  @override
  String teacherCourses(String name) {
    return 'كورسات $name';
  }

  @override
  String get noCoursesForTeacher => 'لا توجد كورسات لهذا المعلم';

  @override
  String get liveStreamTitle => 'البث المباشر';

  @override
  String get liveLabel => 'مباشر';

  @override
  String get commentsLabel => 'التعليقات';

  @override
  String get writeCommentHint => 'اكتب تعليقك...';

  @override
  String get voiceUploadSuccess => 'تم رفع التعليق الصوتي بنجاح';

  @override
  String get voiceUploadFailed => 'فشل رفع الملف الصوتي!';

  @override
  String get userLabel => 'مستخدم';

  @override
  String get noNumberLabel => 'بدون رقم';

  @override
  String get whatsappError =>
      'لا يمكن فتح واتساب. تأكد من تثبيت التطبيق على جهازك.';

  @override
  String get whatsappNotSupported => 'واتساب غير مدعوم على هذا النظام.';

  @override
  String get technicalSupport => 'الدعم الفني';

  @override
  String get supportEmailBody => 'مرحباً، أحتاج مساعدة في ...';

  @override
  String get secondary => 'الثانوية';

  @override
  String get preparatory => 'الاعدادية';

  @override
  String get primary => 'الابتدائية';

  @override
  String get level1 => 'المستوى الأول';

  @override
  String get level2 => 'المستوى الثاني';

  @override
  String get level3 => 'المستوى الثالث';

  @override
  String get level4 => 'المستوى الرابع';

  @override
  String get level5 => 'المستوى الخامس';

  @override
  String get level6 => 'المستوى السادس';

  @override
  String pointsLabel(int points) {
    return 'نقاطك: $points';
  }

  @override
  String pointsTitle(int points) {
    return 'النقاط: $points';
  }

  @override
  String get accountInfo => 'معلومات الحساب';

  @override
  String get nameLabel => 'الاسم:';

  @override
  String get usernameLabel => 'اسم المستخدم:';

  @override
  String get phoneLabel => 'رقم الهاتف:';

  @override
  String get studentData => 'بيانات الطالب';

  @override
  String get loginData => 'بيانات الدخول';
}
