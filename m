Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDCBCCFA05
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 17:06:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4FF10E98D;
	Thu,  6 Nov 2025 17:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="akwRLDge";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDBF10E98D
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 17:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762448783; x=1793984783;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=N4+57+yeIpi9jiPBiEDIR1BVqIL1OxxghKxQYtyt57E=;
 b=akwRLDgeTQJRr6SPBE8WRicPpNPHzoyGNw4/dnvSd/UhCPiU3Lbc1dN4
 BF9k3LN97MNbiwamPiag7C5B1sYqNNLTUv94ZWDBeGs8ScIh4Sel7gkOq
 zvmpzAPC8wXjkom0bm2+lMl5oI/umcglLrZ1kPfEPeIjAue23SPD7XVnN
 OlQzmAJE9FWA6RVQNMNlqNtujcTGZNiFvZ5TvySfpvKvGH8jbhFXRVKdv
 FgXctNn5xjhVj5EJY08jvkTDBSVbR9HHYeBqk89KNvwIUeagEmzBtn8K6
 cW8hkd4BSCgIDCmzf2a16rQxy3GPiW7yrLbzRDiRTZnDL1Lh1ijVrkalm Q==;
X-CSE-ConnectionGUID: MqzuaRMkQv2sHublluqpWw==
X-CSE-MsgGUID: SF+fANmnQY62lcfPUKTs+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="76041867"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="76041867"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 09:06:22 -0800
X-CSE-ConnectionGUID: 2mLkRw6dT4u2P4e5r+F42A==
X-CSE-MsgGUID: RigmAx7sRpSHf9BzHHBRtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187649700"
Received: from dut2943pvc.iind.intel.com ([10.190.215.39])
 by fmviesa006.fm.intel.com with ESMTP; 06 Nov 2025 09:06:20 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v12 2/3] tests/intel/xe_compute: Add loop_duration_2s
 subtest
Date: Thu,  6 Nov 2025 17:06:15 +0000
Message-ID: <20251106170616.62175-3-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106170616.62175-1-nishit.sharma@intel.com>
References: <20251106170616.62175-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

Verify introduced loop_kernel_duration parameter in user_execenv
which makes GPU busy for specified duration. Execution should remain
within a 0.2 second margin of the requested duration. loop_kernel shader
is not supported in xehpc, xehp, xelpg pipelines so test will skip.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_compute.c | 68 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 5e9140902..7665c2bb6 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -19,6 +19,10 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+#define LOOP_DURATION_2s	(1000000ull * 2)
+#define DURATION_MARGIN		0.2
+#define TIME_BOUND		1000000
+
 static int gt_sysfs_open(int gt)
 {
 	int fd, gt_fd;
@@ -186,6 +190,66 @@ test_compute_kernel_with_ccs_mode(void)
 	igt_require(num_gt_with_ccs_mode > 0);
 }
 
+static double elapsed(const struct timeval *start,
+		      const struct timeval *end)
+{
+	return (end->tv_sec - start->tv_sec) + 1e-6*(end->tv_usec - start->tv_usec);
+}
+
+/**
+ * SUBTEST: loop-duration-2s
+ * Functionality: OpenCL kernel
+ * Description:
+ *	Run an openCL loop Kernel that for duration,
+ *	set in loop_kernel_duration ..
+ */
+static void
+test_compute_kernel_loop(uint64_t loop_duration)
+{
+	int fd;
+	unsigned int ip_ver;
+	const struct intel_compute_kernels *kernels;
+	struct user_execenv execenv = { 0 };
+	struct drm_xe_engine_class_instance *hwe;
+	struct timeval start, end;
+	double elapse_time;
+
+	fd = drm_open_driver(DRIVER_XE);
+	ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	kernels = intel_compute_square_kernels;
+
+	while (kernels->kernel) {
+		if (ip_ver == kernels->ip_ver)
+			break;
+		kernels++;
+	}
+
+	/* loop_kernel_duration used as sleep to make EU busy for loop_duration */
+	execenv.loop_kernel_duration = loop_duration;
+	execenv.kernel = kernels->loop_kernel;
+	execenv.kernel_size = kernels->loop_kernel_size;
+
+	xe_for_each_engine(fd, hwe) {
+		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
+			continue;
+
+		igt_info("Running loop_kernel on ccs engine %d\n", hwe->engine_instance);
+		gettimeofday(&start, NULL);
+		igt_assert_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, &execenv,
+								   EXECENV_PREF_SYSTEM),
+			     "Unable to run compute kernel successfully\n");
+		gettimeofday(&end, NULL);
+		elapse_time = elapsed(&start, &end);
+
+		igt_info("elapse_time: %f\n", (double)elapse_time);
+		igt_info("lower_bound: %f\n", (double)(loop_duration / LOOP_DURATION_2s - DURATION_MARGIN));
+		igt_info("upper_bound: %f\n", (double)(loop_duration / LOOP_DURATION_2s + DURATION_MARGIN));
+		igt_assert((double)(loop_duration / LOOP_DURATION_2s - DURATION_MARGIN) < (double)elapse_time &&
+			   (double)elapse_time < (double)(loop_duration / TIME_BOUND + DURATION_MARGIN));
+	}
+	drm_close_driver(fd);
+}
+
 /**
  * SUBTEST: compute-square
  * Mega feature: WMTP
@@ -223,4 +287,8 @@ igt_main
 
 	igt_subtest("ccs-mode-compute-kernel")
 		test_compute_kernel_with_ccs_mode();
+
+	/* To test compute function stops after loop_kernel_duration */
+	igt_subtest("loop-duration-2s")
+		test_compute_kernel_loop(LOOP_DURATION_2s);
 }
-- 
2.43.0

