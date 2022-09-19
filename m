Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9F210E58A
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Sep 2022 10:12:19 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Sep 2022 15:36:23 +0530
Message-Id: <20220919100623.667060-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_dp_aux_dev: Convert test to
 dynamic
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

Modified kms_universal_plane to include dynamic test cases.

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/kms_dp_aux_dev.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
index d3249fa3..ac12b500 100644
--- a/tests/kms_dp_aux_dev.c
+++ b/tests/kms_dp_aux_dev.c
@@ -118,7 +118,7 @@ static bool test(int drm_fd, uint32_t connector_id)
 	return false;
 }
 
-igt_simple_main
+igt_main
 {
 	int valid_connectors = 0;
 	drmModeRes *res;
@@ -129,8 +129,13 @@ igt_simple_main
 	res = drmModeGetResources(drm_fd);
 	igt_require(res);
 
-	for (int i = 0; i < res->count_connectors; i++)
-		valid_connectors += test(drm_fd, res->connectors[i]);
+	igt_subtest_with_dynamic("basic") {
+		for (int i = 0; i < res->count_connectors; i++)
+			igt_dynamic_f("subtest-%d", i) {
+				valid_connectors += test(drm_fd, res->connectors[i]);
+			}
+	}
+
 	igt_require(valid_connectors);
 
 	drmModeFreeResources(res);
-- 
2.25.1
