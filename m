Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888A6CCFA18
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 04:14:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081B010E0AE;
	Tue, 11 Nov 2025 04:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qfa1r3sS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B5310E0AE
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 04:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762834487; x=1794370487;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=STXk83MJPGKF+YVcUiTbyJofM1WxXQOacG/v1j0KhJY=;
 b=Qfa1r3sS1GG4r/w6DRJ2BIBC81BffHdqUoTl0SQFUjJ66PR2ZFt1HgzZ
 tJiZL3Z+I8wv9PjTF08tpUbqlrkbQu3hTb3Ke2eqgaN29WPSaV5u4wFP4
 HaVnuCuzgfOT9G/xzvsmshXstI+Veb15oxiq0TDNLvmEeLIsVxcomJUby
 uZjH8rE9HaFjawQn/mM0/cJJB373UszFnqdpz1WEPtFFRQdroM4kzjrUj
 9iM4e2MFUl43y2U0McP5Yv6CHHpB7g5JufdmxIVK9uHYWXdFMirEwNVAj
 mOAWc/+lGG3fbSH3n4/vslImTG/OA+k2BNhq8rotZ5TbfnJVoF8EHZXXK w==;
X-CSE-ConnectionGUID: yt4d87aeRveO2aMGO36VtA==
X-CSE-MsgGUID: YSkvRPGpT56sm/w4mPLrpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="67497971"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="67497971"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 20:14:46 -0800
X-CSE-ConnectionGUID: BRbGidiWQuqBkL4WFWvhDQ==
X-CSE-MsgGUID: 3jzjPHoYSB+EM9MfgT+ciw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188822059"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 20:14:44 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com,
	Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_joiner: Cleanup igt_require checks
Date: Tue, 11 Nov 2025 09:45:05 +0530
Message-ID: <20251111041505.2438654-1-karthik.b.s@intel.com>
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

Both the main and invalid subtests of each category require the same
igt_require checks. Add these into subtests groups.

Also, the variable names used in igt_require checks are self
explanatory, so remove the duplicate print messages.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel/kms_joiner.c | 225 +++++++++++++++++++--------------------
 1 file changed, 108 insertions(+), 117 deletions(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index d1ddbeb60..654ff8bed 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -626,160 +626,151 @@ igt_main
 		}
 	}
 
-	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
-	igt_subtest_with_dynamic("basic-big-joiner") {
-			igt_require_f(data.big_joiner_output_count > 0,
-				      "No bigjoiner output found\n");
-			igt_require_f(data.n_pipes > 1,
-				      "Minimum 2 pipes required\n");
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(data.big_joiner_output_count > 0);
+			igt_require(data.n_pipes > 1);
+		}
+
+		igt_describe("Verify the basic modeset on big joiner mode on all pipes");
+		igt_subtest_with_dynamic("basic-big-joiner") {
 			igt_dynamic_f("single-joiner")
 				test_single_joiner(&data, data.big_joiner_output_count, false);
 			if (data.big_joiner_output_count > 1)
 				igt_dynamic_f("multi-joiner")
 					test_multi_joiner(&data, data.big_joiner_output_count, false);
-	}
-
-	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
-	igt_subtest_with_dynamic("basic-ultra-joiner") {
-			igt_require_f(data.ultra_joiner_output_count > 0,
-				      "No ultrajoiner output found\n");
-			igt_require_f(data.n_pipes > 3,
-				      "Minimum 4 pipes required\n");
-			igt_dynamic_f("single-joiner")
-				test_ultra_joiner(&data, false, false, false);
-	}
-
-	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
-		     "when the pipe is active with a big joiner modeset");
-	igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
-		igt_require_f(data.big_joiner_output_count > 0, "Non big joiner output not found\n");
-		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
-		if (data.big_joiner_output_count >= 1)
-			igt_dynamic_f("big_joiner_on_last_pipe")
-				test_joiner_on_last_pipe(&data, false);
-		if (data.big_joiner_output_count > 1)
-			igt_dynamic_f("invalid_combinations")
-				test_invalid_modeset_two_joiner(&data, false, false);
-		if (data.mixed_output_count)
-			igt_dynamic_f("mixed_output")
-				test_invalid_modeset_two_joiner(&data, true, false);
-	}
+		}
 
-	igt_describe("Verify if the modeset on the other pipes are rejected "
-		     "when the pipe A is active with a ultra joiner modeset");
-	igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
-		igt_require_f(data.ultra_joiner_output_count > 0, "Ultra joiner output not found\n");
-		igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are required\n");
-
-		igt_dynamic_f("ultra_joiner_on_invalid_pipe")
-			test_ultra_joiner(&data, true, false, false);
-		if (data.non_ultra_joiner_output_count > 0) {
-			igt_dynamic_f("2x")
-				test_ultra_joiner(&data, false, true, false);
+		igt_describe("Verify if the modeset on the adjoining pipe is rejected "
+			     "when the pipe is active with a big joiner modeset");
+		igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
+			if (data.big_joiner_output_count >= 1)
+				igt_dynamic_f("big_joiner_on_last_pipe")
+					test_joiner_on_last_pipe(&data, false);
+			if (data.big_joiner_output_count > 1)
+				igt_dynamic_f("invalid_combinations")
+					test_invalid_modeset_two_joiner(&data, false, false);
+			if (data.mixed_output_count)
+				igt_dynamic_f("mixed_output")
+					test_invalid_modeset_two_joiner(&data, true, false);
 		}
 	}
 
-	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
-	igt_subtest_with_dynamic("basic-force-big-joiner") {
-		igt_require_f(data.non_big_joiner_output_count > 0,
-			      "No non big joiner output found\n");
-		igt_require_f(data.n_pipes > 1,
-			      "Minimum 2 pipes required\n");
-		igt_dynamic_f("single") {
-			enable_force_joiner_on_all_non_big_joiner_outputs(&data);
-			test_single_joiner(&data, data.non_big_joiner_output_count, true);
-			igt_reset_connectors();
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(data.non_big_joiner_output_count > 0);
+			igt_require(data.n_pipes > 1);
 		}
-		if (data.non_big_joiner_output_count > 1) {
-			igt_dynamic_f("multi") {
+
+		igt_describe("Verify the basic modeset on big joiner mode on all pipes");
+		igt_subtest_with_dynamic("basic-force-big-joiner") {
+			igt_dynamic_f("single") {
 				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
-				test_multi_joiner(&data, data.non_big_joiner_output_count, true);
+				test_single_joiner(&data, data.non_big_joiner_output_count, true);
 				igt_reset_connectors();
 			}
-		}
-	}
 
-	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
-		igt_require_f(data.non_big_joiner_output_count > 0,
-			      "Non big joiner output not found\n");
-		igt_require_f(data.n_pipes > 1,
-			      "Minimum of 2 pipes are required\n");
-		if (data.non_big_joiner_output_count >= 1) {
-			igt_dynamic_f("big_joiner_on_last_pipe") {
-				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
-				test_joiner_on_last_pipe(&data, true);
-				igt_reset_connectors();
+			if (data.non_big_joiner_output_count > 1) {
+				igt_dynamic_f("multi") {
+					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
+					test_multi_joiner(&data, data.non_big_joiner_output_count, true);
+					igt_reset_connectors();
+				}
 			}
 		}
-		if (data.non_big_joiner_output_count > 1) {
-			igt_dynamic_f("invalid_combinations") {
-				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
-				test_invalid_modeset_two_joiner(&data, false, true);
-				igt_reset_connectors();
+
+		igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
+			if (data.non_big_joiner_output_count >= 1) {
+				igt_dynamic_f("big_joiner_on_last_pipe") {
+					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
+					test_joiner_on_last_pipe(&data, true);
+					igt_reset_connectors();
+				}
+			}
+
+			if (data.non_big_joiner_output_count > 1) {
+				igt_dynamic_f("invalid_combinations") {
+					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
+					test_invalid_modeset_two_joiner(&data, false, true);
+					igt_reset_connectors();
+				}
 			}
 		}
 	}
 
-	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
-	igt_subtest_with_dynamic("basic-force-ultra-joiner") {
-		igt_require_f(ultra_joiner_supported,
-			      "Ultra joiner not supported on this platform\n");
-		igt_require_f(data.non_ultra_joiner_output_count > 0,
-			      "No non ultra joiner output found\n");
-		igt_require_f(data.n_pipes > 3,
-			      "Minimum 4 pipes required\n");
-		igt_dynamic_f("single") {
-			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
-			test_ultra_joiner(&data, false, false, true);
-			igt_reset_connectors();
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(data.ultra_joiner_output_count > 0);
+			igt_require(data.n_pipes > 3);
 		}
-	}
 
-	igt_describe("Verify modeset switch between ultra joiner and big joiner");
-	igt_subtest_with_dynamic("switch-modeset-ultra-joiner-big-joiner") {
-		igt_require_f(ultra_joiner_supported,
-			      "Ultra joiner not supported on this platform\n");
-		igt_require_f(data.ultra_joiner_output_count > 0 ||
-			      data.non_ultra_joiner_output_count > 0,
-				  "No ultra joiner or force ultra joiner output found\n");
-		igt_require_f(data.n_pipes > 3,
-			      "Minimum 4 pipes required\n");
+		igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
+		igt_subtest_with_dynamic("basic-ultra-joiner") {
+			igt_dynamic_f("single-joiner")
+				test_ultra_joiner(&data, false, false, false);
+		}
 
-		for_each_connected_output(&data.display, output) {
-			switch_modeset_ultra_joiner_big_joiner(&data, output);
+		igt_describe("Verify if the modeset on the other pipes are rejected "
+			     "when the pipe A is active with a ultra joiner modeset");
+		igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
+			igt_dynamic_f("ultra_joiner_on_invalid_pipe")
+				test_ultra_joiner(&data, true, false, false);
+			if (data.non_ultra_joiner_output_count > 0) {
+				igt_dynamic_f("2x")
+					test_ultra_joiner(&data, false, true, false);
+			}
 		}
 	}
 
-	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
-		igt_require_f(ultra_joiner_supported,
-			      "Ultra joiner not supported on this platform\n");
-		igt_require_f(data.non_ultra_joiner_output_count > 0,
-			      "Non ultra joiner output not found\n");
-		igt_require_f(data.n_pipes > 3,
-			      "Minimum of 3 pipes are required\n");
-
-		igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
-			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
-			test_ultra_joiner(&data, true, false, true);
-			igt_reset_connectors();
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(ultra_joiner_supported);
+			igt_require(data.non_ultra_joiner_output_count > 0);
+			igt_require(data.n_pipes > 3);
 		}
 
-		if (data.non_ultra_joiner_output_count >= 1 && data.output_count > 1) {
-			igt_dynamic_f("2x") {
+		igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
+		igt_subtest_with_dynamic("basic-force-ultra-joiner") {
+			igt_dynamic_f("single") {
 				enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
-				test_ultra_joiner(&data, false, true, true);
+				test_ultra_joiner(&data, false, false, true);
 				igt_reset_connectors();
 			}
 		}
+
+		igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
+			igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
+				enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
+				test_ultra_joiner(&data, true, false, true);
+				igt_reset_connectors();
+			}
+
+			if (data.non_ultra_joiner_output_count >= 1 && data.output_count > 1) {
+				igt_dynamic_f("2x") {
+					enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
+					test_ultra_joiner(&data, false, true, true);
+					igt_reset_connectors();
+				}
+			}
+		}
+	}
+
+	igt_describe("Verify modeset switch between ultra joiner and big joiner");
+	igt_subtest_with_dynamic("switch-modeset-ultra-joiner-big-joiner") {
+		igt_require(ultra_joiner_supported);
+		igt_require(data.ultra_joiner_output_count > 0 ||
+			    data.non_ultra_joiner_output_count > 0);
+		igt_require(data.n_pipes > 3);
+
+		for_each_connected_output(&data.display, output)
+			switch_modeset_ultra_joiner_big_joiner(&data, output);
 	}
 
 	igt_describe("Verify the basic modeset on the maximum non-joiner mode across "
 		     "all pipes");
 	igt_subtest_with_dynamic("basic-max-non-joiner") {
-		igt_require_f(data.n_pipes >= 1,
-			      "At least one pipe is required.\n");
-		igt_require_f(data.non_joiner_output_count  > 0,
-			      "No suitable non-joiner mode found\n");
+		igt_require(data.n_pipes >= 1);
+		igt_require(data.non_joiner_output_count  > 0);
 			test_basic_max_non_joiner(&data);
 	}
 
-- 
2.43.0

