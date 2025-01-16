Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC066C02180
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 12:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666C610E587;
	Thu, 16 Jan 2025 12:55:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qaj+ujjd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2E510E587
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737032134; x=1768568134;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BRybhWsTCqvOKDjxPBFLLQqdQlz0cHrSvCia/xhINzw=;
 b=Qaj+ujjddl7Kvk3oG6C0LZaz3tah67plBxlNAb3NnNDrLRLBvoTuTJ3c
 NPDlfUZvDmiKWevkAw5z/oXruN4ydUSicL8ofB+Eb4jYQet3BpzuOcyaY
 6zh40tNG6XhiDsxi0BQIbZWKhWRdjoZDYTUdQkUSGS/sxFSoMHFVH+VaG
 EizLdem2mTva2X0b4Rj94VlV60pMvfMndJaePgu+TNl760Ba346vh5GaV
 X6KhOmiISSrUyi1iA4am2xyqtHpmHcsBIG/fqBC8X1jPg/QCA4Bi/NGtU
 ebnNkT7zn36sykf/C4s8cWhrwwo9AqlLqVdyG4hHI6iorDeXCOlSMsn+y g==;
X-CSE-ConnectionGUID: dadWSzCdRvS2eL8nRk03/g==
X-CSE-MsgGUID: 6YsH9pHsTUOL3fDCPTMW9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37570294"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="37570294"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 04:55:34 -0800
X-CSE-ConnectionGUID: k+zcJDmpS7yqj92shdbHZQ==
X-CSE-MsgGUID: PAUHhDClRlez8WHuGO3lpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110112572"
Received: from artdev273.igk.intel.com ([172.28.176.8])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 04:55:33 -0800
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v1 1/1] tests/xe_eudebug: refactor exec-queue-placements
 test
Date: Thu, 16 Jan 2025 12:55:22 +0000
Message-Id: <20250116125522.146533-1-jan.sokolowski@intel.com>
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

Move the test to the end in the execution list and add
a proper cleanup method, ccs_mode_restore;

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
---
 tests/intel/xe_eudebug.c | 46 ++++++++++++++++++++++++++++++----------
 1 file changed, 35 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 91e9ae885..c93b55857 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
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
@@ -2919,17 +2938,6 @@ igt_main
 	igt_subtest("discovery-empty-clients")
 		test_empty_discovery(fd, DISCOVERY_DESTROY_RESOURCES, 16);
 
-	igt_subtest_group {
-		igt_fixture {
-			drm_close_driver(fd);
-			ccs_mode_all_engines(gt_count);
-			fd = drm_open_driver(DRIVER_XE);
-		}
-
-		igt_subtest("exec-queue-placements")
-			test_basic_sessions(fd, EXEC_QUEUES_PLACEMENTS, 1, true);
-	}
-
 	igt_fixture {
 		xe_eudebug_enable(fd, was_enabled);
 		drm_close_driver(fd);
@@ -2984,4 +2992,20 @@ igt_main
 			free(multigpu_was_enabled);
 		}
 	}
+
+	igt_subtest_group {
+		igt_fixture {
+			ccs_mode_all_engines(gt_count);
+		}
+
+		igt_subtest("exec-queue-placements") {
+			fd = drm_open_driver(DRIVER_XE);
+
+			test_basic_sessions(fd, EXEC_QUEUES_PLACEMENTS, 1, true);
+
+			ccs_mode_restore(gt_count);
+			drm_close_driver(fd);
+		}
+	}
+
 }
-- 
2.34.1

