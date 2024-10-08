import 'package:ace/controller/mogak/mogak_detail_cotroller.dart';
import 'package:ace/models/mogak/mogak_model.dart';
import 'package:ace/routes/view_route.dart';
import 'package:ace/utils/colors.dart';
import 'package:ace/utils/typography.dart';
import 'package:ace/widgets/avatar_custom.dart';
import 'package:ace/widgets/card_tag.dart';
import 'package:ace/widgets/tag_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MogakContent extends GetView<MogakDetailController> {
  const MogakContent({this.data, this.maxLength, super.key});

  final AllMogakModel? data;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              contentPadding: EdgeInsets.only(left: 0),
              title: Row(
                children: [
                  AvatarCustom(
                    height: 48,
                    width: 43,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      data?.author?.nickname ?? "",
                      style: AppTypograpy.button28Bold,
                    ),
                  ),
                  Tag(title: '수료생'),
                ],
              ),
              trailing: InkWell(
                  onTap: () {},
                  child: SvgPicture.asset('assets/icons/icon20/like.svg')),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(ViewRoute.mogakDetail, arguments: data?.id);
                print('${data?.id}  제목 클릭');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: RichText(
                  text: TextSpan(
                      style: AppTypograpy.tapButtonCardTitle16,
                      children: [
                        TextSpan(
                            text: RegExp(r'\[.*?\]')
                                .firstMatch(data?.title ?? "")
                                ?.group(0),
                            style: TextStyle(color: AppColors.primaryColor)),
                        TextSpan(
                            text: (data?.title ?? "")
                                .replaceAll(RegExp(r'\[.*?\]'), ''),
                            style: TextStyle(color: Colors.black)),
                      ]),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(ViewRoute.mogakDetail, arguments: data?.id);
                print('${data?.id}   내용 클릭');
              },
              child: Text(
                data?.content ?? "",
                style: AppTypograpy.button36Regular,
                maxLines: maxLength ?? 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 0),
              trailing: Text(
                  data?.createdAt == null
                      ? ""
                      : "${data!.createdAt.year}.${data!.createdAt.month.toString().padLeft(2, '0')}.${data!.createdAt.day.toString().padLeft(2, '0')}",
                  style: AppTypograpy.cardBody.copyWith(
                    color: AppColors.neutral40,
                  )),
              title: Row(children: [
                SvgPicture.asset(
                  'assets/icons/icon70/man-who.svg',
                  height: 25,
                  width: 25,
                ),
                SizedBox(
                  width: 6,
                ),
                RichText(
                  text: TextSpan(style: AppTypograpy.cardBody, children: [
                    TextSpan(
                        text: data?.appliedProfiles?.length.toString() ?? "0",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '/',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: data?.maxMember.toString() ?? "",
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: ' 참여', style: TextStyle(color: Colors.black)),
                  ]),
                ),
              ]),
            ),
            TagsRow(
              tagsString: (data?.hashtag?.trim().isEmpty ?? true)
                  ? "#태그없음"
                  : data!.hashtag!,
            ),
          ]),
    );
  }
}
