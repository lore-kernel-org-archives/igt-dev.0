Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B324CD6E74
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 10:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D310411A719;
	Fri,  5 Jun 2026 10:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E9Zjpdx2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D773111A719
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 10:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780655806; x=1812191806;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lkcwCl09fklV1KqyXiwxepPpCQJJb/wd2QAIc6ZS6As=;
 b=E9Zjpdx2uTxjTnz50JtV/JAXU71+dWJkYczV8Fz0VLThCUl+TR8EMqfw
 RfviSHvS8OALntz9/CEDFsg2MnEaEtFYzEVBjWTQi3odX1wPusMUqjEXj
 VL7Q8GCapJru3pATrJYZLRfmCilVIO1aaW5xS43zFq//YASMJYrJXPFj1
 obaXazCvJwuPeILEJ24IzxYVswEbYDbPJDGB8lsCilCTlwTq/nOdUV1oC
 IyIOFVHh67agct1Sxp0zvmFV8KYs9GTp7+XMCKWTt071XrYm4XIMzc2O+
 SfyBjRnx8Ue+hGH2QYI5VepPe61W08HO2sHyp0n3Ssb/zFPy+IyG9U8NA Q==;
X-CSE-ConnectionGUID: FQPLzMvxSfmzE2dHq2760w==
X-CSE-MsgGUID: 7ZyxOCBXTP+J7YPgWLnFSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81674019"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="81674019"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 03:36:35 -0700
X-CSE-ConnectionGUID: Zr/nIbgnS7Oba3k0kQYUCg==
X-CSE-MsgGUID: 8I2cPlDNQbuGMLAc92cgUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="242332598"
Received: from cml-cometlake-client-platform.iind.intel.com ([10.223.55.11])
 by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2026 03:36:33 -0700
From: aditya.chauhan@intel.com
To: ramadevi.gandi@intel.com,
	igt-dev@lists.freedesktop.org
Cc: priyanka.dandamudi@intel.com,
	himanshu.girotra@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_exec_reset: suppress expected CGP_SYNC
 dmesg warning
Date: Fri,  5 Jun 2026 16:06:32 +0530
Message-Id: <20260605103632.3297911-1-aditya.chauhan@intel.com>
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

From: Aditya Chauhan <aditya.chauhan@intel.com>

When multi-queue GT reset is triggered, it causes the kernel to emit
"Wait for CGP_SYNC_DONE response failed!" at warn level, which is
expected behavior as  the test intentionally validates that CGP_SYNC
failures are recoverable during GT reset.

Suppress the warning using igt_emit_ignore_dmesg_regex() in the
multi-queue-gt-reset and cm-multi-queue-gt-reset subtests to prevent
false dmesg-warn verdicts from igt_runner.

Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
---
 tests/intel/xe_exec_reset.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 89a47d236..dc1ae7e99 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -29,6 +29,11 @@
 #define SYNC_OBJ_SIGNALED	(0x1 << 0)
 #define LEGACY_MODE_ADDR	0x1a0000
 
+static void ignore_gt_reset_warnings_in_dmesg(void)
+{
+	igt_emit_ignore_dmesg_regex("Wait for CGP_SYNC_DONE response failed");
+}
+
 /**
  * SUBTEST: spin
  * Description: test spin
@@ -1104,6 +1109,7 @@ int igt_main()
 
 	igt_subtest("multi-queue-gt-reset") {
 		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		ignore_gt_reset_warnings_in_dmesg();
 		xe_for_each_multi_queue_engine(fd, hwe)
 			xe_legacy_test_mode(fd, hwe, 16, 16,
 					    GT_RESET | MULTI_QUEUE,
@@ -1165,6 +1171,7 @@ int igt_main()
 
 	igt_subtest("cm-multi-queue-gt-reset") {
 		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		ignore_gt_reset_warnings_in_dmesg();
 		xe_for_each_multi_queue_engine(fd, hwe)
 			test_compute_mode(fd, hwe, 16, 16,
 					  GT_RESET | MULTI_QUEUE);
-- 
2.34.1

