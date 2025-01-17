Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AB4C02183
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 08:21:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4D610E2E6;
	Fri, 17 Jan 2025 08:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BI/r4NDg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837DB10E234
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2025 08:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737102067; x=1768638067;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hNJMe0oIDWBIt54TvIu0eY0hp4cjylYLeushwUz6x1k=;
 b=BI/r4NDgKuYFXXwLzepXMZyeigwNT+ziqUn5krJFSqmMcfClQxMt+zbS
 B/AsqRa33Gy93V/XNMZZbxoj8cWaNqx3gopD/hgBjeJ/2yZxn7hvu5a0M
 86cHuOgniwHfZJu+f9qx+w11/z/5s8uhl9MUBWKSuRX9KYdeGvYIJnpTH
 Rm8mcA0tcu2YJTCVgJUYx1DIjyw7F1rWs+HErNnDUT3kLtUJBs18QD4gt
 nK4JHVJTmCDwk7J8sD/IWeoApf5uLKa/PqPRVYF+/rijuF9djd8KTzIOb
 i660pp6orS5HvtLRm7/AQoAIFIyvjm+qWExT71PJMxoW7sGEzx3DZ7s6k Q==;
X-CSE-ConnectionGUID: BNp96Fh+RW+OUCAHPPn1aQ==
X-CSE-MsgGUID: t5s0KDC5TVmSG0i8pDshew==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="36807182"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="36807182"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 00:21:06 -0800
X-CSE-ConnectionGUID: cCqk/1RLTbK495bcpiJE/g==
X-CSE-MsgGUID: fMRGD/AwT96eOdQV9iXe0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="110751925"
Received: from artdev273.igk.intel.com ([172.28.176.8])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 00:21:05 -0800
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v3 1/1] tests/intel/xe_eudebug: refactor
 exec-queue-placements test
Date: Fri, 17 Jan 2025 08:20:55 +0000
Message-Id: <20250117082055.154635-1-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

In some cases, ccs_mode_all_engines can fail,
which will cause test fixture to not execute properly
and put the rest of the tests in an unstable state. Also,
ccs_mode_all_engines changes the state of the card for
other tests as well, thus it should clean after itself too,
which until now it didn't do.

Refactor exec-queue-placements test so that all possible
failure paths are serviced, and add a proper cleanup method,
ccs_mode_restore.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
---

v2: Forgot proper path in title
v3: More changes. Moved test back to where it originally was

---

 tests/intel/xe_eudebug.c | 41 ++++++++++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 91e9ae885..9787183ed 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -2797,7 +2797,7 @@ static void ccs_mode_all_engines(int num_gt)
 
 		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", num_slices) > 0);
 		igt_assert(igt_sysfs_scanf(gt_fd, "ccs_mode", "%u", &ccs_mode) > 0);
-		igt_assert(num_slices == ccs_mode);
+		igt_require(num_slices == ccs_mode);
 		close(gt_fd);
 	}
 
@@ -2805,6 +2805,25 @@ static void ccs_mode_all_engines(int num_gt)
 	igt_require(num_gts_with_ccs_mode > 0);
 }
 
+static void ccs_mode_restore(int num_gt)
+{
+	int fd, gt, gt_fd, ccs_mode, num_slices;
+
+	for (gt = 0; gt < num_gt; gt++) {
+		fd = drm_open_driver(DRIVER_XE);
+		gt_fd = xe_sysfs_gt_open(fd, gt);
+		close(fd);
+
+		if (igt_sysfs_scanf(gt_fd, "num_cslices", "%u", &num_slices) <= 0)
+			continue;
+
+		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", 1) > 0);
+		igt_assert(igt_sysfs_scanf(gt_fd, "ccs_mode", "%u", &ccs_mode) > 0);
+		igt_assert(ccs_mode == 1);
+		close(gt_fd);
+	}
+}
+
 igt_main
 {
 	bool was_enabled;
@@ -2920,16 +2939,26 @@ igt_main
 		test_empty_discovery(fd, DISCOVERY_DESTROY_RESOURCES, 16);
 
 	igt_subtest_group {
-		igt_fixture {
+		bool restore_ccs = false;
+
+		igt_subtest("exec-queue-placements") {
 			drm_close_driver(fd);
+			fd = -1;
 			ccs_mode_all_engines(gt_count);
+			restore_ccs = true;
 			fd = drm_open_driver(DRIVER_XE);
-		}
-
-		igt_subtest("exec-queue-placements")
 			test_basic_sessions(fd, EXEC_QUEUES_PLACEMENTS, 1, true);
+		}
+		igt_fixture {
+			if (restore_ccs) {
+				drm_close_driver(fd);
+				fd = -1;
+				ccs_mode_restore(gt_count);
+			}
+			if (fd == -1)
+				fd = drm_open_driver(DRIVER_XE);
+		}
 	}
-
 	igt_fixture {
 		xe_eudebug_enable(fd, was_enabled);
 		drm_close_driver(fd);
-- 
2.34.1

