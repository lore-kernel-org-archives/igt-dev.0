Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F9410E4B5
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 10:27:46 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Date: Wed, 29 Nov 2023 15:56:28 +0530
Message-Id: <20231129102628.30848-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] intel/xe_exec_store.c: Fix the check for
 num of placements in store_all.
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Adjust the store_all execution with dynamic subtest, so that test will
skip the engines with no instances and executes on the engines with instances.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_exec_store.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 9c14bfd14..95c678bf7 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -245,7 +245,8 @@ static void store_all(int fd, int gt, int class)
 		eci[num_placements++] = *hwe;
 	}
 
-	igt_require(num_placements);
+	igt_skip_on_f(!num_placements, "Engine class:%d gt:%d not enabled on this platform\n",
+			class, gt);
 
 	for (i = 0; i < num_placements; i++) {
 		struct drm_xe_exec_queue_create create = {
@@ -304,10 +305,13 @@ igt_main
 	igt_subtest("basic-store")
 		store(fd);
 
-	igt_subtest("basic-all") {
+	igt_subtest_with_dynamic("basic-all") {
 		xe_for_each_gt(fd, gt)
-			xe_for_each_hw_engine_class(class)
-				store_all(fd, gt, class);
+			xe_for_each_hw_engine_class(class) {
+				igt_dynamic_f("class-%d", class) {
+					store_all(fd, gt, class);
+				}
+			}
 	}
 
 	igt_subtest("cachelines")
-- 
2.39.1
