# WeatherSwiftUI

This application is a SwiftUI implementation of the iOS Weather app. 
All the background images of the iOS Weather app are not present at the moment, this could be a future improvement of this project. 
The app runs on iOS, macOS and iPadOS. The project will evolve with the different betas of Xcode and SwiftUI.

<p float="left">
  <image src="https://user-images.githubusercontent.com/22772021/62471530-2335fd00-b79d-11e9-8ee8-f464d5aad186.png" width="275"/>
  <image src="https://user-images.githubusercontent.com/22772021/62471534-24672a00-b79d-11e9-85f1-992af7f05e21.png" width="275"/>
  <image src="https://user-images.githubusercontent.com/22772021/62471529-229d6680-b79d-11e9-810d-c1a84f4f05c5.png" width="275"/>
</p>

<p float="left">
  <image src="https://user-images.githubusercontent.com/22772021/62767690-87a2d600-ba95-11e9-9619-b6c6d189e5c4.png" width="425"/>
  <image src="https://user-images.githubusercontent.com/22772021/62767685-870a3f80-ba95-11e9-9038-5cffda327f5b.png" width="425"/>
</p>

## Architecture

The project fits currently the MVVM pattern. As the project follows the different SwiftUI tutorials from Apple, `ViewModels` are called `Datas`.

## API

WeatherSwiftUI uses the [OpenWeather API](https://openweathermap.org) to fetch weather datas. It uses a free API key thereby it only has a 3 hours and 5 days forecast.

## SwiftUI

WeatherSwiftUI tries to be in pure SwiftUI but I had to use some UIKit (UIViewControllerRepresentable) for the PageViewController.
