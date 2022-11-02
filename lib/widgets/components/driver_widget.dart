import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:althouraya/constants.dart';
import 'package:althouraya/infrastructure/utils.dart';
import 'package:althouraya/models/user_model.dart';
import 'package:althouraya/size_config.dart';
import 'package:althouraya/widgets/base_widget.dart';
import 'package:althouraya/widgets/components/custom_text.dart';
import 'package:althouraya/widgets/components/rentx_circle_image.dart';

class DriverCardWidget extends StatelessWidget {
  const DriverCardWidget(
      {Key? key, required this.userModel, this.isSeclected = false})
      : super(key: key);

  final UserModel userModel;
  final bool isSeclected;

  @override
  Widget build(BuildContext context) {
    return RentXWidget(
        builder: (rentxcontext) => Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: width(16),
                vertical: height(16),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: rentxcontext.theme.customTheme.onPrimary,
                border: Border.all(
                  color: isSeclected
                      ? rentxcontext.theme.customTheme.primary
                      : Colors.transparent,
                ),
                boxShadow: [boxShadow],
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RentXCircleImage(
                        imageSrc: userModel.profilePictureId,
                        avatarLetters: NameUtil.getInitials(
                            userModel.name, userModel.surname),
                      ),
                      SizedBox(
                        width: width(14),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              color: rentxcontext.theme.customTheme.headline,
                              fontSize: width(16),
                              text: userModel.getFullName(),
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: height(5),
                            ),
                            CustomText(
                              color: rentxcontext.theme.customTheme.headline3,
                              fontSize: width(14),
                              text: userModel.email!,
                            ),
                            SizedBox(
                              height: height(10),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/Calling.svg",
                                  color: rentxcontext.theme.customTheme.primary,
                                ),
                                SizedBox(
                                  width: width(8),
                                ),
                                CustomText(
                                  color:
                                      rentxcontext.theme.customTheme.headline2,
                                  fontSize: width(14),
                                  text: userModel.phoneNumber!,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height(20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        color: rentxcontext.theme.customTheme.headline3,
                        fontSize: width(14),
                        text: "Car Plate: ${userModel.carPlate.toString()}",
                      ),
                      CustomText(
                        color: rentxcontext.theme.customTheme.headline3,
                        fontSize: width(14),
                        text: "Car type: ${userModel.carType}",
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }
}
