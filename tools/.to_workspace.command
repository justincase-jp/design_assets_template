#!/bin/bash

# ==================================================
#  Created by Takuya Otani on 14/08/2018.
#  Copyright © 2018 justInCase. All rights reserved.
# ==================================================

_SAVEIFS_=$IFS;
IFS=$(echo -en "\n\b");
scriptName=$0
scriptPath=$(cd $(dirname $0); pwd);
workspacePath="${scriptPath}/../_workspace";
checkRemovedFiles=0;
if [ ${scriptName##*/} = "post-merge" ] || [ ${scriptName##*/} = "post-rebase" ]; then
  workspacePath="${scriptPath}/../../_workspace";
  checkRemovedFiles=1;
fi;
repositoryPath="${workspacePath/_workspace/source}";

while getopts ":d:" opt; do
  case "$opt" in
  d) checkRemovedFiles=$OPTARG;
  esac;
done;

# ==== copy from source to workspace
excludes=""
inSource=$(find "${repositoryPath}" -type f -name "document.json");
for filePath in $inSource; do
  targetPath=${filePath/source/_workspace};
  targetPath=${targetPath/\/document.json/.sketch};
  targetDir=${targetPath%/*};
  filePath=${filePath/\/document.json};
  excludes=${excludes}" -not \( -path '${filePath}' -prune \)";
  if [ ! -d ${targetDir} ]; then
    mkdir -p ${targetDir};
  fi;
  echo "updating ... ${targetPath##*/}"
  pushd ${filePath} &> /dev/null;
  zip -q -r ${targetPath} .;
  popd &> /dev/null;
done;

inSource=$(eval "find '${repositoryPath}' ${excludes} -name '*' -type f");
for filePath in $inSource; do
  targetPath=${filePath/source/_workspace};
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

# ==== remove files in workspace when they're removed from source
inWorkspace=$(find "${workspacePath}" -type f -name "*.sketch");
for filePath in $inWorkspace; do
  targetPath=${filePath/_workspace/source};
  targetPath="${targetPath%.*}/document.json";
  if [ ! -e ${targetPath} ]; then
    rm ${filePath};
  fi;
done;

inWorkspace=$(find "${workspacePath}" -type f -name "*" -not -name "*.sketch");
for filePath in $inWorkspace; do
  targetPath=${filePath/_workspace/source};
  if [ ! -e ${targetPath} ]; then
    rm ${filePath};
  fi;
done;

# ==== finalize
IFS=$_SAVEIFS_;
