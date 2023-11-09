Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3C410E8E7
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 15:55:58 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:53:54 +0000
Message-Id: <20231109155410.7-42-francois.dugast@intel.com>
In-Reply-To: <20231109155410.7-1-francois.dugast@intel.com>
References: <20231109155410.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 41/57] tests/intel/xe_query: Fix
 test_query_engines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Let's not confuse gt_id with tile_id.

Also, make test_query_engines to really query for the info
instead of just printing the info.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_query.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 80510146f..16097cba7 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -172,23 +172,43 @@ const char *get_topo_name(int value)
 
 /**
  * SUBTEST: query-engines
- * Description: Display engine classes available for xe device
+ * Description: Display engines available for xe device
  * Test category: functionality test
  */
 static void
 test_query_engines(int fd)
 {
+	struct drm_xe_query_engine_info *engines;
 	struct drm_xe_engine_class_instance *eci;
-	int i = 0;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_ENGINES,
+		.size = 0,
+		.data = 0,
+	};
+	int num_engines, i;
 
-	xe_for_each_engine_instance(fd, eci) {
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	engines = malloc(query.size);
+	igt_assert(engines);
+
+	query.data = to_user_pointer(engines);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	num_engines = query.size / sizeof(*engines);
+
+	for (i = 0; i < num_engines; i++) {
+		eci = &engines[i].instance;
 		igt_assert(eci);
-		igt_info("engine %d: %s, engine instance: %d, tile: TILE-%d\n", i++,
-			 xe_engine_class_string(eci->engine_class), eci->engine_instance,
-								    eci->gt_id);
+		igt_info("engine %d: %s, engine instance: %d, gt: GT-%d\n", i,
+			 xe_engine_class_string(eci->engine_class),
+			 eci->engine_instance,
+			 eci->gt_id);
 	}
 
 	igt_assert(i > 0);
+	free(engines);
 }
 
 /**
-- 
2.34.1
