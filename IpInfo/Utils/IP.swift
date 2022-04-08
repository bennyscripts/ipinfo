import Foundation

struct IP: Codable {
    var ip: String = "Undefined"
    var version: String = "Undefined"
    var city: String = "Undefined"
    var region: String = "Undefined"
    var region_code: String = "Undefined"
    var country: String = "Undefined"
    var country_name: String = "Undefined"
    var country_code: String = "Undefined"
    var country_code_iso3: String = "Undefined"
    var country_capital: String = "Undefined"
    var country_tld: String = "Undefined"
    var continent_code: String = "Undefined"
    var in_eu: Bool = false
    var postal: String = "Undefined"
    var latitude: Float = 0.0
    var longitude: Float = 0.0
    var timezone: String = "Undefined"
    var utc_offset: String = "Undefined"
    var country_calling_code: String = "Undefined"
    var currency: String = "Undefined"
    var currency_name: String = "Undefined"
    var languages: String = "Undefined"
    var country_area: Int = 0
    var country_population: Int = 0
    var asn: String = "Undefined"
    var org: String = "Undefined"
}
