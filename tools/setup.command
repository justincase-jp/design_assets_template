#!/bin/bash

# ==================================================
#  Created by Takuya Otani on 14/08/2018.
#  Copyright © 2018 justInCase. All rights reserved.
# ==================================================

scriptPath=$(cd $(dirname $0); pwd);
workspacePath="${scriptPath}/../_workspace";
if [ ! -e ${workspacePath} ]; then
  mkdir ${workspacePath};
  ${scriptPath}/.to_workspace.command;
fi;
cp ${scriptPath}/.to_workspace.command ${scriptPath}/../.git/hooks/post-merge;
cp ${scriptPath}/.to_workspace.command ${scriptPath}/../.git/hooks/post-rebase;
