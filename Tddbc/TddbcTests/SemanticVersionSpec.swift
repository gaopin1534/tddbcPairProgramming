//
//  SemanticVersionSpec.swift
//  TddbcTests
//
//  Created by keygx on 2017/09/30.
//  Copyright © 2017年 gaopin. All rights reserved.
//

import Foundation
import Quick
import Nimble

class SemanticVersionSpec: QuickSpec {
    override func spec() {
        describe("initialize") {
            context("initializerにmajor,minor,patchの引数が渡されたとき") {
                let major = 1
                let minor = 2
                let patch = 3
                let target = SemanticVersion(major: major, minor: minor, patch: patch)
                it("SemanticVErsionインスタンスが生成される") {
                    expect(type(of: target)).notTo(beNil())
                }
            }
        }
    }
}

struct SemanticVersion {
    var major: Int
    var minor: Int
    var patch: Int
}
