Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DF3E8304A
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 03:57:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47ED10E113;
	Tue,  3 Feb 2026 03:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nDi7qXhY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725EC10E113
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 03:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770091070; x=1801627070;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I1wh7RhmnD7VFt05abdck29R5bXcOWtCwLCf7KWx1ik=;
 b=nDi7qXhYmwAOLDg/dG6GGXLfW5OqlrfEdDTOdCi5lpu48eKVmzUvGjWw
 J2PVdO/O/BPzGRQgkDfB/V0EXXBWDzDMF2N9qXh8EMDL3+gep4KbyF+iY
 Kol+Y6/jdt0kDmF861WJyiTuutwy02pmCBtYlDzypGm/dZnx8MwZC3EU1
 tu5THKytx+OkKX0tHxqwJsrQ+to+d+diCANxMge5F/i0MajkaUsJAvb9P
 yjVpNc3moYH11QeQl8fdaRXBt5uc/Bt/FG49JXWp8yS7QrEdNCNDoZ+W3
 G/e8f7G81IH7iZ+ry5Q1vI6JQmlwnkg0DACd6yHELFw8jaEs2puz05x1I g==;
X-CSE-ConnectionGUID: /7wz+XYWSs6q5ueCUJgA/Q==
X-CSE-MsgGUID: SmCpMUtSQ9eZyFv1ZEYl5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71163016"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="71163016"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 19:57:49 -0800
X-CSE-ConnectionGUID: /xCzsSNGSPaLZSsyShcu/w==
X-CSE-MsgGUID: kjrG9T3cROWeRQ2x3dHmmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="240388601"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.55])
 by orviesa002.jf.intel.com with ESMTP; 02 Feb 2026 19:57:47 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, stuart.summers@intel.com,
 christoph.manszewski@intel.com
Subject: [PATCH i-g-t] DONT_MERGE:tests/intel/xe_compute: Robust SR-IOV/VF/PF
 and per-GT ccs_mode attribute handling
Date: Tue,  3 Feb 2026 03:57:46 +0000
Message-ID: <20260203035746.1143926-1-nishit.sharma@intel.com>
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
 tests/intel/xe_compute.c | 55 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 310093fc5..c1c35f477 100644
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
@@ -77,6 +75,28 @@ static uint64_t get_gt_mask(void)
 #define for_each_bit(__mask, __bit) \
 	for ( ; __bit = ffsll(__mask) - 1, __mask != 0; __mask &= ~(1ull << __bit))
 
+static void
+check_any_gt_has_ccs_mode(void)
+{
+	uint64_t gt_mask = get_gt_mask();
+	bool found_ccs_mode = false;
+	int fd, gt_fd;
+	u32 gt;
+
+	fd = drm_open_driver(DRIVER_XE);
+	for_each_bit(gt_mask, gt) {
+		gt_fd = xe_sysfs_gt_open(fd, gt);
+		if (igt_sysfs_has_attr(gt_fd, "ccs_mode")) {
+			found_ccs_mode = true;
+			close(gt_fd);
+			break;
+		}
+		close(gt_fd);
+	}
+	igt_require(found_ccs_mode);
+	drm_close_driver(fd);
+}
+
 /**
  * SUBTEST: ccs-mode-basic
  * GPU requirement: PVC
@@ -91,6 +111,8 @@ test_ccs_mode(void)
 	int fd, gt_fd, num_gt_with_ccs_mode = 0;
 	uint64_t gt_mask = get_gt_mask();
 
+	check_any_gt_has_ccs_mode();
+
 	/*
 	 * The loop body needs to run without any open file descriptors so we
 	 * can't use xe_for_each_gt() which uses an open fd.
@@ -101,6 +123,10 @@ test_ccs_mode(void)
 
 		num_gt_with_ccs_mode++;
 		gt_fd = gt_sysfs_open(gt);
+		if (!igt_sysfs_has_attr(gt_fd, "ccs_mode")) {
+			close(gt_fd);
+			continue;
+		}
 		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", 0) < 0);
 		for (m = 1; m <= num_slices; m++) {
 			/* compute slices are to be equally distributed among enabled engines */
@@ -167,6 +193,8 @@ test_compute_kernel_with_ccs_mode(void)
 	int fd, gt_fd, num_gt_with_ccs_mode = 0;
 	uint64_t gt_mask = get_gt_mask();
 
+	check_any_gt_has_ccs_mode();
+
 	/*
 	 * The loop body needs to run without any open file descriptors so we
 	 * can't use xe_for_each_gt() which uses an open fd.
@@ -177,6 +205,11 @@ test_compute_kernel_with_ccs_mode(void)
 
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
@@ -354,7 +387,7 @@ static bool is_sriov_mode(int fd)
 {
 	bool is_sriov = false;
 
-	if (igt_sriov_is_pf(fd) && igt_sriov_vfs_supported(fd))
+	if (intel_is_vf_device(fd) || (igt_sriov_is_pf(fd) && igt_sriov_get_enabled_vfs(fd) > 0))
 		is_sriov = true;
 
 	return is_sriov;
@@ -417,11 +450,17 @@ test_eu_busy(uint64_t duration_sec)
 	u32 num_slices, ip_ver;
 	uint64_t gt_mask = get_gt_mask();
 
+	check_any_gt_has_ccs_mode();
+
 	for_each_bit(gt_mask, gt) {
 		if (!get_num_cslices(gt, &num_slices))
 			continue;
 
 		gt_fd = gt_sysfs_open(gt);
+		if (!igt_sysfs_has_attr(gt_fd, "ccs_mode")) {
+			close(gt_fd);
+			continue;
+		}
 		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", num_slices) > 0);
 		igt_assert(igt_sysfs_scanf(gt_fd, "ccs_mode", "%u", &ccs_mode) > 0);
 		close(gt_fd);
@@ -514,6 +553,7 @@ int igt_main()
 {
 	int xe, ccs_mode[4];
 	unsigned int ip_ver;
+	bool sriov_enabled;
 
 	igt_fixture() {
 		xe = drm_open_driver(DRIVER_XE);
@@ -530,14 +570,12 @@ int igt_main()
 
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
@@ -554,7 +592,6 @@ int igt_main()
 
 	/* test to check available EU utilisation in multi-ccs case */
 	igt_subtest("eu-busy-10s") {
-		/* skip if sriov enabled */
 		if (sriov_enabled)
 			igt_skip("Skipping test when SRIOV is enabled\n");
 
@@ -566,7 +603,11 @@ int igt_main()
 	}
 
 	igt_fixture() {
-		if (!sriov_enabled)
+		int fd = drm_open_driver(DRIVER_XE);
+		if (!intel_is_vf_device(fd) &&
+		    !(igt_sriov_is_pf(fd) && igt_sriov_get_enabled_vfs(fd) > 0)) {
+			drm_close_driver(fd);
 			igt_restore_ccs_mode(ccs_mode, ARRAY_SIZE(ccs_mode));
+		}
 	}
 }
-- 
2.43.0

