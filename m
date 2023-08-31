Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269D510E089
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 15:36:10 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 31 Aug 2023 17:35:16 +0200
Message-Id: <20230831153517.35370-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230831153517.35370-1-kamil.konieczny@linux.intel.com>
References: <20230831153517.35370-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] gitlab-ci/pull-or-rebuild: added braces
 for variables
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Added braces for all shell variables.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 .gitlab-ci/pull-or-rebuild.sh | 40 +++++++++++++++++------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/.gitlab-ci/pull-or-rebuild.sh b/.gitlab-ci/pull-or-rebuild.sh
index 4f77431b5..31f3dbca4 100755
--- a/.gitlab-ci/pull-or-rebuild.sh
+++ b/.gitlab-ci/pull-or-rebuild.sh
@@ -26,41 +26,41 @@ DOCKERFILE=$2
 NAME=$3
 REF=${4:-${CI_COMMIT_REF_NAME:-latest}}
 
-REF=$(echo $REF | tr / - )
-IMAGENAME=$CI_REGISTRY/$CI_PROJECT_PATH/$NAME
-DOCKERFILE_CHECKSUM=$(sha1sum $DOCKERFILE | cut -d ' ' -f1)
+REF=$(echo ${REF} | tr / - )
+IMAGENAME=${CI_REGISTRY}/${CI_PROJECT_PATH}/${NAME}
+DOCKERFILE_CHECKSUM=$(sha1sum ${DOCKERFILE} | cut -d ' ' -f1)
 
-REFNAME=$IMAGENAME:$REF
-DOCKERNAME=$IMAGENAME:dockerfile-$DOCKERFILE_CHECKSUM
-COMMITNAME=$IMAGENAME:commit-$CI_COMMIT_SHA
+REFNAME=${IMAGENAME}:${REF}
+DOCKERNAME=${IMAGENAME}:dockerfile-${DOCKERFILE_CHECKSUM}
+COMMITNAME=${IMAGENAME}:commit-${CI_COMMIT_SHA}
 
-PODMAN_BUILD="podman build --build-arg=CI_COMMIT_SHA=$CI_COMMIT_SHA --build-arg=CI_REGISTRY_IMAGE=$CI_REGISTRY_IMAGE"
+PODMAN_BUILD="podman build --build-arg=CI_COMMIT_SHA=${CI_COMMIT_SHA} --build-arg=CI_REGISTRY_IMAGE=${CI_REGISTRY_IMAGE}"
 
-if [ "$TYPE" = "base" ]; then
+if [ "${TYPE}" = "base" ]; then
 	# base container (building, etc) - we rebuild only if changed or forced
-	skopeo inspect docker://$DOCKERNAME
+	skopeo inspect docker://${DOCKERNAME}
 	IMAGE_PRESENT=$?
 
 	set -e
-	if [ $IMAGE_PRESENT -eq 0 ] && [ ${FORCE_REBUILD:-0} -eq 0 ] ; then
+	if [ ${IMAGE_PRESENT} -eq 0 ] && [ ${FORCE_REBUILD:-0} -eq 0 ] ; then
 		echo "Skipping, already built"
 	else
 		echo "Building!"
-		$PODMAN_BUILD --squash -t $DOCKERNAME -f $DOCKERFILE .
-		podman push $DOCKERNAME
+		${PODMAN_BUILD} --squash -t ${DOCKERNAME} -f ${DOCKERFILE} .
+		podman push ${DOCKERNAME}
 	fi
 
-	skopeo copy --dest-creds $CI_REGISTRY_USER:$CI_REGISTRY_PASSWORD \
-               docker://$DOCKERNAME docker://$COMMITNAME
-elif [ "$TYPE" = "igt" ]; then
+	skopeo copy --dest-creds ${CI_REGISTRY_USER}:${CI_REGISTRY_PASSWORD} \
+               docker://${DOCKERNAME} docker://${COMMITNAME}
+elif [ "${TYPE}" = "igt" ]; then
 	# container with IGT, we don't care about Dockerfile changes
 	# we always rebuild
 	set -e
-	$PODMAN_BUILD -t $COMMITNAME -f $DOCKERFILE .
-	podman push $COMMITNAME
-	skopeo copy --dest-creds $CI_REGISTRY_USER:$CI_REGISTRY_PASSWORD \
-               docker://$COMMITNAME docker://$REFNAME
+	${PODMAN_BUILD} -t ${COMMITNAME} -f ${DOCKERFILE} .
+	podman push ${COMMITNAME}
+	skopeo copy --dest-creds ${CI_REGISTRY_USER}:${CI_REGISTRY_PASSWORD} \
+               docker://${COMMITNAME} docker://${REFNAME}
 else
-	echo "unknown build type $TYPE"
+	echo "unknown build type ${TYPE}"
 	exit 1
 fi
-- 
2.39.2
