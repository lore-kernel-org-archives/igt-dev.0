Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B1410E774
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 18:46:10 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:45:32 +0000
Message-Id: <20231130184536.7-18-francois.dugast@intel.com>
In-Reply-To: <20231130184536.7-1-francois.dugast@intel.com>
References: <20231130184536.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v5 17/21] drm-uapi/xe: Fix various struct padding
 for 64b alignment
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

Align with commit ("drm/xe/uapi: Fix various struct padding for
64b alignment")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index b703dc7ce..3938e553d 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -211,8 +211,6 @@ struct drm_xe_mem_region {
 	 * a unique pair.
 	 */
 	__u16 instance;
-	/** @pad: MBZ */
-	__u32 pad;
 	/**
 	 * @min_page_size: Min page-size in bytes for this region.
 	 *
@@ -381,6 +379,8 @@ struct drm_xe_gt {
 	__u16 tile_id;
 	/** @gt_id: Unique ID of this GT within the PCI Device */
 	__u16 gt_id;
+	/** @pad: MBZ */
+	__u16 pad[3];
 	/** @reference_clock: A clock frequency for timestamp */
 	__u32 reference_clock;
 	/**
@@ -600,7 +600,7 @@ struct drm_xe_gem_create {
 #define DRM_XE_GEM_CPU_CACHING_WC                      2
 	__u16 cpu_caching;
 	/** @pad: MBZ */
-	__u16 pad;
+	__u16 pad[3];
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
@@ -775,6 +775,9 @@ struct drm_xe_vm_bind_op {
 	 */
 	__u32 prefetch_mem_region_instance;
 
+	/** @pad: MBZ */
+	__u32 pad2;
+
 	/** @reserved: Reserved */
 	__u64 reserved[3];
 };
@@ -793,12 +796,12 @@ struct drm_xe_vm_bind {
 	 */
 	__u32 exec_queue_id;
 
-	/** @num_binds: number of binds in this IOCTL */
-	__u32 num_binds;
-
 	/** @pad: MBZ */
 	__u32 pad;
 
+	/** @num_binds: number of binds in this IOCTL */
+	__u32 num_binds;
+
 	union {
 		/** @bind: used if num_binds == 1 */
 		struct drm_xe_vm_bind_op bind;
@@ -810,12 +813,12 @@ struct drm_xe_vm_bind {
 		__u64 vector_of_binds;
 	};
 
+	/** @pad: MBZ */
+	__u32 pad2;
+
 	/** @num_syncs: amount of syncs to wait on */
 	__u32 num_syncs;
 
-	/** @pad2: MBZ */
-	__u32 pad2;
-
 	/** @syncs: pointer to struct drm_xe_sync array */
 	__u64 syncs;
 
-- 
2.34.1
