

import Foundation

struct ArticleData: Codable {
  struct Response: Codable {
    struct Result: Codable, Identifiable {
      struct Field: Codable {
        let headline: String
        let standfirst: String?
        let trailText: String
        let byline: String
        let main: String
        let body: String
        let wordcount: String
        let firstPublicationDate: Date
        let isInappropriateForSponsorship: String?
        let isPremoderated: String
        let lastModified: Date
        let liveBloggingNow: String?
        let productionOffice: String
        let publication: String
        let shortURL: URL
        let shouldHideAdverts: String
        let showInRelatedContent: String
        let thumbnail: URL?
        let legallySensitive: String
        let lang: String
        let isLive: String
        let bodyText: String
        let charCount: String
        let shouldHideReaderRevenue: String
        let showAffiliateLinks: String?
        let bylineHtml: String
        let newspaperPageNumber: String?
        let newspaperEditionDate: Date?
        let commentable: String?
        let commentCloseDate: Date?

        private enum CodingKeys: String, CodingKey {
          case headline
          case standfirst
          case trailText
          case byline
          case main
          case body
          case wordcount
          case firstPublicationDate
          case isInappropriateForSponsorship
          case isPremoderated
          case lastModified
          case liveBloggingNow
          case productionOffice
          case publication
          case shortURL = "shortUrl"
          case shouldHideAdverts
          case showInRelatedContent
          case thumbnail
          case legallySensitive
          case lang
          case isLive
          case bodyText
          case charCount
          case shouldHideReaderRevenue
          case showAffiliateLinks
          case bylineHtml
          case newspaperPageNumber
          case newspaperEditionDate
          case commentable
          case commentCloseDate
        }
      }

      let id: String
      let type: String
      let sectionID: String
      let sectionName: String
      let webPublicationDate: Date
      let webTitle: String
      let webURL: URL
      let apiURL: URL
      let fields: Field
      let isHosted: Bool
      let pillarID: String
      let pillarName: String

      private enum CodingKeys: String, CodingKey {
        case id
        case type
        case sectionID = "sectionId"
        case sectionName
        case webPublicationDate
        case webTitle
        case webURL = "webUrl"
        case apiURL = "apiUrl"
        case fields
        case isHosted
        case pillarID = "pillarId"
        case pillarName
      }
    }

    let status: String
    let userTier: String
    let total: Int
    let startIndex: Int
    let pageSize: Int
    let currentPage: Int
    let pages: Int
    let orderBy: String
    let results: [Result]
  }

  let response: Response
}
