// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get myAccount => 'My Account';

  @override
  String get exams => 'Exams';

  @override
  String get courses => 'Courses';

  @override
  String get videos => 'Videos';

  @override
  String get home => 'Home';

  @override
  String get userName => 'User Name';

  @override
  String get online => 'Online';

  @override
  String get editGroup => 'Edit Group';

  @override
  String get save => 'Save';

  @override
  String get contactTeacherWhatsapp => 'Contact Teacher via WhatsApp';

  @override
  String get contactTeacherFacebook => 'Contact Teacher via Facebook';

  @override
  String get contactSupport => 'Contact Support';

  @override
  String get logout => 'Logout';

  @override
  String get companyCodeNote => 'رقم المحاضر مثال \'110490\'';

  @override
  String get companyCodeNote1 => 'ليس الرقم الطويل المخصص لشراء الكورس';

  @override
  String get teacherWhatsappMessage => 'Hello sir, I have an inquiry.';

  @override
  String get supportWhatsappMessage => 'Hello, I have an inquiry.';

  @override
  String get language => 'Language';

  @override
  String get changeLanguage => 'Change Language';

  @override
  String get groupModifiedSuccess => 'Group modified successfully ✅';

  @override
  String get reviewErrors => 'Review Errors';

  @override
  String get gradesHistory => 'Grades History';

  @override
  String get errorModifyingGroup => 'Error modifying group';

  @override
  String get pleaseEnterUsernamePassword =>
      'Please enter username and password';

  @override
  String get loginSuccess => 'Login successful ✅';

  @override
  String get invalidLogin => 'Invalid login credentials ❌';

  @override
  String get welcome => 'Welcome';

  @override
  String loginToPlatform(String appName) {
    return 'Login to $appName platform';
  }

  @override
  String get username => 'Username';

  @override
  String get nameNote => 'First and Last names must be in Arabic';

  @override
  String get usernameNote =>
      'Username must be English letters and numbers without spaces';

  @override
  String get password => 'Password';

  @override
  String get login => 'Login';

  @override
  String get mobilePhoneNote =>
      'Phone number must be 11 digits starting with 01';

  @override
  String get dontHaveAccount => 'Don\'t have an account? ';

  @override
  String get createAccount => 'Create Account';

  @override
  String get firstName => 'First Name';

  @override
  String get lastName => 'Last Name';

  @override
  String get companyCode => 'Lecturer Code';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get next => 'Next';

  @override
  String get passwordMinLength => 'Password must be at least 8 characters';

  @override
  String get fillAllFields => 'Please fill all fields';

  @override
  String get companyCodeInvalid => 'Invalid Lecturer Code';

  @override
  String get companyCodeError => 'Error verifying lecturer code';

  @override
  String get companyCodeMinLength =>
      'Lecturer code must be at least 3 characters';

  @override
  String get usernameMinLength => 'Username must be at least 3 characters';

  @override
  String get passwordMismatch => 'Passwords do not match';

  @override
  String get usernameAlpha => 'Username must contain at least one letter';

  @override
  String errorOccurred(String error) {
    return 'An error occurred during the process';
  }

  @override
  String get studentPhone => 'Student Phone Number';

  @override
  String get parentPhone => 'Parent Phone Number';

  @override
  String get selectGroupOptional => 'Select Group (Optional)';

  @override
  String get selectAcademicYear => 'Select Academic Year';

  @override
  String get noLevelsAvailable => 'No levels available';

  @override
  String get accountCreatedSuccess => 'Account created successfully!';

  @override
  String get registerError => 'Registration error';

  @override
  String get enterValidStudentPhone =>
      'Please enter a valid 11-digit student phone number';

  @override
  String get enterValidParentPhone =>
      'Please enter a valid 11-digit parent phone number';

  @override
  String get selectAcademicYearError => 'Please select an academic year';

  @override
  String get loadingLevels => 'Loading levels';

  @override
  String get selected => 'Selected';

  @override
  String get retrievePassword => 'Retrieve Password';

  @override
  String get registeredPhone => 'Registered Phone Number';

  @override
  String get retrieve => 'Retrieve';

  @override
  String get passwordResetLinkSent => 'A password reset link will be sent';

  @override
  String get loading => 'Loading...';

  @override
  String get user => 'User';

  @override
  String get updateRequired => 'Update Required';

  @override
  String get updateRequiredMessage =>
      'You must update the application to the latest version to use it.';

  @override
  String get undefined => 'Undefined';

  @override
  String get myCourses => 'My Courses';

  @override
  String get categories => 'Categories';

  @override
  String get availableCoursesForPurchase => 'Available Courses for Purchase';

  @override
  String get currentPoints => 'Your Current Points';

  @override
  String pointsCount(int count) {
    return '$count Points';
  }

  @override
  String get examsResults => 'Exams Results';

  @override
  String get teachers => 'Teachers';

  @override
  String get noCoursesAvailable => 'No courses available currently';

  @override
  String priceWithCurrency(Object price) {
    return 'Price: $price EGP';
  }

  @override
  String teacherLabel(String name) {
    return 'Teacher: $name';
  }

  @override
  String get noCoursesPurchased => 'You haven\'t purchased any courses yet';

  @override
  String get shortClips => 'Short Clips';

  @override
  String selectedLabel(String label) {
    return 'Selected: $label';
  }

  @override
  String get unknownExam => 'Unknown Exam';

  @override
  String get currentExams => 'Current Exams';

  @override
  String get noCurrentExams => 'No exams currently';

  @override
  String get upcomingExams => 'Upcoming Exams';

  @override
  String get noUpcomingExams => 'No upcoming exams';

  @override
  String get pastExams => 'Past Exams';

  @override
  String get noPastExams => 'No past exams';

  @override
  String get cannotEnterExamYet => 'You cannot enter the exam yet ✅';

  @override
  String get noTitle => 'No Title';

  @override
  String get noSubject => 'No Subject';

  @override
  String get unknown => 'Unknown';

  @override
  String get noPurchasedCourses => 'No purchased courses currently';

  @override
  String get purchasedVideos => 'Purchased Videos';

  @override
  String get noPurchasedVideos => 'No purchased videos currently';

  @override
  String get lessons => 'Lessons';

  @override
  String get files => 'Files';

  @override
  String get live => 'Live';

  @override
  String get rank => 'Rank';

  @override
  String get purchaseFailed => 'Purchase failed. Check the code.';

  @override
  String get failedToFetchRank => 'Failed to fetch rank data';

  @override
  String get ongoingExamsLabel => 'Ongoing Exams:';

  @override
  String get upcomingExamsLabel => 'Upcoming Exams:';

  @override
  String get endedExamsLabel => 'Ended Exams:';

  @override
  String get start => 'Start';

  @override
  String get examEnded => 'Exam has already ended';

  @override
  String get cannotStartExam => 'Cannot start exam currently';

  @override
  String get courseContent => 'Course Content';

  @override
  String get noExamsAvailable => 'No exams available currently';

  @override
  String get soon => 'Soon';

  @override
  String get noFilesAvailable => 'No files currently';

  @override
  String get pdfFiles => 'PDF Files';

  @override
  String get pdfFile => 'PDF File';

  @override
  String get mustBuyCourseFirst => 'You must buy the course first';

  @override
  String get imageGroups => 'Image Groups';

  @override
  String get imageGroup => 'Image Group';

  @override
  String get failedToLoadPdf => 'Failed to load PDF';

  @override
  String get invalidFile => 'File is invalid or empty';

  @override
  String get student => 'Student';

  @override
  String get exerciseNotAvailable => 'Exercise not available currently';

  @override
  String get exercises => 'Exercises';

  @override
  String get comments => 'Comments';

  @override
  String get watchVideo => 'Watch Video';

  @override
  String get exercise => 'Exercise';

  @override
  String get typeQuestionHint => 'Type your question here';

  @override
  String get voiceMessage => 'Voice Message';

  @override
  String teacherReply(String reply) {
    return 'Teacher\'s Reply: $reply';
  }

  @override
  String get noAdditionalVideos => 'No additional videos currently';

  @override
  String get mainVideo => 'Main Video';

  @override
  String additionalVideoCount(int count) {
    return 'Additional Video $count';
  }

  @override
  String get noExamsResultsYet => 'No exams results yet';

  @override
  String get generalExam => 'General Exam';

  @override
  String get test => 'Test';

  @override
  String yourScoreLabel(Object score) {
    return 'Your Score: $score';
  }

  @override
  String get details => 'Details';

  @override
  String get failedToDisplayAnswers => 'Failed to display answers';

  @override
  String get examResultTitle => 'Exam Result';

  @override
  String yourScoreWithTotal(Object score, Object total) {
    return 'Your Score: $score / $total';
  }

  @override
  String get notAnswered => 'Not answered';

  @override
  String get notAvailable => 'Not available';

  @override
  String get yourAnswerLabel => 'Your Answer:';

  @override
  String get correctAnswerLabel => 'Correct Answer:';

  @override
  String questionScoreLabel(Object score, Object total) {
    return 'Score: $score / $total';
  }

  @override
  String get failedToFetchServerTime => 'Failed to fetch server time';

  @override
  String get remainingTimeLabel => 'Remaining Time';

  @override
  String get timeSpentLabel => 'Time Spent';

  @override
  String get minutesShort => 'm';

  @override
  String get noQuestions => 'No questions';

  @override
  String questionIndex(Object index, Object total) {
    return 'Question $index/$total';
  }

  @override
  String get failedToLoadImage => 'Failed to load image';

  @override
  String get trueValue => 'True';

  @override
  String get falseValue => 'False';

  @override
  String get enterAnswerHint => 'Enter your answer here';

  @override
  String get completeAnswerHint => 'Complete the answer...';

  @override
  String get typeDialogueHint => 'Type the dialogue here...';

  @override
  String get previous => 'Previous';

  @override
  String get finish => 'Finish';

  @override
  String get noRanksAvailable => 'No ranks available currently';

  @override
  String yourCurrentPoints(Object points) {
    return 'Your Current Points: $points';
  }

  @override
  String teacherCourses(String name) {
    return 'Courses of $name';
  }

  @override
  String get noCoursesForTeacher => 'No courses for this teacher';

  @override
  String get liveStreamTitle => 'Live Stream';

  @override
  String get liveLabel => 'LIVE';

  @override
  String get commentsLabel => 'Comments';

  @override
  String get writeCommentHint => 'Write your comment...';

  @override
  String get voiceUploadSuccess => 'Voice comment uploaded successfully';

  @override
  String get voiceUploadFailed => 'Failed to upload voice file!';

  @override
  String get userLabel => 'User';

  @override
  String get noNumberLabel => 'No Number';

  @override
  String get whatsappError =>
      'Could not open WhatsApp. Make sure the app is installed.';

  @override
  String get whatsappNotSupported =>
      'WhatsApp is not supported on this system.';

  @override
  String get technicalSupport => 'Technical Support';

  @override
  String get supportEmailBody => 'Hello, I need help with...';

  @override
  String get secondary => 'Secondary';

  @override
  String get preparatory => 'Preparatory';

  @override
  String get primary => 'Primary';

  @override
  String get level1 => 'Level 1';

  @override
  String get level2 => 'Level 2';

  @override
  String get level3 => 'Level 3';

  @override
  String get level4 => 'Level 4';

  @override
  String get level5 => 'Level 5';

  @override
  String get level6 => 'Level 6';

  @override
  String pointsLabel(int points) {
    return 'Your Points: $points';
  }

  @override
  String pointsTitle(int points) {
    return 'Points: $points';
  }

  @override
  String get accountInfo => 'Account Info';

  @override
  String get nameLabel => 'Name:';

  @override
  String get usernameLabel => 'Username:';

  @override
  String get phoneLabel => 'Phone Number:';

  @override
  String get studentData => 'Student Data';

  @override
  String get loginData => 'Login Data';
}
