Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A71C021B8
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 11:26:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4C810E203;
	Wed, 26 Feb 2025 11:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XCId+gYJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9477F10E203
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 11:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740569187; x=1772105187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tc7qUujdkCefJAZzauA+spL1d9BMpEyDXY7qWVlqIzc=;
 b=XCId+gYJeMMcCiHjUMKoT63RX4jgJxs6YZPQzzm6MqXj7u/ZHFgmWWZA
 gLqqU7Tyi4dElHRNT6hxFap6+AAPX3dmfY/I/BGNfvyFl//OSGomL/fhD
 ACWFUd6AIXGyigKYrmFFQpaaPUQwjhZHkXxZKkhhTzr7RAIgDQEL1o6p3
 8POzZaUHuy/dIz5lFBchbrqF4GXpr8G/YKlAe1DDH8iIywjF6S7gD5+6m
 fyPNt4PBdhrVDLpZ9ga1KkFPMsRKumdG5K0NoUK8MBcI1RzYk3cmtRv7e
 3x2XVpX37gRvJfTWDrW2i+2ao1foIlUPc7CWQXLgggsq6FhvR9rBBs39U w==;
X-CSE-ConnectionGUID: wRbfyuuySMakkXMSolueXw==
X-CSE-MsgGUID: a7yG7wsvSEy+5xAwgzJLsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="66781250"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="66781250"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 03:26:27 -0800
X-CSE-ConnectionGUID: nF1NXrccQ5W8VxTgJvGT9Q==
X-CSE-MsgGUID: EETJZ7nsRi2MQPZzEbWmSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="117166605"
Received: from slindbla-desk.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.75])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 03:26:22 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,
 v3 3/6] lib/intel_compute: Allow the user to provide a vm
Date: Wed, 26 Feb 2025 12:24:04 +0100
Message-ID: <20250226112532.1332367-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226112532.1332367-1-francois.dugast@intel.com>
References: <20250226112532.1332367-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_compute.c       | 68 ++++++++++++++++++++++++++-------------
 lib/intel_compute.h       | 13 ++++++--
 tests/intel/gem_compute.c |  2 +-
 tests/intel/xe_compute.c  |  4 +--
 4 files changed, 60 insertions(+), 27 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 9cca4a629..cad932c24 100644
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
 
@@ -666,10 +676,12 @@ static void dg1_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
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
@@ -698,7 +710,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
 	float *input_data, *output_data;
 	uint16_t devid = intel_get_drm_devid(fd);
 
-	bo_execenv_create(fd, &execenv, eci);
+	bo_execenv_create(fd, &execenv, eci, user);
 
 	/* Sets Kernel size */
 	bo_dict[0].size = ALIGN(size, 0x1000);
@@ -948,10 +960,12 @@ static void xehp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
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
@@ -981,7 +995,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 	struct bo_execenv execenv;
 	float *input_data, *output_data;
 
-	bo_execenv_create(fd, &execenv, eci);
+	bo_execenv_create(fd, &execenv, eci, user);
 
 	/* Sets Kernel size */
 	bo_dict[0].size = ALIGN(size, xe_get_default_alignment(fd));
@@ -1168,10 +1182,12 @@ static void xehpc_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
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
@@ -1192,7 +1208,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 	struct bo_execenv execenv;
 	float *input_data, *output_data;
 
-	bo_execenv_create(fd, &execenv, eci);
+	bo_execenv_create(fd, &execenv, eci, user);
 
 	/* Sets Kernel size */
 	bo_dict[0].size = ALIGN(size, xe_get_default_alignment(fd));
@@ -1517,10 +1533,12 @@ static void xe2_create_indirect_data_inc_kernel(uint32_t *addr_bo_buffer_batch,
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
@@ -1552,7 +1570,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 	struct bo_execenv execenv;
 	float *input_data, *output_data;
 
-	bo_execenv_create(fd, &execenv, eci);
+	bo_execenv_create(fd, &execenv, eci, user);
 
 	/* Sets Kernel size */
 	bo_dict[0].size = ALIGN(size, 0x1000);
@@ -1604,10 +1622,12 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
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
@@ -1642,7 +1662,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 	struct bo_execenv execenv;
 	float *input_data, *output_data;
 
-	bo_execenv_create(fd, &execenv, eci);
+	bo_execenv_create(fd, &execenv, eci, user);
 
 	/* Sets Kernel size */
 	bo_dict[0].size = ALIGN(size, 0x1000);
@@ -1704,7 +1724,8 @@ static const struct {
 	unsigned int ip_ver;
 	void (*compute_exec)(int fd, const unsigned char *kernel,
 			     unsigned int size,
-			     struct drm_xe_engine_class_instance *eci);
+			     struct drm_xe_engine_class_instance *eci,
+			     struct user_execenv *user);
 	uint32_t compat;
 } intel_compute_batches[] = {
 	{
@@ -1750,7 +1771,8 @@ static const struct {
 };
 
 static bool __run_intel_compute_kernel(int fd,
-				       struct drm_xe_engine_class_instance *eci)
+				       struct drm_xe_engine_class_instance *eci,
+				       struct user_execenv *user)
 {
 	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
 	unsigned int batch;
@@ -1782,14 +1804,14 @@ static bool __run_intel_compute_kernel(int fd,
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
@@ -1798,11 +1820,13 @@ bool run_intel_compute_kernel(int fd)
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
@@ -1821,7 +1845,7 @@ bool xe_run_intel_compute_kernel_on_engine(int fd,
 		return false;
 	}
 
-	return __run_intel_compute_kernel(fd, eci);
+	return __run_intel_compute_kernel(fd, eci, user);
 }
 
 /**
@@ -1907,8 +1931,8 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 	for (int i = 0; i < XE2_BO_PREEMPT_DICT_ENTRIES; ++i)
 		bo_dict_short[i] = bo_dict_long[i];
 
-	bo_execenv_create(fd, &execenv_short, eci);
-	bo_execenv_create(fd, &execenv_long, eci);
+	bo_execenv_create(fd, &execenv_short, eci, NULL);
+	bo_execenv_create(fd, &execenv_long, eci, NULL);
 
 	/* Prepare sync object for long */
 	bo_size_long = xe_bb_size(fd, bo_size_long);
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index 3c2cd010c..62e2422c4 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -33,10 +33,19 @@ struct intel_compute_kernels {
 	const unsigned char *long_kernel;
 };
 
+/**
+ * struct user_execenv - Container of the user-provided execution environment
+ */
+struct user_execenv {
+	/** @vm: use this VM if provided, otherwise create one */
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
index 558b46eba..21ebc980e 100644
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

