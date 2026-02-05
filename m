Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6709EA7960
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 04:16:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F3210E788;
	Thu,  5 Feb 2026 04:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bDqz4W0s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DC010E788
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 04:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770265003; x=1801801003;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1ocAlzHlhhpLRRwUzb3R5djKkJjRqGuvO1GeXEMh2lQ=;
 b=bDqz4W0stZhkcDBH4sNJwGXRIWW0MxNup+Ahi8NTYMkisAseKOQI/yF9
 S5FnifyxtQdhWgVawytOdA+c8E2jNf2zJOOk2QFU8Yt6AdYsnWIbUE/aO
 4K4kboVoNSxdkONGLRtoG6SVY1O8AvpcPhS9qvJbHw2oExULKlTyMiBqa
 WBZRaDYxsxxShnKL5CoBVi4sCafzoNPMDKQw1SfNQnCZthoNXX2e1Xrey
 sG/OEQIBE0KDrnlA1C7h4JOQ4+GEpwVchogM9+vtT48lcbAFQp8nPcVIJ
 qSgvFkNw/jI01GNfxaw87QT0T3usXHUx773dCq5XsrXgs2ImJUvGYi9rZ Q==;
X-CSE-ConnectionGUID: CKFpveBnTwq4uxlBhqPxgg==
X-CSE-MsgGUID: Yaz6cSTmQxyi7u4HPdmgEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75311651"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="75311651"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 20:16:43 -0800
X-CSE-ConnectionGUID: QyUYYfCZSlWTPCPV+GOVwQ==
X-CSE-MsgGUID: bqlJXBBgQPuRHxaEb6pDKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="214895678"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.55])
 by orviesa004.jf.intel.com with ESMTP; 04 Feb 2026 20:16:41 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, stuart.summers@intel.com,
 christoph.manszewski@intel.com
Subject: [PATCH i-g-t] DONT_MERGE:tests/intel/xe_compute: Robust SR-IOV/VF/PF
 and per-GT ccs_mode attribute handling
Date: Thu,  5 Feb 2026 04:16:40 +0000
Message-ID: <20260205041640.1357478-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
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
 tests/intel/xe_compute.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 310093fc5..47d4b49dd 100644
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
@@ -101,6 +99,10 @@ test_ccs_mode(void)
 
 		num_gt_with_ccs_mode++;
 		gt_fd = gt_sysfs_open(gt);
+		if (!igt_sysfs_has_attr(gt_fd, "ccs_mode")) {
+			close(gt_fd);
+			continue;
+		}
 		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", 0) < 0);
 		for (m = 1; m <= num_slices; m++) {
 			/* compute slices are to be equally distributed among enabled engines */
@@ -177,6 +179,11 @@ test_compute_kernel_with_ccs_mode(void)
 
 		num_gt_with_ccs_mode++;
 		gt_fd = gt_sysfs_open(gt);
+		if (!igt_sysfs_has_attr(gt_fd, "ccs_mode")) {
+			close(gt_fd);
+			continue;
+		}
+
 		for (m = 1; m <= num_slices; m++) {
 			if (num_slices % m)
 				continue;
@@ -354,7 +361,7 @@ static bool is_sriov_mode(int fd)
 {
 	bool is_sriov = false;
 
-	if (igt_sriov_is_pf(fd) && igt_sriov_vfs_supported(fd))
+	if (intel_is_vf_device(fd) || (igt_sriov_is_pf(fd) && igt_sriov_get_enabled_vfs(fd) > 0))
 		is_sriov = true;
 
 	return is_sriov;
@@ -422,6 +429,10 @@ test_eu_busy(uint64_t duration_sec)
 			continue;
 
 		gt_fd = gt_sysfs_open(gt);
+		if (!igt_sysfs_has_attr(gt_fd, "ccs_mode")) {
+			close(gt_fd);
+			continue;
+		}
 		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", num_slices) > 0);
 		igt_assert(igt_sysfs_scanf(gt_fd, "ccs_mode", "%u", &ccs_mode) > 0);
 		close(gt_fd);
@@ -514,6 +525,7 @@ int igt_main()
 {
 	int xe, ccs_mode[4];
 	unsigned int ip_ver;
+	bool sriov_enabled;
 
 	igt_fixture() {
 		xe = drm_open_driver(DRIVER_XE);
@@ -530,14 +542,12 @@ int igt_main()
 
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
@@ -554,7 +564,6 @@ int igt_main()
 
 	/* test to check available EU utilisation in multi-ccs case */
 	igt_subtest("eu-busy-10s") {
-		/* skip if sriov enabled */
 		if (sriov_enabled)
 			igt_skip("Skipping test when SRIOV is enabled\n");
 
@@ -566,7 +575,7 @@ int igt_main()
 	}
 
 	igt_fixture() {
-		if (!sriov_enabled)
+		if (sriov_enabled)
 			igt_restore_ccs_mode(ccs_mode, ARRAY_SIZE(ccs_mode));
 	}
 }
-- 
2.43.0

