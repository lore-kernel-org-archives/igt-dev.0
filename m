Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C66C41513
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 07:42:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA9C10EC77;
	Wed, 22 May 2024 07:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OMtPb2Al";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BD710EC77
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 07:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716363773; x=1747899773;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4uX/fKRcC6Je/XjvK4Z5vZZf0xmvDXtAlNjqnVk18YI=;
 b=OMtPb2AlVOkOhjcxBVxj1gCiYILu9uc9w/gpR9vd/QpWVNLFvytZ9zNf
 PpWjMPALRAlbIAh6Gglk9qStwb02cnL7TJpLkiHl/EDsWxWmWOpgAH4wm
 CufCxSnYj28JQNA+09VTe08wc2YUopna7n8RsoBgqGq36GLQSRvvBw5/t
 78wCbcOCsDaeshpZoobZquZ4jl3rdzi41SBDnCUhn+5H5lH9GMyp6kty1
 P+Hzn4gYA3NrQshMdXLO/2XHeoz4mgnarFonTUth7IV9JmPokcEF3frgu
 SIdjVSlSakDABNiSDqIhPyMdPruLqK367cZU4dxgiLJJIEDEMPrC/iPHA A==;
X-CSE-ConnectionGUID: a1vTScnrSeyu1u3Blq1yZg==
X-CSE-MsgGUID: 2MBEBAdlRNOwV8Wk09cekA==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="16386998"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="16386998"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 00:42:52 -0700
X-CSE-ConnectionGUID: P1+/hTg5R/a7+FPaMN6tDw==
X-CSE-MsgGUID: aww7WSzlT5eX68LBKAh4ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="38155237"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa004.jf.intel.com with ESMTP; 22 May 2024 00:42:49 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3] tests/kms_plane: Implement dynamic level execution
 across multiple planes
Date: Wed, 22 May 2024 13:12:49 +0530
Message-Id: <20240522074249.468363-1-pranay.samala@intel.com>
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

The test runs on all pipes on dynamic level to test all the supported
pixel-formats and modifiers on all plane of that pipe.

Updating the test to execute on each planes on dynamic level.

v3:
- Fixed checkpatch build issue (Juha-pekka)
- Used an helper to avoid changes in indentation (Juha-pekka)
- Fix other indentations (Juha-pekka)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane.c | 55 ++++++++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 406aecc04..511471067 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -275,7 +275,7 @@ test_plane_position_with_output(data_t *data,
 	drmModeModeInfo *mode;
 	igt_crc_t crc, crc2;
 
-	igt_info("Testing connector %s using pipe %s plane %d\n",
+	igt_debug("Testing connector %s using pipe %s plane %d\n",
 		 igt_output_name(output), kmstest_pipe_name(pipe), plane);
 
 	igt_output_set_pipe(output, pipe);
@@ -285,8 +285,8 @@ test_plane_position_with_output(data_t *data,
 	sprite = igt_output_get_plane(output, plane);
 
 	if (primary->drm_plane->plane_id > sprite->drm_plane->plane_id) {
-		igt_info("primary plane ID (%d) > sprite plane ID (%d), skipping plane %d\n",
-				primary->drm_plane->plane_id, sprite->drm_plane->plane_id, plane);
+		igt_debug("primary plane ID (%d) > sprite plane ID (%d), skipping plane %d\n",
+			primary->drm_plane->plane_id, sprite->drm_plane->plane_id, plane);
 		return;
 	}
 
@@ -352,9 +352,9 @@ test_plane_position(data_t *data, enum pipe pipe)
 	test_grab_crc(data, output, pipe, &green, data->flags, &reference_crc);
 
 	for (int plane = 1; plane < n_planes; plane++)
-		test_plane_position_with_output(data, pipe, plane,
-						output, &reference_crc,
-						data->flags);
+		igt_dynamic_f("pipe-%s-plane-%d", kmstest_pipe_name(pipe), plane)
+			test_plane_position_with_output(data, pipe, plane,
+					output, &reference_crc, data->flags);
 
 	test_fini(data);
 }
@@ -415,7 +415,7 @@ test_plane_panning_with_output(data_t *data,
 	mode = igt_output_get_mode(output);
 	primary = igt_output_get_plane(output, 0);
 
-	igt_info("Testing connector %s using pipe %s, mode %s\n",
+	igt_debug("Testing connector %s using pipe %s, mode %s\n",
 		 igt_output_name(output), kmstest_pipe_name(pipe), mode->name);
 
 	create_fb_for_mode_panning(data, mode, &primary_fb);
@@ -455,7 +455,7 @@ test_plane_panning(data_t *data, enum pipe pipe)
 	igt_crc_t ref_crc;
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
-		 kmstest_pipe_name(pipe), igt_output_name(output));
+		kmstest_pipe_name(pipe), igt_output_name(output));
 
 	test_init(data, pipe);
 
@@ -463,7 +463,6 @@ test_plane_panning(data_t *data, enum pipe pipe)
 		for_each_memory_region(r, data->drm_fd)
 			if (r->ci.memory_class == I915_MEMORY_CLASS_DEVICE)
 				mem_size = r->cpu_size;
-
 	}
 
 	if (is_xe_device(data->drm_fd)) {
@@ -889,7 +888,7 @@ static bool test_format_plane_rgb(data_t *data, enum pipe pipe,
 				  igt_crc_t ref_crc[],
 				  struct igt_fb *fb)
 {
-	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
+	igt_debug("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
 		 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
 		 kmstest_pipe_name(pipe), plane->index);
 
@@ -927,11 +926,10 @@ static bool test_format_plane_yuv(data_t *data, enum pipe pipe,
 						     igt_color_range_to_str(r)))
 				continue;
 
-			igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " (%s, %s) on %s.%u\n",
-				 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
-				 igt_color_encoding_to_str(e),
-				 igt_color_range_to_str(r),
-				 kmstest_pipe_name(pipe), plane->index);
+			igt_debug("Testing format " IGT_FORMAT_FMT " / modifier "
+				IGT_MODIFIER_FMT " (%s, %s) on %s.%u\n", IGT_FORMAT_ARGS(format),
+				IGT_MODIFIER_ARGS(modifier), igt_color_encoding_to_str(e),
+				igt_color_range_to_str(r), kmstest_pipe_name(pipe), plane->index);
 
 			result &= test_format_plane_colors(data, pipe, plane,
 							   format, modifier,
@@ -1043,7 +1041,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 
 	igt_pipe_crc_start(data->pipe_crc);
 
-	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
+	igt_debug("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
 		 IGT_FORMAT_ARGS(ref.format), IGT_MODIFIER_ARGS(ref.modifier),
 		 kmstest_pipe_name(pipe), plane->index);
 
@@ -1089,9 +1087,10 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 			};
 
 			if (igt_vec_index(&tested_formats, &rf) >= 0) {
-				igt_info("Skipping format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
-					 IGT_FORMAT_ARGS(f.format), IGT_MODIFIER_ARGS(f.modifier),
-					 kmstest_pipe_name(pipe), plane->index);
+				igt_debug("Skipping format " IGT_FORMAT_FMT " / modifier "
+					IGT_MODIFIER_FMT " on %s.%u\n", IGT_FORMAT_ARGS(f.format),
+					IGT_MODIFIER_ARGS(f.modifier),
+					kmstest_pipe_name(pipe), plane->index);
 				continue;
 			}
 
@@ -1211,7 +1210,8 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	for_each_plane_on_pipe(&data->display, pipe, plane) {
 		if (skip_plane(data, plane))
 			continue;
-		result &= test_format_plane(data, pipe, output, plane, &primary_fb);
+		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(pipe), plane->index)
+			result &= test_format_plane(data, pipe, output, plane, &primary_fb);
 	}
 
 	test_fini(data);
@@ -1317,14 +1317,19 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
 			continue;
 
 		igt_output_set_pipe(data->output, PIPE_NONE);
-		igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
-			test(data, pipe);
+		test(data, pipe);
 
 		if (is_pipe_limit_reached(++count))
 			break;
 	}
 }
 
+static void dynamic_test_handler(data_t *data, enum pipe pipe)
+{
+	igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+		test_plane_panning(data, pipe);
+}
+
 static void
 run_tests_for_pipe_plane(data_t *data)
 {
@@ -1361,20 +1366,20 @@ run_tests_for_pipe_plane(data_t *data)
 	igt_describe("verify plane panning at top-left position using primary plane");
 	igt_subtest_with_dynamic_f("plane-panning-top-left") {
 		data->flags = TEST_PANNING_TOP_LEFT;
-		run_test(data, test_plane_panning);
+		run_test(data, dynamic_test_handler);
 	}
 
 	igt_describe("verify plane panning at bottom-right position using primary plane");
 	igt_subtest_with_dynamic_f("plane-panning-bottom-right") {
 		data->flags = TEST_PANNING_BOTTOM_RIGHT;
-		run_test(data, test_plane_panning);
+		run_test(data, dynamic_test_handler);
 	}
 
 	igt_describe("verify plane panning at bottom-right position using primary plane and executes system"
 		       "suspend cycles");
 	igt_subtest_with_dynamic_f("plane-panning-bottom-right-suspend") {
 		data->flags = TEST_PANNING_BOTTOM_RIGHT | TEST_SUSPEND_RESUME;
-		run_test(data, test_plane_panning);
+		run_test(data, dynamic_test_handler);
 	}
 
 	igt_describe("verify planar settings for pixel format are accepted or rejected correctly");
-- 
2.34.1

