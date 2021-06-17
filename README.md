# TSLog

A simple logger.

## Installation
To add TSLog to your Xcode project, select File -> Swift Packages -> Add Package Depedancy. Enter `https://github.com/FvnctionHQ/ts-log`

## Usage

`TSLog.sI.activeLevel = .debug`<br />
`...`<br />
`TSLog.sI.logCall()`<br />

## Api

Log string.  <br />
`open func log(_ level: LogLevel, _ str: String, functionName: String = #function, fileName: String = #file)` <br />
Output example: <br />
`TSLog debug touchesMoved(_:with:) pos: 121.0 x 165.0`


Log function call.  <br />
`open func logCall(functionName: String = #function, fileName: String = #file)` <br />
Output example: <br />
`TSLog :: init() :: TSThumbControlsModuleCoordinator`
