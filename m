Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C1E10E8EE
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 15:56:06 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:53:57 +0000
Message-Id: <20231109155410.7-45-francois.dugast@intel.com>
In-Reply-To: <20231109155410.7-1-francois.dugast@intel.com>
References: <20231109155410.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 44/57] drm-uapi/xe: Document the memory_region
 bitmask
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

Align with kernel commit ("drm/xe/uapi: Document the memory_region bitmask")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index be30d506c..d3f48c7ce 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -231,6 +231,10 @@ struct drm_xe_query_engine_info {
 	/**
 	 * @near_mem_regions: Bit mask of instances from
 	 * drm_xe_query_mem_regions that is near this engine.
+	 * Each index in this mask refers directly to the struct
+	 * drm_xe_query_mem_regions' instance, no assumptions should
+	 * be made about order. The type of each region is described
+	 * by struct drm_xe_query_mem_regions' mem_class.
 	 */
 	__u64 near_mem_regions;
 	/**
@@ -239,6 +243,10 @@ struct drm_xe_query_engine_info {
 	 * In general, it has extra indirections when compared to the
 	 * @near_mem_regions. For a discrete device this could mean system
 	 * memory and memory living in a different Tile.
+	 * Each index in this mask refers directly to the struct
+	 * drm_xe_query_mem_regions' instance, no assumptions should
+	 * be made about order. The type of each region is described
+	 * by struct drm_xe_query_mem_regions' mem_class.
 	 */
 	__u64 far_mem_regions;
 
@@ -272,10 +280,9 @@ struct drm_xe_query_mem_region {
 	 */
 	__u16 mem_class;
 	/**
-	 * @instance: The instance for this region.
-	 *
-	 * The @mem_class and @instance taken together will always give
-	 * a unique pair.
+	 * @instance: The unique ID for this region, which serves as the
+	 * index in the placement bitmask used as argument for
+	 * &DRM_IOCTL_XE_GEM_CREATE
 	 */
 	__u16 instance;
 	/** @pad: MBZ */
@@ -695,7 +702,13 @@ struct drm_xe_gem_create {
 	 */
 	__u64 size;
 
-	/** @placement: A mask of memory instances of where GEM can be placed. */
+	/**
+	 * @placement: A mask of memory instances of where GEM can be placed.
+	 * Each index in this mask refers directly to the struct
+	 * drm_xe_query_mem_regions' instance, no assumptions should
+	 * be made about order. The type of each region is described
+	 * by struct drm_xe_query_mem_regions' mem_class.
+	 */
 	__u32 placement;
 
 #define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(1 << 0)
-- 
2.34.1
