# WeatherSwiftUI

This application is a SwiftUI implementation of the iOS Weather app.
It currently runs on iOS but the goal is to run on macOS and iPadOS too.

<p float="left">
  <image src="https://user-images.githubusercontent.com/22772021/62471530-2335fd00-b79d-11e9-8ee8-f464d5aad186.png" width="300"/>
  <image src="https://user-images.githubusercontent.com/22772021/62471534-24672a00-b79d-11e9-85f1-992af7f05e21.png" width="300"/>
  <image src="https://user-images.githubusercontent.com/22772021/62471529-229d6680-b79d-11e9-810d-c1a84f4f05c5.png" width="300"/>
</p>

## API

WeatherSwiftUI uses the [OpenWeather API](https://openweathermap.org) to fetch weather datas. It uses a free API key thereby it only has a 3 hours and 5 days forecast.

## SwiftUI

WeatherSwiftUI tries to be in pure SwiftUI but I had to use some UIKit (UIViewControllerRepresentable) for the PageViewController.

## TODO

- [x] Add all views for current and forecast weather
- [ ] Remove hardcoded cities
- [x] Possibility to select your own city
- [ ] macOS version
- [ ] iPadOS version
