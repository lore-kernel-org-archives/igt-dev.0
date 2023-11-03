Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D07010EA16
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:44:58 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:23 +0000
Message-Id: <20231103144359.7-29-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 28/64] drm-uapi/xe: Reject bo creation of
 unaligned size
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

Align with kernel commit ("xe/xe_bo: Reject bo creation of unaligned size")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 286f00254..addadead9 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -212,11 +212,13 @@ struct drm_xe_query_mem_region {
 	 *
 	 * When the kernel allocates memory for this region, the
 	 * underlying pages will be at least @min_page_size in size.
-	 *
-	 * Important note: When userspace allocates a GTT address which
-	 * can point to memory allocated from this region, it must also
-	 * respect this minimum alignment. This is enforced by the
-	 * kernel.
+	 * Buffer objects with an allowable placement in this region must be
+	 * created with a size aligned to this value.
+	 * GPU virtual address mappings of (parts of) buffer objects that
+	 * may be placed in this region must also have their GPU virtual
+	 * address and range aligned to this value.
+	 * Affected IOCTLS will return %-EINVAL if alignment restrictions are
+	 * not met.
 	 */
 	__u32 min_page_size;
 	/**
@@ -362,6 +364,14 @@ struct drm_xe_query_config {
 #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID		0
 #define DRM_XE_QUERY_CONFIG_FLAGS			1
 	#define DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM	(0x1 << 0)
+	/*
+	 * DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - This returns the
+	 * maximum value of the &min_page_size across all memory regions
+	 * the device implements. User-space code that does not want
+	 * to track @min_page_size per region can use this value for
+	 * a buffer-object size and GPU virtual address and -range
+	 * alignment value that is valid for all regions.
+	 */
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
@@ -615,9 +625,8 @@ struct drm_xe_gem_create {
 	__u64 extensions;
 
 	/**
-	 * @size: Requested size for the object
-	 *
-	 * The (page-aligned) allocated size for the object will be returned.
+	 * @size: Size of the object to be created, must match region
+	 * (system or vram) minimum alignment (&min_page_size).
 	 */
 	__u64 size;
 
-- 
2.34.1
