import 'package:go_router/go_router.dart';
import 'package:healthcare_app/screens/doctors/doctor_view.dart';
import 'package:healthcare_app/screens/home/home_view.dart';
import 'package:healthcare_app/screens/profile/profile_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileView(),
    ),
    GoRoute(
      path: '/doctors',
      builder: (context, state) => const DoctorView(),
    ),
  ],
);
