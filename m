Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF7E10EA0D
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:44:58 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:31 +0000
Message-Id: <20231103144359.7-37-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 36/64] drm-uapi/xe:
 s/FLAGS_HAS_VRAM/FLAG_HAS_VRAM
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
---
 include/drm-uapi/xe_drm.h | 20 ++++++++++----------
 tests/intel/xe_debugfs.c  |  4 ++--
 tests/intel/xe_query.c    |  4 ++--
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index de4ca255d..cadb1e2b1 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -354,7 +354,7 @@ struct drm_xe_query_mem_regions {
  *  - %DRM_XE_QUERY_CONFIG_FLAGS - Flags describing the device
  *    configuration, see list below
  *
- *    - %DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM - Flag is set if the device
+ *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
  *      has usable VRAM
  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
  *    required by this device, typically SZ_4K or SZ_64K
@@ -368,7 +368,7 @@ struct drm_xe_query_config {
 
 #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID		0
 #define DRM_XE_QUERY_CONFIG_FLAGS			1
-	#define DRM_XE_QUERY_CONFIG_FLAGS_HAS_VRAM	(0x1 << 0)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
 	/*
 	 * DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - This returns the
 	 * maximum value of the &min_page_size across all memory regions
@@ -752,10 +752,10 @@ struct drm_xe_vm_create {
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
 
@@ -849,10 +849,10 @@ struct drm_xe_vm_bind_op {
 	/** @op: Bind operation to perform */
 	__u32 op;
 
-#define DRM_XE_VM_BIND_FLAG_READONLY	(0x1 << 0)
-#define DRM_XE_VM_BIND_FLAG_ASYNC	(0x1 << 1)
-#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 2)
-#define DRM_XE_VM_BIND_FLAG_NULL	(0x1 << 3)
+#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
+#define DRM_XE_VM_BIND_FLAG_ASYNC	(1 << 1)
+#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 2)
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
index 267d6ddc8..e788835a3 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -366,9 +366,9 @@ test_query_config(int fd)
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
