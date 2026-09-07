Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14174C79F99
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 17:51:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F5D10E04F;
	Mon,  7 Sep 2026 17:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P83ya2De";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E8E10E04F
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 17:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788803321; x=1820339321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TmgaZjkqsvdi+lELnzUw+j3uioPFJJJ3FWD8kra6bh8=;
 b=P83ya2De1NBpVoBJYMntklXL1NZiAbyUoKfumArKwgEin64+Kw0Y4nI9
 Fhs7y0E087iuV3kqam6vQ0q4wuYH5RUtY6fkRK4cLS/kgtLp/KTWqgiKR
 VzUc2uLU1Ki39mo2wV3pobd3gCtSsqy2zvqlwu8Mcw3uq2gBvrWBLpt80
 TPlZ+0evB7zb2sV6I/sNcx/mmdI9/lDJ8s//4N5Hlye6/LTH9OD0dRtQ+
 h3VrQZqPqVu+HkVcijjhX7YJH+o+zxwvo4ABtVj/HFXxgh5JoXiqb482q
 yBWnZm26xyf96ykujNnyB0BgC6XX9zV8Ufc+Rz0VjqagWpOBKwtz7kpRr A==;
X-CSE-ConnectionGUID: vhVJNwIXRkSAW0J/ZFe/0g==
X-CSE-MsgGUID: CD306RKYTbSxr8soaAg0HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99801583"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="99801583"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 10:48:41 -0700
X-CSE-ConnectionGUID: G9i5h1hUR5eDHRTb8oNAFg==
X-CSE-MsgGUID: SbJw2m+/QteF5BZ1Hc536w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="270743542"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 10:48:39 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, chaitanya.kumar.borah@intel.com,
 karthik.b.s@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v6 3/3] tests/kms_vrr: Add CMRR fixed and video mode
 subtests
Date: Mon,  7 Sep 2026 23:18:35 +0530
Message-ID: <20260907174836.3159214-4-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907174836.3159214-1-ramanaidu.naladala@intel.com>
References: <20260907174836.3159214-1-ramanaidu.naladala@intel.com>
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

v2: Fix test issue.
v3: Address review comments. (Mitul)
v4: Fix test issue.
v5: Address below review comments:
    - Rename CMRR fixed/non-video mode references to desktop
      mode. (Chaitanya)
    - Factor out vblank timestamp/sequence retrieval into
      helper. (Chaitanya)
    - Simplify CMRR tests by extracting common mode logic. (Chaitanya,
      Mitul)
    - Refactor CMRR refresh-rate verification and frame filtering.
v6: Address below review comments:
    - Document skipped vblank intervals and fix seq_delta
      format. (Chaitanya)
    - Fix minor style issues in CMRR tests. (Chaitanya, Mitul)
    - Add mode existence checks for CMRR test paths. (Chaitanya)

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 240 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 240 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 27f18e8d0..109b4629d 100644
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
@@ -80,9 +81,22 @@
  *
  * SUBTEST: lobf-dc3co
  * Description: Test DC3CO entry during LOBF.
+ *
+ * SUBTEST: cmrr-desktop-mode
+ * Description: Test to set a desktop mode CMRR target refresh rate and verify
+ *              it is correctly applied.
+ *
+ * SUBTEST: cmrr-video-mode
+ * Description: Test to set standard video timing refresh rates via CMRR
+ *              and verify each target rate is correctly applied.
  */
 
 #define NSECS_PER_SEC (1000000000ull)
+#define CMRR_NUMERATOR 1000ULL
+#define CMRR_DENOMINATOR 1000ULL
+#define CMRR_VIDEO_MODE_DENOMINATOR 1001ULL
+#define TARGET_RR_SAMP_COUNT 100
+#define CMRR_RR_TOLERANCE_HZ 0.02
 
 /*
  * Each test measurement step runs for ~5 seconds.
@@ -103,6 +117,14 @@ enum {
 	TEST_LINK_OFF = 1 << 10,
 	TEST_NEGATIVE = 1 << 11,
 	TEST_FORCE_RR = 1 << 12,
+	TEST_CMRR_DESKTOP_MODE = 1 << 13,
+	TEST_CMRR_VIDEO_MODE = 1 << 14,
+};
+
+enum {
+	CMRR_VIDEO_MODE,
+	CMRR_DESKTOP_MODE,
+	CMRR_DISABLE,
 };
 
 enum {
@@ -221,6 +243,38 @@ output_mode_with_maxrate(igt_output_t *output, unsigned int vrr_max)
 	return mode;
 }
 
+/**
+ * get_mode_with_video_timing:
+ * @output: Display output containing connector mode list
+ * @fps: Requested integer refresh rate in Hz
+ * @matched_mode: Returned mode that matches @fps
+ *
+ * Find and return a connector mode that matches the requested
+ * video timing refresh rate in Hz.
+ *
+ * Returns: true when a mode is found, false otherwise
+ */
+
+static bool
+get_mode_with_video_timing(igt_output_t *output, uint32_t fps,
+			   drmModeModeInfo *matched_mode)
+{
+	drmModeConnectorPtr connector;
+
+	connector = output->config.connector;
+	if (!connector)
+		return false;
+
+	for (int i = 0; i < connector->count_modes; i++) {
+		if (connector->modes[i].vrefresh == fps) {
+			*matched_mode = connector->modes[i];
+			return true;
+		}
+	}
+
+	return false;
+}
+
 static drmModeModeInfo
 low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
 {
@@ -580,6 +634,177 @@ flip_and_measure(data_t *data, igt_output_t *output,
 	return 0;
 }
 
+/* Measure and verify the effective refresh rate against the expected CMRR target rate. */
+static void
+flip_and_measure_target_rr(data_t *data, igt_crtc_t *crtc,
+			   double vrefresh, uint32_t cmrr_mode)
+{
+	uint64_t last_vblank_ns, vblank_ns, frame_time_ns;
+	uint64_t total_frame_time_ns = 0;
+	uint32_t last_seq, seq, seq_delta;
+	uint32_t err_frames = 0, valid_frames;
+	double avg_frame_time_ns, avg_refresh_rate;
+	double  expected_rr = 0;
+	bool front = false;
+	uint32_t i;
+
+	switch (cmrr_mode) {
+	case CMRR_VIDEO_MODE:
+		expected_rr = (vrefresh * CMRR_NUMERATOR) /
+			      (double)CMRR_VIDEO_MODE_DENOMINATOR;
+		break;
+	case CMRR_DESKTOP_MODE:
+		expected_rr = (vrefresh * CMRR_NUMERATOR) /
+			      (double)CMRR_DENOMINATOR;
+		break;
+	case CMRR_DISABLE:
+		expected_rr = vrefresh;
+		break;
+	default:
+		igt_assert_f(0, "Invalid CMRR mode %u\n", cmrr_mode);
+	}
+
+	do_flip(data, &data->fb[0]);
+	(void)get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
+	igt_wait_for_vblank_ts_seq(crtc, &last_vblank_ns, &last_seq);
+
+	for (i = 0; i < TARGET_RR_SAMP_COUNT; i++) {
+		front = !front;
+
+		do_flip(data, front ? &data->fb[1] : &data->fb[0]);
+		igt_wait_for_vblank_ts_seq(crtc, &vblank_ns, &seq);
+		(void)get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
+
+		frame_time_ns = vblank_ns - last_vblank_ns;
+		seq_delta = seq - last_seq;
+
+		last_vblank_ns = vblank_ns;
+		last_seq = seq;
+
+		/*
+		 * Use only single-frame intervals. If delta > 1, one or
+		 * more vblanks were missed, so the interval is not valid
+		 * for calculating the average frame time.
+		 */
+		if (seq_delta != 1) {
+			igt_debug("vblank seq delta = %u\n", seq_delta);
+			err_frames++;
+			continue;
+		}
+
+		total_frame_time_ns += frame_time_ns;
+	}
+
+	valid_frames = TARGET_RR_SAMP_COUNT - err_frames;
+
+	igt_assert_f(valid_frames >= 90,
+		     "Valid frames below threshold (90): valid_frames=%u, err_frames=%u\n",
+		     valid_frames, err_frames);
+
+	avg_frame_time_ns = (double)total_frame_time_ns / valid_frames;
+	avg_refresh_rate = (double)NSECS_PER_SEC / avg_frame_time_ns;
+
+	igt_assert_f(fabs(avg_refresh_rate - expected_rr) <= CMRR_RR_TOLERANCE_HZ,
+		     "CMRR refresh rate mismatch: measured avg_rr = %.3f Hz, "
+		     "expected_rr = %.3f Hz\n",
+		      avg_refresh_rate, expected_rr);
+
+	igt_info("Average RR (Hz): %.2f, Expected RR (Hz): %.2f, error frames = %u\n",
+		 avg_refresh_rate, expected_rr, err_frames);
+}
+
+/**
+ * Programs the requested CMRR target refresh rate for @mode, verifies that the measured
+ * refresh rate matches the expected CMRR behavior,then disables CMRR and verifies that
+ * the refresh rate returns to the mode's nominal refresh rate. The function asserts that
+ * all target refresh rate programming operations succeed.
+ */
+static void
+run_cmrr(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
+	 const drmModeModeInfo *mode, uint32_t cmrr_mode)
+{
+	uint32_t numerator, denominator;
+	bool ret;
+	double rr_from_mode = igt_vrr_mode_line_refresh_hz(mode);
+
+	switch (cmrr_mode) {
+	case CMRR_VIDEO_MODE:
+		numerator = mode->vrefresh * CMRR_NUMERATOR;
+		denominator = CMRR_VIDEO_MODE_DENOMINATOR;
+		break;
+	case CMRR_DESKTOP_MODE:
+		numerator = mode->vrefresh * CMRR_NUMERATOR;
+		denominator = CMRR_DENOMINATOR;
+		break;
+	default:
+		igt_assert_f(0, "Unsupported CMRR mode %u\n",
+			     cmrr_mode);
+	}
+
+	igt_output_override_mode(output, mode);
+	igt_info("Override mode:");
+	kmstest_dump_mode((drmModeModeInfo *)mode);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	ret = igt_vrr_target_rr_debugfs_write(data->drm_fd,
+					      crtc->crtc_index,
+					      numerator,
+					      denominator);
+	igt_assert_f(ret, "Failed to program CMRR target RR (%u/%u)\n",
+		     numerator, denominator);
+
+	flip_and_measure_target_rr(data, crtc, mode->vrefresh, cmrr_mode);
+
+	ret = igt_vrr_target_rr_debugfs_write(data->drm_fd, crtc->crtc_index, 0, 0);
+
+	igt_assert_f(ret, "Failed to disable CMRR target RR\n");
+
+	flip_and_measure_target_rr(data, crtc, rr_from_mode, CMRR_DISABLE);
+}
+
+/* Validate CMRR behavior for supported video and desktop display modes. */
+static
+void test_cmrr(data_t *data, igt_crtc_t *crtc,
+	       igt_output_t *output, uint32_t flags)
+{
+	drmModeModeInfo mode;
+	bool found = false;
+	drmModeConnectorPtr connector = output->config.connector;
+	uint32_t j;
+
+	igt_require_f(igt_vrr_target_refresh_rate_supported(data->drm_fd, crtc->crtc_index),
+		      "CMRR not supported\n");
+	prepare_test(data, output, crtc);
+	set_vrr_on_crtc(data, crtc, true, false);
+
+	if (flags & TEST_CMRR_VIDEO_MODE) {
+		found = false;
+		for (j = 0; j < igt_vrr_standard_video_timing_fps_count; j++) {
+			if (!get_mode_with_video_timing(output,
+							igt_vrr_standard_video_timing_fps[j],
+							&mode))
+				continue;
+
+			found = true;
+			run_cmrr(data, crtc, output, &mode, CMRR_VIDEO_MODE);
+		}
+		igt_require_f(found, "No video mode found.\n");
+	}
+
+	if (flags & TEST_CMRR_DESKTOP_MODE) {
+		found = false;
+		for (j = 0; j < connector->count_modes; j++) {
+			mode = connector->modes[j];
+			if (igt_vrr_mode_line_refresh_hz(&mode) - mode.vrefresh <= 0.04)
+				continue;
+
+			found = true;
+			run_cmrr(data, crtc, output, &mode, CMRR_DESKTOP_MODE);
+		}
+		igt_require_f(found, "No desktop mode found.\n");
+	}
+}
+
 /* Basic VRR flip functionality test - enable, measure, disable, measure */
 static void
 test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
@@ -591,6 +816,7 @@ test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 	uint64_t rate[] = {0};
 
 	prepare_test(data, output, crtc);
+
 	range = data->range;
 	vtest_ns = data->vtest_ns;
 	rate[0] = vtest_ns.rate_ns;
@@ -1147,6 +1373,20 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
+	igt_subtest_group() {
+		igt_fixture()
+			igt_require_intel(data.drm_fd);
+
+		igt_describe("Test to validate CMRR in desktop mode.");
+		igt_subtest_with_dynamic("cmrr-desktop-mode") {
+			run_vrr_test(&data, test_cmrr, TEST_CMRR_DESKTOP_MODE);
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

