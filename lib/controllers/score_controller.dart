import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../models/match_details_response.dart';
import '../models/team_response.dart';
import '../services/api_services.dart';
import '../utils/helpers.dart';

class ScoreController extends GetxController {
  RxList<Live> teamResponseList = <Live>[].obs;
  Rx<TeamResponse> teamResponseModel = TeamResponse().obs;
  RxList<Match> matchResponseList = <Match>[].obs;
  RxList<Keystats> kStateResponseList = <Keystats>[].obs;
  RxList<Batter> batterDetailsResponseList = <Batter>[].obs;
  RxList<Bowler> bowlerDetailsResponseList = <Bowler>[].obs;
  RxList<Commentry> comentryResponseList = <Commentry>[].obs;
  RxList<Live> favouriteList = <Live>[].obs;
  List lastEightBall = [];
  List last = [];
  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;
  final box = GetStorage();

  Rx<MatchDetailsResponse> matchResponseModel = MatchDetailsResponse().obs;

  RxBool loading = true.obs;
  RxBool matchLoading = true.obs;
  RxBool adLoading = false.obs;

  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';
  final adId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/1033173712'
      : 'ca-app-pub-3940256099942544/4411468910';

  void loadAd() {
    bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');

          adLoading.value = true;
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
      ),
    )..load();
  }

  getStorageRead() {
    var result = box.read('fixture') ?? '';
    dd(result);
    if (result != null && result != '') {
      List<dynamic> jsonData = jsonDecode(result);
      favouriteList.value =
          jsonData.map((payment) => Live.fromJson(payment)).toList();
      print("Shanto$favouriteList");
    }
  }

  void loadAdins() {
    InterstitialAd.load(
        adUnitId: adId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            interstitialAd = ad;
          },

          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
          },
        ));
  }

  teamScheudle() async {
    loading.value = true;
    teamResponseList.clear();

    try {
      var teamResponse = await ApiService.post(
          'https://supersports24.xyz/api/v6/cricket/live',
          headers: {},
          body: {
            'api_key':
                '7f581f7766bb683c1e785253fc75395a4245fe94f003f5318665b73c8d021424'
          });
      teamResponseModel.value =
          TeamResponse.fromJson(jsonDecode(teamResponse.body));
      teamResponseModel.value.live
          ?.map((e) =>
              teamResponseList.contains(e) ? null : teamResponseList.add(e))
          .toList();
      //  print(teamResponseModel.value.toJson());
    } on Exception catch (e) {
      dd(e);
    } finally {
      loading.value = false;
    }
  }

  matchDetails(String link) async {
    matchLoading.value = true;
    matchResponseList.clear();
    kStateResponseList.clear();
    batterDetailsResponseList.clear();
    comentryResponseList.clear();
    bowlerDetailsResponseList.clear();
    lastEightBall.clear();
    lastEightBall = [];

    try {
      var matchResponse = await ApiService.post(
          'https://supersports24.xyz/api/v6/cricket/live/details',
          headers: {},
          body: {
            'api_key':
                '7f581f7766bb683c1e785253fc75395a4245fe94f003f5318665b73c8d021424',
            'url': link
          });
      matchResponseModel.value =
          MatchDetailsResponse.fromJson(jsonDecode(matchResponse.body));
      matchResponseModel.value.batter
          ?.map((e) => batterDetailsResponseList.add(e))
          .toList();
      matchResponseModel.value.bowler
          ?.map((e) => bowlerDetailsResponseList.add(e))
          .toList();
      matchResponseModel.value.keystats
          ?.map((e) => kStateResponseList.add(e))
          .toList();
      matchResponseModel.value.commentry
          ?.map((e) => comentryResponseList.add(e))
          .toList();

      var recentBallSplit = (matchResponseModel.value.recent.toString())
          .replaceAll("Recent:... ", "")
          .split(' | ');
      dd(recentBallSplit);
      for (int i = 0; i < recentBallSplit.length; i++) {
        lastEightBall = [...lastEightBall, ...recentBallSplit[i].split(" ")];
      }

      dd(recentBallSplit.length);

      print(lastEightBall);
    } on Exception catch (e) {
      dd(e);
    } finally {
      matchLoading.value = false;
    }
  }
}
