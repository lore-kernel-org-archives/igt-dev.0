Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E727CCF9E5
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 04:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3EE10E097;
	Mon, 27 Oct 2025 04:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bWtTZIhA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423B210E097
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 04:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761539439; x=1793075439;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hmXr04EIDXpOW1qZhnZVJktqKY++SyGViTZxcA2Ka6Q=;
 b=bWtTZIhAmsK8CaL59UqXfr75tytTmsU2N042osSzDW0IPFWLwSWOILdb
 kGuxo0phhvC6RCs3yrZ9g39SZaKRDw+zGjl95V8c4ZF8pLvtjwy9Y5jFF
 xT41njCmBkX4WlCoUWxaTEGB0yQT5Gg7YuAdjjKS0gZeNUYLJ+8ye/tT5
 vKGSLEXhGBl9kOYfbhdA4cWSxDdp0ZSPRW0CWvgsly2J1QI+oclH34nXY
 Ib2dGUkedab/BI2yJhawQqTp7LxIIKM9xX54mF8VE19TsmHpzTnP8vjGE
 UCgm/4/xfhwDMhFR+WgazGfd2+zt/p52Cc6QI48E2JWUX7HVIzqXupH1F w==;
X-CSE-ConnectionGUID: PqDcbsUyTlCH4uXIlqj1vA==
X-CSE-MsgGUID: OECTwPuVRIaMD4ursK21Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63649500"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="63649500"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 21:30:39 -0700
X-CSE-ConnectionGUID: IZtsVOPLSii50+Lx2+Gtew==
X-CSE-MsgGUID: lcREc/yBRoSNj5td3tvg5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="190076556"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 21:30:37 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, pranay.samala@intel.com,
 sowmiya <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v3] tests/kms_atomic_transition: Add info messages for
 skipped subtest
Date: Mon, 27 Oct 2025 10:18:23 +0530
Message-ID: <20251027044824.2995891-1-sowmiya.s@intel.com>
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

From: sowmiya <sowmiya.s@intel.com>

Add info messages for subtests that are skipped
without having proper info messages. This provides
clearer insight into the reason for skipping.

v2: Add switch case instead of if conditions
    Also changed the flag name.
v3: Reframed the info message

Signed-off-by: sowmiya <sowmiya.s@intel.com>
---
 tests/kms_atomic_transition.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index a13830965..3c54604c2 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1172,6 +1172,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	};
 	int i, j, count = 0;
 	int pipe_count = 0;
+	bool info_flag = false;
 
 	igt_fixture {
 		unsigned int debug_mask_if_ci = DRM_UT_KMS;
@@ -1216,6 +1217,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_describe(transition_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", transition_tests[i].name) {
 			pipe_count = 0;
+			info_flag = false;
 
 			for_each_pipe_with_valid_output(&data.display, pipe, output) {
 				/*
@@ -1224,12 +1226,16 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				 * panels with long power cycle delays.
 				 */
 				if ((transition_tests[i].type == TRANSITION_MODESET) &&
-				    output_is_internal_panel(output))
+				    output_is_internal_panel(output)) {
+					info_flag = true;
 					continue;
+				}
 
 				if ((transition_tests[i].type == TRANSITION_MODESET_FAST) &&
-				    !output_is_internal_panel(output))
+				    !output_is_internal_panel(output)) {
+					info_flag = true;
 					continue;
+				}
 
 				if (pipe_count == 2 * count && !data.extended)
 					break;
@@ -1249,6 +1255,18 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				test_cleanup(&data, pipe, output,
 					     transition_tests[i].fencing);
 			}
+			if (info_flag && !pipe_count) {
+				switch (transition_tests[i].type) {
+				case TRANSITION_MODESET:
+					igt_info("Skipping test: invalid for internal panel\n");
+					break;
+				case TRANSITION_MODESET_FAST:
+					igt_info("Skipping test: invalid for external panel\n");
+					break;
+				default:
+					break;
+				}
+			}
 		}
 	}
 
-- 
2.43.0

