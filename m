Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB1F10E1E9
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 05:36:42 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun,  3 Dec 2023 21:36:37 -0800
Message-Id: <20231204053638.29960-3-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20231204053638.29960-1-niranjana.vishwanathapura@intel.com>
References: <20231204053638.29960-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/3] lib/intel_compute: Update
 intel_compute to run on specified engine
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

With CCS_MODE setting, available compute slices can be assigned
to specific compute engines. Update intel_compute library to
be able to run compute kernel on specified compute or render
engine.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_compute.c | 80 ++++++++++++++++++++++++++++++++-------------
 lib/intel_compute.h |  3 ++
 2 files changed, 60 insertions(+), 23 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index dd921bf46..b7aae4dbc 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -16,7 +16,6 @@
 #include "intel_compute.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
-#include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xehp_media.h"
@@ -62,7 +61,8 @@ struct bo_execenv {
 	struct drm_i915_gem_exec_object2 *obj;
 };
 
-static void bo_execenv_create(int fd, struct bo_execenv *execenv)
+static void bo_execenv_create(int fd, struct bo_execenv *execenv,
+			      struct drm_xe_engine_class_instance *eci)
 {
 	igt_assert(execenv);
 
@@ -71,18 +71,24 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv)
 	execenv->driver = get_intel_driver(fd);
 
 	if (execenv->driver == INTEL_DRIVER_XE) {
-		uint16_t engine_class;
-		uint32_t devid = intel_get_drm_devid(fd);
-		const struct intel_device_info *info = intel_get_device_info(devid);
-
-		if (info->graphics_ver >= 12 && info->graphics_rel < 60)
-			engine_class = DRM_XE_ENGINE_CLASS_RENDER;
-		else
-			engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
-
 		execenv->vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
-		execenv->exec_queue = xe_exec_queue_create_class(fd, execenv->vm,
-								 engine_class);
+
+		if (eci) {
+			execenv->exec_queue = xe_exec_queue_create(fd, execenv->vm,
+								   eci, 0);
+		} else {
+			uint16_t engine_class;
+			uint32_t devid = intel_get_drm_devid(fd);
+			const struct intel_device_info *info = intel_get_device_info(devid);
+
+			if (info->graphics_ver >= 12 && info->graphics_rel < 60)
+				engine_class = DRM_XE_ENGINE_CLASS_RENDER;
+			else
+				engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
+
+			execenv->exec_queue = xe_exec_queue_create_class(fd, execenv->vm,
+									 engine_class);
+		}
 	}
 }
 
@@ -584,9 +590,11 @@ static void dg1_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
  * @fd: file descriptor of the opened DRM device
  * @kernel: GPU Kernel binary to be executed
  * @size: size of @kernel.
+ * @eci: engine class instance
  */
 static void compute_exec(int fd, const unsigned char *kernel,
-			 unsigned int size)
+			 unsigned int size,
+			 struct drm_xe_engine_class_instance *eci)
 {
 #define BO_DICT_ENTRIES 7
 	struct bo_dict_entry bo_dict[BO_DICT_ENTRIES] = {
@@ -615,7 +623,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
 	float *dinput;
 	uint16_t devid = intel_get_drm_devid(fd);
 
-	bo_execenv_create(fd, &execenv);
+	bo_execenv_create(fd, &execenv, eci);
 
 	/* Sets Kernel size */
 	bo_dict[0].size = ALIGN(size, 0x1000);
@@ -861,9 +869,11 @@ static void xehp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
  * @fd: file descriptor of the opened DRM device
  * @kernel: GPU Kernel binary to be executed
  * @size: size of @kernel.
+ * @eci: engine class instance
  */
 static void xehp_compute_exec(int fd, const unsigned char *kernel,
-			     unsigned int size)
+			      unsigned int size,
+			      struct drm_xe_engine_class_instance *eci)
 {
 #define XEHP_BO_DICT_ENTRIES 9
 	struct bo_dict_entry bo_dict[XEHP_BO_DICT_ENTRIES] = {
@@ -893,7 +903,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 	struct bo_execenv execenv;
 	float *dinput;
 
-	bo_execenv_create(fd, &execenv);
+	bo_execenv_create(fd, &execenv, eci);
 
 	/* Sets Kernel size */
 	bo_dict[0].size = ALIGN(size, 0x1000);
@@ -1075,9 +1085,11 @@ static void xehpc_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
  * @fd: file descriptor of the opened DRM device
  * @kernel: GPU Kernel binary to be executed
  * @size: size of @kernel.
+ * @eci: engine class instance
  */
 static void xehpc_compute_exec(int fd, const unsigned char *kernel,
-			       unsigned int size)
+			       unsigned int size,
+			       struct drm_xe_engine_class_instance *eci)
 {
 #define XEHPC_BO_DICT_ENTRIES 6
 	struct bo_dict_entry bo_dict[XEHPC_BO_DICT_ENTRIES] = {
@@ -1098,7 +1110,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	struct bo_execenv execenv;
 	float *dinput;
 
-	bo_execenv_create(fd, &execenv);
+	bo_execenv_create(fd, &execenv, eci);
 
 	/* Sets Kernel size */
 	bo_dict[0].size = ALIGN(size, 0x1000);
@@ -1152,7 +1164,8 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 static const struct {
 	unsigned int ip_ver;
 	void (*compute_exec)(int fd, const unsigned char *kernel,
-			     unsigned int size);
+			     unsigned int size,
+			     struct drm_xe_engine_class_instance *eci);
 	uint32_t compat;
 } intel_compute_batches[] = {
 	{
@@ -1177,7 +1190,8 @@ static const struct {
 	},
 };
 
-bool run_intel_compute_kernel(int fd)
+static bool __run_intel_compute_kernel(int fd,
+				       struct drm_xe_engine_class_instance *eci)
 {
 	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
 	unsigned int batch;
@@ -1188,8 +1202,10 @@ bool run_intel_compute_kernel(int fd)
 		if (ip_ver == intel_compute_batches[batch].ip_ver)
 			break;
 	}
-	if (batch == ARRAY_SIZE(intel_compute_batches))
+	if (batch == ARRAY_SIZE(intel_compute_batches)) {
+		igt_debug("GPU version 0x%x not supported\n", ip_ver);
 		return false;
+	}
 
 	if (!(COMPAT_DRIVER_FLAG(driver) & intel_compute_batches[batch].compat)) {
 		igt_debug("Driver is not supported: flags %x & %x\n",
@@ -1207,7 +1223,25 @@ bool run_intel_compute_kernel(int fd)
 		return 1;
 
 	intel_compute_batches[batch].compute_exec(fd, kernels->kernel,
-						  kernels->size);
+						  kernels->size, eci);
 
 	return true;
 }
+
+bool run_intel_compute_kernel(int fd)
+{
+	return __run_intel_compute_kernel(fd, NULL);
+}
+
+bool run_intel_compute_kernel_on_engine(int fd,
+					struct drm_xe_engine_class_instance *eci)
+{
+	if (eci->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE &&
+	    eci->engine_class != DRM_XE_ENGINE_CLASS_RENDER) {
+		igt_debug("%s engine class not supported\n",
+			  xe_engine_class_string(eci->engine_class));
+		return false;
+	}
+
+	return __run_intel_compute_kernel(fd, eci);
+}
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index ba153f064..5d81c3d62 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -9,6 +9,8 @@
 #ifndef INTEL_COMPUTE_H
 #define INTEL_COMPUTE_H
 
+#include "xe_drm.h"
+
 /*
  * OpenCL Kernels are generated using:
  *
@@ -28,5 +30,6 @@ struct intel_compute_kernels {
 extern const struct intel_compute_kernels intel_compute_square_kernels[];
 
 bool run_intel_compute_kernel(int fd);
+bool run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_instance *eci);
 
 #endif	/* INTEL_COMPUTE_H */
-- 
2.21.0.rc0.32.g243a4c7e27
