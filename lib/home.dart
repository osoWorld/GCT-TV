import 'package:flutter/material.dart';
import 'package:gct_tv/playvideo.dart';
import 'package:gct_tv/utils/constants/colors.dart';
import 'package:gct_tv/utils/constants/image_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            const Text(
              "GCT",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black),
            ),
            const SizedBox(height: 6,),
            RichText(
                text: const TextSpan(children: [
              TextSpan(text: "Watch ", style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: "Live Channel, News",
                  style: TextStyle(color: Colors.redAccent)),
              TextSpan(text: " share with others and have fun.", style: TextStyle(color: Colors.black))
            ])),
            Expanded(
              child: Image.asset(
                GCTImages.mainTV,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const VideoScreen(),
                          )),
                      child: Container(
                        height: 130,
                        width: 160,
                        decoration: BoxDecoration(
                          color: GCTColors.myRed,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 42,
                                width: 42,
                                decoration: BoxDecoration(
                                    color: GCTColors.myRedLight,
                                    borderRadius: BorderRadius.circular(25)),
                                child: Padding(
                                  padding: const EdgeInsets.all(11),
                                  child: Image.asset(
                                    GCTImages.news2Icon,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12,),
                              const Text("Watch News", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              const SizedBox(height: 4,),
                              const Text("Get to the latest news", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12),),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24,),

                    Container(
                      height: 115,
                      width: 160,
                      decoration: BoxDecoration(
                        color: GCTColors.myBlue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                  color: GCTColors.myBlueLight,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Image.asset(
                                  GCTImages.ratingIconBold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12,),
                            const Text("Rate Us", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),),
                            const SizedBox(height: 4,),
                            const Text("Share Your Reviews", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 10),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20,),

                Column(
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const VideoScreen(),
                          )),
                      child: Container(
                        height: 115,
                        width: 160,
                        decoration: BoxDecoration(
                          color: GCTColors.myYellow,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 36,
                                width: 36,
                                decoration: BoxDecoration(
                                    color: GCTColors.myYellowLight,
                                    borderRadius: BorderRadius.circular(25)),
                                child: Padding(
                                  padding: const EdgeInsets.all(9),
                                  child: Image.asset(
                                    GCTImages.live2Icon,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12,),
                              const Text("Live Channel", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),),
                              const SizedBox(height: 4,),
                              const Text("Watch Latest Tv", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 10),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24,),

                    Container(
                      height: 130,
                      width: 160,
                      decoration: BoxDecoration(
                        color: GCTColors.myGreen,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 42,
                              width: 42,
                              decoration: BoxDecoration(
                                  color: GCTColors.myGreenLight,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Padding(
                                padding: const EdgeInsets.all(11),
                                child: Image.asset(
                                  GCTImages.shareIcon,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12,),
                            const Text("Share App", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            const SizedBox(height: 4,),
                            const Text("Share With Others", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12),),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}