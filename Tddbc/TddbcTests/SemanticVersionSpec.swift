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
                let target = SemanticVersion(major: 1, minor: 2, patch: 3)
                it("SemanticVErsionインスタンスが生成される") {
                    expect(type(of: target)).notTo(beNil())
                }
            }
        }
        
        describe("toString") {
            let actual = SemanticVersion(major: 1, minor: 2, patch: 3)
            it("SemanticVersionの文字列表現を返す") {
                expect(actual.toString()).to(equal("1.2.3"))
            }
        }
        
        describe("等価判定") {
            context("同じバージョンを持つオブジェクトを比較したとき") {
                let major: UInt = 1
                let minor: UInt = 2
                let patch: UInt = 3
                let left = SemanticVersion(major: major, minor: minor, patch: patch)
                let right = SemanticVersion(major: major, minor: minor, patch: patch)
                
                it("trueを返す") {
                    expect(left).to(equal(right))
                }
            }
            
            context("異なるバージョンを持つオブジェクトを比較したとき") {
                let major: UInt = 1
                let minor: UInt = 2
                let leftPatch: UInt = 3
                let rightPatch: UInt = 5
                let left = SemanticVersion(major: major, minor: minor, patch: leftPatch)
                let right = SemanticVersion(major: major, minor: minor, patch: rightPatch)
                
                it("falseを返す") {
                    expect(left).toNot(equal(right))
                }
            }
        }
    }
}

struct SemanticVersion {
    var major: UInt
    var minor: UInt
    var patch: UInt
    
    func toString() -> String {
        return "\(major).\(minor).\(patch)"
    }
}

extension SemanticVersion: Equatable {
    static func ==(lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
        return lhs.major == rhs.major && lhs.minor == rhs.minor && lhs.patch == rhs.patch
    }
}
