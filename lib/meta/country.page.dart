import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:save_me_vpn/app/constants.dart';
import 'package:save_me_vpn/meta/home.page.dart';

class CountryPage extends StatelessWidget {
  const CountryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: bgColor));

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBottomBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
          child: LayoutBuilder(builder: (context, constraints) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.03,
                  ),
                  SearchBar(
                    constraints: constraints,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.05,
                  ),
                  Text(
                    "Select your country",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: constraints.maxHeight * 0.035),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.03,
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: LocationListTile(
                            constraints: constraints,
                            data: data.elementAt(index)),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class LocationListTile extends StatelessWidget {
  const LocationListTile({
    Key? key,
    required this.constraints,
    required this.data,
  }) : super(key: key);

  final BoxConstraints constraints;
  final CountryData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: constraints.maxHeight * 0.1,
      width: constraints.maxWidth * 0.85,
      decoration: BoxDecoration(
          color: canvasColor, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              height: constraints.maxHeight * 0.02,
              margin: const EdgeInsets.symmetric(vertical: 10),
              // width: constraints.maxWidth * 0.12,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: data.flag,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            data.countryName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          Icon(
            CupertinoIcons.dot_radiowaves_left_right,
            color: data.isSelected ? buttonColor : Colors.grey,
          )
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, required this.constraints}) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: constraints.maxHeight * 0.085,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: canvasColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: const [
          Icon(Iconsax.search_normal, color: Colors.grey),
          SizedBox(
            width: 15,
          ),
          Text(
            "Search your Country",
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}

class CountryData {
  final String countryName;
  final Flag flag;
  final bool isSelected;

  CountryData(
      {required this.countryName,
      required this.flag,
      required this.isSelected});
}

List<CountryData> data = [
  CountryData(
      countryName: "India",
      flag: Flag.fromCode(
        FlagsCode.IN,
        fit: BoxFit.fill,
      ),
      isSelected: true),
  CountryData(
      countryName: "Netherlands",
      flag: Flag.fromCode(
        FlagsCode.NL,
        fit: BoxFit.fill,
      ),
      isSelected: false),
  CountryData(
      countryName: "Italy",
      flag: Flag.fromCode(
        FlagsCode.IT,
        fit: BoxFit.fill,
      ),
      isSelected: false),
  CountryData(
      countryName: "Ireland",
      flag: Flag.fromCode(
        FlagsCode.IL,
        fit: BoxFit.fill,
      ),
      isSelected: false),
  CountryData(
      countryName: "Poland",
      flag: Flag.fromCode(
        FlagsCode.PL,
        fit: BoxFit.fill,
      ),
      isSelected: false),
  CountryData(
      countryName: "Korea",
      flag: Flag.fromCode(
        FlagsCode.KR,
        fit: BoxFit.fill,
      ),
      isSelected: false),
  CountryData(
      countryName: "Austria",
      flag: Flag.fromCode(
        FlagsCode.AT,
        fit: BoxFit.fill,
      ),
      isSelected: false),
  CountryData(
      countryName: "Turkey",
      flag: Flag.fromCode(
        FlagsCode.TR,
        fit: BoxFit.fill,
      ),
      isSelected: false),
  CountryData(
      countryName: "Britan",
      flag: Flag.fromCode(
        FlagsCode.BR,
        fit: BoxFit.fill,
      ),
      isSelected: false),
];
