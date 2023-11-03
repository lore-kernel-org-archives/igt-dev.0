Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A1510EA12
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:44:58 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:26 +0000
Message-Id: <20231103144359.7-32-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 31/64] fixup! drm-uapi/xe: Align with
 drm_xe_query_engine_info
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

Aligns with e1c6a20e7b57 ("fixup! drm/xe: Make DRM_XE_DEVICE_QUERY_ENGINES future proof")
---
 include/drm-uapi/xe_drm.h          | 15 +++++++++++----
 tests/intel/xe_prime_self_import.c |  5 +----
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index addadead9..d65f065a2 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -127,6 +127,10 @@ struct xe_user_extension {
 /**
  * struct drm_xe_engine_class_instance - instance of an engine class
  *
+ * It is returned as part of the @drm_xe_query_engine_info, but it also is
+ * used as the input of engine selection for both @drm_xe_exec_queue_create
+ * and @drm_xe_query_engine_cycles
+ *
  * The @engine_class can be:
  *  - %DRM_XE_ENGINE_CLASS_RENDER
  *  - %DRM_XE_ENGINE_CLASS_COPY
@@ -164,13 +168,16 @@ struct drm_xe_engine_class_instance {
 /**
  * struct drm_xe_query_engine_info - describe hardware engine
  *
- * If a query is made with a struct drm_xe_device_query where .query
- * is equal to DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
- * struct drm_xe_query_engine_info in .data.
+ * If a query is made with a struct @drm_xe_device_query where .query
+ * is equal to %DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
+ * struct @drm_xe_query_engine_info in .data.
  */
 struct drm_xe_query_engine_info {
+	/** @instance: The @drm_xe_engine_class_instance */
 	struct drm_xe_engine_class_instance instance;
-	__u64 rsvd[3];
+
+	/** @reserved: Reserved */
+	__u64 reserved[3];
 };
 
 /**
diff --git a/tests/intel/xe_prime_self_import.c b/tests/intel/xe_prime_self_import.c
index 504e6a13d..ad988ef3b 100644
--- a/tests/intel/xe_prime_self_import.c
+++ b/tests/intel/xe_prime_self_import.c
@@ -59,7 +59,6 @@ IGT_TEST_DESCRIPTION("Check whether prime import/export works on the same"
 static char counter;
 static int g_time_out = 5;
 static pthread_barrier_t g_barrier;
-static size_t bo_size;
 
 static size_t get_min_bo_size(int fd1, int fd2)
 {
@@ -532,10 +531,8 @@ igt_main
 	int i;
 	int fd;
 
-	igt_fixture {
+	igt_fixture
 		fd = drm_open_driver(DRIVER_XE);
-		bo_size = xe_get_default_alignment(fd);
-	}
 
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		igt_subtest(tests[i].name)
-- 
2.34.1
