//
//  WeatherModel.swift
//  TestApp
//
//  Created by takemura on 2018/02/22.
//  Copyright © 2018年 takemura. All rights reserved.
//

struct WeatherDescription: Codable {
    let text: String
    let publicTime: String
}

struct WeatherLocation: Codable {
    let city: String
    let area: String
    let prefecture: String
}

struct WeatherImage: Codable {
    let width: Int
    let height: Int
    let title: String
    let url: String
}

struct Temperature: Codable {
    let celsius: String
    let fahrenheit: String
}

struct TemperatureCollection: Codable {
    let min: Temperature?
    let max: Temperature?
}

struct Forecast: Codable {
    let dateLabel: String
    let telop: String
    let date: String
    let temperature: TemperatureCollection
    let image: WeatherImage
}

struct WeatherNews: Codable {
    let title: String
    let publicTime: String
    let foreccasts: [Forecast]
    let location: WeatherLocation
    let description: WeatherDescription
}

