class CarouselItem {
  final String image;
  final String text;
  CarouselItem({required this.image, required this.text});
}

List<CarouselItem> carouselItems = [
  CarouselItem(
    image: 'assets/utils/easy.png',
    text: 'Make your life easier',
  ),
  CarouselItem(
    image: 'assets/utils/organize.png',
    text: 'Write your task in an organize way',
  ),
  CarouselItem(
    image: 'assets/utils/time.png',
    text: 'Manage your time properly',
  ),
];
