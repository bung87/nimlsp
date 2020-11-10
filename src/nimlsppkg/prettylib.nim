import macros, os

const explicitSourcePath {.strdefine.} = getCurrentCompilerExe().parentDir.parentDir

macro mImport(path: static[string]): untyped =
  result = nnkImportStmt.newTree(newLit(path))

when defined(nimpretty):
  mImport(explicitSourcePath / "nimpretty" / "nimpretty.nim")
  export PrettyOptions
  export prettyPrint

when isMainModule and defined(nimpretty):
  var opt = PrettyOptions(indWidth: 2, maxLineLen: 80)
  prettyPrint(currentSourcePath, currentSourcePath, opt)