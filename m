Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6896ECA100B
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 06:03:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7B110E091;
	Wed,  3 Sep 2025 06:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cq+qLf1b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F027210E091
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 06:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756879398; x=1788415398;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wh5+vjyQUkwPr3hXBiVskJAsbOqLp7tKCMgUlyMO6qA=;
 b=Cq+qLf1b9WamUOaktb2jl6vaqu4NOaRDZF/Epc9qScHQdWukYWVC2fTw
 ikUUvJ48PoMtGCpz49E9FhyM+3CItdsitdRKbkeahKniF3ok2jDh8wzTW
 NcH8i2YbHxVqa2wY4oiyuLlbOHM4ZYIRKEeYaY+6fhTdi8LbzWUOysz3W
 wVrzKL4yL5nIZbGs3EwZpoBGdJuilSAdPR12EoN8ekS3nUk0a5wsLIOhd
 4pfilyRBHBOZFYZTEWjXMZcbA6WUxFZDfP0hPYfgCU0ZjVJba0eQbc3Fl
 CUPHE0sSIyvt2An9qy9f7cn+GX1M0JwuqWPORnAjQpC7ApAFdtPaVv14g Q==;
X-CSE-ConnectionGUID: 1EUuyqsYRlijRPh69JKGjg==
X-CSE-MsgGUID: xZNjFexqSl2yDJXVHX/Zrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59095233"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59095233"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 23:03:17 -0700
X-CSE-ConnectionGUID: LuHhelE7Tk2ehqKaHs8YEA==
X-CSE-MsgGUID: lCpcHhk1SfibLZioCMoRhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171059185"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 23:03:17 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel/xe_compute_preempt: GPU Compatibility
 check
Date: Wed,  3 Sep 2025 06:03:06 +0000
Message-Id: <20250903060306.1516598-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903060306.1516598-1-sobin.thomas@intel.com>
References: <20250903060306.1516598-1-sobin.thomas@intel.com>
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

Add a check to verify the GPU version prior to launching the
xe_compute_preempt test. This prevents the unnecessary forking of
multiple child processes that would later be skipped due to a GPU
version mismatch.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 lib/intel_compute.c              | 25 +++++++++++++++++++++++++
 lib/intel_compute.h              |  1 +
 tests/intel/xe_compute_preempt.c |  4 ++++
 3 files changed, 30 insertions(+)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 147dd2916..d8627c78b 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -2211,6 +2211,31 @@ static const struct {
 	},
 };
 
+bool check_gpu_compatibility(int fd)
+{
+	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	unsigned int batch;
+	enum intel_driver driver = get_intel_driver(fd);
+
+	for (batch = 0; batch < ARRAY_SIZE(intel_compute_preempt_batches); batch++)
+		if (ip_ver == intel_compute_preempt_batches[batch].ip_ver)
+			break;
+
+	if (batch == ARRAY_SIZE(intel_compute_preempt_batches)) {
+		igt_debug("GPU version 0x%x not supported\n", ip_ver);
+		return false;
+	}
+
+	if (!(COMPAT_DRIVER_FLAG(driver) & intel_compute_preempt_batches[batch].compat)) {
+		igt_debug("Driver is not supported: flags %x & %x\n",
+			COMPAT_DRIVER_FLAG(driver),
+			intel_compute_preempt_batches[batch].compat);
+		return false;
+	}
+
+	return true;
+}
+
 static bool __run_intel_compute_kernel_preempt(int fd,
 		struct drm_xe_engine_class_instance *eci,
 		bool threadgroup_preemption,
diff --git a/lib/intel_compute.h b/lib/intel_compute.h
index 412791d07..6c8414c56 100644
--- a/lib/intel_compute.h
+++ b/lib/intel_compute.h
@@ -78,6 +78,7 @@ bool run_intel_compute_kernel(int fd, struct user_execenv *user,
 bool xe_run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_instance *eci,
 					   struct user_execenv *user,
 					   enum execenv_alloc_prefs alloc_prefs);
+bool check_gpu_compatibility(int fd);
 bool run_intel_compute_kernel_preempt(int fd, struct drm_xe_engine_class_instance *eci,
 				      bool threadgroup_preemption,
 				      enum execenv_alloc_prefs alloc_prefs);
diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index c9b194869..65ad5d4d5 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -98,6 +98,7 @@ igt_main
 				 * CONTEXT_MB * 2 (long and short) job
 				 */
 				child_count = ram_mb / 2 / CONTEXT_MB / 2;
+				igt_require_f(check_gpu_compatibility(xe), "GPU not supported\n");
 
 				igt_debug("RAM: %" PRIu64 ", child count: %d\n",
 					  ram_mb, child_count);
@@ -118,6 +119,7 @@ igt_main
 
 			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class)) {
 				int child_count;
+				igt_require_f(check_gpu_compatibility(xe), "GPU not supported\n");
 
 				/*
 				 * Get whole ram, then divide by
@@ -153,6 +155,7 @@ igt_main
 
 				igt_debug("VRAM: %" PRIu64 ", child count: %d\n",
 					  vram_mb, child_count);
+				igt_require_f(check_gpu_compatibility(xe), "GPU not supported\n");
 
 				igt_fork(child, child_count)
 					test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
@@ -179,6 +182,7 @@ igt_main
 
 				igt_debug("VRAM: %" PRIu64 ", child count: %d\n",
 					  vram_mb, child_count);
+				igt_require_f(check_gpu_compatibility(xe), "GPU not supported\n");
 
 				igt_fork(child, child_count)
 					test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
-- 
2.34.1

