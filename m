Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBA110E886
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Oct 2023 14:19:02 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Oct 2023 14:18:27 +0000
Message-Id: <20231011141841.7-7-francois.dugast@intel.com>
In-Reply-To: <20231011141841.7-1-francois.dugast@intel.com>
References: <20231011141841.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC v1 06/20] drm-uapi/xe: Remove useless query config
 num_params
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

Align with commit ("Remove useless query config num_params")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 7 -------
 lib/xe/xe_query.c         | 2 --
 tests/intel/xe_query.c    | 2 --
 3 files changed, 11 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 3eef48f10..7a1b75a60 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -315,9 +315,6 @@ struct drm_xe_query_mem_usage {
  * struct drm_xe_query_config in .data.
  */
 struct drm_xe_query_config {
-	/** @num_params: number of parameters returned in info */
-	__u32 num_params;
-
 	/** @pad: MBZ */
 	__u32 pad;
 
@@ -355,10 +352,6 @@ struct drm_xe_query_config {
 	 * Value of the highest available exec queue priority
 	 */
 #define XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	6
-	/*
-	 * Number of elements in the info array
-	 */
-#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1)
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 986a3a0c1..cd0e29dcc 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -34,8 +34,6 @@ static struct drm_xe_query_config *xe_query_config_new(int fd)
 	query.data = to_user_pointer(config);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-	igt_assert(config->num_params > 0);
-
 	return config;
 }
 
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 2cff75414..dc19a9d32 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -359,8 +359,6 @@ test_query_config(int fd)
 	query.data = to_user_pointer(config);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
-	igt_assert(config->num_params > 0);
-
 	igt_info("XE_QUERY_CONFIG_REV_AND_DEVICE_ID\t%#llx\n",
 		config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID]);
 	igt_info("  REV_ID\t\t\t\t%#llx\n",
-- 
2.34.1
