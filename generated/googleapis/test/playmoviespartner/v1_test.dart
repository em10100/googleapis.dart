library googleapis.playmoviespartner.v1.test;

import "dart:core" as core;
import "dart:collection" as collection;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as http_testing;
import 'package:unittest/unittest.dart' as unittest;

import 'package:googleapis/playmoviespartner/v1.dart' as api;

class HttpServerMock extends http.BaseClient {
  core.Function _callback;
  core.bool _expectJson;

  void register(core.Function callback, core.bool expectJson) {
    _callback = callback;
    _expectJson = expectJson;
  }

  async.Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (_expectJson) {
      return request.finalize()
          .transform(convert.UTF8.decoder)
          .join('')
          .then((core.String jsonString) {
        if (jsonString.isEmpty) {
          return _callback(request, null);
        } else {
          return _callback(request, convert.JSON.decode(jsonString));
        }
      });
    } else {
      var stream = request.finalize();
      if (stream == null) {
        return _callback(request, []);
      } else {
        return stream.toBytes().then((data) {
          return _callback(request, data);
        });
      }
    }
  }
}

http.StreamedResponse stringResponse(
    core.int status, core.Map headers, core.String body) {
  var stream = new async.Stream.fromIterable([convert.UTF8.encode(body)]);
  return new http.StreamedResponse(stream, status, headers: headers);
}

buildUnnamed3020() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3020(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterAvail = 0;
buildAvail() {
  var o = new api.Avail();
  buildCounterAvail++;
  if (buildCounterAvail < 3) {
    o.altId = "foo";
    o.availId = "foo";
    o.captionExemption = "foo";
    o.captionIncluded = true;
    o.contentId = "foo";
    o.displayName = "foo";
    o.encodeId = "foo";
    o.end = "foo";
    o.episodeAltId = "foo";
    o.episodeNumber = "foo";
    o.episodeTitleInternalAlias = "foo";
    o.formatProfile = "foo";
    o.licenseType = "foo";
    o.pphNames = buildUnnamed3020();
    o.priceType = "foo";
    o.priceValue = "foo";
    o.productId = "foo";
    o.ratingReason = "foo";
    o.ratingSystem = "foo";
    o.ratingValue = "foo";
    o.releaseDate = "foo";
    o.seasonAltId = "foo";
    o.seasonNumber = "foo";
    o.seasonTitleInternalAlias = "foo";
    o.seriesAltId = "foo";
    o.seriesTitleInternalAlias = "foo";
    o.start = "foo";
    o.storeLanguage = "foo";
    o.suppressionLiftDate = "foo";
    o.territory = "foo";
    o.titleInternalAlias = "foo";
    o.videoId = "foo";
    o.workType = "foo";
  }
  buildCounterAvail--;
  return o;
}

checkAvail(api.Avail o) {
  buildCounterAvail++;
  if (buildCounterAvail < 3) {
    unittest.expect(o.altId, unittest.equals('foo'));
    unittest.expect(o.availId, unittest.equals('foo'));
    unittest.expect(o.captionExemption, unittest.equals('foo'));
    unittest.expect(o.captionIncluded, unittest.isTrue);
    unittest.expect(o.contentId, unittest.equals('foo'));
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.encodeId, unittest.equals('foo'));
    unittest.expect(o.end, unittest.equals('foo'));
    unittest.expect(o.episodeAltId, unittest.equals('foo'));
    unittest.expect(o.episodeNumber, unittest.equals('foo'));
    unittest.expect(o.episodeTitleInternalAlias, unittest.equals('foo'));
    unittest.expect(o.formatProfile, unittest.equals('foo'));
    unittest.expect(o.licenseType, unittest.equals('foo'));
    checkUnnamed3020(o.pphNames);
    unittest.expect(o.priceType, unittest.equals('foo'));
    unittest.expect(o.priceValue, unittest.equals('foo'));
    unittest.expect(o.productId, unittest.equals('foo'));
    unittest.expect(o.ratingReason, unittest.equals('foo'));
    unittest.expect(o.ratingSystem, unittest.equals('foo'));
    unittest.expect(o.ratingValue, unittest.equals('foo'));
    unittest.expect(o.releaseDate, unittest.equals('foo'));
    unittest.expect(o.seasonAltId, unittest.equals('foo'));
    unittest.expect(o.seasonNumber, unittest.equals('foo'));
    unittest.expect(o.seasonTitleInternalAlias, unittest.equals('foo'));
    unittest.expect(o.seriesAltId, unittest.equals('foo'));
    unittest.expect(o.seriesTitleInternalAlias, unittest.equals('foo'));
    unittest.expect(o.start, unittest.equals('foo'));
    unittest.expect(o.storeLanguage, unittest.equals('foo'));
    unittest.expect(o.suppressionLiftDate, unittest.equals('foo'));
    unittest.expect(o.territory, unittest.equals('foo'));
    unittest.expect(o.titleInternalAlias, unittest.equals('foo'));
    unittest.expect(o.videoId, unittest.equals('foo'));
    unittest.expect(o.workType, unittest.equals('foo'));
  }
  buildCounterAvail--;
}

buildUnnamed3021() {
  var o = new core.List<api.Avail>();
  o.add(buildAvail());
  o.add(buildAvail());
  return o;
}

checkUnnamed3021(core.List<api.Avail> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAvail(o[0]);
  checkAvail(o[1]);
}

core.int buildCounterListAvailsResponse = 0;
buildListAvailsResponse() {
  var o = new api.ListAvailsResponse();
  buildCounterListAvailsResponse++;
  if (buildCounterListAvailsResponse < 3) {
    o.avails = buildUnnamed3021();
    o.nextPageToken = "foo";
    o.totalSize = 42;
  }
  buildCounterListAvailsResponse--;
  return o;
}

checkListAvailsResponse(api.ListAvailsResponse o) {
  buildCounterListAvailsResponse++;
  if (buildCounterListAvailsResponse < 3) {
    checkUnnamed3021(o.avails);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.totalSize, unittest.equals(42));
  }
  buildCounterListAvailsResponse--;
}

buildUnnamed3022() {
  var o = new core.List<api.Order>();
  o.add(buildOrder());
  o.add(buildOrder());
  return o;
}

checkUnnamed3022(core.List<api.Order> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOrder(o[0]);
  checkOrder(o[1]);
}

core.int buildCounterListOrdersResponse = 0;
buildListOrdersResponse() {
  var o = new api.ListOrdersResponse();
  buildCounterListOrdersResponse++;
  if (buildCounterListOrdersResponse < 3) {
    o.nextPageToken = "foo";
    o.orders = buildUnnamed3022();
    o.totalSize = 42;
  }
  buildCounterListOrdersResponse--;
  return o;
}

checkListOrdersResponse(api.ListOrdersResponse o) {
  buildCounterListOrdersResponse++;
  if (buildCounterListOrdersResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed3022(o.orders);
    unittest.expect(o.totalSize, unittest.equals(42));
  }
  buildCounterListOrdersResponse--;
}

buildUnnamed3023() {
  var o = new core.List<api.StoreInfo>();
  o.add(buildStoreInfo());
  o.add(buildStoreInfo());
  return o;
}

checkUnnamed3023(core.List<api.StoreInfo> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkStoreInfo(o[0]);
  checkStoreInfo(o[1]);
}

core.int buildCounterListStoreInfosResponse = 0;
buildListStoreInfosResponse() {
  var o = new api.ListStoreInfosResponse();
  buildCounterListStoreInfosResponse++;
  if (buildCounterListStoreInfosResponse < 3) {
    o.nextPageToken = "foo";
    o.storeInfos = buildUnnamed3023();
    o.totalSize = 42;
  }
  buildCounterListStoreInfosResponse--;
  return o;
}

checkListStoreInfosResponse(api.ListStoreInfosResponse o) {
  buildCounterListStoreInfosResponse++;
  if (buildCounterListStoreInfosResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed3023(o.storeInfos);
    unittest.expect(o.totalSize, unittest.equals(42));
  }
  buildCounterListStoreInfosResponse--;
}

buildUnnamed3024() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3024(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterOrder = 0;
buildOrder() {
  var o = new api.Order();
  buildCounterOrder++;
  if (buildCounterOrder < 3) {
    o.approvedTime = "foo";
    o.channelId = "foo";
    o.channelName = "foo";
    o.countries = buildUnnamed3024();
    o.customId = "foo";
    o.earliestAvailStartTime = "foo";
    o.episodeName = "foo";
    o.legacyPriority = "foo";
    o.name = "foo";
    o.normalizedPriority = "foo";
    o.orderId = "foo";
    o.orderedTime = "foo";
    o.pphName = "foo";
    o.priority = 42.0;
    o.receivedTime = "foo";
    o.rejectionNote = "foo";
    o.seasonName = "foo";
    o.showName = "foo";
    o.status = "foo";
    o.statusDetail = "foo";
    o.studioName = "foo";
    o.type = "foo";
    o.videoId = "foo";
  }
  buildCounterOrder--;
  return o;
}

checkOrder(api.Order o) {
  buildCounterOrder++;
  if (buildCounterOrder < 3) {
    unittest.expect(o.approvedTime, unittest.equals('foo'));
    unittest.expect(o.channelId, unittest.equals('foo'));
    unittest.expect(o.channelName, unittest.equals('foo'));
    checkUnnamed3024(o.countries);
    unittest.expect(o.customId, unittest.equals('foo'));
    unittest.expect(o.earliestAvailStartTime, unittest.equals('foo'));
    unittest.expect(o.episodeName, unittest.equals('foo'));
    unittest.expect(o.legacyPriority, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.normalizedPriority, unittest.equals('foo'));
    unittest.expect(o.orderId, unittest.equals('foo'));
    unittest.expect(o.orderedTime, unittest.equals('foo'));
    unittest.expect(o.pphName, unittest.equals('foo'));
    unittest.expect(o.priority, unittest.equals(42.0));
    unittest.expect(o.receivedTime, unittest.equals('foo'));
    unittest.expect(o.rejectionNote, unittest.equals('foo'));
    unittest.expect(o.seasonName, unittest.equals('foo'));
    unittest.expect(o.showName, unittest.equals('foo'));
    unittest.expect(o.status, unittest.equals('foo'));
    unittest.expect(o.statusDetail, unittest.equals('foo'));
    unittest.expect(o.studioName, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.videoId, unittest.equals('foo'));
  }
  buildCounterOrder--;
}

buildUnnamed3025() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3025(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3026() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3026(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3027() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3027(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterStoreInfo = 0;
buildStoreInfo() {
  var o = new api.StoreInfo();
  buildCounterStoreInfo++;
  if (buildCounterStoreInfo < 3) {
    o.audioTracks = buildUnnamed3025();
    o.country = "foo";
    o.editLevelEidr = "foo";
    o.episodeNumber = "foo";
    o.hasAudio51 = true;
    o.hasEstOffer = true;
    o.hasHdOffer = true;
    o.hasInfoCards = true;
    o.hasSdOffer = true;
    o.hasVodOffer = true;
    o.liveTime = "foo";
    o.mid = "foo";
    o.name = "foo";
    o.pphNames = buildUnnamed3026();
    o.seasonId = "foo";
    o.seasonName = "foo";
    o.seasonNumber = "foo";
    o.showId = "foo";
    o.showName = "foo";
    o.studioName = "foo";
    o.subtitles = buildUnnamed3027();
    o.titleLevelEidr = "foo";
    o.trailerId = "foo";
    o.type = "foo";
    o.videoId = "foo";
  }
  buildCounterStoreInfo--;
  return o;
}

checkStoreInfo(api.StoreInfo o) {
  buildCounterStoreInfo++;
  if (buildCounterStoreInfo < 3) {
    checkUnnamed3025(o.audioTracks);
    unittest.expect(o.country, unittest.equals('foo'));
    unittest.expect(o.editLevelEidr, unittest.equals('foo'));
    unittest.expect(o.episodeNumber, unittest.equals('foo'));
    unittest.expect(o.hasAudio51, unittest.isTrue);
    unittest.expect(o.hasEstOffer, unittest.isTrue);
    unittest.expect(o.hasHdOffer, unittest.isTrue);
    unittest.expect(o.hasInfoCards, unittest.isTrue);
    unittest.expect(o.hasSdOffer, unittest.isTrue);
    unittest.expect(o.hasVodOffer, unittest.isTrue);
    unittest.expect(o.liveTime, unittest.equals('foo'));
    unittest.expect(o.mid, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed3026(o.pphNames);
    unittest.expect(o.seasonId, unittest.equals('foo'));
    unittest.expect(o.seasonName, unittest.equals('foo'));
    unittest.expect(o.seasonNumber, unittest.equals('foo'));
    unittest.expect(o.showId, unittest.equals('foo'));
    unittest.expect(o.showName, unittest.equals('foo'));
    unittest.expect(o.studioName, unittest.equals('foo'));
    checkUnnamed3027(o.subtitles);
    unittest.expect(o.titleLevelEidr, unittest.equals('foo'));
    unittest.expect(o.trailerId, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.videoId, unittest.equals('foo'));
  }
  buildCounterStoreInfo--;
}

buildUnnamed3028() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3028(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3029() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3029(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3030() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3030(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3031() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3031(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3032() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3032(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3033() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3033(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3034() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3034(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3035() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3035(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3036() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3036(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3037() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3037(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3038() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3038(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3039() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3039(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3040() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3040(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3041() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3041(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed3042() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed3042(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}


main() {
  unittest.group("obj-schema-Avail", () {
    unittest.test("to-json--from-json", () {
      var o = buildAvail();
      var od = new api.Avail.fromJson(o.toJson());
      checkAvail(od);
    });
  });


  unittest.group("obj-schema-ListAvailsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListAvailsResponse();
      var od = new api.ListAvailsResponse.fromJson(o.toJson());
      checkListAvailsResponse(od);
    });
  });


  unittest.group("obj-schema-ListOrdersResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListOrdersResponse();
      var od = new api.ListOrdersResponse.fromJson(o.toJson());
      checkListOrdersResponse(od);
    });
  });


  unittest.group("obj-schema-ListStoreInfosResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListStoreInfosResponse();
      var od = new api.ListStoreInfosResponse.fromJson(o.toJson());
      checkListStoreInfosResponse(od);
    });
  });


  unittest.group("obj-schema-Order", () {
    unittest.test("to-json--from-json", () {
      var o = buildOrder();
      var od = new api.Order.fromJson(o.toJson());
      checkOrder(od);
    });
  });


  unittest.group("obj-schema-StoreInfo", () {
    unittest.test("to-json--from-json", () {
      var o = buildStoreInfo();
      var od = new api.StoreInfo.fromJson(o.toJson());
      checkStoreInfo(od);
    });
  });


  unittest.group("resource-AccountsAvailsResourceApi", () {
    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AccountsAvailsResourceApi res = new api.PlaymoviespartnerApi(mock).accounts.avails;
      var arg_accountId = "foo";
      var arg_availId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("v1/accounts/"));
        pathOffset += 12;
        index = path.indexOf("/avails/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("/avails/"));
        pathOffset += 8;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_availId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAvail());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_accountId, arg_availId).then(unittest.expectAsync(((api.Avail response) {
        checkAvail(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.AccountsAvailsResourceApi res = new api.PlaymoviespartnerApi(mock).accounts.avails;
      var arg_accountId = "foo";
      var arg_pageSize = 42;
      var arg_pageToken = "foo";
      var arg_pphNames = buildUnnamed3028();
      var arg_studioNames = buildUnnamed3029();
      var arg_title = "foo";
      var arg_territories = buildUnnamed3030();
      var arg_altId = "foo";
      var arg_videoIds = buildUnnamed3031();
      var arg_altIds = buildUnnamed3032();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("v1/accounts/"));
        pathOffset += 12;
        index = path.indexOf("/avails", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7), unittest.equals("/avails"));
        pathOffset += 7;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(core.int.parse(queryMap["pageSize"].first), unittest.equals(arg_pageSize));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(queryMap["pphNames"], unittest.equals(arg_pphNames));
        unittest.expect(queryMap["studioNames"], unittest.equals(arg_studioNames));
        unittest.expect(queryMap["title"].first, unittest.equals(arg_title));
        unittest.expect(queryMap["territories"], unittest.equals(arg_territories));
        unittest.expect(queryMap["altId"].first, unittest.equals(arg_altId));
        unittest.expect(queryMap["videoIds"], unittest.equals(arg_videoIds));
        unittest.expect(queryMap["altIds"], unittest.equals(arg_altIds));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListAvailsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_accountId, pageSize: arg_pageSize, pageToken: arg_pageToken, pphNames: arg_pphNames, studioNames: arg_studioNames, title: arg_title, territories: arg_territories, altId: arg_altId, videoIds: arg_videoIds, altIds: arg_altIds).then(unittest.expectAsync(((api.ListAvailsResponse response) {
        checkListAvailsResponse(response);
      })));
    });

  });


  unittest.group("resource-AccountsOrdersResourceApi", () {
    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AccountsOrdersResourceApi res = new api.PlaymoviespartnerApi(mock).accounts.orders;
      var arg_accountId = "foo";
      var arg_orderId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("v1/accounts/"));
        pathOffset += 12;
        index = path.indexOf("/orders/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("/orders/"));
        pathOffset += 8;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_orderId"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOrder());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_accountId, arg_orderId).then(unittest.expectAsync(((api.Order response) {
        checkOrder(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.AccountsOrdersResourceApi res = new api.PlaymoviespartnerApi(mock).accounts.orders;
      var arg_accountId = "foo";
      var arg_pageSize = 42;
      var arg_pageToken = "foo";
      var arg_pphNames = buildUnnamed3033();
      var arg_studioNames = buildUnnamed3034();
      var arg_name = "foo";
      var arg_status = buildUnnamed3035();
      var arg_customId = "foo";
      var arg_videoIds = buildUnnamed3036();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("v1/accounts/"));
        pathOffset += 12;
        index = path.indexOf("/orders", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7), unittest.equals("/orders"));
        pathOffset += 7;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(core.int.parse(queryMap["pageSize"].first), unittest.equals(arg_pageSize));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(queryMap["pphNames"], unittest.equals(arg_pphNames));
        unittest.expect(queryMap["studioNames"], unittest.equals(arg_studioNames));
        unittest.expect(queryMap["name"].first, unittest.equals(arg_name));
        unittest.expect(queryMap["status"], unittest.equals(arg_status));
        unittest.expect(queryMap["customId"].first, unittest.equals(arg_customId));
        unittest.expect(queryMap["videoIds"], unittest.equals(arg_videoIds));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListOrdersResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_accountId, pageSize: arg_pageSize, pageToken: arg_pageToken, pphNames: arg_pphNames, studioNames: arg_studioNames, name: arg_name, status: arg_status, customId: arg_customId, videoIds: arg_videoIds).then(unittest.expectAsync(((api.ListOrdersResponse response) {
        checkListOrdersResponse(response);
      })));
    });

  });


  unittest.group("resource-AccountsStoreInfosResourceApi", () {
    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.AccountsStoreInfosResourceApi res = new api.PlaymoviespartnerApi(mock).accounts.storeInfos;
      var arg_accountId = "foo";
      var arg_pageSize = 42;
      var arg_pageToken = "foo";
      var arg_pphNames = buildUnnamed3037();
      var arg_studioNames = buildUnnamed3038();
      var arg_videoId = "foo";
      var arg_countries = buildUnnamed3039();
      var arg_name = "foo";
      var arg_videoIds = buildUnnamed3040();
      var arg_mids = buildUnnamed3041();
      var arg_seasonIds = buildUnnamed3042();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("v1/accounts/"));
        pathOffset += 12;
        index = path.indexOf("/storeInfos", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("/storeInfos"));
        pathOffset += 11;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(core.int.parse(queryMap["pageSize"].first), unittest.equals(arg_pageSize));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(queryMap["pphNames"], unittest.equals(arg_pphNames));
        unittest.expect(queryMap["studioNames"], unittest.equals(arg_studioNames));
        unittest.expect(queryMap["videoId"].first, unittest.equals(arg_videoId));
        unittest.expect(queryMap["countries"], unittest.equals(arg_countries));
        unittest.expect(queryMap["name"].first, unittest.equals(arg_name));
        unittest.expect(queryMap["videoIds"], unittest.equals(arg_videoIds));
        unittest.expect(queryMap["mids"], unittest.equals(arg_mids));
        unittest.expect(queryMap["seasonIds"], unittest.equals(arg_seasonIds));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListStoreInfosResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_accountId, pageSize: arg_pageSize, pageToken: arg_pageToken, pphNames: arg_pphNames, studioNames: arg_studioNames, videoId: arg_videoId, countries: arg_countries, name: arg_name, videoIds: arg_videoIds, mids: arg_mids, seasonIds: arg_seasonIds).then(unittest.expectAsync(((api.ListStoreInfosResponse response) {
        checkListStoreInfosResponse(response);
      })));
    });

  });


  unittest.group("resource-AccountsStoreInfosCountryResourceApi", () {
    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AccountsStoreInfosCountryResourceApi res = new api.PlaymoviespartnerApi(mock).accounts.storeInfos.country;
      var arg_accountId = "foo";
      var arg_videoId = "foo";
      var arg_country = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("v1/accounts/"));
        pathOffset += 12;
        index = path.indexOf("/storeInfos/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/storeInfos/"));
        pathOffset += 12;
        index = path.indexOf("/country/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_videoId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/country/"));
        pathOffset += 9;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_country"));

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildStoreInfo());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_accountId, arg_videoId, arg_country).then(unittest.expectAsync(((api.StoreInfo response) {
        checkStoreInfo(response);
      })));
    });

  });


}

