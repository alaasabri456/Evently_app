import '../../core/resources/assets_manager.dart';

class OnBoardingModel{
  String image;
  String title;
  String subTitle;
  OnBoardingModel({required this.image,required this.title,required this.subTitle});
  static List<OnBoardingModel>onBoardingModels=[
    //OnBoardingModel(image: ImageAssets.onboarding1, title: "Personalize Your Experience", subTitle:"Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style."),
    OnBoardingModel(image: ImageAssets.onboarding2, title: "Find Events That Inspire You", subTitle: "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you."),
    OnBoardingModel(image: ImageAssets.onboarding3, title: "Effortless Event Planning", subTitle: "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests."),
    OnBoardingModel(image: ImageAssets.onboarding4, title: "Connect with Friends & Share Moments", subTitle: "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories."),

  ];
}