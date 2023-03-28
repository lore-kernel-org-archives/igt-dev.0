Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7320E10E6E2
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Mar 2023 05:22:47 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Mar 2023 22:22:38 -0700
Message-Id: <20230328052238.22108-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] lib/xe/xe_query: Extern
 xe_supports_faults()
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

Do not check for supports_faults in xe_device_get() as
it creates a VM in fault mode which prohibits creation
of any other VM in non-fault mode until this fault mode
VM is closed. This leads to test failures in multi threaded
cases.

v2: Rebase and add some documentation as per review feedback.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 lib/xe/xe_query.c | 54 +++++++++++++++++++++++------------------------
 lib/xe/xe_query.h |  3 ---
 2 files changed, 27 insertions(+), 30 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 82a7e36e3..f281bc4a3 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -160,23 +160,6 @@ static uint32_t __mem_default_alignment(struct drm_xe_query_mem_usage *mem_usage
 	return alignment;
 }
 
-static bool xe_check_supports_faults(int fd)
-{
-	bool supports_faults;
-
-	struct drm_xe_vm_create create = {
-		.flags = DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
-			 DRM_XE_VM_CREATE_FAULT_MODE,
-	};
-
-	supports_faults = !igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
-
-	if (supports_faults)
-		xe_vm_destroy(fd, create.vm_id);
-
-	return supports_faults;
-}
-
 /**
  * xe_engine_class_string:
  * @engine_class: engine class
@@ -268,7 +251,6 @@ struct xe_device *xe_device_get(int fd)
 						     xe_dev->gts, gt);
 	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_usage);
 	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_usage);
-	xe_dev->supports_faults = xe_check_supports_faults(fd);
 
 	/* We may get here from multiple threads, use first cached xe_dev */
 	pthread_mutex_lock(&cache.cache_mutex);
@@ -303,6 +285,33 @@ void xe_device_put(int fd)
 	pthread_mutex_unlock(&cache.cache_mutex);
 }
 
+/**
+ * xe_supports_faults:
+ * @fd: xe device fd
+ *
+ * Returns true if xe device @fd allows creating vm in fault mode otherwise
+ * false.
+ *
+ * NOTE: This function temporarily creates a VM in fault mode. Hence, while
+ * this function is executing, no non-fault mode VMs can be created.
+ */
+bool xe_supports_faults(int fd)
+{
+	bool supports_faults;
+
+	struct drm_xe_vm_create create = {
+		.flags = DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
+			 DRM_XE_VM_CREATE_FAULT_MODE,
+	};
+
+	supports_faults = !igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
+
+	if (supports_faults)
+		xe_vm_destroy(fd, create.vm_id);
+
+	return supports_faults;
+}
+
 static void xe_device_destroy_cache(void)
 {
 	pthread_mutex_lock(&cache.cache_mutex);
@@ -458,15 +467,6 @@ uint64_t xe_vram_size(int fd, int gt)
  */
 xe_dev_FN(xe_get_default_alignment, default_alignment, uint32_t);
 
-/**
- * xe_supports_faults:
- * @fd: xe device fd
- *
- * Returns true if xe device @fd allows creating vm in fault mode otherwise
- * false.
- */
-xe_dev_FN(xe_supports_faults, supports_faults, bool);
-
 /**
  * xe_va_bits:
  * @fd: xe device fd
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 70de183cc..3a00ecd1c 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -53,9 +53,6 @@ struct xe_device {
 	/** @has_vram: true if gpu has vram, false if system memory only */
 	bool has_vram;
 
-	/** @supports_faults: true if gpu supports faults, otherwise false */
-	bool supports_faults;
-
 	/** @va_bits: va length in bits */
 	uint32_t va_bits;
 
-- 
2.21.0.rc0.32.g243a4c7e27
