Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4468C8302D
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 16:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100EE10E4AA;
	Mon, 30 Jun 2025 16:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kuqBFBRT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9607C10E050
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 16:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751301349; x=1782837349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/HLb/a7BgD9uJ/WODpau1Ssdw1ichwC3TCsEl3TtA9E=;
 b=kuqBFBRTndR10LdoIYskYCG0bkU4IUpc0aQSjxJ9tf13EzfdVzbxSLOd
 YOeKe27VBZ3Lq3wKeI63mUZHUEwJ0lZp7vvHsh6x/oxdN8If5phwSoJtr
 WJ15uh2e6pAobCR1LFiSM8qrnr9sDNUywU6aW/Nq61XNb/n3+lwCqyQmx
 1OUE6ioSmQe73AzoaOwwuuAtw3ZbpgvOnPrczlAJNIdSOaThTMSOmbKrp
 1m1mrrwOIp92hkMa2PsIhmhBpki+tfp3WTkLGcN+R/2jTXbKaQjc/zS7P
 HZ5L9Rb062W4s1V8yUKQxEV3XSDY0cFlLHiIRuQmIWsYE2Buho5NuzwEx w==;
X-CSE-ConnectionGUID: 07HrpjpnQJGgPCVXiCkYKQ==
X-CSE-MsgGUID: fuJgA1d7QH66mScebksHiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="71101955"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="71101955"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 09:35:48 -0700
X-CSE-ConnectionGUID: zQv9yC3CQmikLnrbemQQFQ==
X-CSE-MsgGUID: q4q8jJoORvOJouJuil1w1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="159226423"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 09:35:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t 7/7] tests/xe: Don't assume max GT ID is num_gt - 1
Date: Mon, 30 Jun 2025 09:35:37 -0700
Message-ID: <20250630163529.2096664-16-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630163529.2096664-9-matthew.d.roper@intel.com>
References: <20250630163529.2096664-9-matthew.d.roper@intel.com>
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

On future platforms GT IDs may not be consecutive.  The GT mask should
be consulted when determining whether a GT is valid, and the maximum GT
ID (not the GT count) should be used when allocating array storage space
for GTs.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 tests/intel/xe_compute.c | 47 ++++++++++++++++++++--------------------
 tests/intel/xe_gt_freq.c |  8 +++----
 2 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 955edf082..658502e35 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -48,13 +48,13 @@ static bool get_num_cslices(u32 gt, u32 *num_slices)
  * Functionality: ccs mode
  */
 static void
-test_ccs_mode(int num_gt)
+test_ccs_mode(int fd)
 {
 	struct drm_xe_engine_class_instance *hwe;
 	u32 gt, m, ccs_mode, vm, q, num_slices;
-	int fd, gt_fd, num_gt_with_ccs_mode = 0;
+	int new_fd, gt_fd, num_gt_with_ccs_mode = 0;
 
-	for (gt = 0; gt < num_gt; gt++) {
+	xe_for_each_gt(fd, gt) {
 		if (!get_num_cslices(gt, &num_slices))
 			continue;
 
@@ -74,34 +74,34 @@ test_ccs_mode(int num_gt)
 			igt_assert(m == ccs_mode);
 
 			/* Validate exec queues creation with enabled ccs engines */
-			fd = drm_open_driver(DRIVER_XE);
-			vm = xe_vm_create(fd, 0, 0);
-			xe_for_each_engine(fd, hwe) {
+			new_fd = drm_open_driver(DRIVER_XE);
+			vm = xe_vm_create(new_fd, 0, 0);
+			xe_for_each_engine(new_fd, hwe) {
 				if (hwe->gt_id != gt ||
 				    hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
 					continue;
 
-				q = xe_exec_queue_create(fd, vm, hwe, 0);
-				xe_exec_queue_destroy(fd, q);
+				q = xe_exec_queue_create(new_fd, vm, hwe, 0);
+				xe_exec_queue_destroy(new_fd, q);
 			}
 
 			/* Ensure exec queue creation fails for disabled ccs engines */
 			hwe->gt_id = gt;
 			hwe->engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
 			hwe->engine_instance = m;
-			igt_assert_neq(__xe_exec_queue_create(fd, vm, 1, 1, hwe, 0, &q), 0);
+			igt_assert_neq(__xe_exec_queue_create(new_fd, vm, 1, 1, hwe, 0, &q), 0);
 
-			xe_vm_destroy(fd, vm);
-			drm_close_driver(fd);
+			xe_vm_destroy(new_fd, vm);
+			drm_close_driver(new_fd);
 		}
 
 		/* Ensure invalid ccs mode setting is rejected */
 		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", m) < 0);
 
 		/* Can't change ccs mode with an open drm clients */
-		fd = drm_open_driver(DRIVER_XE);
+		new_fd = drm_open_driver(DRIVER_XE);
 		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", 1) < 0);
-		drm_close_driver(fd);
+		drm_close_driver(new_fd);
 
 		/* Set ccs mode back to default value */
 		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", 1) > 0);
@@ -119,13 +119,13 @@ test_ccs_mode(int num_gt)
  * Functionality: ccs mode
  */
 static void
-test_compute_kernel_with_ccs_mode(int num_gt)
+test_compute_kernel_with_ccs_mode(int fd)
 {
 	struct drm_xe_engine_class_instance *hwe;
 	u32 gt, m, num_slices;
-	int fd, gt_fd, num_gt_with_ccs_mode = 0;
+	int new_fd, gt_fd, num_gt_with_ccs_mode = 0;
 
-	for (gt = 0; gt < num_gt; gt++) {
+	xe_for_each_gt(fd, gt) {
 		if (!get_num_cslices(gt, &num_slices))
 			continue;
 
@@ -138,18 +138,18 @@ test_compute_kernel_with_ccs_mode(int num_gt)
 			igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", m) > 0);
 
 			/* Run compute kernel on enabled ccs engines */
-			fd = drm_open_driver(DRIVER_XE);
-			xe_for_each_engine(fd, hwe) {
+			new_fd = drm_open_driver(DRIVER_XE);
+			xe_for_each_engine(new_fd, hwe) {
 				if (hwe->gt_id != gt ||
 				    hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
 					continue;
 
 				igt_info("GT-%d: Running compute kernel with ccs_mode %d on ccs engine %d\n",
 					 gt, m, hwe->engine_instance);
-				igt_assert_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL, EXECENV_PREF_SYSTEM),
+				igt_assert_f(xe_run_intel_compute_kernel_on_engine(new_fd, hwe, NULL, EXECENV_PREF_SYSTEM),
 					     "Unable to run compute kernel successfully\n");
 			}
-			drm_close_driver(fd);
+			drm_close_driver(new_fd);
 		}
 
 		/* Set ccs mode back to default value */
@@ -180,11 +180,10 @@ test_compute_square(int fd)
 
 igt_main
 {
-	int xe, num_gt;
+	int xe;
 
 	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
-		num_gt = xe_number_gt(xe);
 	}
 
 	igt_subtest("compute-square")
@@ -195,8 +194,8 @@ igt_main
 
 	/* ccs mode tests should be run without open gpu file handles */
 	igt_subtest("ccs-mode-basic")
-		test_ccs_mode(num_gt);
+		test_ccs_mode(xe);
 
 	igt_subtest("ccs-mode-compute-kernel")
-		test_compute_kernel_with_ccs_mode(num_gt);
+		test_compute_kernel_with_ccs_mode(xe);
 }
diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index 689e0296a..2c9080428 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -399,17 +399,17 @@ igt_main
 	int gt;
 	struct drm_xe_engine_class_instance *hwe;
 	uint32_t *stash_min, *stash_max;
-	int num_gts;
+	int max_gt;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 
 		igt_require(xe_sysfs_gt_has_node(fd, 0, "freq0"));
-		num_gts = xe_number_gt(fd);
+		max_gt = xe_dev_max_gt(fd);
 
 		/* The defaults are the same. Stashing the gt0 is enough */
-		stash_min = (uint32_t *) malloc(sizeof(uint32_t) * num_gts);
-		stash_max = (uint32_t *) malloc(sizeof(uint32_t) * num_gts);
+		stash_min = (uint32_t *) malloc(sizeof(uint32_t) * max_gt);
+		stash_max = (uint32_t *) malloc(sizeof(uint32_t) * max_gt);
 
 		xe_for_each_gt(fd, gt) {
 			stash_min[gt] = xe_gt_get_freq(fd, gt, "min");
-- 
2.49.0

