Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ACE606A32A
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 01:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XP+fBFp9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394F5112125;
	Thu, 19 Nov 2026 01:12:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E709910E1A3
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 01:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795050706; x=1826586706;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vea0ldgdpcK/oRe48Lyzo+FTmP5c0ilyVuQFmyapOqQ=;
 b=XP+fBFp9ohmyYrR5R+NFa8UH/+Dk0HCmIV+rcrKv8LSPRuh3ViRsJjER
 vxjGAIcQyWduoB7LQi7GxLf2k9978422a1Ma4/8VBJEl5tKgivd+1I9Ad
 I8eAdt5ZxvnBCPGiWnIUpxg1fku+qwdr713KqKOogeeEqGFLKGebTzhRp
 0hMjFW0UheOo7RsjEHgTKpiq7dLPoFI88tfr9DNNEpxdr8ySErnfjIF7v
 jTARGgpZ6hfRI3hJLz9kmSsTF/WXOLu/Ns1gVaALtCu4j7CPzHM6SnG1V
 Hsey0eRmGbb0B85ObO5qBFqiX2uOfd8bwfqxnbAWbc9W7LPuQsmBZUzgL A==;
X-CSE-ConnectionGUID: GkXJRcfsTz+3dgKQCupdPQ==
X-CSE-MsgGUID: 3zASusRhQy+bOFRhGUFQVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3781336"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3781336"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 17:11:45 -0800
X-CSE-ConnectionGUID: 20vmb/aTQrekOW8LYwGgQA==
X-CSE-MsgGUID: aEq3JnmWTaG58Y6Kf1mnfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10427884"
Received: from cyp05.fm.intel.com ([10.36.55.41])
 by fmviesa003.fm.intel.com with ESMTP; 18 Nov 2026 17:11:45 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_compute: Use monotonic clock in
 loop-duration-2s
Date: Wed, 18 Nov 2026 17:08:58 -0800
Message-ID: <20261119010857.377785-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The subtest times the loop kernel with gettimeofday(), which follows
CLOCK_REALTIME. If the system time is stepped (e.g. by NTP) during the
run, the measured time falls outside (1.8s, 2.2s) and the test fails,
even though the kernel ran for about 2s.

Use igt_nsec_elapsed(), which is monotonic, and print the measured
time and bounds on failure.

Reproduced on PTL by stepping the clock with date -s during the test:
the old code fails every time, the fixed code passes.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9795
Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 tests/intel/xe_compute.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index e738c9dab..ee376fd88 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -207,12 +207,6 @@ test_compute_kernel_with_ccs_mode(void)
 	igt_require(num_gt_with_ccs_mode > 0);
 }
 
-static double elapsed(const struct timeval *start,
-		      const struct timeval *end)
-{
-	return (end->tv_sec - start->tv_sec) + 1e-6*(end->tv_usec - start->tv_usec);
-}
-
 /**
  * SUBTEST: loop-duration-2s
  * Functionality: OpenCL kernel
@@ -228,7 +222,6 @@ test_compute_kernel_loop(uint64_t loop_duration)
 	const struct intel_compute_kernels *kernels;
 	struct user_execenv execenv = { 0 };
 	struct drm_xe_engine_class_instance *hwe;
-	struct timeval start, end;
 	double elapse_time, lower_bound, upper_bound;
 
 	fd = drm_open_driver(DRIVER_XE);
@@ -247,20 +240,23 @@ test_compute_kernel_loop(uint64_t loop_duration)
 	execenv.kernel_size = kernels->loop_kernel_size;
 
 	xe_for_each_engine(fd, hwe) {
+		struct timespec start = {};
+
 		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
 			continue;
 
 		igt_info("Running loop_kernel on ccs engine %d\n", hwe->engine_instance);
-		gettimeofday(&start, NULL);
+		igt_nsec_elapsed(&start);
 		igt_assert_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, &execenv,
 								   EXECENV_PREF_SYSTEM),
 			     "Unable to run compute kernel successfully\n");
-		gettimeofday(&end, NULL);
-		elapse_time = elapsed(&start, &end);
+		elapse_time = igt_nsec_elapsed(&start) / 1e9;
 		lower_bound = loop_duration / 1e6 - DURATION_MARGIN;
 		upper_bound = loop_duration / 1e6 + DURATION_MARGIN;
 
-		igt_assert(lower_bound < elapse_time && elapse_time < upper_bound);
+		igt_assert_f(lower_bound < elapse_time && elapse_time < upper_bound,
+			     "Elapsed time %.3fs out of range (%.3fs, %.3fs)\n",
+			     elapse_time, lower_bound, upper_bound);
 	}
 	drm_close_driver(fd);
 }
-- 
2.43.0

