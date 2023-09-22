Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B937110E1D8
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 14:22:01 +0000 (UTC)
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 22 Sep 2023 07:11:17 -0700
Message-Id: <20230922141118.3821111-2-jonathan.cavitt@intel.com>
In-Reply-To: <20230922141118.3821111-1-jonathan.cavitt@intel.com>
References: <20230922141118.3821111-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/2] drm-uapi: Add
 DRM_I915_QUERY_L3BANK_COUNT query
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: jonathan.cavitt@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add drm-uapi specifications for DRM_I915_QUERY_L3BANK_COUNT query.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 include/drm-uapi/i915_drm.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index a0876ee413..edf3b1e445 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -2813,6 +2813,7 @@ struct drm_i915_query_item {
 	 *  - %DRM_I915_QUERY_MEMORY_REGIONS (see struct drm_i915_query_memory_regions)
 	 *  - %DRM_I915_QUERY_HWCONFIG_BLOB (see `GuC HWCONFIG blob uAPI`)
 	 *  - %DRM_I915_QUERY_GEOMETRY_SUBSLICES (see struct drm_i915_query_topology_info)
+	 *  - %DRM_I915_QUERY_L3BANK_COUNT (see `L3 Bank Count Query uAPI`)
 	 */
 	__u64 query_id;
 #define DRM_I915_QUERY_TOPOLOGY_INFO		1
@@ -2821,6 +2822,7 @@ struct drm_i915_query_item {
 #define DRM_I915_QUERY_MEMORY_REGIONS		4
 #define DRM_I915_QUERY_HWCONFIG_BLOB		5
 #define DRM_I915_QUERY_GEOMETRY_SUBSLICES	6
+#define DRM_I915_QUERY_L3BANK_COUNT		7
 /* Must be kept compact -- no holes and well documented */
 
 	/**
@@ -3502,6 +3504,17 @@ struct drm_i915_gem_create_ext {
 	__u64 extensions;
 };
 
+/**
+ * DOC: L3 Bank Count Query uAPI
+ *
+ * The L3 bank count query called through the query id
+ * DRM_I915_QUERY_L3BANK_COUNT and returns the count of
+ * the available L3 Banks on a given engine.
+ *
+ * The count itself is an integer, and since no additional
+ * data is returned, the count is returned as such.
+ */
+
 /**
  * struct drm_i915_gem_create_ext_memory_regions - The
  * I915_GEM_CREATE_EXT_MEMORY_REGIONS extension.
-- 
2.25.1
