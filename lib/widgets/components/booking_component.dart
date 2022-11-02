import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:althouraya/constants.dart';
import 'package:althouraya/infrastructure/utils.dart';
import 'package:althouraya/size_config.dart';
import 'package:althouraya/widgets/base_widget.dart';
import 'package:althouraya/widgets/components/custom_button.dart';
import 'package:althouraya/widgets/components/custom_text.dart';
import 'package:althouraya/widgets/components/price_tag.dart';
import 'package:althouraya/widgets/components/rentx_circle_image.dart';

class BookingCardWidget extends StatelessWidget {
  const BookingCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RentXWidget(
        builder: (rentxcontext) => GestureDetector(
              onTap: () {
                // rentxcontext.route((context) => BookingDetailsScreen());
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: width(16),
                  vertical: height(16),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: rentxcontext.theme.customTheme.onPrimary,
                  boxShadow: [boxShadow],
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RentXCircleImage(
                          imageSrc:
                              "https://th.bing.com/th/id/R.95e45a66c918a53280e796b44add2d66?rik=oVKQ59XBdewj8Q&pid=ImgRaw&r=0",
                          avatarLetters:
                              NameUtil.getInitials("Mohamed", "Mounir"),
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
                                text: "Mohamed Mounir",
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: height(5),
                              ),
                              CustomText(
                                color: rentxcontext.theme.customTheme.headline3,
                                fontSize: width(14),
                                text: "Muscat Dhow Cruise",
                              ),
                              SizedBox(
                                height: height(10),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/calendar.svg",
                                    color:
                                        rentxcontext.theme.customTheme.primary,
                                  ),
                                  SizedBox(
                                    width: width(8),
                                  ),
                                  CustomText(
                                    color: rentxcontext
                                        .theme.customTheme.headline2,
                                    fontSize: width(14),
                                    text: DateUtil.displayTimeRange(
                                      from:
                                          const TimeOfDay(hour: 14, minute: 43),
                                      to: TimeOfDay.now(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1.3,
                    ),
                    SizedBox(
                      height: height(10),
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: PriceTag(
                            price: "920",
                            duration: "person",
                            showDuration: true,
                          ),
                        ),
                        CustomButton(
                          fontSize: width(12),
                          function: () {},
                          text: "Tour Details",
                          btnWidth: width(100),
                          btnHeight: height(30),
                        ),
                        /*Expanded(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/img/location.svg",
                                color: rentxcontext.theme.customTheme.primary,
                              ),
                              SizedBox(
                                width: width(5),
                              ),
                              Expanded(
                                child: CustomText(
                                  fontSize: width(12),
                                  text: "Ashrafya compund, Fifth district",
                                  color:
                                      rentxcontext.theme.customTheme.headline3,
                                ),
                              ),
                            ],
                          ),
                        )*/
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
}
