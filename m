Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1501210E114
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Nov 2023 15:52:31 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Nov 2023 15:52:09 +0000
Message-Id: <20231110155211.7-6-francois.dugast@intel.com>
In-Reply-To: <20231110155211.7-1-francois.dugast@intel.com>
References: <20231110155211.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v1 5/7] drm-uapi/xe: Remove unused
 QUERY_CONFIG_MEM_REGION_COUNT
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

Align with commit ("drm/xe/uapi: Remove unused QUERY_CONFIG_MEM_REGION_COUNT")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 4 ++--
 tests/intel/xe_query.c    | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 68317a82e..db883fb6b 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -311,6 +311,7 @@ struct drm_xe_query_mem_usage {
  * If a query is made with a struct drm_xe_device_query where .query
  * is equal to DRM_XE_DEVICE_QUERY_CONFIG, then the reply uses
  * struct drm_xe_query_config in .data.
+ *
  */
 struct drm_xe_query_config {
 	/** @num_params: number of parameters returned in info */
@@ -325,8 +326,7 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define XE_QUERY_CONFIG_VA_BITS			3
 #define XE_QUERY_CONFIG_GT_COUNT		4
-#define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
-#define XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	6
+#define XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	5
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index e6258ff01..66a714518 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -376,8 +376,6 @@ test_query_config(int fd)
 		config->info[XE_QUERY_CONFIG_VA_BITS]);
 	igt_info("XE_QUERY_CONFIG_GT_COUNT\t\t%llu\n",
 		config->info[XE_QUERY_CONFIG_GT_COUNT]);
-	igt_info("XE_QUERY_CONFIG_MEM_REGION_COUNT\t%llu\n",
-		config->info[XE_QUERY_CONFIG_MEM_REGION_COUNT]);
 	igt_info("XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY\t%llu\n",
 		config->info[XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY]);
 	dump_hex_debug(config, query.size);
-- 
2.34.1
