Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44BBD10375
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 05:16:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7019410E74C;
	Thu, 27 Nov 2025 05:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZK9fzn3L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574DF10E74C
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 05:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764220591; x=1795756591;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fILDgg2izbECg9Ykwwe4SE88RP/StTo5Cc2QqfglOyk=;
 b=ZK9fzn3LHucIffcWDJXDJSuDZC0Fa559nCuax0qCi9Rehb0QEHP+GRiv
 0uf8TArVwRrY2Rs5vnguIpnhuGBjC2FHJ+dlMvdLaLhMAefRPAmjJbbhN
 5W1xo4Q4OkBh94Ug/MLzUCAFzQJYbR3WOLV44J+8V71kz67PSMIvXPCfh
 6l5Mbz5xghVVBTiiLu7KZ1bmQaj1jFCMGhL7wvb2w1mMVOmWshGijHn2H
 KdzVVaU2oX5eY7nRaXCtd2ntn/BfWzPCsSQ8Mts5dlbjVoDj/vPjjgO/Q
 tbCAN5O31xUsb5wEy8cKhqojiM3A3LqnpJb7IqGTyKNaKcHPukW2UDKeh w==;
X-CSE-ConnectionGUID: ejJ6QmbbS1OrWCzvld0gXA==
X-CSE-MsgGUID: wYFH2wn8SByr3EjtBeRrew==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66296885"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="66296885"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 21:16:30 -0800
X-CSE-ConnectionGUID: qgJQmvxFRXOBcZ5c5gxm2A==
X-CSE-MsgGUID: kfLQg+SWT8eZbZlIbP36aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="193592723"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 21:16:28 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, kamil.konieczny@linux.intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_joiner: Add function for pretest checks
Date: Thu, 27 Nov 2025 10:46:26 +0530
Message-ID: <20251127051626.2645054-1-karthik.b.s@intel.com>
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

Remove igt_require checks in subtest groups and all these checks to a
function which can be called from all subtests.

This is done to avoid spurious skips and corresponding noise in logs.

Fixes: 3f90f16d1233 ("tests/intel/kms_joiner: Cleanup igt_require checks")
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel/kms_joiner.c | 202 +++++++++++++++++++--------------------
 1 file changed, 101 insertions(+), 101 deletions(-)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 276170229..32de3af92 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -101,6 +101,7 @@ typedef struct {
 	igt_output_t *non_joiner_output[IGT_MAX_PIPES];
 	enum pipe pipe_seq[IGT_MAX_PIPES];
 	igt_display_t display;
+	bool ultra_joiner_supported;
 } data_t;
 
 static int max_dotclock;
@@ -179,6 +180,26 @@ static void set_joiner_mode(data_t *data, igt_output_t *output, drmModeModeInfo
 	igt_remove_fb(data->drm_fd, &fb);
 }
 
+static void require_joiners(data_t *data, bool big_joiner, bool ultra_joiner, bool force_joiner)
+{
+	if (big_joiner) {
+		igt_require(data->n_pipes > 1);
+
+		if (force_joiner)
+			igt_require(data->non_big_joiner_output_count > 0);
+		else
+			igt_require(data->big_joiner_output_count > 0);
+	} else if (ultra_joiner) {
+		igt_require(data->ultra_joiner_supported);
+		igt_require(data->n_pipes > 3);
+
+		if (force_joiner)
+			igt_require(data->non_ultra_joiner_output_count > 0);
+		else
+			igt_require(data->ultra_joiner_output_count > 0);
+	}
+}
+
 static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *output)
 {
 	drmModeModeInfo bj_mode;
@@ -554,7 +575,7 @@ igt_main
 	data_t data;
 
 	igt_fixture {
-		ultra_joiner_supported = false;
+		data.ultra_joiner_supported = false;
 		data.big_joiner_output_count = 0;
 		data.ultra_joiner_output_count = 0;
 		data.non_big_joiner_output_count = 0;
@@ -574,7 +595,7 @@ igt_main
 		is_dgfx = is_xe_device(data.drm_fd) ? xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
 		display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
 		if (is_dgfx && display_ver == 14)
-			ultra_joiner_supported = true;
+			data.ultra_joiner_supported = true;
 
 		for_each_connected_output(&data.display, output) {
 			bool ultrajoiner_found = false, bigjoiner_found = false, force_joiner_supported = false;
@@ -627,132 +648,111 @@ igt_main
 		}
 	}
 
-	igt_subtest_group {
-		igt_fixture {
-			igt_require(data.big_joiner_output_count > 0);
-			igt_require(data.n_pipes > 1);
-		}
-
-		igt_describe("Verify the basic modeset on big joiner mode on all pipes");
-		igt_subtest_with_dynamic("basic-big-joiner") {
-			igt_dynamic_f("single-joiner")
-				test_single_joiner(&data, data.big_joiner_output_count, false);
-			if (data.big_joiner_output_count > 1)
-				igt_dynamic_f("multi-joiner")
-					test_multi_joiner(&data, data.big_joiner_output_count, false);
-		}
+	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
+	igt_subtest_with_dynamic("basic-big-joiner") {
+		require_joiners(&data, true, false, false);
+		igt_dynamic_f("single-joiner")
+			test_single_joiner(&data, data.big_joiner_output_count, false);
+		if (data.big_joiner_output_count > 1)
+			igt_dynamic_f("multi-joiner")
+				test_multi_joiner(&data, data.big_joiner_output_count, false);
+	}
 
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
+	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
+		     "when the pipe is active with a big joiner modeset");
+	igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
+		require_joiners(&data, true, false, false);
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
 
-	igt_subtest_group {
-		igt_fixture {
-			igt_require(data.non_big_joiner_output_count > 0);
-			igt_require(data.n_pipes > 1);
+	igt_describe("Verify the basic modeset on force big joiner mode on all pipes");
+	igt_subtest_with_dynamic("basic-force-big-joiner") {
+		require_joiners(&data, true, false, true);
+		igt_dynamic_f("single") {
+			enable_force_joiner_on_all_non_big_joiner_outputs(&data);
+			test_single_joiner(&data, data.non_big_joiner_output_count, true);
+			igt_reset_connectors();
 		}
 
-		igt_describe("Verify the basic modeset on force big joiner mode on all pipes");
-		igt_subtest_with_dynamic("basic-force-big-joiner") {
-			igt_dynamic_f("single") {
+		if (data.non_big_joiner_output_count > 1) {
+			igt_dynamic_f("multi") {
 				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
-				test_single_joiner(&data, data.non_big_joiner_output_count, true);
+				test_multi_joiner(&data, data.non_big_joiner_output_count, true);
 				igt_reset_connectors();
 			}
-
-			if (data.non_big_joiner_output_count > 1) {
-				igt_dynamic_f("multi") {
-					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
-					test_multi_joiner(&data, data.non_big_joiner_output_count, true);
-					igt_reset_connectors();
-				}
-			}
 		}
+	}
 
-		igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
-			if (data.non_big_joiner_output_count >= 1) {
-				igt_dynamic_f("big_joiner_on_last_pipe") {
-					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
-					test_joiner_on_last_pipe(&data, true);
-					igt_reset_connectors();
-				}
+	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
+		require_joiners(&data, true, false, true);
+		if (data.non_big_joiner_output_count >= 1) {
+			igt_dynamic_f("big_joiner_on_last_pipe") {
+				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
+				test_joiner_on_last_pipe(&data, true);
+				igt_reset_connectors();
 			}
+		}
 
-			if (data.non_big_joiner_output_count > 1) {
-				igt_dynamic_f("invalid_combinations") {
-					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
-					test_invalid_modeset_two_joiner(&data, false, true);
-					igt_reset_connectors();
-				}
+		if (data.non_big_joiner_output_count > 1) {
+			igt_dynamic_f("invalid_combinations") {
+				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
+				test_invalid_modeset_two_joiner(&data, false, true);
+				igt_reset_connectors();
 			}
 		}
 	}
 
-	igt_subtest_group {
-		igt_fixture {
-			igt_require(data.ultra_joiner_output_count > 0);
-			igt_require(data.n_pipes > 3);
-		}
-
-		igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
-		igt_subtest_with_dynamic("basic-ultra-joiner") {
-			igt_dynamic_f("single-joiner")
-				test_ultra_joiner(&data, false, false, false);
-		}
+	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
+	igt_subtest_with_dynamic("basic-ultra-joiner") {
+		require_joiners(&data, false, true, false);
+		igt_dynamic_f("single-joiner")
+			test_ultra_joiner(&data, false, false, false);
+	}
 
-		igt_describe("Verify if the modeset on the other pipes are rejected "
-			     "when the pipe A is active with a ultra joiner modeset");
-		igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
-			igt_dynamic_f("ultra_joiner_on_invalid_pipe")
-				test_ultra_joiner(&data, true, false, false);
-			if (data.non_ultra_joiner_output_count > 0) {
-				igt_dynamic_f("2x")
-					test_ultra_joiner(&data, false, true, false);
-			}
+	igt_describe("Verify if the modeset on the other pipes are rejected "
+		     "when the pipe A is active with a ultra joiner modeset");
+	igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
+		require_joiners(&data, false, true, false);
+		igt_dynamic_f("ultra_joiner_on_invalid_pipe")
+			test_ultra_joiner(&data, true, false, false);
+		if (data.non_ultra_joiner_output_count > 0) {
+			igt_dynamic_f("2x")
+				test_ultra_joiner(&data, false, true, false);
 		}
 	}
 
-	igt_subtest_group {
-		igt_fixture {
-			igt_require(ultra_joiner_supported);
-			igt_require(data.non_ultra_joiner_output_count > 0);
-			igt_require(data.n_pipes > 3);
+	igt_describe("Verify the basic modeset on force ultra joiner mode on all pipes");
+	igt_subtest_with_dynamic("basic-force-ultra-joiner") {
+		require_joiners(&data, false, true, true);
+		igt_dynamic_f("single") {
+			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
+			test_ultra_joiner(&data, false, false, true);
+			igt_reset_connectors();
 		}
+	}
 
-		igt_describe("Verify the basic modeset on force ultra joiner mode on all pipes");
-		igt_subtest_with_dynamic("basic-force-ultra-joiner") {
-			igt_dynamic_f("single") {
-				enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
-				test_ultra_joiner(&data, false, false, true);
-				igt_reset_connectors();
-			}
+	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
+		require_joiners(&data, false, true, true);
+		igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
+			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
+			test_ultra_joiner(&data, true, false, true);
+			igt_reset_connectors();
 		}
 
-		igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
-			igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
+		if (data.non_ultra_joiner_output_count >= 1 && data.output_count > 1) {
+			igt_dynamic_f("2x") {
 				enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
-				test_ultra_joiner(&data, true, false, true);
+				test_ultra_joiner(&data, false, true, true);
 				igt_reset_connectors();
 			}
-
-			if (data.non_ultra_joiner_output_count >= 1 && data.output_count > 1) {
-				igt_dynamic_f("2x") {
-					enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
-					test_ultra_joiner(&data, false, true, true);
-					igt_reset_connectors();
-				}
-			}
 		}
 	}
 
-- 
2.43.0

