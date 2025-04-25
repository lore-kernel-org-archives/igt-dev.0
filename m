Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BEAC369D7
	for <igt-dev@archiver.kernel.org>; Fri, 25 Apr 2025 07:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2810110E8A3;
	Fri, 25 Apr 2025 07:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TBgBE6/j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BF010E8A3
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Apr 2025 07:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745565684; x=1777101684;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GU9qe4wFDZSQ56pQtxMnE/lr5VuiYpan48Yvhv7mIi0=;
 b=TBgBE6/jmjLp5J2I/RBHPULgoyy/urRGOf3rn5s+T7KH3ldWAuOBMDBx
 aYGY7s6tNlIA8eJGKijjmOQcwsPPdKwPKXuFM1lgxBMMXTKWf2HgQ1M5v
 oIGJZzGGsfUDkBuMuqjLzJY6Xz4Px1fWinQUWz74xxFQnED8zTWxbF7+X
 gCEZScJSNtNoWXMQzK/lshUPddu5JmlaEQNPgou/QPp1kYSocWcQdBI0j
 hATVmhCQVldDvixyEnoApbEFAq8NQC1m1NIx9a9pqD/JqfiZje0oTdu92
 4VK/xQGk/fJRSquHeZRWB/ovb7/Rw6SUKS3c2Ur8Fynj6qUDjlCAU43DV Q==;
X-CSE-ConnectionGUID: TrRZNtwzSNeimJQpXURtJg==
X-CSE-MsgGUID: HwbJsFloRgWVAZlYe2/lVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="58208886"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="58208886"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 00:21:24 -0700
X-CSE-ConnectionGUID: aYxMuJFXSlKrMGx3X2g4fA==
X-CSE-MsgGUID: pXPahb3WTAWqP+ExxgYjHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="138000189"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 00:21:24 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, kamil.konieczny@linux.intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH i-g-t v2 1/2] tests/intel/xe_eu_stall: Add tests to run
 blocking and non-blocking read twice
Date: Fri, 25 Apr 2025 00:21:17 -0700
Message-ID: <29f92b276ff8c0a246dc5d22757193bc66f27c66.1745565376.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
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

Add tests that enable EU stall sampling, read all the EU stall data and
disable EU stall sampling, two times back to back. Add tests for both
blocking and non-blocking reads.

v2: Renamed tests: blocking-read-twice to blocking-re-enable, and
		   non-blocking-read-twice to non-blocking-re-enable
    Moved check for observation_paranoid file to a separate patch.

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 tests/intel/xe_eu_stall.c | 41 +++++++++++++++++++++++++++++----------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
index da9bd7843..b48236425 100644
--- a/tests/intel/xe_eu_stall.c
+++ b/tests/intel/xe_eu_stall.c
@@ -14,9 +14,15 @@
  * SUBTEST: non-blocking-read
  * Description: Verify non-blocking read of EU stall data during a workload run
  *
+ * SUBTEST: non-blocking-re-enable
+ * Description: Run non-blocking read test twice with disable and enable between the runs
+ *
  * SUBTEST: blocking-read
  * Description: Verify blocking read of EU stall data during a workload run
  *
+ * SUBTEST: blocking-re-enable
+ * Description: Run blocking read test twice with disable and enable between the runs
+ *
  * SUBTEST: unprivileged-access
  * Description: Verify unprivileged open of a EU stall data stream fd
  *
@@ -460,13 +466,13 @@ static void print_eu_stall_data(uint32_t devid, uint8_t *buf, size_t size)
  * while the parent process reads the stall counters data, disables EU stall
  * counters once the workload completes execution.
  */
-static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read)
+static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read, int iter)
 {
-	uint32_t num_samples = 0, num_drops = 0;
+	uint32_t num_samples, num_drops;
 	struct igt_helper_process work_load = {};
 	struct sigaction sa = { 0 };
 	int ret, flags, stream_fd;
-	uint64_t total_size = 0;
+	uint64_t total_size;
 	uint8_t *buf;
 
 	uint64_t properties[] = {
@@ -520,7 +526,7 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read)
 		flags = O_CLOEXEC;
 
 	set_fd_flags(stream_fd, flags);
-
+enable:
 	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
 
 	sa.sa_handler = sighandler;
@@ -540,6 +546,9 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read)
 			_exit(run_gpgpu_fill(drm_fd, devid));
 		}
 	}
+	total_size = 0;
+	num_samples = 0;
+	num_drops = 0;
 	/* Parent process reads the EU stall counters data */
 	do {
 		if (!blocking_read) {
@@ -574,14 +583,16 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read)
 	igt_info("Number of samples: %u\n", num_samples);
 	igt_info("Number of drops reported: %u\n", num_drops);
 
+	ret = wait_child(&work_load);
+	igt_assert_f(ret == 0, "waitpid() - ret: %d, errno: %d\n", ret, errno);
+	igt_assert_f(num_samples, "No EU stalls detected during the workload\n");
+
 	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
+	if (--iter)
+		goto enable;
 
 	close(stream_fd);
 	free(buf);
-
-	ret = wait_child(&work_load);
-	igt_assert_f(ret == 0, "waitpid() - ret: %d, errno: %d\n", ret, errno);
-	igt_assert_f(num_samples, "No EU stalls detected during the workload\n");
 }
 
 static int opt_handler(int opt, int opt_index, void *data)
@@ -650,12 +661,22 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 
 	igt_describe("Verify non-blocking read of EU stall data during a workload run");
 	igt_subtest("non-blocking-read") {
-		test_eustall(drm_fd, devid, !blocking_read);
+		test_eustall(drm_fd, devid, !blocking_read, 1);
+	}
+
+	igt_describe("Run non-blocking read test twice with disable and enable between the runs");
+	igt_subtest("non-blocking-re-enable") {
+		test_eustall(drm_fd, devid, !blocking_read, 2);
 	}
 
 	igt_describe("Verify blocking read of EU stall data during a workload run");
 	igt_subtest("blocking-read") {
-		test_eustall(drm_fd, devid, blocking_read);
+		test_eustall(drm_fd, devid, blocking_read, 1);
+	}
+
+	igt_describe("Run blocking read test twice with disable and enable between the runs");
+	igt_subtest("blocking-re-enable") {
+		test_eustall(drm_fd, devid, blocking_read, 2);
 	}
 
 	igt_describe("Verify that unprivileged open of a EU stall data fd fails");
-- 
2.48.1

