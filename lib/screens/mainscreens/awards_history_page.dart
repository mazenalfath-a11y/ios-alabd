import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_version/data/api_service.dart';
import 'package:flutter_version/utilities/app_colors.dart';
import 'package:flutter_version/utilities/theme_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class AwardsHistoryPage extends StatefulWidget {
  const AwardsHistoryPage({Key? key}) : super(key: key);

  @override
  State<AwardsHistoryPage> createState() => _AwardsHistoryPageState();
}

class _AwardsHistoryPageState extends State<AwardsHistoryPage> {
  final ApiService _apiService = ApiService();
  bool _isLoading = true;

  int _studentScore = 0;
  int _firstPlaceCount = 0;
  int _secondPlaceCount = 0;
  int _thirdPlaceCount = 0;
  int _idealStudentCount = 0;

  static const List<Map<String, dynamic>> _rankTiers = [
    {"threshold": 0, "name": "ملازم"},
    {"threshold": 100, "name": "ملازم أول"},
    {"threshold": 300, "name": "نقيب"},
    {"threshold": 600, "name": "رائد"},
    {"threshold": 1000, "name": "مقدم"},
    {"threshold": 1500, "name": "عقيد"},
    {"threshold": 2200, "name": "عميد"},
    {"threshold": 3000, "name": "لواء"},
  ];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      // First, get the badges from the new endpoint
      final badgesRes =
          await _apiService.request('student/badges', null, 'GET');
      if (badgesRes != null && badgesRes.statusCode == 200) {
        final data = badgesRes.data;
        setState(() {
          _firstPlaceCount = (data['firstPlace'] as num?)?.toInt() ?? 0;
          _secondPlaceCount = (data['secondPlace'] as num?)?.toInt() ?? 0;
          _thirdPlaceCount = (data['thirdPlace'] as num?)?.toInt() ?? 0;
          _idealStudentCount = (data['idealStudent'] as num?)?.toInt() ?? 0;
        });
      } else {
        // Fallback to getuser if badges endpoint fails
        final userRes =
            await _apiService.request('student/getuser', null, 'GET');
        if (userRes != null && userRes.statusCode == 200) {
          final data = userRes.data;
          setState(() {
            _firstPlaceCount = (data['firstPlaceCount'] as num?)?.toInt() ?? 0;
            _secondPlaceCount =
                (data['secondPlaceCount'] as num?)?.toInt() ?? 0;
            _thirdPlaceCount = (data['thirdPlaceCount'] as num?)?.toInt() ?? 0;
            _idealStudentCount =
                (data['idealStudentCount'] as num?)?.toInt() ?? 0;
          });
        }
      }

      // Score (unchanged)
      final scoreRes =
          await _apiService.request('score/get_student_score', null, 'GET');
      if (scoreRes != null && scoreRes.statusCode == 200) {
        setState(() {
          _studentScore = (scoreRes.data?['score'] as num?)?.toInt() ?? 0;
        });
      }
    } catch (e) {
      debugPrint('Error loading awards data: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  String _formatTimes(int count) {
    if (count == 0) return 'لم يحصل عليها';
    if (count == 1) return 'مرة واحدة';
    if (count == 2) return 'مرتان';
    if (count >= 3 && count <= 10) return '$count مرات';
    return '$count مرة';
  }

  String _getCurrentRankName() {
    String currentRank = _rankTiers.first["name"] as String;
    for (int i = _rankTiers.length - 1; i >= 0; i--) {
      if (_studentScore >= (_rankTiers[i]["threshold"] as int)) {
        currentRank = _rankTiers[i]["name"] as String;
        break;
      }
    }
    return currentRank;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDark = themeProvider.isDarkMode;
    return Scaffold(
      backgroundColor: const Color(0xFF0B1120),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: _isLoading
                ? Center(
                    child:
                        CircularProgressIndicator(color: AppColors.sky(isDark)))
                : SingleChildScrollView(
                    padding: const EdgeInsets.only(
                        top: 24.0, right: 20.0, left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CachedNetworkImage(
                              height: 24,
                              width: 24,
                              imageUrl:
                                  'https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Activities/Military%20Medal.png',
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'أوسمة الصدارة',
                              style: GoogleFonts.cairo(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 14.0, left: 14.0),
                          child: GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.85,
                            children: [
                              _buildMedalCard(
                                title: 'مركز أول',
                                countStr: _formatTimes(_firstPlaceCount),
                                imagePath: 'assets/images/1st place medal.png',
                                countColor: const Color(0xFFF59E0B),
                              ),
                              _buildMedalCard(
                                title: 'مركز ثاني',
                                countStr: _formatTimes(_secondPlaceCount),
                                imagePath: 'assets/images/2nd place medal.png',
                                countColor: const Color(0xFFC084FC),
                              ),
                              _buildMedalCard(
                                title: 'مركز ثالث',
                                countStr: _formatTimes(_thirdPlaceCount),
                                imagePath: 'assets/images/3rd place medal.png',
                                countColor: const Color(0xFFF87171),
                              ),
                              _buildMedalCard(
                                title: 'الطالب المثالي',
                                countStr: _formatTimes(_idealStudentCount),
                                imagePath: 'assets/images/trophy.png',
                                countColor: const Color(0xFFFBBF24),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CachedNetworkImage(
                                height: 24,
                                width: 24,
                                imageUrl:
                                    'https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Shield.png'),
                            const SizedBox(width: 4),
                            Text(
                              'مسار الرتب',
                              style: GoogleFonts.cairo(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        GridView.builder(
                          itemCount: _rankTiers.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.85,
                          ),
                          itemBuilder: (context, index) {
                            final rank = _rankTiers[index];
                            final threshold = rank["threshold"] as int;
                            final name = rank["name"] as String;
                            final currentRankName = _getCurrentRankName();

                            final isCurrent = name == currentRankName;
                            final isCompleted =
                                _studentScore >= threshold && !isCurrent;
                            final isLocked = _studentScore < threshold;

                            return _buildRankCard(
                              name: name,
                              threshold: threshold,
                              isCurrent: isCurrent,
                              isCompleted: isCompleted,
                              isLocked: isLocked,
                            );
                          },
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.15,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xFF0E172A),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
          border: Border(
            bottom: BorderSide(color: const Color(0XFF1D293D), width: 1),
          )),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1D293D),
                      border: Border.all(color: Color(0XFF314158), width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(PhosphorIconsRegular.arrowRight,
                        color: Color(0XFF90A1B9), size: 20),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(PhosphorIconsFill.trophy,
                        color: Colors.white, size: 32),
                    const SizedBox(width: 8),
                    Text(
                      'سجل البطولات',
                      style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMedalCard({
    required String title,
    required String countStr,
    required String imagePath,
    required Color countColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 20,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 76,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(2),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ],
            ),
          ),
          const Spacer(flex: 2),
          Stack(
            alignment: Alignment.center,
            children: [
              Transform.translate(
                offset: const Offset(0, 24),
                child: Image.asset(
                  'assets/images/Ellipse.png',
                  height: 16,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
              Image.asset(imagePath,
                  width: 48, height: 48, fit: BoxFit.contain),
            ],
          ),
          const Spacer(),
          Text(
            title,
            style: GoogleFonts.cairo(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              color: countColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              countStr,
              style: GoogleFonts.cairo(
                color: countColor,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildRankCard({
    required String name,
    required int threshold,
    required bool isCurrent,
    required bool isCompleted,
    required bool isLocked,
  }) {
    Color borderColor = Colors.white.withOpacity(0.1);
    Color bgColor = const Color(0xFF111827);

    if (isCurrent) {
      borderColor = const Color(0xFF3B82F6).withOpacity(0.5);
      bgColor = bgColor;
    }

    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: borderColor, width: isCurrent ? 1.5 : 1),
            boxShadow: [
              if (!isLocked && !isCurrent)
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 12,
                  spreadRadius: 0,
                  offset: const Offset(0, 2),
                ),
              if (isCurrent)
                BoxShadow(
                  color: const Color(0xFF3B82F6).withOpacity(0.15),
                  blurRadius: 30,
                  spreadRadius: 0,
                  offset: const Offset(0, 0),
                ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isLocked)
                Container(
                  width: 76,
                  height: 4,
                  decoration: BoxDecoration(
                    color: isCurrent
                        ? const Color(0xFF3B82F6)
                        : Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(2),
                    boxShadow: [
                      BoxShadow(
                        color:
                            (isCurrent ? const Color(0xFF3B82F6) : Colors.white)
                                .withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                )
              else
                const SizedBox(height: 4),
              const Spacer(flex: 2),
              Opacity(
                opacity: isLocked ? 0.3 : 1.0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.translate(
                      offset: const Offset(0, 36),
                      child: Image.asset(
                        'assets/images/Ellipse.png',
                        height: 16,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Image.asset(
                      'assets/images/$name.png',
                      width: 64,
                      height: 64,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                          PhosphorIconsFill.shield,
                          size: 64,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                name,
                style: GoogleFonts.cairo(
                  color:
                      isLocked ? Colors.white.withOpacity(0.5) : Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              if (isCompleted)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10B981).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'مكتمل',
                    style: GoogleFonts.cairo(
                      color: const Color(0xFF10B981),
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              else if (isCurrent)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B82F6).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'الحالية',
                    style: GoogleFonts.cairo(
                      color: const Color(0xFF3B82F6),
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              else if (isLocked)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '$threshold XP',
                    style: GoogleFonts.cairo(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              const Spacer(),
            ],
          ),
        ),
        if (isLocked)
          Positioned(
            top: 12,
            right: 12,
            child: Icon(
              PhosphorIconsFill.lockKey,
              color: Color(0XFF62748E),
              size: 16,
            ),
          ),
      ],
    );
  }
}
