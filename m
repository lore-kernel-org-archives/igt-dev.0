Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EA6C369C2
	for <igt-dev@archiver.kernel.org>; Wed, 23 Apr 2025 02:57:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76F410E3F3;
	Wed, 23 Apr 2025 02:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VZIt3Fkk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9128E10E643
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Apr 2025 02:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745377064; x=1776913064;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eq6tIYC9/EWPhaebLJ1E0S8gfAtTpIqABRZ1ACWEFiY=;
 b=VZIt3FkkRjs7VPXea3KhDtG083/Hx92m5THPUcoAh52AnKOeBjjCgu2S
 orhN74eibSzZcPlkeOZ7ZyRHLab9qTA0/EQnX5V6hTAn+fnAaNXiao4FC
 5pBm4NNk3WLgCyQz5Y4jb06/TT4I2XkKuVu8QTY4gxA9EdzObr0YDU+/s
 Mdg2Rsw1W3Ui8I55cRADIpTGqqWPPPzq9tmUGta8jaQOsfjPTqhW/wzxY
 s46efltF707mVs3/qfM+vQsy31Xj1Q4zn4YuNXTSxjyjuVFPDZ7KT74tm
 jGM4EE/LZfX4L+PHOiIn6gsLeZXUz7RV3I9eTfvjLZ/GOQKFCrIx2UzHq w==;
X-CSE-ConnectionGUID: 4GdkzxDDSBmzujP6vokMeA==
X-CSE-MsgGUID: XDbatM+PRBml/pajoC9lNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57937501"
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; d="scan'208";a="57937501"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 19:57:44 -0700
X-CSE-ConnectionGUID: twDEs7w4S2GJXdih0himwQ==
X-CSE-MsgGUID: em8ElGKsRzmpfUw3qNHI1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; d="scan'208";a="132177443"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 19:57:43 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH 1/1] tests/intel/xe_eu_stall: Add tests to run blocking and
 non-blocking read twice
Date: Tue, 22 Apr 2025 19:57:34 -0700
Message-ID: <eef990ac70dd804c500c31d801e7329a364cd6fd.1745376823.git.harish.chegondi@intel.com>
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
blocking and non-blocking reads. Also, add a check for the presence of
/proc/sys/dev/xe/observation_paranoid file which is required for the
unprivileged-access test.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 tests/intel/xe_eu_stall.c | 44 ++++++++++++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
index da9bd7843..15d4589c6 100644
--- a/tests/intel/xe_eu_stall.c
+++ b/tests/intel/xe_eu_stall.c
@@ -14,9 +14,15 @@
  * SUBTEST: non-blocking-read
  * Description: Verify non-blocking read of EU stall data during a workload run
  *
+ * SUBTEST: non-blocking-read-twice
+ * Description: Run non-blocking read test twice with disable and enable between the runs
+ *
  * SUBTEST: blocking-read
  * Description: Verify blocking read of EU stall data during a workload run
  *
+ * SUBTEST: blocking-read-twice
+ * Description: Run blocking read test twice with disable and enable between the runs
+ *
  * SUBTEST: unprivileged-access
  * Description: Verify unprivileged open of a EU stall data stream fd
  *
@@ -33,6 +39,7 @@
 #include <fcntl.h>
 #include <poll.h>
 #include <sys/ioctl.h>
+#include <sys/stat.h>
 #include <sys/wait.h>
 
 #include "igt.h"
@@ -460,13 +467,13 @@ static void print_eu_stall_data(uint32_t devid, uint8_t *buf, size_t size)
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
@@ -520,7 +527,7 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read)
 		flags = O_CLOEXEC;
 
 	set_fd_flags(stream_fd, flags);
-
+enable:
 	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
 
 	sa.sa_handler = sighandler;
@@ -540,6 +547,9 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read)
 			_exit(run_gpgpu_fill(drm_fd, devid));
 		}
 	}
+	total_size = 0;
+	num_samples = 0;
+	num_drops = 0;
 	/* Parent process reads the EU stall counters data */
 	do {
 		if (!blocking_read) {
@@ -574,14 +584,16 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read)
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
@@ -634,6 +646,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 {
 	int drm_fd;
 	uint32_t devid;
+	struct stat sb;
 	bool blocking_read = true;
 
 	igt_fixture {
@@ -642,6 +655,7 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 		devid = intel_get_drm_devid(drm_fd);
 		igt_require(IS_PONTEVECCHIO(devid) || intel_graphics_ver(devid) >= IP_VER(20, 0));
 		igt_require_f(igt_get_gpgpu_fillfunc(devid), "no gpgpu-fill function\n");
+		igt_require(!stat(OBSERVATION_PARANOID, &sb));
 		if (output_file) {
 			output = fopen(output_file, "w");
 			igt_require(output);
@@ -650,12 +664,22 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 
 	igt_describe("Verify non-blocking read of EU stall data during a workload run");
 	igt_subtest("non-blocking-read") {
-		test_eustall(drm_fd, devid, !blocking_read);
+		test_eustall(drm_fd, devid, !blocking_read, 1);
+	}
+
+	igt_describe("Run non-blocking read test twice with disable and enable between the runs");
+	igt_subtest("non-blocking-read-twice") {
+		test_eustall(drm_fd, devid, !blocking_read, 2);
 	}
 
 	igt_describe("Verify blocking read of EU stall data during a workload run");
 	igt_subtest("blocking-read") {
-		test_eustall(drm_fd, devid, blocking_read);
+		test_eustall(drm_fd, devid, blocking_read, 1);
+	}
+
+	igt_describe("Run blocking read test twice with disable and enable between the runs");
+	igt_subtest("blocking-read-twice") {
+		test_eustall(drm_fd, devid, blocking_read, 2);
 	}
 
 	igt_describe("Verify that unprivileged open of a EU stall data fd fails");
-- 
2.48.1

