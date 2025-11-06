Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15406CCF9F8
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 09:34:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD57210E857;
	Thu,  6 Nov 2025 09:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B9l7mTxn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEBA10E857
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 09:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762421647; x=1793957647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HYwUAJ5GVgvhDkJlQ+xcS5Nkx0Dp/eF44Z5ffh928Xo=;
 b=B9l7mTxnw4qrCneH94yr428ARUifa8Cel0jePlhS0x3hUpDphTR15qq6
 QAWBKk+m0BvSC5ZEmOx1fymBmYd2cgcbUnRKTXmXgKNffeWS+oh5D/zYl
 Mi1Xcm/rCvmj0WwD87jEFnBw6PcqdXzat0Ymhyu98Utbs10lq47q4B6YP
 W63dT8DTLGTjpefk+m5NBNjRpkicDmLwTKVU83l/h28bc+mKk8jq83qun
 bOf0J2KfIw4SG7Mll/agbvJs0UWghGeV9sdbUSOVQjbhq2Ikk/HdcgAtK
 7vFz9knA7UMpod0c/h1TEi60gpiUvX6QellC2OA0mmb6q8ySyxwA3uxDG Q==;
X-CSE-ConnectionGUID: M3xDsY9PR3S02kRGiS57dA==
X-CSE-MsgGUID: YVBwgMCJRXaJ2qEYpJbnIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="67166511"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="67166511"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 01:34:07 -0800
X-CSE-ConnectionGUID: sTx8xx0QRcKgqR8H8hJQpg==
X-CSE-MsgGUID: Y4ViV4LWRXqTyf6asE7/eg==
X-ExtLoop1: 1
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 01:34:05 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sowmiya S <sowmiya.s@intel.com>,
	Pranay Samala <pranay.samala@intel.com>
Subject: [PATCH i-g-t v4] tests/kms_atomic_transition: Add info messages for
 skipped subtest
Date: Thu,  6 Nov 2025 15:22:08 +0530
Message-ID: <20251106095208.3051901-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251027061057.2996401-1-sowmiya.s@intel.com>
References: <20251027061057.2996401-1-sowmiya.s@intel.com>
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

Add info messages for subtests that are skipped
without having proper info messages. This provides
clearer insight into the reason for skipping.

v2: Add switch case instead of if conditions
    Also changed the flag name.
v3: Reframed the info message
    corrected author name
v4: declare and initialize flag inside
    subtest (pranay)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Reviewed-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_atomic_transition.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 419afe4dd..9a74b4297 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1216,6 +1216,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 		igt_describe(transition_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", transition_tests[i].name) {
+			bool info_flag = false;
 			pipe_count = 0;
 
 			for_each_pipe_with_valid_output(&data.display, pipe, output) {
@@ -1225,12 +1226,16 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
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
@@ -1250,6 +1255,18 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
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

