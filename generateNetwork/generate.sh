#!/bin/sh

#  generateNetworkPackage.sh
#  hwPagingOnRealAPI
#
#  Created by Sasha Kurganova on 21.12.2022.
#

openapi-generator generate \
    -i "NobelMedia-NobelMasterData-2.0-resolved.json" \
    --reserved-words-mappings Character=chdf \
    -g swift5 \
    --global-property models,apis,modelDocs=false,apiDocs=false,supportingFiles \
    --additional-properties swiftPackagePath=/,projectName=Network \
    -o "../hwPagingOnRealAPI/Network/Sources/Network"
