Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E96EF8FE4
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 13:40:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9208610E2A5;
	Thu,  5 Mar 2026 13:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EBzfZIR1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9281810E2A5
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 13:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772718053; x=1804254053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VMcTEytojxmHY3K1lbGlMQ6fKZBeXYwUD8yrARFtHW8=;
 b=EBzfZIR1cCfJUiONeQpghLSzt+QP02/GZFf/a3froYh/FmOQLtYdFGQc
 8Hfw2dd8oiywxgFaSWEdIKhFcKdhPGSave6FLzW1XFpmhgPu53Lh+c7gj
 +X5Hb+iyvoYn8Jd/XF6ZJ1h60l9ftJZ5YJpDr4PDwbYsoVLU3JqVghp7A
 soRxcZOJtYWM52pNhRo/BYqSXZUDinH+9mE9jIM+kK0Ri+S8En7AizlRs
 iJEdAKJ0HvtV5tXgFR69JevCmYtph5Lqd8F4e+aAq3lcW8+TAVieRkR/6
 WhrBsUyLG/wdBVihze/82KIXJuAWTDznO3qNzVQlQnx/EMdkD4YXAg6JG Q==;
X-CSE-ConnectionGUID: 38T65IDPRkGYLY/exMPddw==
X-CSE-MsgGUID: 2Y+U/vwiTBmS5VbWAwgzcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="76404980"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="76404980"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:40:52 -0800
X-CSE-ConnectionGUID: a1VnGDMnSdafkU6LmKIziA==
X-CSE-MsgGUID: Is3pZ1uGTFWLXKou71RY2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="218641225"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:40:50 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lyude Paul <lyude@redhat.com>
Subject: [PATCH i-g-t 2/5] tests/nouveau_crc: Convert to dynamic subtests
Date: Thu,  5 Mar 2026 15:40:35 +0200
Message-ID: <20260305134038.6995-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305134038.6995-1-ville.syrjala@linux.intel.com>
References: <20260305134038.6995-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

nouveau_crc is the last holdout for for_each_pipe_static(). Convert
the tests to use dynamic per-pipe subtests so that we can nuke
for_each_pipe_static() and convert everything to use igt_crtc_t.

Untested due to lack of hardware.

Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.h       |  12 -----
 tests/nouveau_crc.c | 113 ++++++++++++++++++++++++++------------------
 2 files changed, 68 insertions(+), 57 deletions(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e91c6567757e..9514ef03f0e8 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -720,18 +720,6 @@ static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *outp
 	for_each_output((display), (output))	\
 		for_each_if ((!(igt_output_is_connected((output)))))
 
-/**
- * for_each_pipe_static:
- * @pipe: The pipe to iterate.
- *
- * This for loop iterates over all pipes supported by IGT libraries.
- *
- * This should be used to enumerate per-pipe subtests since it has no runtime
- * depencies.
- */
-#define for_each_pipe_static(pipe) \
-	for (pipe = 0; pipe < IGT_MAX_PIPES; pipe++)
-
 /**
  * for_each_crtc:
  * @display: a pointer to an #igt_display_t structure
diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
index 393414339ab0..59fa8a2daeb8 100644
--- a/tests/nouveau_crc.c
+++ b/tests/nouveau_crc.c
@@ -297,6 +297,16 @@ static void test_source(data_t *data, const char *source)
 	free(crcs);
 }
 
+static void test_source_outp_complete(data_t *data)
+{
+	test_source(data, "outp-complete");
+}
+
+static void test_source_rg(data_t *data)
+{
+	test_source(data, "rg");
+}
+
 static void test_source_outp_inactive(data_t *data)
 {
 	struct color_fb colors[] = {
@@ -365,13 +375,17 @@ static void cleanup_test(data_t *data)
 	close(data->nv_crc_dir);
 }
 
+static void run_test(data_t *data, void (*test)(data_t *data))
+{
+	setup_test(data);
+	test(data);
+	cleanup_test(data);
+}
+
 data_t data = {0};
 
-#define pipe_test(name) igt_subtest_f("pipe-%s-" name, kmstest_pipe_name(pipe))
 int igt_main()
 {
-	int pipe;
-
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		igt_require_nouveau(data.drm_fd);
@@ -383,50 +397,59 @@ int igt_main()
 		igt_display_reset(&data.display);
 	}
 
-	for_each_pipe_static(pipe) {
-		igt_fixture() {
-			data.crtc = igt_crtc_for_pipe(&data.display, pipe);
-			igt_require(data.crtc->valid);
-
-			setup_test(&data);
+	/* We don't need to test this on every pipe, but the setup is the same */
+	igt_describe("Make sure that the CRC notifier context flip threshold "
+		     "is reset to its default value after a single capture.");
+	igt_subtest("ctx-flip-threshold-reset-after-capture") {
+		data.crtc = igt_crtc_for_pipe(&data.display, PIPE_A);
+		igt_require(data.crtc->valid);
+
+		run_test(&data, test_ctx_flip_threshold_reset_after_capture);
+	}
+
+	igt_describe("Make sure the association between each CRC and its "
+		     "respective frame index is not broken when the driver "
+		     "performs a notifier context flip.");
+	igt_subtest("ctx-flip-detection") {
+		for_each_crtc(&data.display, data.crtc) {
+			igt_dynamic_f("pipe-%s", igt_crtc_name(data.crtc))
+				run_test(&data, test_ctx_flip_detection);
 		}
-
-		/* We don't need to test this on every pipe, but the setup is the same */
-		if (pipe == PIPE_A) {
-			igt_describe("Make sure that the CRC notifier context flip threshold "
-				     "is reset to its default value after a single capture.");
-			igt_subtest("ctx-flip-threshold-reset-after-capture")
-				test_ctx_flip_threshold_reset_after_capture(&data);
+	}
+
+	igt_describe("Make sure that igt_pipe_crc_get_current() works even "
+		     "when the CRC for the current frame index is lost.");
+	igt_subtest("ctx-flip-skip-current-frame") {
+		for_each_crtc(&data.display, data.crtc) {
+			igt_dynamic_f("pipe-%s", igt_crtc_name(data.crtc))
+				run_test(&data, test_ctx_flip_skip_current_frame);
 		}
-
-		igt_describe("Make sure the association between each CRC and its "
-			     "respective frame index is not broken when the driver "
-			     "performs a notifier context flip.");
-		pipe_test("ctx-flip-detection")
-			test_ctx_flip_detection(&data);
-
-		igt_describe("Make sure that igt_pipe_crc_get_current() works even "
-			     "when the CRC for the current frame index is lost.");
-		pipe_test("ctx-flip-skip-current-frame")
-			test_ctx_flip_skip_current_frame(&data);
-
-		igt_describe("Check that basic CRC readback using the outp-complete "
-			     "source works.");
-		pipe_test("source-outp-complete")
-			test_source(&data, "outp-complete");
-
-		igt_describe("Check that basic CRC readback using the rg source "
-			     "works.");
-		pipe_test("source-rg")
-			test_source(&data, "rg");
-
-		igt_describe("Make sure that the outp-inactive source is actually "
-			     "capturing the inactive raster.");
-		pipe_test("source-outp-inactive")
-			test_source_outp_inactive(&data);
-
-		igt_fixture() {
-			cleanup_test(&data);
+	}
+
+	igt_describe("Check that basic CRC readback using the outp-complete "
+		     "source works.");
+	igt_subtest("source-outp-complete") {
+		for_each_crtc(&data.display, data.crtc) {
+			igt_dynamic_f("pipe-%s", igt_crtc_name(data.crtc))
+				run_test(&data, test_source_outp_complete);
+		}
+	}
+
+	igt_describe("Check that basic CRC readback using the rg source "
+		     "works.");
+	igt_subtest("source-rg") {
+		for_each_crtc(&data.display, data.crtc) {
+			igt_dynamic_f("pipe-%s", igt_crtc_name(data.crtc))
+				run_test(&data, test_source_rg);
+		}
+	}
+
+	igt_describe("Make sure that the outp-inactive source is actually "
+		     "capturing the inactive raster.");
+	igt_subtest("source-outp-inactive") {
+		for_each_crtc(&data.display, data.crtc) {
+			igt_dynamic_f("pipe-%s", igt_crtc_name(data.crtc))
+				run_test(&data, test_source_outp_inactive);
 		}
 	}
 
-- 
2.52.0

