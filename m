Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDF510E610
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 14:55:28 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Nov 2023 14:54:55 +0000
Message-Id: <20231129145457.7-19-francois.dugast@intel.com>
In-Reply-To: <20231129145457.7-1-francois.dugast@intel.com>
References: <20231129145457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 18/20] drm-uapi/xe: Fix various struct padding
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
 include/drm-uapi/xe_drm.h | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 555560e43..f5078fd99 100644
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
@@ -715,6 +715,9 @@ struct drm_xe_vm_bind_op {
 	 */
 	__u32 prefetch_mem_region_instance;
 
+	/** @pad: MBZ */
+	__u32 pad2;
+
 	/** @reserved: Reserved */
 	__u64 reserved[3];
 };
@@ -733,12 +736,12 @@ struct drm_xe_vm_bind {
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
@@ -750,12 +753,12 @@ struct drm_xe_vm_bind {
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
