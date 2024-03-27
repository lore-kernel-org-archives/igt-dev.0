Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659FCC54E67
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 23:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC49112198;
	Wed, 27 Mar 2024 23:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kihD6IWy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A519210F1AD
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 23:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711583293; x=1743119293;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d+nLN9pYZT7HwD6/0HMii3svh5WMuWogomkRobqFBTQ=;
 b=kihD6IWyxtidfNE/5PupfGnQKaxJn3qtskGibQoMV39LsYnYZNwPHsW4
 8nUtPlCUXnLMujIO9UnYksquTSs9NkDqWBrGa+M6YCa8Xp0Raepy61luy
 0j9oPq/Bcon6/fKrMe3ZSy1ZnZ76mMJRPtlnBs/GCP0ZYdpkvtVt/fx+Q
 uoPc8SaFHGcycy9/XprDHifl3Ud3OO2kTVkH6VwhOeWwPqx2KiHDdYQxx
 vgHYB9PuOtghtddhugaGwV2/O/gCcgtOkTjg7XBmSRfKF1dlgpvU4VQH7
 4g688w25be+BF1F3nJeZQBuOUcxQLahyW1vhhaZ10yifEFpok90g1QqMn w==;
X-CSE-ConnectionGUID: F/E78CorTQmWZh4dz+0zeg==
X-CSE-MsgGUID: d1Ul1/9IQzOGtdNpyRAUzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6612095"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="6612095"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 16:48:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="16295351"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.140])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 16:48:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH i-g-t v2] tests/xe_compute: Don't require ccs_mode on every GT
Date: Wed, 27 Mar 2024 16:47:59 -0700
Message-ID: <20240327234759.1473420-1-matthew.d.roper@intel.com>
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

On platforms with standalone media, we expect some GTs to have CCS
engines (meaning ccs_mode can be tested if there's more than one CCS),
but the media GT will never have any CCS engines and will never expose
ccs_mode.  Move the igt_require() out of the loop so that we don't
declare the whole test a skip upon encountering the media GT when the
test already executed successfully on the primary GT.

v2:
 - Make the same fix for the compute_kernel subtest, not just the basic
   subtest.  (Gustavo)
 - Treat get_num_cslices()'s return value as a bool rather than an
   integer for clarity.

Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 tests/intel/xe_compute.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index e773e798a..ac6351276 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -51,11 +51,13 @@ test_ccs_mode(int num_gt)
 {
 	struct drm_xe_engine_class_instance *hwe;
 	u32 gt, m, ccs_mode, vm, q, num_slices;
-	int fd, gt_fd;
+	int fd, gt_fd, num_gt_with_ccs_mode = 0;
 
 	for (gt = 0; gt < num_gt; gt++) {
-		igt_require(get_num_cslices(gt, &num_slices));
+		if (!get_num_cslices(gt, &num_slices))
+			continue;
 
+		num_gt_with_ccs_mode++;
 		gt_fd = gt_sysfs_open(gt);
 		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", 0) < 0);
 		for (m = 1; m <= num_slices; m++) {
@@ -105,6 +107,8 @@ test_ccs_mode(int num_gt)
 
 		close(gt_fd);
 	}
+
+	igt_require(num_gt_with_ccs_mode > 0);
 }
 
 /**
@@ -118,11 +122,13 @@ test_compute_kernel_with_ccs_mode(int num_gt)
 {
 	struct drm_xe_engine_class_instance *hwe;
 	u32 gt, m, num_slices;
-	int fd, gt_fd;
+	int fd, gt_fd, num_gt_with_ccs_mode = 0;
 
 	for (gt = 0; gt < num_gt; gt++) {
-		igt_require(get_num_cslices(gt, &num_slices));
+		if (!get_num_cslices(gt, &num_slices))
+			continue;
 
+		num_gt_with_ccs_mode++;
 		gt_fd = gt_sysfs_open(gt);
 		for (m = 1; m <= num_slices; m++) {
 			if (num_slices % m)
@@ -150,6 +156,8 @@ test_compute_kernel_with_ccs_mode(int num_gt)
 
 		close(gt_fd);
 	}
+
+	igt_require(num_gt_with_ccs_mode > 0);
 }
 
 /**
-- 
2.43.0

