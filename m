Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A746CC55822
	for <igt-dev@archiver.kernel.org>; Tue,  4 Aug 2026 23:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC8F10E152;
	Tue,  4 Aug 2026 23:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DnkLq1Ag";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BC210E152
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Aug 2026 23:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785885415; x=1817421415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LDWymakgmdYWmHebRrarSkU4iUUFT8j9Hpk+kC8nQpE=;
 b=DnkLq1Ag+KwYxn24XmCO/Y8hkmOpC7cF/NWHPMgLqUdOEloiaXW9zyHy
 LbZrZEQgMGZaFrkzckBse9j9P3Rp79mkLZ/B6d2wjoDOB+VJvCgX1h+dw
 uLOP17QoJKnv0dcXhvFM4clz8LucMd//si0hmJmNo2Euedp8kGpRWjn2i
 rglTGDFzRsbEBjq8bU80kxcwbl4l/tp1xx27L1Gqu0BecS4JBHR7YhAtx
 1qgh+AXIsrMRcsptZWMz5qQNFLGMM6QebvQHkNfUqmYl2mRq4b/z3Apbw
 12SCymDvOwDt/0VxP3zeMvjx9Huv3wjz6cyygIqlWXljv2sDpPmzj7JZe A==;
X-CSE-ConnectionGUID: /wkU06yAQHiAl3p+mp72Fg==
X-CSE-MsgGUID: rozMW5e1Riy+LmVh6l19hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86327082"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="86327082"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 16:16:54 -0700
X-CSE-ConnectionGUID: SB0qBP2dTUur+g7DMER/yw==
X-CSE-MsgGUID: 6pSj6JK6SDCwmO1hnEjcIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="259867696"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 16:16:53 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, mitulkumar.ajitkumar.golani@intel.com,
 ankit.k.nautiyal@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 2/2] tests/kms_vrr: add CMRR fixed and video mode
 subtests
Date: Wed,  5 Aug 2026 04:46:58 +0530
Message-ID: <20260804231702.602029-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804231702.602029-1-ramanaidu.naladala@intel.com>
References: <20260804231702.602029-1-ramanaidu.naladala@intel.com>
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

Add test coverage to validate Content Match Refresh Rate (CMRR)
behavior across both fixed and video timing display modes.

This introduces a shared helper library to support refresh-rate
mode selection and parsing, along with two new test cases covering
fixed-mode and video-mode scenarios.

The new tests measure actual display refresh timing during CMRR
operation and compare it against the expected target rate to
verify correctness. Video mode coverage validates behavior across
standard video timing rates, while fixed mode coverage targets
display modes that fall outside the standard video timing set.

Each test cycles through the relevant refresh configurations,
applying and resetting the appropriate settings between
measurement passes to ensure consistent and isolated test results.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 188 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 188 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 27f18e8d0..6be14b00d 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -32,6 +32,7 @@
 #include "igt_pm.h"
 #include "igt_psr.h"
 #include "i915/intel_drrs.h"
+#include "igt_vrr.h"
 #include "sw_sync.h"
 #include <fcntl.h>
 #include <signal.h>
@@ -80,6 +81,12 @@
  *
  * SUBTEST: lobf-dc3co
  * Description: Test DC3CO entry during LOBF.
+ *
+ * SUBTEST: cmrr-fixed-mode
+ * Description:
+ *
+ * SUBTEST: cmrr-video-mode
+ * Description:
  */
 
 #define NSECS_PER_SEC (1000000000ull)
@@ -103,6 +110,8 @@ enum {
 	TEST_LINK_OFF = 1 << 10,
 	TEST_NEGATIVE = 1 << 11,
 	TEST_FORCE_RR = 1 << 12,
+	TEST_CMRR_FIXED_MODE = 1 << 13,
+	TEST_CMRR_VIDEO_MODE = 1 << 14,
 };
 
 enum {
@@ -580,6 +589,171 @@ flip_and_measure(data_t *data, igt_output_t *output,
 	return 0;
 }
 
+static
+uint64_t wait_next_vblank_ts_ns(data_t *data, igt_crtc_t *crtc)
+{
+	union drm_wait_vblank vbl = {};
+
+	vbl.request.type = DRM_VBLANK_RELATIVE | igt_crtc_get_vbl_flag(crtc);
+	vbl.request.sequence = 1;
+	do_or_die(igt_ioctl(data->drm_fd, DRM_IOCTL_WAIT_VBLANK, &vbl));
+
+	return vbl.reply.tval_sec * NSECS_PER_SEC + vbl.reply.tval_usec * 1000ull;
+}
+
+static void
+flip_and_measure_target_rr(data_t *data, igt_crtc_t *crtc,
+			   uint32_t vrefresh, uint32_t cmrr_mode)
+{
+	uint32_t i;
+	bool front = false;
+	uint64_t last_vblank_ns, vblank_ns;
+	uint32_t err_frames = 0;
+	uint64_t frame_times_ns[TARGET_RR_SAMP_COUNT];
+	uint64_t exp_time_ns;
+	uint64_t total_frame_time_ns = 0;
+	uint64_t avg_frame_time_ns;
+	float avg_refresh_rate;
+	float expected_rr;
+
+	exp_time_ns = igt_kms_frame_time_from_vrefresh(vrefresh);
+
+	do_flip(data, &data->fb[0]);
+	(void)get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
+	last_vblank_ns = wait_next_vblank_ts_ns(data, crtc);
+
+	for (i = 0; i < TARGET_RR_SAMP_COUNT; i++) {
+		front = !front;
+
+		do_flip(data, front ? &data->fb[1] : &data->fb[0]);
+		vblank_ns = wait_next_vblank_ts_ns(data, crtc);
+		(void)get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
+
+		frame_times_ns[i] = vblank_ns - last_vblank_ns;
+
+		if (frame_times_ns[i] > (exp_time_ns + (exp_time_ns / 2))) {
+			err_frames++;
+			last_vblank_ns = vblank_ns;
+			continue;
+		}
+
+		last_vblank_ns = vblank_ns;
+		total_frame_time_ns += frame_times_ns[i];
+	}
+
+	avg_frame_time_ns = total_frame_time_ns / (TARGET_RR_SAMP_COUNT - err_frames);
+	avg_refresh_rate = (float)NSECS_PER_SEC / (float)avg_frame_time_ns;
+
+	if (cmrr_mode == CMRR_VIDEO_MODE) {
+		expected_rr = (double)(vrefresh * CMRR_NUMERATOR) /
+			      (double)CMRR_VIDEO_MODE_DENOMINATOR;
+		igt_assert_f(fabs(avg_refresh_rate - expected_rr) <= 0.02,
+			     "CMRR refresh rate mismatch: "
+			     "measured avg_rr = %.3f Hz, "
+			     "expected_rr = %.3f Hz\n",
+			     avg_refresh_rate, expected_rr);
+	}
+
+	if (cmrr_mode == CMRR_NON_VIDEO_MODE) {
+		expected_rr = (double)(vrefresh * CMRR_NUMERATOR) /
+			      (double)CMRR_DENOMINATOR;
+		igt_assert_f(fabs(avg_refresh_rate - expected_rr) <= 0.02,
+			     "CMRR refresh rate mismatch: "
+			     "measured avg_rr = %.3f Hz, "
+			     "expected_rr = %.3f Hz\n",
+			     avg_refresh_rate, expected_rr);
+	}
+
+	if (cmrr_mode == CMRR_DISABLE) {
+		expected_rr = (float)vrefresh;
+		igt_assert_f(fabs(avg_refresh_rate - expected_rr) <= 0.02,
+			     "CMRR refresh rate mismatch: "
+			     "measured avg_rr = %.3f Hz, "
+			     "expected_rr = %.3f Hz\n",
+			     avg_refresh_rate, expected_rr);
+	}
+
+	igt_info("Average RR (Hz): %.2f , Expected RR (Hz): %.2f, error frames = %d\n",
+		 avg_refresh_rate, expected_rr, err_frames);
+}
+
+static
+void test_cmrr(data_t *data, igt_crtc_t *crtc,
+	       igt_output_t *output, uint32_t flags)
+{
+	uint32_t found;
+	double rr_from_mode;
+	drmModeModeInfo mode;
+	drmModeConnectorPtr connector;
+	int j;
+
+	prepare_test(data, output, crtc);
+	set_vrr_on_crtc(data, crtc, true, false);
+
+	if (flags == TEST_CMRR_VIDEO_MODE) {
+		for (j = 0; j < igt_vrr_standard_video_timing_fps_count; j++) {
+			found = igt_vrr_get_mode_with_video_timeing(output,
+							igt_vrr_standard_video_timing_fps[j],
+							&mode);
+			if (found) {
+				igt_output_override_mode(output, &mode);
+				igt_info("Override mode:");
+				kmstest_dump_mode(&mode);
+				igt_target_rr_debugfs_write(data->drm_fd,
+							    crtc,
+							    mode.vrefresh,
+							    CMRR_VIDEO_MODE);
+				igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+				flip_and_measure_target_rr(data, crtc,
+							   mode.vrefresh,
+							   CMRR_VIDEO_MODE);
+
+				igt_target_rr_debugfs_write(data->drm_fd, crtc,
+							    mode.vrefresh,
+							    CMRR_DISABLE);
+
+				igt_display_commit2(&data->display, COMMIT_ATOMIC);
+				flip_and_measure_target_rr(data, crtc,
+							   mode.vrefresh,
+							   CMRR_DISABLE);
+			}
+		}
+	}
+
+	if (flags == TEST_CMRR_FIXED_MODE) {
+		found = 0;
+		connector = output->config.connector;
+		for (j = 0; j < connector->count_modes; j++) {
+			mode = connector->modes[j];
+			rr_from_mode = igt_vrr_mode_line_refresh_hz(&mode);
+
+			if (rr_from_mode - mode.vrefresh > 0.04) {
+				found = 1;
+				igt_output_override_mode(output, &mode);
+				igt_info("Override mode:");
+				kmstest_dump_mode(&mode);
+				igt_target_rr_debugfs_write(data->drm_fd, crtc,
+							    mode.vrefresh,
+							    CMRR_NON_VIDEO_MODE);
+				igt_display_commit2(&data->display, COMMIT_ATOMIC);
+				flip_and_measure_target_rr(data, crtc,
+							   mode.vrefresh,
+							   CMRR_NON_VIDEO_MODE);
+
+				igt_target_rr_debugfs_write(data->drm_fd, crtc,
+							    mode.vrefresh,
+							    CMRR_DISABLE);
+				igt_display_commit2(&data->display, COMMIT_ATOMIC);
+				flip_and_measure_target_rr(data, crtc,
+							   mode.vrefresh,
+							   CMRR_DISABLE);
+			}
+		}
+		igt_require_f(found, "No non-video-timing mode found.\n");
+	}
+}
+
 /* Basic VRR flip functionality test - enable, measure, disable, measure */
 static void
 test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
@@ -1147,6 +1321,20 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
+	igt_subtest_group() {
+		igt_fixture()
+			igt_require_intel(data.drm_fd);
+
+		igt_describe("Test to validate CMRR in fixed mode.");
+		igt_subtest_with_dynamic("cmrr-fixed-mode") {
+			run_vrr_test(&data, test_cmrr, TEST_CMRR_FIXED_MODE);
+		}
+
+		igt_describe("Test to validate CMRR in video mode.");
+		igt_subtest_with_dynamic("cmrr-video-mode") {
+			run_vrr_test(&data, test_cmrr, TEST_CMRR_VIDEO_MODE);
+		}
+	}
 	igt_fixture() {
 		close(data.debugfs_fd);
 		igt_display_fini(&data.display);
-- 
2.43.0

