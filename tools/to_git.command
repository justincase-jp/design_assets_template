#!/bin/bash

# ==================================================
#  Created by Takuya Otani on 14/08/2018.
#  Copyright © 2018 justInCase. All rights reserved.
# ==================================================

_SAVEIFS_=$IFS;
IFS=$(echo -en "\n\b");
scriptPath=$(cd $(dirname $0); pwd);
workspacePath="${scriptPath}/../_workspace";
repositoryPath="${workspacePath/_workspace/source}";
checkRemovedFiles=0;

while getopts ":d:" opt; do
  case "$opt" in
  d) checkRemovedFiles=$OPTARG;
  esac
done

# ==== copy from workspace to source
inWorkspace=$(find "${workspacePath}" -type f -name "*.sketch");
for filePath in $inWorkspace; do
  targetPath=${filePath/_workspace/source};
  targetPath=${targetPath%.*};
  if [ ! -d ${targetPath} ]; then
    mkdir -p ${targetPath};
  fi;
  echo "expand ... ${filePath##*/}"
  unzip -q -o "${filePath}" -d "${targetPath}";
  rm -rf "${targetPath}/previews";
done;

inWorkspace=$(find "${workspacePath}" -type f -name "*" -not -name "*.sketch");
for filePath in $inWorkspace; do
  targetPath=${filePath/_workspace/source};
  targetDir=${targetPath%/*};
  if [ ! -d ${targetDir} ]; then
    mkdir -p ${targetDir};
  fi;
  cp -f ${filePath} ${targetPath}
done;

if [ ${checkRemovedFiles} = "0" ]; then
  echo "removed files check has been skipped.";
  exit 0;
fi;

# ==== remove files in source when they're removed from workspace
excludes=""
inSource=$(find "${repositoryPath}" -type f -name "document.json");
for filePath in $inSource; do
  targetPath=${filePath/source/_workspace};
  targetPath=${targetPath/\/document.json/.sketch};
  filePath=${filePath/\/document.json}
  excludes=${excludes}" -not \( -path '${filePath}' -prune \)";
  if [ ! -e ${targetPath} ]; then
    rm -rf ${filePath};
  fi;
done;

inSource=$(eval "find '${repositoryPath}' ${excludes} -name '*' -type f");
for filePath in $inSource; do
  targetPath=${filePath/source/_workspace};
  if [ ! -e $targetPath ]; then
    rm ${filePath};
  fi;
done;

# ==== finalize
IFS=$_SAVEIFS_;

