import 'package:delivery_project/features/onboarding/data/model/onboarding_model.dart';

class OnboardingData {
  static List<OnboardingModel> data = [
    OnboardingModel(
      imagePath: 'assets/images/Character starve.png',
      title: """Don’t Starve, 
Just Order""",
      description:
          """Just order for your favorite food anytime, anywhere and receive your
  meal within a few minutes""",
    ),
    OnboardingModel(
      imagePath: 'assets/images/FILLED_OUTLINE.png',
      title: "Fast Delivery",
      description:
          """Find a Restaurant place your order and get it deliver to your location within few minutes.""",
    ),
    OnboardingModel(
      imagePath: 'assets/images/—Pngtree—anti-epidemic logistics chef_5416092.png',
      title: """Best Food App 
For You""",
      description:
          """Your No.1 favorite food app we’ve got you covered, with the most delicious food on the planet. You one click away to experience greatness. We’ve got all the magic of your favorite tastes right here, right now.""",
    ),
  ];
}
