import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:save_me_vpn/app/constants.dart';
import 'package:save_me_vpn/app/state/is_active.provider.dart';
import 'package:save_me_vpn/meta/country.page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Save Me VPN",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
      body: LayoutBuilder(builder: (context, constraints) {
        return Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CountryPage(),
                      ));
                },
                child: LocationContainer(
                  constraints: constraints,
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.08,
              ),
              SwitchButton(
                constraints: constraints,
              ),
              SizedBox(
                height: constraints.maxHeight * 0.06,
              ),
              const Text.rich(
                  TextSpan(style: TextStyle(fontSize: 18), children: [
                TextSpan(
                    text: "Username:  ", style: TextStyle(color: Colors.grey)),
                TextSpan(
                    text: "@me__aabir_k",
                    style: TextStyle(color: Colors.white)),
              ])),
              const SizedBox(
                height: 5,
              ),
              const Text.rich(
                  TextSpan(style: TextStyle(fontSize: 16), children: [
                TextSpan(
                    text: "Expiration Date:  ",
                    style: TextStyle(color: Colors.grey)),
                TextSpan(
                    text: "10/16/2022", style: TextStyle(color: Colors.white)),
              ])),
              SizedBox(
                height: constraints.maxHeight * 0.08,
              ),
              const Text(
                "Report Problem",
                style: TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                    fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: constraints.maxHeight * 0.09,
                width: constraints.maxWidth * 0.85,
                decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Iconsax.card),
                      const SizedBox(width: 10),
                      Text(
                        "Purchase Details",
                        style:
                            TextStyle(fontSize: constraints.maxHeight * 0.025),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

class SwitchButton extends StatelessWidget {
  const SwitchButton({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: constraints.maxHeight * 0.18,
      backgroundColor: canvasColor,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: constraints.maxHeight * 0.28,
        width: constraints.maxHeight * 0.28,
        decoration: BoxDecoration(
            color: context.watch<IsActive>().isActive ? buttonColor : bgColor,
            shape: BoxShape.circle),
        child: Center(
          child: GestureDetector(
            onTap: () {
              context.read<IsActive>().changeActiveState();
            },
            child: CircleAvatar(
              backgroundColor: locationBarColor,
              radius: constraints.maxHeight * 0.08,
              child: Icon(
                CupertinoIcons.power,
                color: Colors.white,
                size: constraints.maxHeight * 0.08,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(
            Iconsax.home,
            color: buttonColor,
          ),
          Icon(
            Iconsax.bag,
            color: Colors.grey,
          ),
          Icon(
            Iconsax.repeat,
            color: Colors.grey,
          ),
          Icon(
            Iconsax.setting,
            color: Colors.grey,
          ),
          Icon(
            Iconsax.card,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class LocationContainer extends StatelessWidget {
  const LocationContainer({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: constraints.maxHeight * 0.1,
      width: constraints.maxWidth * 0.85,
      decoration: BoxDecoration(
          color: locationBarColor, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              height: constraints.maxHeight * 0.02,
              margin: const EdgeInsets.symmetric(vertical: 10),
              // width: constraints.maxWidth * 0.12,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Flag.fromCode(
                FlagsCode.IN,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                "Auto Location",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "India",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Spacer(),
          const Icon(Iconsax.more)
        ],
      ),
    );
  }
}
