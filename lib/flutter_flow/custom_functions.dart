import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/sqlite/sqlite_manager.dart';

int createUID() {
  // Return a UID which is a integer
  return DateTime.now().microsecondsSinceEpoch + math.Random().nextInt(999999);
}

DateTime unixTimeStamp(int unixTimestampValue) {
  // convert unix timestamp in seconds to date time
  return DateTime.fromMillisecondsSinceEpoch(unixTimestampValue * 1000);
}
