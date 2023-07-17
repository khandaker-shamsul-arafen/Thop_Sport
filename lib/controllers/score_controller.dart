import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/match_details_response.dart';
import '../models/team_response.dart';
import '../services/api_services.dart';
import '../utils/helpers.dart';

class ScoreController extends GetxController {
  RxList<Live> teamResponseList = <Live>[].obs;
  Rx<TeamResponse> teamResponseModel = TeamResponse().obs;
  RxList<Match> matchResponseList = <Match>[].obs;
  Rx<MatchDetailsResponse> matchResponseModel = MatchDetailsResponse().obs;

  RxBool loading = true.obs;
  RxBool matchLoading = true.obs;

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
      print(teamResponseList[0].title);
    } on Exception catch (e) {
      dd(e);
    } finally {
      loading.value = false;
    }
  }

  matchDetails() async {
    matchLoading.value = true;
    matchResponseList.clear();

    try {
      var matchResponse = await ApiService.post(
          'https://supersports24.xyz/api/v6/cricket/live/details',
          headers: {},
          body: {
            'api_key':
                '7f581f7766bb683c1e785253fc75395a4245fe94f003f5318665b73c8d021424',
            'url':
                'https://www.cricbuzz.com/live-cricket-scores/73285/waf-vs-tsk-5th-match-major-league-cricket-2023'
          });
      matchResponseModel.value =
          MatchDetailsResponse.fromJson(jsonDecode(matchResponse.body));
      // matchResponseModel.value.match
      //     ?.map((e) =>
      // teamResponseList.contains(e) ? null : teamResponseList.add(e))
      //     .toList();
      print(matchResponseModel.toJson());
    } on Exception catch (e) {
      dd(e);
    } finally {
      loading.value = false;
    }
  }
}
