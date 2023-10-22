class TrafficLightModel {
  final String name;
  final String image;
  final String description;

  TrafficLightModel(
      {required this.name, required this.image, required this.description});
}

//nepali
final List<TrafficLightModel> trafficLights = [
  TrafficLightModel(
    name: "रातो",
    image: "https://top20lists.net/wp-content/uploads/2023/09/red.png",
    description: "रोक्नुहोस्",
  ),
  TrafficLightModel(
    name: "पहेलो",
    image: "https://top20lists.net/wp-content/uploads/2023/09/orange.png",
    description: "तयार",
  ),
  TrafficLightModel(
    name: "हरियो",
    image: "https://top20lists.net/wp-content/uploads/2023/09/green.png",
    description: "जानुहोस्",
  ),
];
