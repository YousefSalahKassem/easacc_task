import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easacc_task/core/themes/app_sizes.dart';
import 'package:easacc_task/core/themes/app_text_styles.dart';
import 'package:easacc_task/core/themes/app_theme_flavor.dart';
import 'package:easacc_task/core/themes/data.dart';
import 'package:easacc_task/core/utilities/extensions.dart';

part 'light_color.dart';

class LightTheme extends AppThemeFlavor {
  LightTheme() : super.init();

  @override
  ThemeData createThemeData(BuildContext context) {
    final appSizes = context.isTablet ? AppSizes.tablet() : AppSizes.mobile();
    final appTextStyle =
        context.isTablet ? AppTextStyles.tablet() : AppTextStyles.mobile();

    final textTheme = appTextStyle.toTextTheme().apply(
          fontFamily: 'Tajawal',
          displayColor: _LightColors.primary,
          bodyColor: _LightColors.primary,
          decorationColor: _LightColors.primary,
        );
    return ThemeData.from(colorScheme: ColorScheme.fromSwatch()).copyWith(
      scaffoldBackgroundColor: _LightColors.background,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        elevation: 10,
        foregroundColor: _LightColors.primary,
        surfaceTintColor: _LightColors.white,
        backgroundColor: _LightColors.background,
        titleSpacing: 0,
        titleTextStyle: appTextStyle.headlineLarge.copyWith(
          color: _LightColors.primary,
        ),
      ),
      dividerColor: Colors.grey.shade100,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _LightColors.primary,
          foregroundColor: _LightColors.white,
          textStyle: appTextStyle.subheadLarge,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all<Color>(_LightColors.white),
        checkColor: MaterialStateProperty.all<Color>(_LightColors.white),
        overlayColor: MaterialStateProperty.all<Color>(
          _LightColors.white,
        ),
        side: BorderSide(
          color: _LightColors.secondaryVariant,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: _LightColors.background,
        unselectedItemColor: _LightColors.secondaryVariant,
        selectedItemColor: _LightColors.primary,
        enableFeedback: false,
        elevation: 1,
      ),
      cardTheme: CardTheme(
        color: _LightColors.white,
        surfaceTintColor: _LightColors.white,
        elevation: 0,
      ),
      iconTheme: IconThemeData(
        color: _LightColors.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _LightColors.textFieldBackgroundColor,
        suffixIconColor: _LightColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        iconColor: _LightColors.primary,
        prefixIconColor: const Color(0xFF3a3a6e),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: _LightColors.primary,
        labelStyle: appTextStyle.titleLarge,
        unselectedLabelColor: _LightColors.black,
        unselectedLabelStyle: appTextStyle.titleMedium,
        indicatorColor: _LightColors.primary,
        dividerColor: _LightColors.white.withOpacity(0.2),
      ),
      extensions: [
        appTextStyle,
        appSizes,
        AppThemeData(
          white: _LightColors.white,
          black: _LightColors.black,
          blue: _LightColors.blue,
          primary: _LightColors.primary,
          primaryVariant: _LightColors.primaryVariant,
          secondary: _LightColors.secondary,
          secondaryVariant: _LightColors.secondaryVariant,
          error: _LightColors.error,
          errorField: _LightColors.errorField,
          success: _LightColors.success,
          successField: _LightColors.successField,
          gray3: _LightColors.gray3,
          warning: _LightColors.warning,
          background: _LightColors.background,
          warningOrder: _LightColors.pendingOrder,
          successOrder: _LightColors.successOrder,
          failedOrder: _LightColors.failedOrder,
        ),
      ],
    );
  }

  @override
  Brightness get windowBrightness => Brightness.dark;
}
