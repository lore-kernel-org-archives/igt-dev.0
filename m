Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364D1CA1005
	for <igt-dev@archiver.kernel.org>; Tue,  2 Sep 2025 08:41:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85EA10E5FE;
	Tue,  2 Sep 2025 08:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="co5sCaTI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984EF10E39A
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Sep 2025 07:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756798701; x=1788334701;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FPbJRc+eY4j3DX8jGVpe3fwqDNqR+nqOsOmwFE/T47Q=;
 b=co5sCaTI0aSa1B45iBIArWfQqZpJilSY++NzdWsRZ5mVI+jgpo8pTjbd
 +aClMS+En3wa15P4Q4ygguMPWxiRwIdJ9O3CKOtsE7j5f9E9dpPX4CAT+
 xPiqesSbGo1Ic5VPnEWJCAuUw3O5iFGuq5Mr44kj5m9vPnPZJ2nXTKQ5D
 1domO5BKV5lhxNRgAjH8mm2ZK8MgWJYCNPjX0Pt4Dy1QX7U4dPUMf93ap
 WXdLOYezJHlHZOiOHV3q5DQvhjWT+rDEJpVyfyQ/IXPYnqMQooUTQSfFI
 gHp6IrOaNiN7mw0IZgRmbY3PWrdd2Rc8bHVPJeQMzsVTFyhfmdrLtRlDc A==;
X-CSE-ConnectionGUID: S4QruBAFSAe94Z1xx6Dm4Q==
X-CSE-MsgGUID: skxdbpRaQO6A9cV5SoXBPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="69321256"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="69321256"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 00:38:20 -0700
X-CSE-ConnectionGUID: T3osWTjKRwChE9/PkZvOuQ==
X-CSE-MsgGUID: wCO3+WxoSnC6IydAXQcYVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="171647827"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 00:38:17 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	sowmiya <sowmiya.s@intel.com>
Subject: [PATCH i-g-t] tests/kms_atomic_transition: Add info meassages for
 skipped subtest
Date: Tue,  2 Sep 2025 13:25:47 +0530
Message-ID: <20250902075547.2545495-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 02 Sep 2025 08:41:23 +0000
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

From: sowmiya <sowmiya.s@intel.com>

Add igt_info messages for subtests that are skipped due to
the absence of internal or external displays. This provides
clearer insight into the reason for skipping.

Signed-off-by: sowmiya <sowmiya.s@intel.com>
---
 tests/kms_atomic_transition.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index a13830965..a26ddf5f2 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1172,6 +1172,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	};
 	int i, j, count = 0;
 	int pipe_count = 0;
+	bool flag = false;
 
 	igt_fixture {
 		unsigned int debug_mask_if_ci = DRM_UT_KMS;
@@ -1216,6 +1217,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_describe(transition_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", transition_tests[i].name) {
 			pipe_count = 0;
+			flag = false;
 
 			for_each_pipe_with_valid_output(&data.display, pipe, output) {
 				/*
@@ -1224,12 +1226,16 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				 * panels with long power cycle delays.
 				 */
 				if ((transition_tests[i].type == TRANSITION_MODESET) &&
-				    output_is_internal_panel(output))
+				    output_is_internal_panel(output)) {
+					flag = true;
 					continue;
+				}
 
 				if ((transition_tests[i].type == TRANSITION_MODESET_FAST) &&
-				    !output_is_internal_panel(output))
+				    !output_is_internal_panel(output)) {
+					flag = true;
 					continue;
+				}
 
 				if (pipe_count == 2 * count && !data.extended)
 					break;
@@ -1249,6 +1255,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				test_cleanup(&data, pipe, output,
 					     transition_tests[i].fencing);
 			}
+			if (flag && !pipe_count) {
+				if (transition_tests[i].type == TRANSITION_MODESET)
+					igt_info("Invalid test for internal panel\n");
+				else if (transition_tests[i].type == TRANSITION_MODESET_FAST)
+					igt_info("Invalid test for external panel\n");
+			}
 		}
 	}
 
-- 
2.43.0

