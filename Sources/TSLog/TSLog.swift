//
//  gpuImgLog.swift
//  Vertex
//
//  Created by Alex Linkov on 5/20/21.
//

import Foundation

public enum LogLevel: Int {
    case fatal = 0, error = 1, warning = 2, info = 3, debug = 4, trace = 5
}

public typealias TSLogOnAfterFuntionCallLoggedBlock = (_ info: String) -> Void
public typealias TSLogOnAfterLoggedBlock = (_ info: String, _ logLevel: LogLevel, _ site: String) -> Void

open class TSLog {
    
    public static let sI = TSLog()
    
    public var onAfterFunctionCallLogged: TSLogOnAfterFuntionCallLoggedBlock?
    public var onAfterLogged: TSLogOnAfterLoggedBlock?
    public var activeLevel: LogLevel = .error
    
    open func log(_ level: LogLevel, _ str: String, functionName: String = #function, fileName: String = #file) {
        let fileName = ((fileName as NSString).lastPathComponent as NSString).deletingPathExtension
        if (level.rawValue == activeLevel.rawValue) {
            let l = "\(level)"
            print("TSLog",l.uppercased(),functionName, str, separator: " ", terminator: "\n")
        }
        
        if let block = onAfterLogged {
            block("TSLog: \(str) ", level, "\(functionName) :: \(fileName)")
        }
      
    }
    
    open func logCall(functionName: String = #function, fileName: String = #file) {
        if (activeLevel.rawValue <= LogLevel.warning.rawValue) {
            let fileName = ((fileName as NSString).lastPathComponent as NSString).deletingPathExtension
            print("TSLog", functionName, fileName, separator: " :: ", terminator: "\n")
        }
        
        if let block = onAfterFunctionCallLogged {
            block("TSLog :: \(functionName) :: \(fileName)")
        }
      
    }
}
