//
//  MemberDetailModel.swift
//  Somosmas
//
//  Created by Artekium on 27/10/2021.
//

import Foundation

struct MemberDetailModel {
    private let service = MembersWS()
    
    func getMemberData(id: Int, completion: @escaping MemberDetailHandler, errorHandler: @escaping ErrorHandler) {
        self.service.getMemberById(id: id) { membersResult in
            let memberData = membersResult.data
            guard let member = memberData.map( { dto in Member(dto: dto) })
            else { return }
            completion(member)
        } errorHandler: { errorMessage in
            errorHandler(errorMessage)
        }
    }
}
