Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6610AC25B74
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 03:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73AC10E059;
	Fri, 24 May 2024 03:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l81RHPin";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AE610E046
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 03:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716520223; x=1748056223;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7fdrBTqGb30GBnLtzsiTkcLN1Io92TQE4mpcatKxl3I=;
 b=l81RHPinCmVevxO1hOpM7NamIOu2xJPrNl9jS9ZNDCBwmROyFGN0W+fN
 WTeF1e3g542Jb983ZgHryOjQNh9Cqm88noJRJehbEazIO0vVWTi5L7u0T
 +1d/2JStaO61ipadZgU2ql8CPtW9/RG+JH/UiCTiixxPsE7X30OAwpaW6
 zynogTiJ33nXWIZbGUjEAxKeD0uVd0s65QI+SxTEEbee3wPn3E3V+3bHR
 C7pKx0GUE1rvdc5TRbMaDYvW5GZf48jsWWkSpMxjbj6MFV0mLwpgHh7V7
 h+Hf5LNo0W9OhTEqnzfOc+aSP6vpLCQ+9eY+pK2I9NBN38hL0wfafqrOh w==;
X-CSE-ConnectionGUID: Tl1mgE5iQ1OYojwskq9ZnA==
X-CSE-MsgGUID: lpgnLEsyQcuD4Nx6TmidpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12730019"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="12730019"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 20:10:22 -0700
X-CSE-ConnectionGUID: 0OQVqhFrQIezTLO+2os6dg==
X-CSE-MsgGUID: fZK/MCnBSrmZlCEB7/jPTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="33760910"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa010.jf.intel.com with ESMTP; 23 May 2024 20:10:18 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com, Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
Subject: [PATCH i-g-t] tests/kms_plane: Convert to dynamic subtests
Date: Fri, 24 May 2024 08:40:18 +0530
Message-Id: <20240524031018.470573-1-pranay.samala@intel.com>
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
pixel-formats and modifiers on current plane of that pipe.

Updating the test to execute on multiple planes on dynamic level.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 406aecc04..1a831c461 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -351,10 +351,11 @@ test_plane_position(data_t *data, enum pipe pipe)
 	test_init(data, pipe);
 	test_grab_crc(data, output, pipe, &green, data->flags, &reference_crc);
 
-	for (int plane = 1; plane < n_planes; plane++)
-		test_plane_position_with_output(data, pipe, plane,
-						output, &reference_crc,
-						data->flags);
+	for (int plane = 1; plane < n_planes; plane++) {
+		igt_dynamic_f("pipe-%s-plane-%d", kmstest_pipe_name(pipe), plane)
+			test_plane_position_with_output(data, pipe, plane, output,
+							&reference_crc, data->flags);
+	}
 
 	test_fini(data);
 }
@@ -1211,7 +1212,8 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	for_each_plane_on_pipe(&data->display, pipe, plane) {
 		if (skip_plane(data, plane))
 			continue;
-		result &= test_format_plane(data, pipe, output, plane, &primary_fb);
+		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(pipe), plane->index)
+			result &= test_format_plane(data, pipe, output, plane, &primary_fb);
 	}
 
 	test_fini(data);
@@ -1317,14 +1319,19 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
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
@@ -1361,20 +1368,20 @@ run_tests_for_pipe_plane(data_t *data)
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

