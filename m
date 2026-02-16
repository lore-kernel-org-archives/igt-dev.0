Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D66EF99F9
	for <igt-dev@archiver.kernel.org>; Mon, 16 Feb 2026 09:52:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58B310E219;
	Mon, 16 Feb 2026 09:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8moKUdv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767DD10E10B
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Feb 2026 09:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771235522; x=1802771522;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LqauPnFtvaZKxSH9kyxguJ1Ephqzyq1dEf2GT+AHPPw=;
 b=Q8moKUdvaIiwgTRd4MsrRpUS0Y/5lMtXzv3YvbCdtCaQr9YLMPsqvFRR
 K1bIC6PJzOTOYMO5Aq7p21YhjcfhX8/xIXdB5WHe9qURx0VbXBVQQ24EB
 KT1yEDvAKvriN8vC1+q7j9tA9aq+KDB1lKEnAo8EQJbMkVv83u8+nlo8A
 Z4i987vujoYuPbgm6cP4qDNjXwzWjxEQzhx1a6oMIfb7HiFLxTWOZ4Hnq
 q2ALxUPvOvlohk7ROefSbynWlRV9JUdicVCwuXSLC1E5jtOd0fhra6WBO
 R4UURK+4khpnjPODWmULss+GOVMBLNucN9fAXKcSxkoQsoLgtrz1Y68Xh g==;
X-CSE-ConnectionGUID: KV23Q/OJQ8ymgKa3wzQZUA==
X-CSE-MsgGUID: jRtxkZQjT1O7pQdSC1+IFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="83036140"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="83036140"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 01:52:02 -0800
X-CSE-ConnectionGUID: SAemRJb9TBWUcU6fcMC8zA==
X-CSE-MsgGUID: dsNkECToTJCW8MXinpzYRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="217568239"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.84.79])
 by fmviesa004.fm.intel.com with ESMTP; 16 Feb 2026 01:52:01 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 christoph.manszewski@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_compute: Robust SR-IOV/VF/PF and per-GT
 ccs_mode attribute handling
Date: Mon, 16 Feb 2026 09:52:01 +0000
Message-ID: <20260216095201.1114305-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

Add explicit checks for VF devices using intel_is_vf_device().
Changed test skip logic based on PF with enabled VFs
Remove global sriov_enabled flag and always check device state at runtime.
For multi-GT systems, only run ccs_mode tests on GTs where the ccs_mode
sysfs attribute is present. This ensures tests are robust on all platforms
and configurations.
Once the KMD changes are merged this patch will be aligned and merged

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_compute.c | 41 ++++++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 310093fc5..fe21772a3 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -26,8 +26,6 @@
 #define DURATION_MARGIN		0.2
 #define MIN_BUSYNESS		95.0
 
-bool sriov_enabled;
-
 struct thread_data {
 	pthread_t thread;
 	pthread_mutex_t *mutex;
@@ -101,6 +99,12 @@ test_ccs_mode(void)
 
 		num_gt_with_ccs_mode++;
 		gt_fd = gt_sysfs_open(gt);
+		if (!igt_sysfs_has_attr(gt_fd, "ccs_mode")) {
+			close(gt_fd);
+			continue;
+		}
+		num_gt_with_ccs_mode++;
+
 		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", 0) < 0);
 		for (m = 1; m <= num_slices; m++) {
 			/* compute slices are to be equally distributed among enabled engines */
@@ -177,6 +181,12 @@ test_compute_kernel_with_ccs_mode(void)
 
 		num_gt_with_ccs_mode++;
 		gt_fd = gt_sysfs_open(gt);
+		if (!igt_sysfs_has_attr(gt_fd, "ccs_mode")) {
+			close(gt_fd);
+			continue;
+		}
+		num_gt_with_ccs_mode++;
+
 		for (m = 1; m <= num_slices; m++) {
 			if (num_slices % m)
 				continue;
@@ -352,12 +362,9 @@ igt_check_supported_pipeline(void)
 
 static bool is_sriov_mode(int fd)
 {
-	bool is_sriov = false;
-
-	if (igt_sriov_is_pf(fd) && igt_sriov_vfs_supported(fd))
-		is_sriov = true;
-
-	return is_sriov;
+	return intel_is_vf_device(fd) ||
+	       (igt_sriov_is_pf(fd) &&
+	       igt_sriov_get_enabled_vfs(fd) > 0);
 }
 
 static void
@@ -413,20 +420,30 @@ test_eu_busy(uint64_t duration_sec)
 	pthread_cond_t cond;
 	u32 gt, n_instances = 0, i;
 	bool go = false;
-	int ccs_mode, gt_fd, fd;
+	int ccs_mode, gt_fd, fd, num_gt_with_ccs_mode = 0;
 	u32 num_slices, ip_ver;
 	uint64_t gt_mask = get_gt_mask();
+	bool ccs_mode_found = false;
 
 	for_each_bit(gt_mask, gt) {
 		if (!get_num_cslices(gt, &num_slices))
 			continue;
 
 		gt_fd = gt_sysfs_open(gt);
+		if (!igt_sysfs_has_attr(gt_fd, "ccs_mode")) {
+			close(gt_fd);
+			continue;
+		}
+		num_gt_with_ccs_mode++;
 		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", num_slices) > 0);
 		igt_assert(igt_sysfs_scanf(gt_fd, "ccs_mode", "%u", &ccs_mode) > 0);
 		close(gt_fd);
+		ccs_mode_found = true;
 	}
 
+	if (!ccs_mode_found)
+		igt_skip("No GT with ccs_mode attribute found, skipping test\n");
+
 	igt_skip_on_f(ccs_mode <= 1, "Skipping test as ccs_mode <=1 not matching criteria :%d\n",
 		      ccs_mode);
 
@@ -491,6 +508,7 @@ test_eu_busy(uint64_t duration_sec)
 	free(threads_data);
 
 	drm_close_driver(fd);
+	igt_require(num_gt_with_ccs_mode > 0);
 }
 
 /**
@@ -514,10 +532,12 @@ int igt_main()
 {
 	int xe, ccs_mode[4];
 	unsigned int ip_ver;
+	bool sriov_enabled;
 
 	igt_fixture() {
 		xe = drm_open_driver(DRIVER_XE);
 		sriov_enabled = is_sriov_mode(xe);
+		igt_info("sriov_enabled :%d\n", sriov_enabled);
 		ip_ver = intel_graphics_ver(intel_get_drm_devid(xe));
 		igt_store_ccs_mode(ccs_mode, ARRAY_SIZE(ccs_mode));
 	}
@@ -530,14 +550,12 @@ int igt_main()
 
 	/* ccs mode tests should be run without open gpu file handles */
 	igt_subtest("ccs-mode-basic") {
-		/* skip if sriov enabled */
 		if (sriov_enabled)
 			igt_skip("Skipping test when SRIOV is enabled\n");
 		test_ccs_mode();
 	}
 
 	igt_subtest("ccs-mode-compute-kernel") {
-		/* skip if sriov enabled */
 		if (sriov_enabled)
 			igt_skip("Skipping test when SRIOV is enabled\n");
 		test_compute_kernel_with_ccs_mode();
@@ -554,7 +572,6 @@ int igt_main()
 
 	/* test to check available EU utilisation in multi-ccs case */
 	igt_subtest("eu-busy-10s") {
-		/* skip if sriov enabled */
 		if (sriov_enabled)
 			igt_skip("Skipping test when SRIOV is enabled\n");
 
-- 
2.43.0

