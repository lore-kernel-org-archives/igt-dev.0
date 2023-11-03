Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B728610EA16
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:44:57 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:21 +0000
Message-Id: <20231103144359.7-27-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 26/64] drm-uapi/xe: Replace BO with GEM in
 documentation
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

Align with kernel commit ("drm/xe/uapi: Replace BO with GEM in documentation")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 35dfd82a4..b2827cf0c 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -621,14 +621,14 @@ struct drm_xe_gem_create {
 	 */
 	__u64 size;
 
-	/** @placement: A mask of memory instances of where BO can be placed. */
+	/** @placement: A mask of memory instances of where GEM can be placed. */
 	__u32 placement;
 
 #define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(1 << 0)
 #define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(1 << 1)
 #define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
 	/**
-	 * @flags: Flags, currently a mask of memory instances of where BO can
+	 * @flags: Flags, currently a mask of memory instances of where GEM can
 	 * be placed
 	 */
 	__u32 flags;
@@ -636,7 +636,7 @@ struct drm_xe_gem_create {
 	/**
 	 * @vm_id: Attached VM, if any
 	 *
-	 * If a VM is specified, this BO must:
+	 * If a VM is specified, this GEM must:
 	 *
 	 *  1. Only ever be bound to that VM.
 	 *  2. Cannot be exported as a PRIME fd.
@@ -738,8 +738,8 @@ struct drm_xe_vm_destroy {
  *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
  *    tables are setup with a special bit which indicates writes are
  *    dropped and all reads return zero. In the future, the NULL flags
- *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
- *    handle MBZ, and the BO offset MBZ. This flag is intended to
+ *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the GEM
+ *    handle MBZ, and the GEM offset MBZ. This flag is intended to
  *    implement VK sparse bindings.
  *
  */
-- 
2.34.1
