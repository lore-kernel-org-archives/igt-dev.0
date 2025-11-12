Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146F3CCFA1E
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 09:35:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C209210E1C2;
	Wed, 12 Nov 2025 09:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fCUCXDny";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D00310E1C2
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Nov 2025 09:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762940116; x=1794476116;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hT17+JKBUkhXC0PPwctLsOSh3MKVlejB0FOeriaTH+U=;
 b=fCUCXDnygQ4+tPSYAJifUBRN6O0TYdaBE5I/qKJwPyJTjW7Y3i9ozMli
 ALwHJS1cfk2g267kq7kRREObyYkOMULIhZ/oyzZ+zpSDT+86wcP9f4Bbs
 07KTBUyFA+z5qxjmuPTfs+IvsUNevxJijwF6E0yy1cbokcn3bBVVRmXXq
 qSeynGT46vnM8S4PTPetRsF2kAgT4vv/nnWPSToVmZrAKJB06FHVoId0j
 YWmjLBqq73aAk5QxkvZA+xEXqNuxJRckOrf+4vE4pNLiWjSlUAZUhqgnU
 oR0O9gM2CcMYYOl4cazizU1BJKUxJJpw0tEAd8VufrYfiTK7OiyWPOgUw A==;
X-CSE-ConnectionGUID: jOtTxBqzTgiMPW3XVuTINw==
X-CSE-MsgGUID: FDiQbciiRfatLq4zuTSSNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="82630622"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="82630622"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 01:35:16 -0800
X-CSE-ConnectionGUID: Ldg9Umf5RY2IPnaa24vBBA==
X-CSE-MsgGUID: 21QQjk+UR1KGTEuVsxTjLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="188429152"
Received: from dut2943pvc.iind.intel.com ([10.190.215.39])
 by orviesa006.jf.intel.com with ESMTP; 12 Nov 2025 01:35:15 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v15 2/3] tests/intel/xe_compute: Add loop_duration_2s
 subtest
Date: Wed, 12 Nov 2025 09:35:09 +0000
Message-ID: <20251112093510.15195-3-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112093510.15195-1-nishit.sharma@intel.com>
References: <20251112093510.15195-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

Verify introduced loop_kernel_duration parameter in user_execenv
which makes GPU busy for specified duration. Execution should remain
within a 0.2 second margin of the requested duration. loop_kernel shader
is not supported in xehpc, xehp, xelpg pipelines so test will skip.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_compute.c | 65 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 5e9140902..87be69514 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -19,6 +19,9 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+#define LOOP_DURATION_2s	(1000000ull * 2)
+#define DURATION_MARGIN		0.2
+
 static int gt_sysfs_open(int gt)
 {
 	int fd, gt_fd;
@@ -186,6 +189,64 @@ test_compute_kernel_with_ccs_mode(void)
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
+	double elapse_time, lower_bound, upper_bound;
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
+		lower_bound = (loop_duration / 1e6 - DURATION_MARGIN);
+		upper_bound = (loop_duration / 1e6 + DURATION_MARGIN);
+
+		igt_assert(lower_bound < elapse_time && elapse_time < upper_bound);
+	}
+	drm_close_driver(fd);
+}
+
 /**
  * SUBTEST: compute-square
  * Mega feature: WMTP
@@ -223,4 +284,8 @@ igt_main
 
 	igt_subtest("ccs-mode-compute-kernel")
 		test_compute_kernel_with_ccs_mode();
+
+	/* To test compute function stops after loop_kernel_duration */
+	igt_subtest("loop-duration-2s")
+		test_compute_kernel_loop(LOOP_DURATION_2s);
 }
-- 
2.43.0

