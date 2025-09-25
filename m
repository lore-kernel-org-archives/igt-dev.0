Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232C3CAC5A5
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 11:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C997610E8E4;
	Thu, 25 Sep 2025 11:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kWq6y9SE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F239F10E8E2
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 11:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758800242; x=1790336242;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/+yicTljIewwVY6e8ZyMHXEy+PuQpMg5eCaMVostoLE=;
 b=kWq6y9SEyrTWCW3EO44IZoHcWWSSdg67qZT1nSvCAO0pFmPVF93ObmH3
 w/CiTOZH+8/l+sj5Lx5+i5aXj8zNI00ZZMj5ypjgm8evRH0g/xummWwFH
 /TE9iuDElpmeZcQzovGWx361Ohg0zNIgqWQfN5eUOCHPMuqNvQVR8SL32
 Tgeu69Vy/2aKGjixU+P7EXU/YYyaL7jiBCNF4/F5ws3HdiywjwkP1/SQ4
 6Or16B9e4onTdVcAdh377YX26ATBhfg1PLBFhTpTH2LMkjmtuKfmyc13j
 htIK57+a37cQq6AKzUIvQtLHK209AE25g8TPvT1wH2MFgS2tZzgl6Xc2I w==;
X-CSE-ConnectionGUID: x3PYBy+FS5uktuFfUh1+Nw==
X-CSE-MsgGUID: 9MY8OJraS/KJHOQVc2TZyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61167970"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61167970"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 04:37:22 -0700
X-CSE-ConnectionGUID: skZnhJfQTG2oaRH9CEznZg==
X-CSE-MsgGUID: 0yPF+m07RgaTZnVRpbmTUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="208055078"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 04:37:19 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 priyanka.dandamudi@intel.com, Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v8 1/1] tests/intel/xe_compute_preempt: Compute
 preemption check
Date: Thu, 25 Sep 2025 11:36:58 +0000
Message-ID: <20250925113705.414943-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925113705.414943-1-sobin.thomas@intel.com>
References: <20250925113705.414943-1-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
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

On platforms (like PVC) that do not support walker mid-thread
preemption, running tests in forked threads can lead to inconsistent
states due to igt_skip being called mid-execution. Made changes to
perform kernel preemption check at the beginning of each subtests.
If the GPU version does not support the required features, the
test is skipped gracefully, ensuring consistent behavior across
different platforms.

v2: Fixed review comments to move the compatibility check
    into the igt_fixture. [Priyanka]

v3: Added check for thread group preemption and WMTP.
    Added enum flags for preemption type as per review . [Zbigniew]

v4: Added check for preempt inside __run_intel_compute_kernel_preempt
    Refactored the code.  [priyanka]

v5: Refactor for finding the kernel and out of bound check. [Zbigniew]

v6: Added NULL Check for kernel. [Zbigniew]

v7: Moved TODO inside the code. [kamil]
    Modified the check condition for kernel [Priyanka]

v8: Additional check for the kernel variants

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 lib/intel_compute.c              | 141 +++++++++++++++++++++++++------
 lib/intel_compute.h              |   7 ++
 tests/intel/xe_compute_preempt.c |   6 ++
 3 files changed, 130 insertions(+), 24 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 147dd2916..0853c7662 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: MIT */
 /*
  * Copyright © 2023 Intel Corporation
- *
+ * TODO: Add kernel for PVC for preemption test
  * Authors:
  *    Francois Dugast <francois.dugast@intel.com>
  */
@@ -1921,14 +1921,69 @@ static const struct {
 	},
 };
 
+static const struct intel_compute_kernels
+		*intel_compute_find_kernel(const struct intel_compute_kernels  *kernels,
+		unsigned int ip_ver)
+{
+	if (!kernels) {
+		igt_debug("%s: kernel_list is NULL\n", __func__);
+		return NULL;
+	}
+
+	while (kernels->kernel) {
+		if (ip_ver == kernels->ip_ver)
+			return kernels;
+		kernels++;
+	}
+
+	return NULL;
+}
+
+static bool validate_kernels(const struct intel_compute_kernels *kernels,
+							 bool check_preemption,
+							 bool threadgroup_preemption,
+							 unsigned int ip_ver)
+{
+	if (!kernels) {
+		igt_warn("No kernel entry found for IP version 0x%x\n", ip_ver);
+		return false;
+	}
+
+	if (!kernels->kernel) {
+		igt_warn("Missing compute square kernel for IP version 0x%x\n", ip_ver);
+		return false;
+	}
+
+	if (!check_preemption)
+		return true;
+
+	if (threadgroup_preemption && !kernels->long_kernel) {
+		igt_warn("Long kernel for thread group preemption is not available for "
+			 "IP version 0x%x\n", ip_ver);
+		return false;
+		} else if (!threadgroup_preemption) {
+			if (!kernels->sip_kernel) {
+				igt_warn("SIP kernel for WMTP not available for IP "
+					 "version 0x%x\n", ip_ver);
+				return false;
+			}
+			if (!kernels->loop_kernel) {
+				igt_warn("Loop kernel for WMTP not available for "
+					 "IP version 0x%x\n", ip_ver);
+				return false;
+			}
+		}
+	return true;
+}
+
 static bool __run_intel_compute_kernel(int fd,
 				       struct drm_xe_engine_class_instance *eci,
 				       struct user_execenv *user,
 				       enum execenv_alloc_prefs alloc_prefs)
 {
 	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
-	unsigned int batch;
-	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
+	int batch;
+	const struct intel_compute_kernels *kernel_entries = intel_compute_square_kernels, *kernels;
 	enum intel_driver driver = get_intel_driver(fd);
 	const unsigned char *kernel;
 	unsigned int kernel_size;
@@ -1954,12 +2009,8 @@ static bool __run_intel_compute_kernel(int fd,
 		kernel = user->kernel;
 		kernel_size = user->kernel_size;
 	} else {
-		while (kernels->kernel) {
-			if (ip_ver == kernels->ip_ver)
-				break;
-			kernels++;
-		}
-		if (!kernels->kernel)
+		kernels = intel_compute_find_kernel(kernel_entries, ip_ver);
+		if (!validate_kernels(kernels, false, false, ip_ver))
 			return false;
 		kernel = kernels->kernel;
 		kernel_size = kernels->size;
@@ -2193,40 +2244,59 @@ static const struct {
 			     bool threadgroup_preemption,
 			     enum execenv_alloc_prefs alloc_prefs);
 	uint32_t compat;
+	enum xe_compute_preempt_type preempt_type;
 } intel_compute_preempt_batches[] = {
 	{
 		.ip_ver = IP_VER(20, 01),
 		.compute_exec = xe2lpg_compute_preempt_exec,
 		.compat = COMPAT_DRIVER_XE,
+		.preempt_type = PREEMPT_TGP | PREEMPT_WMTP,
 	},
 	{
 		.ip_ver = IP_VER(20, 04),
 		.compute_exec = xe2lpg_compute_preempt_exec,
 		.compat = COMPAT_DRIVER_XE,
+		.preempt_type = PREEMPT_TGP | PREEMPT_WMTP,
 	},
 	{
 		.ip_ver = IP_VER(30, 00),
 		.compute_exec = xe2lpg_compute_preempt_exec,
 		.compat = COMPAT_DRIVER_XE,
+		.preempt_type = PREEMPT_TGP | PREEMPT_WMTP,
 	},
 };
 
+static int find_preempt_batch(unsigned int ip_ver)
+{
+	for (int batch_idx = 0; batch_idx < ARRAY_SIZE(intel_compute_preempt_batches); batch_idx++)
+		if (ip_ver == intel_compute_preempt_batches[batch_idx].ip_ver)
+			return batch_idx;
+	return -1;
+}
+
+static bool is_preemptable(int batch, enum xe_compute_preempt_type required_preempt)
+{
+	if (required_preempt &&
+	    !(intel_compute_preempt_batches[batch].preempt_type & required_preempt)) {
+		igt_info("Preemption not supported\n");
+		return false;
+	}
+	return true;
+}
+
 static bool __run_intel_compute_kernel_preempt(int fd,
 		struct drm_xe_engine_class_instance *eci,
 		bool threadgroup_preemption,
 		enum execenv_alloc_prefs alloc_prefs)
 {
 	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
-	unsigned int batch;
-	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
+	int batch;
+	const struct intel_compute_kernels *kernel_entries = intel_compute_square_kernels, *kernels;
 	enum intel_driver driver = get_intel_driver(fd);
+	int required_preempt = threadgroup_preemption ? PREEMPT_TGP : PREEMPT_WMTP;
 
-	for (batch = 0; batch < ARRAY_SIZE(intel_compute_preempt_batches); batch++)
-		if (ip_ver == intel_compute_preempt_batches[batch].ip_ver)
-			break;
-
-
-	if (batch == ARRAY_SIZE(intel_compute_preempt_batches)) {
+	batch = find_preempt_batch(ip_ver);
+	if (batch < 0) {
 		igt_debug("GPU version 0x%x not supported\n", ip_ver);
 		return false;
 	}
@@ -2238,14 +2308,13 @@ static bool __run_intel_compute_kernel_preempt(int fd,
 		return false;
 	}
 
-	while (kernels->kernel) {
-		if (ip_ver == kernels->ip_ver)
-			break;
-		kernels++;
-	}
+	if (!is_preemptable(batch, required_preempt))
+		return false;
+
+	kernels = intel_compute_find_kernel(kernel_entries, ip_ver);
 
-	if (!kernels->kernel || !kernels->sip_kernel || !kernels->long_kernel)
-		return 0;
+	if (!validate_kernels(kernels, true, threadgroup_preemption, ip_ver))
+		return false;
 
 	intel_compute_preempt_batches[batch].compute_exec(fd, kernels->long_kernel,
 							  kernels->long_kernel_size,
@@ -2260,6 +2329,30 @@ static bool __run_intel_compute_kernel_preempt(int fd,
 
 	return true;
 }
+
+/**
+ * check_kernel_preempt- Checks ip version to confirm if  provided
+ * preempt type is supported.
+ * @fd: file descriptor of the opened DRM Xe device
+ * @required_preempt: Preemption type ( WMTP/TGP)
+ *
+ * Returns true on success, false otherwise.
+ */
+bool check_kernel_preempt(int fd, enum xe_compute_preempt_type required_preempt)
+{
+	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	int batch = find_preempt_batch(ip_ver);
+
+	if (batch < 0) {
+		igt_debug("GPU version 0x%x not supported\n", ip_ver);
+		return false;
+	}
+	if (!is_preemptable(batch, required_preempt))
+		return false;
+
+	return true;
+}
+
 /**
  * run_intel_compute_kernel_preempt - runs compute kernels to
  * exercise preemption scenario.
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index 412791d07..b70cd7185 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -71,6 +71,11 @@ enum execenv_alloc_prefs {
 	EXECENV_PREF_VRAM_IF_POSSIBLE,
 };
 
+enum xe_compute_preempt_type {
+	PREEMPT_TGP  = 1 << 0,    /* ThreadGroup Preemption */
+	PREEMPT_WMTP  = 1 << 1,  /* Walker Mid Thread Preemption */
+};
+
 extern const struct intel_compute_kernels intel_compute_square_kernels[];
 
 bool run_intel_compute_kernel(int fd, struct user_execenv *user,
@@ -81,4 +86,6 @@ bool xe_run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_in
 bool run_intel_compute_kernel_preempt(int fd, struct drm_xe_engine_class_instance *eci,
 				      bool threadgroup_preemption,
 				      enum execenv_alloc_prefs alloc_prefs);
+
+bool check_kernel_preempt(int fd, enum xe_compute_preempt_type required_preempt);
 #endif	/* INTEL_COMPUTE_H */
diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index c9b194869..a4c0bc59b 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -76,6 +76,7 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("compute-preempt") {
+		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
 		xe_for_each_engine(xe, hwe) {
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
 				continue;
@@ -86,6 +87,7 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("compute-preempt-many") {
+		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
 		xe_for_each_engine(xe, hwe) {
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
 				continue;
@@ -112,6 +114,7 @@ igt_main
 	igt_subtest_with_dynamic("compute-preempt-many-all-ram") {
 		igt_require(swap_mb > CONTEXT_MB * 10);
 
+		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
 		xe_for_each_engine(xe, hwe) {
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
 				continue;
@@ -138,6 +141,7 @@ igt_main
 	igt_subtest_with_dynamic("compute-preempt-many-vram") {
 		igt_require(xe_has_vram(xe));
 
+		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
 		xe_for_each_engine(xe, hwe) {
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
 				continue;
@@ -164,6 +168,7 @@ igt_main
 	igt_subtest_with_dynamic("compute-preempt-many-vram-evict") {
 		igt_require(xe_has_vram(xe));
 
+		igt_require(check_kernel_preempt(xe, PREEMPT_WMTP));
 		xe_for_each_engine(xe, hwe) {
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
 				continue;
@@ -188,6 +193,7 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("compute-threadgroup-preempt") {
+		igt_require(check_kernel_preempt(xe, PREEMPT_TGP));
 		xe_for_each_engine(xe, hwe) {
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
 				continue;
-- 
2.51.0

