//
// NobelPrizePerLaureate.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Description of the Nobel Prize by Laureate */
public struct NobelPrizePerLaureate: Codable, JSONEncodable, Hashable {

    public enum SortOrder: String, Codable, CaseIterable {
        case _1 = "1"
        case _2 = "2"
        case _3 = "3"
    }
    public enum Portion: String, Codable, CaseIterable {
        case _1 = "1"
        case _12 = "1/2"
        case _13 = "1/3"
        case _14 = "1/4"
    }
    public enum PrizeStatus: String, Codable, CaseIterable {
        case received = "received"
        case declined = "declined"
        case restricted = "restricted"
    }
    public var awardYear: Int?
    public var category: Translation?
    public var categoryFullName: Translation?
    public var sortOrder: SortOrder? = ._1
    public var portion: Portion? = ._1
    public var dateAwarded: Date?
    public var prizeStatus: PrizeStatus?
    public var motivation: Translation?
    /** Prize amount given at the year of the award */
    public var prizeAmount: Int?
    /** Prize amount adjusted according to Index number yearly average */
    public var prizeAmountAdjusted: Int?
    public var affiliations: [Entity]?
    public var residences: [Residence]?
    public var links: ItemLinks?

    public init(awardYear: Int? = nil, category: Translation? = nil, categoryFullName: Translation? = nil, sortOrder: SortOrder? = ._1, portion: Portion? = ._1, dateAwarded: Date? = nil, prizeStatus: PrizeStatus? = nil, motivation: Translation? = nil, prizeAmount: Int? = nil, prizeAmountAdjusted: Int? = nil, affiliations: [Entity]? = nil, residences: [Residence]? = nil, links: ItemLinks? = nil) {
        self.awardYear = awardYear
        self.category = category
        self.categoryFullName = categoryFullName
        self.sortOrder = sortOrder
        self.portion = portion
        self.dateAwarded = dateAwarded
        self.prizeStatus = prizeStatus
        self.motivation = motivation
        self.prizeAmount = prizeAmount
        self.prizeAmountAdjusted = prizeAmountAdjusted
        self.affiliations = affiliations
        self.residences = residences
        self.links = links
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case awardYear
        case category
        case categoryFullName
        case sortOrder
        case portion
        case dateAwarded
        case prizeStatus
        case motivation
        case prizeAmount
        case prizeAmountAdjusted
        case affiliations
        case residences
        case links
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(awardYear, forKey: .awardYear)
        try container.encodeIfPresent(category, forKey: .category)
        try container.encodeIfPresent(categoryFullName, forKey: .categoryFullName)
        try container.encodeIfPresent(sortOrder, forKey: .sortOrder)
        try container.encodeIfPresent(portion, forKey: .portion)
        try container.encodeIfPresent(dateAwarded, forKey: .dateAwarded)
        try container.encodeIfPresent(prizeStatus, forKey: .prizeStatus)
        try container.encodeIfPresent(motivation, forKey: .motivation)
        try container.encodeIfPresent(prizeAmount, forKey: .prizeAmount)
        try container.encodeIfPresent(prizeAmountAdjusted, forKey: .prizeAmountAdjusted)
        try container.encodeIfPresent(affiliations, forKey: .affiliations)
        try container.encodeIfPresent(residences, forKey: .residences)
        try container.encodeIfPresent(links, forKey: .links)
    }
}
