Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE65CA0ED1
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 07:54:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C9010E407;
	Mon, 18 Aug 2025 07:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZU3C889+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668F210E40E
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 07:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755503693; x=1787039693;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=wK6QxTkkBGcvurg5fnzXt2l5JNXHlUh8AK4K3DpoBxU=;
 b=ZU3C889+h/6VL6Q7zeL3KLkHjKdT1OdUENw+rr1jDcBEnP5IJk2/Wexz
 sc/5xFcKgb2zUrwgz58kAyP+00mg6fih3vCH7zgeaFjbGM5jkC6GY3BJQ
 NEgXmi3agrtIEHSlmE/oAWH8jiRLHuNKC4Xi3TIjM6ciDQgxE5jTlBwfz
 tb1ARF63tXTtSfI9RPxzy7QXc8dlOgpZH27RiOHbsGZpEDg0MnD5hYECP
 iM8ZKPaRxDR9+nHyiwCE5dRvMyQtaP661/hT3ZdDtYWI8g2bfIJGRUhnu
 lHEWJewEPIEmKphj3Bp0cPawL8QzwmKntxF77xgrHrcH+E0TwkaVdLwu6 g==;
X-CSE-ConnectionGUID: wSAK06qfRReGpoJVJcr5TQ==
X-CSE-MsgGUID: n13/s290S2S163zvQ/zhIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="69170845"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="69170845"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 00:54:52 -0700
X-CSE-ConnectionGUID: OS6Dr6OwTWK4HXIInPSjYA==
X-CSE-MsgGUID: B2gmdiriTs+lPZlsjzXdqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="167010991"
Received: from dut2943pvc.iind.intel.com ([10.190.215.44])
 by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2025 00:54:51 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t 2/3] tests/intel/xe_compute: Added loop_duration_2s
 subtest
Date: Mon, 18 Aug 2025 07:54:45 +0000
Message-ID: <20250818075447.15230-3-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818075447.15230-1-nishit.sharma@intel.com>
References: <20250818075447.15230-1-nishit.sharma@intel.com>
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

Added loop_duration_2s subtest which fills kernel and loop_kernel_duration
members of structure user_execenv and passed as member in
xe_run_intel_compute_kernel_on_engine() to schedule Job on CCS engine.
This also verifies GPU is executing loop_kernel shader when sleep for
loop_kernel_duration is called. loop_kernel shader is available on
xe2lpg and xe3lpg pipeline. Verified GPU is working during sleep using
gputop. Test will skip for xehpc, xehp, xelpg pipeline as they don't have
loop_kernel shader. This checks whether the test executed successfully
in elapsed_duration  >= loop_kernel_duration + 0.2 seconds or failed in
duration - 0.2 < elapsed_duration. elapsed_duration is time taken on
scheduling and execution of workload in single iteration on single
single instance of CCS.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 lib/intel_compute.c      |  6 +++-
 tests/intel/xe_compute.c | 59 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 125331c53..51caacfa6 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1830,6 +1830,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
 	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
 	int entries = ARRAY_SIZE(bo_dict);
+	int64_t timeout_one_ns = 1;
 
 	bo_execenv_create(fd, &execenv, eci, user);
 
@@ -1861,11 +1862,14 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 				    OFFSET_KERNEL, 0, false,
 				    execenv.array_size);
 
+	/* To make GPU run Kernel for specific duration, loo_kernel_duration added */
 	if (user && user->loop_kernel_duration) {
 		bo_execenv_exec_async(&execenv, ADDR_BATCH);
 		igt_measured_usleep(user->loop_kernel_duration);
+		/* Check that the loop kernel has not completed yet */
+		igt_assert_neq(0, __xe_wait_ufence(fd, &execenv.bo_sync->sync, USER_FENCE_VALUE,
+					execenv.exec_queue, &timeout_one_ns));
 		((int *)bo_dict[4].data)[0] = MAGIC_LOOP_STOP;
-		bo_execenv_sync(&execenv);
 		user->skip_results_check = 1;
 	} else
 		bo_execenv_exec(&execenv, ADDR_BATCH);
diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 5e9140902..eec5fe37f 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -19,6 +19,8 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+#define LOOP_DURATION	(1000000ull)
+
 static int gt_sysfs_open(int gt)
 {
 	int fd, gt_fd;
@@ -186,6 +188,59 @@ test_compute_kernel_with_ccs_mode(void)
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
+		igt_assert_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, &execenv, EXECENV_PREF_SYSTEM),
+				"Unable to run compute kernel successfully\n");
+		gettimeofday(&end, NULL);
+		igt_assert((double)(loop_duration/LOOP_DURATION - 0.2) < elapsed(&start, &end) &&
+				    (double)(loop_duration/LOOP_DURATION + 0.2));
+	}
+	drm_close_driver(fd);
+}
+
 /**
  * SUBTEST: compute-square
  * Mega feature: WMTP
@@ -223,4 +278,8 @@ igt_main
 
 	igt_subtest("ccs-mode-compute-kernel")
 		test_compute_kernel_with_ccs_mode();
+
+	/* To test compute function stops after loop_kernel_duration */
+	igt_subtest("loop-duration-2s")
+		test_compute_kernel_loop(2 * LOOP_DURATION);
 }
-- 
2.43.0

