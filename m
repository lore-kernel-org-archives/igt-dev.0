Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B98910E9FF
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:44:54 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:15 +0000
Message-Id: <20231103144359.7-21-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 20/64] drm-uapi/xe: Remove unused
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
 tests/intel/xe_query.c    | 3 +--
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index beaeb3f06..dc0c35e06 100644
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
@@ -357,8 +355,7 @@ struct drm_xe_query_config {
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
index 29624a770..5e657a4d4 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -1,3 +1,4 @@
+
 // SPDX-License-Identifier: MIT
 /*
  * Copyright © 2022 Intel Corporation
@@ -374,8 +375,6 @@ test_query_config(int fd)
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
