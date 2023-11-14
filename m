Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E0510E443
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Nov 2023 13:44:47 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Nov 2023 13:44:24 +0000
Message-Id: <20231114134426.7-7-francois.dugast@intel.com>
In-Reply-To: <20231114134426.7-1-francois.dugast@intel.com>
References: <20231114134426.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v1 6/8] drm-uapi/xe: s/FLAGS_HAS_VRAM/FLAG_HAS_VRAM
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Align with commit ("drm/xe/uapi: Standardize the FLAG naming and assignment")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 18 +++++++++---------
 tests/intel/xe_debugfs.c  |  4 ++--
 tests/intel/xe_query.c    |  4 ++--
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index ec37f6811..2dae8b03e 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -323,7 +323,7 @@ struct drm_xe_query_config {
 
 #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define DRM_XE_QUERY_CONFIG_FLAGS			1
-	#define DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
@@ -587,10 +587,10 @@ struct drm_xe_vm_create {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-#define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(0x1 << 0)
-#define DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE	(0x1 << 1)
-#define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(0x1 << 2)
-#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(0x1 << 3)
+#define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
+#define DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE	(1 << 1)
+#define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(1 << 2)
+#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 3)
 	/** @flags: Flags */
 	__u32 flags;
 
@@ -654,13 +654,13 @@ struct drm_xe_vm_bind_op {
 	/** @op: Bind operation to perform */
 	__u32 op;
 
-#define DRM_XE_VM_BIND_FLAG_READONLY	(0x1 << 0)
-#define DRM_XE_VM_BIND_FLAG_ASYNC	(0x1 << 1)
+#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
+#define DRM_XE_VM_BIND_FLAG_ASYNC	(1 << 1)
 	/*
 	 * Valid on a faulting VM only, do the MAP operation immediately rather
 	 * than deferring the MAP to the page fault handler.
 	 */
-#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 2)
+#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 2)
 	/*
 	 * When the NULL flag is set, the page tables are setup with a special
 	 * bit which indicates writes are dropped and all reads return zero.  In
@@ -668,7 +668,7 @@ struct drm_xe_vm_bind_op {
 	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
 	 * intended to implement VK sparse bindings.
 	 */
-#define DRM_XE_VM_BIND_FLAG_NULL	(0x1 << 3)
+#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 3)
 	/** @flags: Bind flags */
 	__u32 flags;
 
diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 60ddceda7..4fd5ebc28 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -99,7 +99,7 @@ test_base(int fd, struct drm_xe_query_config *config)
 	igt_assert(igt_debugfs_search(fd, "info", reference));
 
 	sprintf(reference, "is_dgfx %s", config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
-		DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM ? "yes" : "no");
+		DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM ? "yes" : "no");
 
 	igt_assert(igt_debugfs_search(fd, "info", reference));
 
@@ -125,7 +125,7 @@ test_base(int fd, struct drm_xe_query_config *config)
 	igt_assert(igt_debugfs_exists(fd, "gtt_mm", O_RDONLY));
 	igt_debugfs_dump(fd, "gtt_mm");
 
-	if (config->info[DRM_XE_QUERY_CONFIG_FLAGS] & DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM) {
+	if (config->info[DRM_XE_QUERY_CONFIG_FLAGS] & DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM) {
 		igt_assert(igt_debugfs_exists(fd, "vram0_mm", O_RDONLY));
 		igt_debugfs_dump(fd, "vram0_mm");
 	}
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 5860add0b..4a23dcb60 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -367,9 +367,9 @@ test_query_config(int fd)
 		config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff);
 	igt_info("DRM_XE_QUERY_CONFIG_FLAGS\t\t\t%#llx\n",
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS]);
-	igt_info("  DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM\t%s\n",
+	igt_info("  DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM\t%s\n",
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
-		DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM ? "ON":"OFF");
+		DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM ? "ON":"OFF");
 	igt_info("DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT\t\t%#llx\n",
 		config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT]);
 	igt_info("DRM_XE_QUERY_CONFIG_VA_BITS\t\t\t%llu\n",
-- 
2.34.1
