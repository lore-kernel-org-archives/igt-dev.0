Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B483CA101F
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 17:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41E410E35D;
	Wed, 10 Sep 2025 17:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9/UJR6o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35AE10E305
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 17:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757524809; x=1789060809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l4r2GCMDak3IHoo149opjcdmXUBIhnfpjKaUl6nkl7Y=;
 b=e9/UJR6osQt0of3KpXZAEAV9633CrU/Amdq+J0VZdRDguA9GhIGzGf8O
 bOAZvkNgdR3xHd0qjKKCY4qkgWo/D7hj+KWRCIc/tdPQEejBJCAWlVbUB
 lUQ6d2JOLjr8ZfieIX3QlZAoUqiQqY/U2XUPYcmQAmnKwv3/dbDxemP93
 2xwFZxGSGTbOcbuNARAZq+emnB6akYrbRXmGktCuQfUmy6n0ZHWaGWCnz
 OcHzPbbYUVf4vYXKyxgHKmx23Z1AXZ4bQYT1NlvArT3q57iyL6Lb3hGrT
 CE7/AXim2ZM6M9R6WkzAG8zR1RveY27ElO3Fo46TXGYh8L4bn+GDigDoV w==;
X-CSE-ConnectionGUID: j6rskG9vSNmF7ZH8VPnTnA==
X-CSE-MsgGUID: 2zZ0r+ecQD2ZCzs9Jg0fbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59068243"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="59068243"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 10:20:09 -0700
X-CSE-ConnectionGUID: 2v3MZWdjQ92VZrsBx+odLA==
X-CSE-MsgGUID: Ys8CJrh5RVGWeTrPY9tGow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="173360281"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 10:20:09 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v3 i-g-t 1/1] tests/intel/xe_compute_preempt: Compute
 preemption check
Date: Wed, 10 Sep 2025 17:19:59 +0000
Message-Id: <20250910171959.1852534-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910171959.1852534-1-sobin.thomas@intel.com>
References: <20250910171959.1852534-1-sobin.thomas@intel.com>
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

On platforms like PVC that lack walker mid-thread preemption, running
tests in forked threads can cause inconsistent states due to mid-
execution igt_skip calls. This patch adds a kernel preemption check
at the start of each subtest to ensure consistent behavior. If the
GPU lacks required preemption, the test is skipped gracefully.

v2: Moved compatibility check to igt_fixture per review.
v3: - Added thread group preemption and WMTP checks;
    - Introduced enum flags for preemption types. [Zbigniew]
Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 lib/intel_compute.c              | 22 ++++++++++++++++++++++
 lib/intel_compute.h              |  7 +++++++
 tests/intel/xe_compute_preempt.c |  6 ++++++
 3 files changed, 35 insertions(+)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 147dd2916..7538c4b42 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -2193,21 +2193,25 @@ static const struct {
 			     bool threadgroup_preemption,
 			     enum execenv_alloc_prefs alloc_prefs);
 	uint32_t compat;
+	enum xe_compute_preempt_type preempt_type;
 } intel_compute_preempt_batches[] = {
 	{
 		.ip_ver = IP_VER(20, 01),
 		.compute_exec = xe2lpg_compute_preempt_exec,
 		.compat = COMPAT_DRIVER_XE,
+		.preempt_type = PREEMPT_WMTP | PREEMPT_TGP,
 	},
 	{
 		.ip_ver = IP_VER(20, 04),
 		.compute_exec = xe2lpg_compute_preempt_exec,
 		.compat = COMPAT_DRIVER_XE,
+		.preempt_type = PREEMPT_WMTP | PREEMPT_TGP,
 	},
 	{
 		.ip_ver = IP_VER(30, 00),
 		.compute_exec = xe2lpg_compute_preempt_exec,
 		.compat = COMPAT_DRIVER_XE,
+		.preempt_type = PREEMPT_WMTP | PREEMPT_TGP,
 	},
 };
 
@@ -2260,6 +2264,24 @@ static bool __run_intel_compute_kernel_preempt(int fd,
 
 	return true;
 }
+
+bool check_kernel_preempt(int fd, enum xe_compute_preempt_type required_preempt)
+{
+	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	unsigned int batch;
+
+	for (batch = 0; batch < ARRAY_SIZE(intel_compute_preempt_batches); batch++)
+		if (ip_ver == intel_compute_preempt_batches[batch].ip_ver)
+			break;
+
+	if (required_preempt &&
+	    !(intel_compute_preempt_batches[batch].preempt_type & required_preempt)) {
+		igt_info("Preemption type not supported %x", required_preempt);
+		return false;
+	}
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
2.34.1

