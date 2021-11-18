//
//  Closures.swift
//  SomosMas
//
//  Created by Kenyi Rodriguez on 27/09/21.
//

import UIKit

typealias MyClosure = () -> Void

typealias ResultLoginHandler = (_ token: String) -> Void
typealias ErrorHandler = (_ errorMessage: String) -> Void

typealias SignUpUsersSuccess = (_ user: SignInResponse) -> ()
typealias SignUpUsersFailure = (_ error: Error?) -> ()

typealias AlertAction = (_ : UIAlertAction) -> ()
typealias TestimonialDTOCompletionHandler = (_ arrayTestimonial: [TestimonialDTO]) -> Void
typealias SlideDTOCompletionHandler = (_ arraySlide: [SlideDTO]) -> Void
typealias AboutUsDTOCompletionHandler = (_ arrayAboutUs: [AboutUsDTO]) -> Void

typealias LatestNewsDTOCompletionHandler = (_ arrayLatestNews: [LatestNewsDTO]) -> Void
typealias ActivitiesResultHandler = (_ activitiesResult: ActivitiesResultDTO) -> Void
typealias ActivitiesArrayHandler = (_ arrayActivities: [Activity]) -> Void

typealias MembersResultHandler = (_ membersResult: MembersResultDTO) -> Void
typealias MemberDetailHandler = (_ memberDetail: Member) -> Void
