Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4685310E8E3
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 15:54:56 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:53:34 +0000
Message-Id: <20231109155410.7-22-francois.dugast@intel.com>
In-Reply-To: <20231109155410.7-1-francois.dugast@intel.com>
References: <20231109155410.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 21/57] drm-uapi/xe: Remove unused
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
 include/drm-uapi/xe_drm.h | 5 +----
 tests/intel/xe_query.c    | 2 --
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 5bf557d5a..1ed982935 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -342,8 +342,6 @@ struct drm_xe_query_mem_usage {
  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
  *  - %DRM_XE_QUERY_CONFIG_GT_COUNT - Total number of GTs for the entire
  *    device
- *  - %DRM_XE_QUERY_CONFIG_MEM_REGION_COUNT - Total number of accessible
- *    memory regions
  *  - %DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY - Value of the highest
  *    available exec queue priority
  */
@@ -360,8 +358,7 @@ struct drm_xe_query_config {
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_GT_COUNT			4
-#define DRM_XE_QUERY_CONFIG_MEM_REGION_COUNT		5
-#define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	6
+#define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	5
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 6b1be248c..351e56eb4 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -376,8 +376,6 @@ test_query_config(int fd)
 		config->info[DRM_XE_QUERY_CONFIG_VA_BITS]);
 	igt_info("DRM_XE_QUERY_CONFIG_GT_COUNT\t\t%llu\n",
 		config->info[DRM_XE_QUERY_CONFIG_GT_COUNT]);
-	igt_info("DRM_XE_QUERY_CONFIG_MEM_REGION_COUNT\t%llu\n",
-		config->info[DRM_XE_QUERY_CONFIG_MEM_REGION_COUNT]);
 	igt_info("DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY\t%llu\n",
 		config->info[DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY]);
 	dump_hex_debug(config, query.size);
-- 
2.34.1
