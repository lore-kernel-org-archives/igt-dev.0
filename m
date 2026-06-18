Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEECCD98F2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 20:26:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C70C10E282;
	Thu, 18 Jun 2026 20:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MmhSWX5D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B728210E282
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 20:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781814363; x=1813350363;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VJb1huvbyellKATvXa/PZnRTxC/NIzGZ7y/YM0P9HF0=;
 b=MmhSWX5DzQ4ZF1HvrqgbScshbZS3nj009aXYg4NQSphUDPPR1BEr10DM
 R9sS/riUh2T5xqUxD7AlmiK1nCCFPqp7dBBXXOMnghflv++tAdT91cndz
 caASkvJngScGpKLmciibyTt/LMHnHaJl8tVTtRWsLTkikisv1lLubhqGf
 7+2aLCDLQFPbmkzpBPcman7kgN6QRIO65PpbsdN1rqtcoKnA3oorI6XCn
 StJNlIUbiAcozYb5pImlrCR9P5HyRG+rs+RIWRMGHTiqZHX1ZBp3wxiTU
 WFEqwXSH6MIMXRocoYcfDuysGXBfwj4plslvF7vb8Psgv+JOFTM00oclf w==;
X-CSE-ConnectionGUID: Kg95HYybR4myQE8Wr/8m1Q==
X-CSE-MsgGUID: VWVVutafTOacJD0t4+uCaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="93781178"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="93781178"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 13:26:02 -0700
X-CSE-ConnectionGUID: 9YbHbXsjRNaPgoqmIVIzfQ==
X-CSE-MsgGUID: KaVP5I4gROSxJ4yg7Asygg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="248537246"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 13:26:02 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/kms_hdr: Enable DRM KMS debug mask for
 invalid-hdr subtest
Date: Fri, 19 Jun 2026 02:04:54 +0530
Message-Id: <20260618203454.2717685-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

The invalid-hdr subtest validates that HDR is not enabled on
non-HDR panels by checking for "Unknown EOTF" messages in
dmesg. These messages are emitted via drm_dbg_kms() which
requires DRM_UT_KMS to be set in the debug mask.

v2:
- Scope DRM_UT_KMS enablement to invalid-hdr subtest only (Pranay)

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_hdr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index b0b038413..99960cda7 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -34,6 +34,7 @@
 #include <unistd.h>
 #include "igt_edid.h"
 #include "igt_hdr.h"
+#include "igt_sysfs.h"
 
 /**
  * SUBTEST: bpc-switch
@@ -678,8 +679,11 @@ int igt_main()
 		test_hdr(&data, TEST_INVALID_METADATA_SIZES);
 
 	igt_describe("Test to ensure HDR is not enabled on non-HDR panel");
-	igt_subtest_with_dynamic("invalid-hdr")
+	igt_subtest_with_dynamic("invalid-hdr") {
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
+		igt_drm_debug_mask_update(DRM_UT_KMS);
 		test_hdr(&data, TEST_INVALID_HDR);
+	}
 
 	igt_fixture() {
 		igt_display_fini(&data.display);
-- 
2.25.1

