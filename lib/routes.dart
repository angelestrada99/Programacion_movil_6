import 'package:flutter/material.dart';
import 'package:flutter_1/screens/add_post_screen.dart';
import 'package:flutter_1/screens/events_screen.dart';
import 'package:flutter_1/screens/list_popular_videos.dart';
import 'package:flutter_1/screens/modify_event_screen.dart';
import 'package:flutter_1/screens/preferencest_screen.dart';
import 'package:flutter_1/screens/register_screen.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_1/screens/register_screen.dart';
import 'package:flutter_1/screens/dashboard_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/register': (BuildContext context) => const RegisterScreen(),
    '/preferencestTheme': (BuildContext context) => PreferencestScreen(),
    '/dash': (BuildContext context) => const DashboardScreen(),
    '/add': (BuildContext context) => AddPostScreen(),
    '/events': (BuildContext context) => EventScreen(),
    '/modify': (BuildContext context) => ModifyEvent(),
    '/popular': (BuildContext context) => const ListPopularVideos()
  };
}
