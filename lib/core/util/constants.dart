import 'package:flutter/material.dart';

// ============= API CONSTS =============

const baseUrl = 'http://192.168.1.103/api';
const registerUrl = '$baseUrl/register';
const loginUrl = '$baseUrl/login';
const updateUserLocationUrl = '$baseUrl/update';
const updateUserFcm = '$baseUrl/fcm';
const longPressShareUrl = '$baseUrl/longPressShare';
const activeShare = '$baseUrl/activeShare';
const followersUrl = '$baseUrl/followers';

enum ActiveSharingType { sender, receiver }

// ============= STYLE CONSTS ==============

const kScaffoldColor = Color(0xffFDFDFD);
const kRedColor = Color(0xffA90606);

const kPrimaryColor = Color(0xff2D2B4E);
const kSecondaryColor = Color(0xffFFD465);
const kOnSecondaryColor = Color(0xff784E00);
const kDangerColor = Color(0xffF56C61);

// Low Opacity Colors
const kLinksColor = Color(0xff807D99);
const kLightPrimaryColor = Color(0xffE7E5F1);
const kLightSecondaryColor = Color(0xffFFE6A6);
const kLightDangerColor = Color(0xffFEE2E7);
const kOnLightDangerColor = Color(0xff783341);
