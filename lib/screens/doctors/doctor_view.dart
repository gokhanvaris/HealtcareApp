import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_app/utils/constants.dart';
import 'package:healthcare_app/widgets/custom_sizedbox.dart';

class DoctorView extends StatelessWidget {
  const DoctorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(color: Color(0xfffcfbff)),
                child: CircleAvatar(
                  radius: 16.0,
                  backgroundColor: Colors.lightBlue[100],
                  child: ClipRRect(
                    child: Image.asset('assets/images/doctor.png'),
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                ),
              ),
            ),
            CustomSizedBox(height: 20),
            Text(
              'Dr. Mustafa UÇAN',
              style: KConstant.kTextStyle(FontWeight.bold, Colors.black, 24.0),
            ),
            Text(
              'Cardiologist',
              style: KConstant.kTextStyle(FontWeight.normal, Colors.grey, 18.0),
            ),
            CustomSizedBox(height: 20),
            buildInfoMenu(),
            CustomSizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Divider(
                indent: 16,
                color: Color(0xff9a9a9a).withOpacity(0.8),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 10.0),
              child: Row(
                children: [
                  Text(
                    'Achievement',
                    style:
                        KConstant.kTextStyle(FontWeight.bold, Colors.black, 18),
                  ).tr(),
                  CustomSizedBox(height: 10),
                ],
              ),
            ),
            Row(
              children: [
                buildInfoCard(Icons.people, '2000+', 'Patients'),
                buildInfoCard(
                    Icons.model_training_outlined, '10 Yrs', 'Experience'),
                buildInfoCard(Icons.star_border, '4.5+', 'Ratings'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'About',
                        style: KConstant.kTextStyle(
                            FontWeight.bold, Colors.black, 18),
                      ).tr(),
                    ],
                  ),
                  CustomSizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.lightBlue.withOpacity(.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: 150,
                      width: MediaQuery.of(context).size.width * 1.0,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Dr. Melvin Steve is a cardiologist and nationally recognized in Healthcare field. \nHe is an award winning and gold medalist in cardiology.\nHe have an experience around 10 years and treated many patients successfully.',
                          style: KConstant.kTextStyle(
                              FontWeight.normal, Colors.grey, 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomSizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildTimeCard(
                    'Available Today',
                    '10:00 AM - 5:00 PM',
                    Color(0x26febe3e),
                    'All Timing',
                    Color(0xfffebe3e),
                    Colors.white),
                buildTimeCard('Clinic Fees', '90 USD', Color(0xffeff8fd),
                    'Get %30 Discount', Color(0xd9ffffff), Color(0xff30b3ed)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 20.0),
              child: Row(
                children: [
                  Text(
                    'Contact Info',
                    style:
                        KConstant.kTextStyle(FontWeight.bold, Colors.black, 18),
                  ).tr(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 20.0),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[100],
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Icon(
                      Icons.call,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    'mustafaucan.cardiocenter@gmail.com',
                    style: KConstant.kTextStyle(
                        FontWeight.normal, Colors.grey, 14.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 20.0),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[100],
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Icon(
                      Icons.gps_fixed,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    '2056, Vacaville new city Zone.\nAnkara,Turkey',
                    style: KConstant.kTextStyle(
                        FontWeight.normal, Colors.grey, 14.0),
                  ),
                ],
              ),
            ),
            CustomSizedBox(height: 20),
            Container(
              width: 338,
              height: 58,
              decoration: BoxDecoration(
                color: Color(0xff30b3ed),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Text(
                  'Book An Appointment',
                  style: KConstant.kTextStyle(
                      FontWeight.normal, Colors.white, 14.0),
                ).tr(),
              ),
            ),
            CustomSizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Padding buildTimeCard(
    String title,
    String info,
    Color color,
    String buttonTitle,
    Color buttonColor,
    Color textColor,
  ) {
    return Padding(
      padding: const EdgeInsets.all(KConstant.kHomePadding),
      child: Row(
        children: [
          Container(
            width: 164,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: color, // Color(0x26febe3e),
              border: Border.all(
                color: color,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(KConstant.kHomePadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: KConstant.kTextStyle(
                        FontWeight.bold, Colors.black, 14.0),
                  ).tr(),
                  CustomSizedBox(height: 5),
                  Text(
                    info,
                    style: KConstant.kTextStyle(
                        FontWeight.normal, Colors.grey, 14.0),
                  ),
                  CustomSizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius:
                            BorderRadius.circular(10.0) // Color(0xfffebe3e),
                        ),
                    width: 150,
                    height: 26,
                    child: Center(
                        child: Text(
                      buttonTitle,
                      style: KConstant.kTextStyle(
                          FontWeight.normal, textColor, 14.0),
                    ).tr()),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildInfoCard(IconData icon, String count, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 20.0, right: 10.0),
      child: Row(
        children: [
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0f0d345c),
                  offset: Offset(0, 0),
                  blurRadius: 18,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.lightBlue,
                ),
                CustomSizedBox(height: 15),
                Text(
                  count,
                  style:
                      KConstant.kTextStyle(FontWeight.bold, Colors.black, 14.0),
                ).tr(),
                CustomSizedBox(height: 1),
                Text(
                  title,
                  style:
                      KConstant.kTextStyle(FontWeight.normal, Colors.grey, 12),
                ).tr(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row buildInfoMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.lightBlue[50],
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.messenger,
              color: Colors.blue,
            ),
          ),
        ),
        SizedBox(width: 20),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.orange[50],
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.call,
              color: Colors.orange,
            ),
          ),
        ),
        SizedBox(width: 20),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.pink[100],
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.video_call,
              color: Colors.pinkAccent,
            ),
          ),
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: const Color(0xfffcfbff),
      leading: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      actions: const [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.menu_open,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
