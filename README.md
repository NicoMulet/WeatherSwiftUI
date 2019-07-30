# WeatherSwiftUI

This application is a SwiftUI implementation of the iOS Weather app.
It currently runs on iOS but the goal is to run on macOS and iPadOS too.

<p float="left">
  <image src="https://user-images.githubusercontent.com/22772021/62136090-b1187080-b2e3-11e9-87ed-6675fc9752eb.png" width="500"/>
</p>

## API

WeatherSwiftUI uses the [OpenWeather API](https://openweathermap.org) to fetch weather datas. It uses a free API key. So it only have a 3 hours forecast.

## SwiftUI

WeatherSwiftUI tries to be in pure SwiftUI but I had to use some UIKit (UIViewControllerRepresentable) for the PageViewController.

## TODO

- [x] Add all views for current and forecast weather
- [ ] Remove hardcoded cities
- [ ] Possibility to select your own city
- [ ] Change background
- [ ] macOS version
- [ ] iPadOS version
