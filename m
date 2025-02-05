Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC2EC02199
	for <igt-dev@archiver.kernel.org>; Wed,  5 Feb 2025 10:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455A710E771;
	Wed,  5 Feb 2025 10:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iyU6x8s9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7512A10E0E0
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Feb 2025 10:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738750712; x=1770286712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3u6JQ2fRifFqXFdhmy2Vs91OEx3+br4aj7lJxgpMhuM=;
 b=iyU6x8s9hV2CrHhGfSqlvH6SJxVYsGkRTS8cjha3i38Cys/Ewj7AzgDv
 3FwV7KG//9OU+CsOibu1r8WjYsau5VrKlU0MMyFG2JeLu1axv+y0yF9Eh
 9OIMrAEfqJl0suW3dS+dU3RJn6A0xa4NpTDBGpzo6/VgsxmOCGOZI78bz
 xA6fLHu2hVUg8ZYCQE3/uQ3HlOTVebNj1gpiNhIyCeHA9eYhuF8P/KBhK
 yY0VTuSz307O6cCL2y/cx5+05P460xrwelro8BkzxHqw6bzh6MRTsmSHP
 6+pH1FIiiQHgQJYO7lsJ/Q8YsEz4mHKybqwbZx8ibOpf/7xZ3BtzRFrqN g==;
X-CSE-ConnectionGUID: YqDI4ZxUSvehHNfxD/02Ag==
X-CSE-MsgGUID: fmXM9ZV/Q62xJAPExOD1gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50700680"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="50700680"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 02:18:23 -0800
X-CSE-ConnectionGUID: 0bVm1jgDRTS95Xh4Ea8bQg==
X-CSE-MsgGUID: zKl6uzo+TfmzAdgswYXEww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111299195"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.221])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 02:18:22 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 2/5] lib/intel_compute: Allow the user to provide a vm
Date: Wed,  5 Feb 2025 11:17:03 +0100
Message-ID: <20250205101748.1117809-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205101748.1117809-1-francois.dugast@intel.com>
References: <20250205101748.1117809-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

By default the vm used in the compute library is created with default
flags and not visible externally. There can be situations where the
vm to be used already exists and requires special handling prior to
be used by the compute library. Add the possibility for the user to
provide such a vm when running a compute kernel. The place holder
structure containing the vm can later be extended to include more
parameters.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c       | 68 ++++++++++++++++++++++++++-------------
 lib/intel_compute.h       |  9 ++++--
 tests/intel/gem_compute.c |  2 +-
 tests/intel/xe_compute.c  |  4 +--
 4 files changed, 56 insertions(+), 27 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 86eb48afc..e0776fb6d 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -77,10 +77,13 @@ struct bo_execenv {
 	/* i915 part */
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 *obj;
+
+	struct user_execenv *user;
 };
 
 static void bo_execenv_create(int fd, struct bo_execenv *execenv,
-			      struct drm_xe_engine_class_instance *eci)
+			      struct drm_xe_engine_class_instance *eci,
+			      struct user_execenv *user)
 {
 	igt_assert(execenv);
 
@@ -89,7 +92,13 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv,
 	execenv->driver = get_intel_driver(fd);
 
 	if (execenv->driver == INTEL_DRIVER_XE) {
-		execenv->vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+		if (user)
+			execenv->user = user;
+
+		if (user && user->vm)
+			execenv->vm = user->vm;
+		else
+			execenv->vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 
 		if (eci) {
 			execenv->exec_queue = xe_exec_queue_create(fd, execenv->vm,
@@ -116,7 +125,8 @@ static void bo_execenv_destroy(struct bo_execenv *execenv)
 
 	if (execenv->driver == INTEL_DRIVER_XE) {
 		xe_exec_queue_destroy(execenv->fd, execenv->exec_queue);
-		xe_vm_destroy(execenv->fd, execenv->vm);
+		if (!execenv->user || !execenv->user->vm)
+			xe_vm_destroy(execenv->fd, execenv->vm);
 	}
 }
 
@@ -665,10 +675,12 @@ static void dg1_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
  * @kernel: GPU Kernel binary to be executed
  * @size: size of @kernel.
  * @eci: Xe engine class instance if device is Xe
+ * @user: user-provided execution environment
  */
 static void compute_exec(int fd, const unsigned char *kernel,
 			 unsigned int size,
-			 struct drm_xe_engine_class_instance *eci)
+			 struct drm_xe_engine_class_instance *eci,
+			 struct user_execenv *user)
 {
 #define BO_DICT_ENTRIES 7
 	struct bo_dict_entry bo_dict[BO_DICT_ENTRIES] = {
@@ -697,7 +709,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
 	float *input_data, *output_data;
 	uint16_t devid = intel_get_drm_devid(fd);
 
-	bo_execenv_create(fd, &execenv, eci);
+	bo_execenv_create(fd, &execenv, eci, user);
 
 	/* Sets Kernel size */
 	bo_dict[0].size = ALIGN(size, 0x1000);
@@ -946,10 +958,12 @@ static void xehp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
  * @kernel: GPU Kernel binary to be executed
  * @size: size of @kernel.
  * @eci: Xe engine class instance if device is Xe
+ * @user: user-provided execution environment
  */
 static void xehp_compute_exec(int fd, const unsigned char *kernel,
 			      unsigned int size,
-			      struct drm_xe_engine_class_instance *eci)
+			      struct drm_xe_engine_class_instance *eci,
+			      struct user_execenv *user)
 {
 #define XEHP_BO_DICT_ENTRIES 9
 	struct bo_dict_entry bo_dict[XEHP_BO_DICT_ENTRIES] = {
@@ -979,7 +993,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 	struct bo_execenv execenv;
 	float *input_data, *output_data;
 
-	bo_execenv_create(fd, &execenv, eci);
+	bo_execenv_create(fd, &execenv, eci, user);
 
 	/* Sets Kernel size */
 	bo_dict[0].size = ALIGN(size, xe_get_default_alignment(fd));
@@ -1165,10 +1179,12 @@ static void xehpc_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
  * @kernel: GPU Kernel binary to be executed
  * @size: size of @kernel.
  * @eci: Xe engine class instance if device is Xe
+ * @user: user-provided execution environment
  */
 static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 			       unsigned int size,
-			       struct drm_xe_engine_class_instance *eci)
+			       struct drm_xe_engine_class_instance *eci,
+			       struct user_execenv *user)
 {
 #define XEHPC_BO_DICT_ENTRIES 6
 	struct bo_dict_entry bo_dict[XEHPC_BO_DICT_ENTRIES] = {
@@ -1189,7 +1205,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	struct bo_execenv execenv;
 	float *input_data, *output_data;
 
-	bo_execenv_create(fd, &execenv, eci);
+	bo_execenv_create(fd, &execenv, eci, user);
 
 	/* Sets Kernel size */
 	bo_dict[0].size = ALIGN(size, xe_get_default_alignment(fd));
@@ -1514,10 +1530,12 @@ static void xe2_create_indirect_data_inc_kernel(uint32_t *addr_bo_buffer_batch,
  * @kernel: GPU Kernel binary to be executed
  * @size: size of @kernel.
  * @eci: xelpg engine class instance if device is MTL
+ * @user: user-provided execution environment
  */
 static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 				unsigned int size,
-				struct drm_xe_engine_class_instance *eci)
+			       struct drm_xe_engine_class_instance *eci,
+			       struct user_execenv *user)
 {
 #define XELPG_BO_DICT_ENTRIES 9
 	struct bo_dict_entry bo_dict[XELPG_BO_DICT_ENTRIES] = {
@@ -1549,7 +1567,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 	struct bo_execenv execenv;
 	float *input_data, *output_data;
 
-	bo_execenv_create(fd, &execenv, eci);
+	bo_execenv_create(fd, &execenv, eci, user);
 
 	/* Sets Kernel size */
 	bo_dict[0].size = ALIGN(size, 0x1000);
@@ -1601,10 +1619,12 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
  * @fd: file descriptor of the opened DRM device
  * @kernel: GPU Kernel binary to be executed
  * @size: size of @kernel.
+ * @user: user-provided execution environment
  */
 static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 				unsigned int size,
-				struct drm_xe_engine_class_instance *eci)
+				struct drm_xe_engine_class_instance *eci,
+				struct user_execenv *user)
 {
 #define XE2_BO_DICT_ENTRIES 10
 	struct bo_dict_entry bo_dict[XE2_BO_DICT_ENTRIES] = {
@@ -1639,7 +1659,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 	struct bo_execenv execenv;
 	float *input_data, *output_data;
 
-	bo_execenv_create(fd, &execenv, eci);
+	bo_execenv_create(fd, &execenv, eci, user);
 
 	/* Sets Kernel size */
 	bo_dict[0].size = ALIGN(size, 0x1000);
@@ -1701,7 +1721,8 @@ static const struct {
 	unsigned int ip_ver;
 	void (*compute_exec)(int fd, const unsigned char *kernel,
 			     unsigned int size,
-			     struct drm_xe_engine_class_instance *eci);
+			     struct drm_xe_engine_class_instance *eci,
+			     struct user_execenv *user);
 	uint32_t compat;
 } intel_compute_batches[] = {
 	{
@@ -1742,7 +1763,8 @@ static const struct {
 };
 
 static bool __run_intel_compute_kernel(int fd,
-				       struct drm_xe_engine_class_instance *eci)
+				       struct drm_xe_engine_class_instance *eci,
+				       struct user_execenv *user)
 {
 	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
 	unsigned int batch;
@@ -1774,14 +1796,14 @@ static bool __run_intel_compute_kernel(int fd,
 		return false;
 
 	intel_compute_batches[batch].compute_exec(fd, kernels->kernel,
-						  kernels->size, eci);
+						  kernels->size, eci, user);
 
 	return true;
 }
 
-bool run_intel_compute_kernel(int fd)
+bool run_intel_compute_kernel(int fd, struct user_execenv *user)
 {
-	return __run_intel_compute_kernel(fd, NULL);
+	return __run_intel_compute_kernel(fd, NULL, user);
 }
 
 /**
@@ -1790,11 +1812,13 @@ bool run_intel_compute_kernel(int fd)
  *
  * @fd: file descriptor of the opened DRM Xe device
  * @eci: Xe engine class instance
+ * @user: user-provided execution environment
  *
  * Returns true on success, false otherwise.
  */
 bool xe_run_intel_compute_kernel_on_engine(int fd,
-					   struct drm_xe_engine_class_instance *eci)
+					   struct drm_xe_engine_class_instance *eci,
+					   struct user_execenv *user)
 {
 	if (!is_xe_device(fd)) {
 		igt_debug("Xe device expected\n");
@@ -1813,7 +1837,7 @@ bool xe_run_intel_compute_kernel_on_engine(int fd,
 		return false;
 	}
 
-	return __run_intel_compute_kernel(fd, eci);
+	return __run_intel_compute_kernel(fd, eci, user);
 }
 
 /**
@@ -1899,8 +1923,8 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	for (int i = 0; i < XE2_BO_PREEMPT_DICT_ENTRIES; ++i)
 		bo_dict_short[i] = bo_dict_long[i];
 
-	bo_execenv_create(fd, &execenv_short, eci);
-	bo_execenv_create(fd, &execenv_long, eci);
+	bo_execenv_create(fd, &execenv_short, eci, NULL);
+	bo_execenv_create(fd, &execenv_long, eci, NULL);
 
 	/* Prepare sync object for long */
 	bo_size_long = xe_bb_size(fd, bo_size_long);
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index 3c2cd010c..c4b4ee5e1 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -33,10 +33,15 @@ struct intel_compute_kernels {
 	const unsigned char *long_kernel;
 };
 
+struct user_execenv {
+	uint32_t vm;
+};
+
 extern const struct intel_compute_kernels intel_compute_square_kernels[];
 
-bool run_intel_compute_kernel(int fd);
-bool xe_run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_instance *eci);
+bool run_intel_compute_kernel(int fd, struct user_execenv *user);
+bool xe_run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_instance *eci,
+					   struct user_execenv *user);
 bool run_intel_compute_kernel_preempt(int fd, struct drm_xe_engine_class_instance *eci,
 				      bool threadgroup_preemption);
 #endif	/* INTEL_COMPUTE_H */
diff --git a/tests/intel/gem_compute.c b/tests/intel/gem_compute.c
index 97c701bce..ce41cd386 100644
--- a/tests/intel/gem_compute.c
+++ b/tests/intel/gem_compute.c
@@ -27,7 +27,7 @@
 static void
 test_compute_square(int fd)
 {
-	igt_require_f(run_intel_compute_kernel(fd), "GPU not supported\n");
+	igt_require_f(run_intel_compute_kernel(fd, NULL), "GPU not supported\n");
 }
 
 igt_main
diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 62beb24dc..1262a2b22 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -146,7 +146,7 @@ test_compute_kernel_with_ccs_mode(int num_gt)
 
 				igt_info("GT-%d: Running compute kernel with ccs_mode %d on ccs engine %d\n",
 					 gt, m, hwe->engine_instance);
-				igt_assert_f(xe_run_intel_compute_kernel_on_engine(fd, hwe),
+				igt_assert_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL),
 					     "Unable to run compute kernel successfully\n");
 			}
 			drm_close_driver(fd);
@@ -174,7 +174,7 @@ test_compute_kernel_with_ccs_mode(int num_gt)
 static void
 test_compute_square(int fd)
 {
-	igt_require_f(run_intel_compute_kernel(fd), "GPU not supported\n");
+	igt_require_f(run_intel_compute_kernel(fd, NULL), "GPU not supported\n");
 }
 
 igt_main
-- 
2.43.0

