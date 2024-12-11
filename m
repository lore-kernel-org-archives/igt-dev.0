Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DA8E7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 15:15:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B8210E1C2;
	Wed, 11 Dec 2024 15:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HoNMWu0K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11BC010E1C2
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 15:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733930104; x=1765466104;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+diXR/6bmNlIOPj8CB2GSGnaiBJwebyw44iyJs7Td4Y=;
 b=HoNMWu0KebDBKpt+2jMyzugT5+HYz3E7SaEr3AibtGAzGY1mSTlqvKbU
 2T6aDOakbt7gawrHcpUuAEv8peUTvtVOkZE3+KtPLJNvWw6A+hMV6dhxl
 ZM2W+6Fe0MIYHXtO3w1c6WPeniKqQG4NXsbHbPMsnM1EyIAR1vX8anGkY
 cZ/xQMP1NPdgoPmpnu7SXC9ovNj06K7fX46dih4aWgDXxhSUtsQB6zODG
 NsmmeoMaoHMobx50Cw4zh9xcidia2w+zKzR/wVpEZWO3ZKYR51pdz9BZc
 3SAVCXi83TFRl78nTQRjf4wlS1F4iBl/um7jnKPc18NWnGv7PC61hk1f6 A==;
X-CSE-ConnectionGUID: 6+FyyqxISP+nkPYlCuSOqg==
X-CSE-MsgGUID: TuNEoD5rQmmP1G9S7pAxvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34041825"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="34041825"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 07:15:03 -0800
X-CSE-ConnectionGUID: vJ8WsbZNSaK5G77U2rNi6w==
X-CSE-MsgGUID: PkdWAz9EToSmEXe8kaKxcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="95669974"
Received: from unknown (HELO
 dg2adlp-Alder-Lake-Client-Platform.iind.intel.com) ([10.145.162.161])
 by fmviesa007.fm.intel.com with ESMTP; 11 Dec 2024 07:15:00 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/kms_histogram: Add test to count the number of
 histogram events
Date: Wed, 11 Dec 2024 20:44:24 +0530
Message-Id: <20241211151424.97387-1-mohammed.thasleem@intel.com>
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

This test to count the number of histogram events during color flips.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_histogram.c | 42 ++++++++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/tests/kms_histogram.c b/tests/kms_histogram.c
index c25aa022b..9d9112915 100644
--- a/tests/kms_histogram.c
+++ b/tests/kms_histogram.c
@@ -29,6 +29,7 @@
 #define GLOBAL_HIST_ENABLE		1
 #define GLOBAL_HIST_DELAY		2
 #define FLIP_COUNT			20
+#define CHK_FLIP_COUNT			200
 
 /**
  * SUBTEST: global-basic
@@ -229,9 +230,10 @@ static void flip_fb(data_t *data, enum pipe pipe, igt_output_t *output, struct i
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
-static void prepare_pipe(data_t *data, enum pipe pipe, igt_output_t *output, bool color_fb)
+static void prepare_pipe(data_t *data, enum pipe pipe, igt_output_t *output,
+		         bool color_fb, bool count_events)
 {
-	int i;
+	int i, events = 0;
 	struct udev_monitor *mon = igt_watch_uevents();
 	drmModeModeInfo *mode = igt_output_get_mode(output);
 	bool event_detected = false;
@@ -248,24 +250,34 @@ static void prepare_pipe(data_t *data, enum pipe pipe, igt_output_t *output, boo
 	igt_flush_uevents(mon);
 	for (i = 1; i <= FLIP_COUNT; i++) {
 		flip_fb(data, pipe, output, &data->fb[i % fb_count]);
+		if (count_events)
+			igt_wait_for_vblank(data->drm_fd, data->display.pipes[pipe].crtc_offset);
 
 		/* Check for histogram event on every flip and break the loop if detected. */
 		if (igt_global_histogram_event_detected(mon, 0)) {
-			event_detected = true;
-			break;
+			if (count_events)
+				events++;
+			else {
+				event_detected = true;
+				break;
+			}
 		}
 	}
 
 	igt_cleanup_uevents(mon);
-	igt_assert_f(event_detected, "Histogram event not generated.\n");
+	if (count_events) {
+		igt_info("Number of histogram events received = %d\n", events);
+		igt_assert_f(events, "Histogram event not generated.\n");
+	} else
+		igt_assert_f(event_detected, "Histogram event not generated.\n");
 }
 
 static void run_global_histogram_pipeline(data_t *data, enum pipe pipe, igt_output_t *output,
-					  bool color_fb, test_t test_pixel_factor)
+					  bool color_fb, test_t test_pixel_factor, bool count_events)
 {
 	drmModePropertyBlobRes *global_hist_blob = NULL;
 
-	prepare_pipe(data, pipe, output, color_fb);
+	prepare_pipe(data, pipe, output, color_fb, count_events);
 
 	read_global_histogram(data, pipe, &global_hist_blob);
 
@@ -277,7 +289,8 @@ static void run_global_histogram_pipeline(data_t *data, enum pipe pipe, igt_outp
 }
 
 static void run_tests_for_global_histogram(data_t *data, bool color_fb,
-					   test_t test_pixel_factor)
+					   test_t test_pixel_factor,
+					   bool count_events)
 {
 	enum pipe pipe;
 	igt_output_t *output;
@@ -294,7 +307,7 @@ static void run_tests_for_global_histogram(data_t *data, bool color_fb,
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
-				run_global_histogram_pipeline(data, pipe, output, color_fb, test_pixel_factor);
+				run_global_histogram_pipeline(data, pipe, output, color_fb, test_pixel_factor, count_events);
 		}
 	}
 }
@@ -302,7 +315,7 @@ static void run_tests_for_global_histogram(data_t *data, bool color_fb,
 static void run_algo_test(data_t *data, bool color_fb)
 {
 #ifdef HAVE_LIBGHE
-	run_tests_for_global_histogram(data, color_fb, algo_image_enhancement_factor);
+	run_tests_for_global_histogram(data, color_fb, algo_image_enhancement_factor, false);
 #else
 	igt_skip("Histogram algorithm library not found.\n");
 #endif
@@ -320,15 +333,20 @@ igt_main
 		igt_require(data.display.is_atomic);
 	}
 
+	igt_describe("Test to enable histogram, flip color fbs, count histogram "
+		     "event.");
+	igt_subtest_with_dynamic("global-color-event")
+		run_tests_for_global_histogram(&data, true, NULL, true);
+
 	igt_describe("Test to enable histogram, flip monochrome fbs, wait for histogram "
 		     "event and then read the histogram data.");
 	igt_subtest_with_dynamic("global-basic")
-		run_tests_for_global_histogram(&data, false, NULL);
+		run_tests_for_global_histogram(&data, false, NULL, false);
 
 	igt_describe("Test to enable histogram, flip color fbs, wait for histogram event "
 		     "and then read the histogram data.");
 	igt_subtest_with_dynamic("global-color")
-		run_tests_for_global_histogram(&data, true, NULL);
+		run_tests_for_global_histogram(&data, true, NULL, false);
 
 	igt_describe("Test to enable histogram, flip monochrome fbs, wait for histogram "
 		     "event and then read the histogram data and enhance pixels by multiplying "
-- 
2.25.1

