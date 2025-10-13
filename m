Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984FFCCD183
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 13:35:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1E010E441;
	Mon, 13 Oct 2025 13:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a2SbDvUX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BBB10E441
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 13:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760362542; x=1791898542;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U7YKFigBZgeBEcHty5zsMyCvQeRtQ24jZzeGh4uU2Ro=;
 b=a2SbDvUXB24xeO4Hk4pblX7a1JULww5vY8CnWijWR3ZWvRbmJXOc/JqU
 AnsrBqAthuS0XCuO73SxvBxRAd2ul65lpPWdakfqU3H3v3T1BdFvrZQXj
 rmkBCO2lZx48kdzkgn2tZtVTEXt17I7aB6y2FiF84O+/90SrEl0Q6IdUZ
 NUSLo967zvae59j7wkSq5XcN77n2hYAmg4/ZP7L/E7cilI9nZvh0L5yDp
 wc+trQBVar1yDM3aBS6+B5qWWs/tWHllWZSpg5GC66hTWJhqt00FZ/lKJ
 XtNSw0C1410z225sr/SZqIHShzcevdgYdvP4InR4EBP3/+EM8bH05VZt+ A==;
X-CSE-ConnectionGUID: fzO1iJERRsePDEyJpY7Nnw==
X-CSE-MsgGUID: st1zJZqmTYW8NBH507jViQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73106024"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="73106024"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 06:35:42 -0700
X-CSE-ConnectionGUID: wpA5qjyhQGaHR7vlE9cZyw==
X-CSE-MsgGUID: Uv+65XNcSRasjDSh8DCP7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="180844522"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 06:35:42 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 priyanka.dandamudi@intel.com, Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v10 1/3] tests/intel/xe_compute_preempt: Compute
 preemption check
Date: Mon, 13 Oct 2025 13:34:33 +0000
Message-ID: <20251013133439.543393-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013133439.543393-1-sobin.thomas@intel.com>
References: <20251013133439.543393-1-sobin.thomas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 lib/intel_compute.c              | 79 ++++++++++++++++++++++++++++----
 lib/intel_compute.h              | 11 +++++
 tests/intel/xe_compute_preempt.c |  6 +++
 3 files changed, 88 insertions(+), 8 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 147dd2916..9a4bcc047 100644
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
@@ -2193,40 +2193,70 @@ static const struct {
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
+	    !(intel_compute_preempt_batches[batch].preempt_type & required_preempt))
+		return false;
+	return true;
+}
+
+static const char *xe_preempt_type_to_str(enum xe_compute_preempt_type type)
+{
+	switch (type) {
+	case PREEMPT_TGP:
+		return "PREEMPT_TGP";
+	case PREEMPT_WMTP:
+		return "PREEMPT_WMTP";
+	default:
+		return "UNKNOWN_PREEMPT_TYPE";
+	}
+}
+
 static bool __run_intel_compute_kernel_preempt(int fd,
 		struct drm_xe_engine_class_instance *eci,
 		bool threadgroup_preemption,
 		enum execenv_alloc_prefs alloc_prefs)
 {
 	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
-	unsigned int batch;
+	int batch;
 	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
 	enum intel_driver driver = get_intel_driver(fd);
+	enum xe_compute_preempt_type required_preempt =
+		threadgroup_preemption ? PREEMPT_TGP : PREEMPT_WMTP;
 
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
@@ -2244,6 +2274,12 @@ static bool __run_intel_compute_kernel_preempt(int fd,
 		kernels++;
 	}
 
+	if (!is_preemptable(batch, required_preempt)) {
+		igt_debug("Preemption type %s not supported on GPU version 0x%x\n",
+			  xe_preempt_type_to_str(required_preempt), ip_ver);
+		return false;
+	}
+
 	if (!kernels->kernel || !kernels->sip_kernel || !kernels->long_kernel)
 		return 0;
 
@@ -2260,6 +2296,33 @@ static bool __run_intel_compute_kernel_preempt(int fd,
 
 	return true;
 }
+
+/**
+ * xe_kernel_preempt_check - Checks IP version to confirm if provided
+ *			     preempt type is supported.
+ * @fd: file descriptor of the opened DRM Xe device
+ * @required_preempt: Preemption type (WMTP/TGP)
+ *
+ * Returns true on success, false otherwise.
+ */
+bool xe_kernel_preempt_check(int fd, enum xe_compute_preempt_type required_preempt)
+{
+	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	int batch = find_preempt_batch(ip_ver);
+
+	if (batch < 0) {
+		igt_debug("GPU version 0x%x not supported\n", ip_ver);
+		return false;
+	}
+	if (!is_preemptable(batch, required_preempt)) {
+		igt_debug("Preemption type %s not supported on GPU version 0x%x\n",
+			  xe_preempt_type_to_str(required_preempt), ip_ver);
+		return false;
+	}
+
+	return true;
+}
+
 /**
  * run_intel_compute_kernel_preempt - runs compute kernels to
  * exercise preemption scenario.
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index 412791d07..6e18d93e9 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -71,6 +71,16 @@ enum execenv_alloc_prefs {
 	EXECENV_PREF_VRAM_IF_POSSIBLE,
 };
 
+/**
+ * enum xe_compute_preempt_type - Types of compute preemption supported.
+ * PREEMPT_TGP: ThreadGroup Preemption
+ * PREEMPT_WMTP: Walker Mid Thread Preemption
+ */
+enum xe_compute_preempt_type {
+	PREEMPT_TGP  = 1 << 0,
+	PREEMPT_WMTP  = 1 << 1,
+};
+
 extern const struct intel_compute_kernels intel_compute_square_kernels[];
 
 bool run_intel_compute_kernel(int fd, struct user_execenv *user,
@@ -81,4 +91,5 @@ bool xe_run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_in
 bool run_intel_compute_kernel_preempt(int fd, struct drm_xe_engine_class_instance *eci,
 				      bool threadgroup_preemption,
 				      enum execenv_alloc_prefs alloc_prefs);
+bool xe_kernel_preempt_check(int fd, enum xe_compute_preempt_type required_preempt);
 #endif	/* INTEL_COMPUTE_H */
diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index c9b194869..076360f1d 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -76,6 +76,7 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("compute-preempt") {
+		igt_require(xe_kernel_preempt_check(xe, PREEMPT_WMTP));
 		xe_for_each_engine(xe, hwe) {
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
 				continue;
@@ -86,6 +87,7 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("compute-preempt-many") {
+		igt_require(xe_kernel_preempt_check(xe, PREEMPT_WMTP));
 		xe_for_each_engine(xe, hwe) {
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
 				continue;
@@ -112,6 +114,7 @@ igt_main
 	igt_subtest_with_dynamic("compute-preempt-many-all-ram") {
 		igt_require(swap_mb > CONTEXT_MB * 10);
 
+		igt_require(xe_kernel_preempt_check(xe, PREEMPT_WMTP));
 		xe_for_each_engine(xe, hwe) {
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
 				continue;
@@ -138,6 +141,7 @@ igt_main
 	igt_subtest_with_dynamic("compute-preempt-many-vram") {
 		igt_require(xe_has_vram(xe));
 
+		igt_require(xe_kernel_preempt_check(xe, PREEMPT_WMTP));
 		xe_for_each_engine(xe, hwe) {
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
 				continue;
@@ -164,6 +168,7 @@ igt_main
 	igt_subtest_with_dynamic("compute-preempt-many-vram-evict") {
 		igt_require(xe_has_vram(xe));
 
+		igt_require(xe_kernel_preempt_check(xe, PREEMPT_WMTP));
 		xe_for_each_engine(xe, hwe) {
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
 				continue;
@@ -188,6 +193,7 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("compute-threadgroup-preempt") {
+		igt_require(xe_kernel_preempt_check(xe, PREEMPT_TGP));
 		xe_for_each_engine(xe, hwe) {
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
 				continue;
-- 
2.51.0

