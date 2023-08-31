Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F5410E089
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 15:36:34 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 31 Aug 2023 17:35:17 +0200
Message-Id: <20230831153517.35370-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230831153517.35370-1-kamil.konieczny@linux.intel.com>
References: <20230831153517.35370-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] gitlab-ci/pull-or-rebuild: added few
 debug prints
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

Added few debug prints to help diagnose problems.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 .gitlab-ci/pull-or-rebuild.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitlab-ci/pull-or-rebuild.sh b/.gitlab-ci/pull-or-rebuild.sh
index 31f3dbca4..57c470fa4 100755
--- a/.gitlab-ci/pull-or-rebuild.sh
+++ b/.gitlab-ci/pull-or-rebuild.sh
@@ -38,6 +38,7 @@ PODMAN_BUILD="podman build --build-arg=CI_COMMIT_SHA=${CI_COMMIT_SHA} --build-ar
 
 if [ "${TYPE}" = "base" ]; then
 	# base container (building, etc) - we rebuild only if changed or forced
+	echo "Inspecting base: ${DOCKERNAME}"
 	skopeo inspect docker://${DOCKERNAME}
 	IMAGE_PRESENT=$?
 
@@ -46,6 +47,7 @@ if [ "${TYPE}" = "base" ]; then
 		echo "Skipping, already built"
 	else
 		echo "Building!"
+		echo "Build with: ${PODMAN_BUILD} --squash -t ${DOCKERNAME} -f ${DOCKERFILE} ."
 		${PODMAN_BUILD} --squash -t ${DOCKERNAME} -f ${DOCKERFILE} .
 		podman push ${DOCKERNAME}
 	fi
-- 
2.39.2
