import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

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
  List lastEightBall = [0, 0, 0, 0, 0, 0, 0, 0];

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
    lastEightBall = [0, 0, 0, 0, 0, 0, 0, 0];

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
      var recentBallSplit =
          (matchResponseModel.value.recent.toString()).split('|');
      var splitIndex0 = (recentBallSplit[1].split(" "));
      var splitIndex1 = recentBallSplit[2].split(" ");

      if (splitIndex0.isNotEmpty) {
        for (int index = 1; index < splitIndex0.length - 1; index++) {
          lastEightBall[index - 1] = splitIndex0[index];
        }
      }

      if (splitIndex1.isNotEmpty) {
        for (int index = 1;
            index <= lastEightBall.length - (splitIndex0.length - 2);
            index++) {
          lastEightBall[splitIndex0.length - 1] = splitIndex1[index];
        }
      }

      print(lastEightBall);
    } on Exception catch (e) {
      dd(e);
    } finally {
      matchLoading.value = false;
    }
  }
}
