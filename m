Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A95D4336B
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 05:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6DE10E32F;
	Fri, 12 Dec 2025 05:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GcPv4+Y1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7796610E32A
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 05:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765519015; x=1797055015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o+KVx/LT9DehsQlHWPB5n0AB5KyDpC9hVfH3Spylm7c=;
 b=GcPv4+Y1G+MjA/Mgkcl8a63Ia2SKvFAZ3ZB9p9DIdsSKQ4h/8wQkRpUJ
 LnOY8TFIyz9AGxEJe2xfbTskWeRDRecVqmrx5Nr2Hg58zQLccdz5F+p1A
 aEArM3EAEnQHPD4OnvIt2OwGn4KVHH+o1zBmI6k/jYS4OyPtN6T+8WG5y
 g9l5TmQBs/c743cNkZHAZgQOZhyjgvTgNK12cuB0TSBqn4tsmmVrkNgjp
 vmAUE+SC2MDfvca0shZsXB/IO81v4LoO0H9yXOVFGyuNZ8mN0uAE6KdIz
 7jekknyKNC6o8SeuyH0rnXvwjoIj6NTYSIrSzuDI4MyQp9gavd859nFJK g==;
X-CSE-ConnectionGUID: HpYBZE3YQ1qxMw8FjW5How==
X-CSE-MsgGUID: GqDxpjgQQQq6SdPHYYAngw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78972131"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="78972131"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 21:56:54 -0800
X-CSE-ConnectionGUID: jz7BywMySZCkgq1uej8GUw==
X-CSE-MsgGUID: iVezqBDwSRiQYZVi9EnfJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="228058548"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 21:56:53 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, santhosh.reddy.guddati@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3 1/2] Revert "tests/intel/kms_joiner: Cleanup
 igt_require checks"
Date: Fri, 12 Dec 2025 11:27:15 +0530
Message-ID: <20251212055717.2870018-2-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212055717.2870018-1-karthik.b.s@intel.com>
References: <20251212055717.2870018-1-karthik.b.s@intel.com>
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

This reverts commit 3f90f16d1233a9d7ea75e41c83aaa0e34750764f.

v3: Rebased.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/kms_joiner.c | 223 ++++++++++++++++++++-------------------
 1 file changed, 117 insertions(+), 106 deletions(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index bf77f6626..f8e684b47 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -627,151 +627,162 @@ int igt_main()
 		}
 	}
 
-	igt_subtest_group() {
-		igt_fixture() {
-			igt_require(data.big_joiner_output_count > 0);
-			igt_require(data.n_pipes > 1);
-		}
 
-		igt_describe("Verify the basic modeset on big joiner mode on all pipes");
-		igt_subtest_with_dynamic("basic-big-joiner") {
+	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
+	igt_subtest_with_dynamic("basic-big-joiner") {
+			igt_require_f(data.big_joiner_output_count > 0,
+				      "No bigjoiner output found\n");
+			igt_require_f(data.n_pipes > 1,
+				      "Minimum 2 pipes required\n");
 			igt_dynamic_f("single-joiner")
 				test_single_joiner(&data, data.big_joiner_output_count, false);
 			if (data.big_joiner_output_count > 1)
 				igt_dynamic_f("multi-joiner")
 					test_multi_joiner(&data, data.big_joiner_output_count, false);
-		}
-
-		igt_describe("Verify if the modeset on the adjoining pipe is rejected "
-			     "when the pipe is active with a big joiner modeset");
-		igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
-			if (data.big_joiner_output_count >= 1)
-				igt_dynamic_f("big_joiner_on_last_pipe")
-					test_joiner_on_last_pipe(&data, false);
-			if (data.big_joiner_output_count > 1)
-				igt_dynamic_f("invalid_combinations")
-					test_invalid_modeset_two_joiner(&data, false, false);
-			if (data.mixed_output_count)
-				igt_dynamic_f("mixed_output")
-					test_invalid_modeset_two_joiner(&data, true, false);
-		}
 	}
 
-	igt_subtest_group() {
-		igt_fixture() {
-			igt_require(data.non_big_joiner_output_count > 0);
-			igt_require(data.n_pipes > 1);
-		}
-
-		igt_describe("Verify the basic modeset on force big joiner mode on all pipes");
-		igt_subtest_with_dynamic("basic-force-big-joiner") {
-			igt_dynamic_f("single") {
-				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
-				test_single_joiner(&data, data.non_big_joiner_output_count, true);
-				igt_reset_connectors();
-			}
-
-			if (data.non_big_joiner_output_count > 1) {
-				igt_dynamic_f("multi") {
-					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
-					test_multi_joiner(&data, data.non_big_joiner_output_count, true);
-					igt_reset_connectors();
-				}
-			}
-		}
-
-		igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
-			if (data.non_big_joiner_output_count >= 1) {
-				igt_dynamic_f("big_joiner_on_last_pipe") {
-					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
-					test_joiner_on_last_pipe(&data, true);
-					igt_reset_connectors();
-				}
-			}
+	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
+	igt_subtest_with_dynamic("basic-ultra-joiner") {
+			igt_require_f(data.ultra_joiner_output_count > 0,
+				      "No ultrajoiner output found\n");
+			igt_require_f(data.n_pipes > 3,
+				      "Minimum 4 pipes required\n");
+			igt_dynamic_f("single-joiner")
+				test_ultra_joiner(&data, false, false, false);
+	}
 
-			if (data.non_big_joiner_output_count > 1) {
-				igt_dynamic_f("invalid_combinations") {
-					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
-					test_invalid_modeset_two_joiner(&data, false, true);
-					igt_reset_connectors();
-				}
-			}
-		}
+	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
+		     "when the pipe is active with a big joiner modeset");
+	igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
+		igt_require_f(data.big_joiner_output_count > 0, "Non big joiner output not found\n");
+		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
+		if (data.big_joiner_output_count >= 1)
+			igt_dynamic_f("big_joiner_on_last_pipe")
+				test_joiner_on_last_pipe(&data, false);
+		if (data.big_joiner_output_count > 1)
+			igt_dynamic_f("invalid_combinations")
+				test_invalid_modeset_two_joiner(&data, false, false);
+		if (data.mixed_output_count)
+			igt_dynamic_f("mixed_output")
+				test_invalid_modeset_two_joiner(&data, true, false);
 	}
 
-	igt_subtest_group() {
-		igt_fixture() {
-			igt_require(data.ultra_joiner_output_count > 0);
-			igt_require(data.n_pipes > 3);
+	igt_describe("Verify if the modeset on the other pipes are rejected "
+		     "when the pipe A is active with a ultra joiner modeset");
+	igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
+		igt_require_f(data.ultra_joiner_output_count > 0, "Ultra joiner output not found\n");
+		igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are required\n");
+
+		igt_dynamic_f("ultra_joiner_on_invalid_pipe")
+			test_ultra_joiner(&data, true, false, false);
+		if (data.non_ultra_joiner_output_count > 0) {
+			igt_dynamic_f("2x")
+				test_ultra_joiner(&data, false, true, false);
 		}
+	}
 
-		igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
-		igt_subtest_with_dynamic("basic-ultra-joiner") {
-			igt_dynamic_f("single-joiner")
-				test_ultra_joiner(&data, false, false, false);
+	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
+	igt_subtest_with_dynamic("basic-force-big-joiner") {
+		igt_require_f(data.non_big_joiner_output_count > 0,
+			      "No non big joiner output found\n");
+		igt_require_f(data.n_pipes > 1,
+			      "Minimum 2 pipes required\n");
+		igt_dynamic_f("single") {
+			enable_force_joiner_on_all_non_big_joiner_outputs(&data);
+			test_single_joiner(&data, data.non_big_joiner_output_count, true);
+			igt_reset_connectors();
 		}
 
-		igt_describe("Verify if the modeset on the other pipes are rejected "
-			     "when the pipe A is active with a ultra joiner modeset");
-		igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
-			igt_dynamic_f("ultra_joiner_on_invalid_pipe")
-				test_ultra_joiner(&data, true, false, false);
-			if (data.non_ultra_joiner_output_count > 0) {
-				igt_dynamic_f("2x")
-					test_ultra_joiner(&data, false, true, false);
+		if (data.non_big_joiner_output_count > 1) {
+			igt_dynamic_f("multi") {
+				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
+				test_multi_joiner(&data, data.non_big_joiner_output_count, true);
+				igt_reset_connectors();
 			}
 		}
 	}
 
-	igt_subtest_group() {
-		igt_fixture() {
-			igt_require(ultra_joiner_supported);
-			igt_require(data.non_ultra_joiner_output_count > 0);
-			igt_require(data.n_pipes > 3);
-		}
-
-		igt_describe("Verify the basic modeset on force ultra joiner mode on all pipes");
-		igt_subtest_with_dynamic("basic-force-ultra-joiner") {
-			igt_dynamic_f("single") {
-				enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
-				test_ultra_joiner(&data, false, false, true);
+	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
+		igt_require_f(data.non_big_joiner_output_count > 0,
+			      "Non big joiner output not found\n");
+		igt_require_f(data.n_pipes > 1,
+			      "Minimum of 2 pipes are required\n");
+		if (data.non_big_joiner_output_count >= 1) {
+			igt_dynamic_f("big_joiner_on_last_pipe") {
+				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
+				test_joiner_on_last_pipe(&data, true);
 				igt_reset_connectors();
 			}
 		}
 
-		igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
-			igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
-				enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
-				test_ultra_joiner(&data, true, false, true);
+		if (data.non_big_joiner_output_count > 1) {
+			igt_dynamic_f("invalid_combinations") {
+				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
+				test_invalid_modeset_two_joiner(&data, false, true);
 				igt_reset_connectors();
 			}
+		}
+	}
 
-			if (data.non_ultra_joiner_output_count >= 1 && data.output_count > 1) {
-				igt_dynamic_f("2x") {
-					enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
-					test_ultra_joiner(&data, false, true, true);
-					igt_reset_connectors();
-				}
-			}
+	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
+	igt_subtest_with_dynamic("basic-force-ultra-joiner") {
+		igt_require_f(ultra_joiner_supported,
+			      "Ultra joiner not supported on this platform\n");
+		igt_require_f(data.non_ultra_joiner_output_count > 0,
+			      "No non ultra joiner output found\n");
+		igt_require_f(data.n_pipes > 3,
+			      "Minimum 4 pipes required\n");
+		igt_dynamic_f("single") {
+			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
+			test_ultra_joiner(&data, false, false, true);
+			igt_reset_connectors();
 		}
 	}
 
 	igt_describe("Verify modeset switch between ultra joiner and big joiner");
 	igt_subtest_with_dynamic("switch-modeset-ultra-joiner-big-joiner") {
-		igt_require(ultra_joiner_supported);
-		igt_require(data.ultra_joiner_output_count > 0 ||
-			    data.non_ultra_joiner_output_count > 0);
-		igt_require(data.n_pipes > 3);
+		igt_require_f(ultra_joiner_supported,
+			      "Ultra joiner not supported on this platform\n");
+		igt_require_f(data.ultra_joiner_output_count > 0 ||
+			      data.non_ultra_joiner_output_count > 0,
+				  "No ultra joiner or force ultra joiner output found\n");
+		igt_require_f(data.n_pipes > 3,
+			      "Minimum 4 pipes required\n");
 
 		for_each_connected_output(&data.display, output)
 			switch_modeset_ultra_joiner_big_joiner(&data, output);
 	}
 
+	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
+		igt_require_f(ultra_joiner_supported,
+			      "Ultra joiner not supported on this platform\n");
+		igt_require_f(data.non_ultra_joiner_output_count > 0,
+			      "Non ultra joiner output not found\n");
+		igt_require_f(data.n_pipes > 3,
+			      "Minimum of 3 pipes are required\n");
+
+		igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
+			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
+			test_ultra_joiner(&data, true, false, true);
+			igt_reset_connectors();
+		}
+
+		if (data.non_ultra_joiner_output_count >= 1 && data.output_count > 1) {
+			igt_dynamic_f("2x") {
+				enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
+				test_ultra_joiner(&data, false, true, true);
+				igt_reset_connectors();
+			}
+		}
+	}
+
 	igt_describe("Verify the basic modeset on the maximum non-joiner mode across "
 		     "all pipes");
 	igt_subtest_with_dynamic("basic-max-non-joiner") {
-		igt_require(data.n_pipes >= 1);
-		igt_require(data.non_joiner_output_count  > 0);
+		igt_require_f(data.n_pipes >= 1,
+			      "At least one pipe is required.\n");
+		igt_require_f(data.non_joiner_output_count  > 0,
+			      "No suitable non-joiner mode found\n");
 			test_basic_max_non_joiner(&data);
 	}
 
-- 
2.43.0

