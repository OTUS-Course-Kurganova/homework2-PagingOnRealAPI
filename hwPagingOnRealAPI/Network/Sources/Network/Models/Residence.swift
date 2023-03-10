//
// Residence.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Residence: Codable, JSONEncodable, Hashable {

    public var city: Translation?
    public var country: Translation?
    public var cityNow: TranslationWithSameas?
    public var countryNow: TranslationWithSameas?
    public var locationString: Translation?

    public init(city: Translation? = nil, country: Translation? = nil, cityNow: TranslationWithSameas? = nil, countryNow: TranslationWithSameas? = nil, locationString: Translation? = nil) {
        self.city = city
        self.country = country
        self.cityNow = cityNow
        self.countryNow = countryNow
        self.locationString = locationString
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case city
        case country
        case cityNow
        case countryNow
        case locationString
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(city, forKey: .city)
        try container.encodeIfPresent(country, forKey: .country)
        try container.encodeIfPresent(cityNow, forKey: .cityNow)
        try container.encodeIfPresent(countryNow, forKey: .countryNow)
        try container.encodeIfPresent(locationString, forKey: .locationString)
    }
}

