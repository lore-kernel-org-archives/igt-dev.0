Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD62CC83F09
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 22:04:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5625C10E6EA;
	Tue,  8 Jul 2025 22:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ewE137D/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B1E10E1D6
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 22:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752012292; x=1783548292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TsY/FU3Nix20bi3RoR0d2SCTSTXptqzE1PXzxRzzTHw=;
 b=ewE137D/jODyTCeIpI3+Dic38oaNpM0mzJcrn2zqUY9bJYJBTdAYTTxk
 4kpbVSHcVhkvgf1Zk1OmoPfNPR6L2PEkAucFKulSA72/6ovqY3Eh3SeBM
 Ng73vEAIyj9iTcgnVf9qjS6Bdd1j1dWAmG+RoiOqTOJlkP0vzy1XB5F+P
 BX4aFfRlyk/uZ1oXnyIEDVLBrzGaznV1FZyl1MpTmNhi0jh43zBZxFw9n
 Yj1s1M09XuCc2CVHaHSW+0qA79kbG7Q13scuMLGj3x06tJbEeRIxjqOWq
 L/p7XK05ArnrM6i1UfNt18oEkpRNjFFI/pzp09c8q/OO4OCPVFIGK9EUO g==;
X-CSE-ConnectionGUID: a0hkfV66S/iSLy95qW5xww==
X-CSE-MsgGUID: C2PdeJv9S/y4jYY1N/C2fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="64848995"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="64848995"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 15:04:52 -0700
X-CSE-ConnectionGUID: q0540bAMRyqKXwvd5SPTcg==
X-CSE-MsgGUID: XB04AHHWS6OsajwT5VMqRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="159920396"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 15:04:50 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, mitulkumar.ajitkumar.golani@intel.com,
 karthik.b.s@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 1/2] tests/kms_vrr: Improve VRR test robustness with
 cleanup before assertions
Date: Wed,  9 Jul 2025 03:35:01 +0530
Message-ID: <20250708220502.803610-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708220502.803610-1-ramanaidu.naladala@intel.com>
References: <20250708220502.803610-1-ramanaidu.naladala@intel.com>
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

The robustness and maintainability of the VRR (Variable Refresh Rate)
by ensuring proper cleanup is performed before any assertion failure
is triggered.

Previously, when a test failed due to not meeting the expected VRR
threshold, the test environment was not always cleaned up properly.
This could lead to resource leaks or inconsistent states that might
affect subsequent tests, making debugging more difficult.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 161 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 105 insertions(+), 56 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 9c2c4ac92..a24f413de 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -241,6 +241,18 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
 	return mode;
 }
 
+static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
+{
+	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, false);
+
+	igt_plane_set_fb(data->primary, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_output_override_mode(output, NULL);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	igt_remove_fb(data->drm_fd, &data->fb[1]);
+	igt_remove_fb(data->drm_fd, &data->fb[0]);
+}
+
 static void
 virtual_rr_vrr_range_mode(drmModeModeInfo *mode, float virtual_refresh_rate)
 {
@@ -701,25 +713,34 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	if (flags & TEST_FLIPLINE) {
 		rate[0] = igt_kms_frame_time_from_vrefresh(range.max + 5);
 		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
-		igt_assert_f(result > 75,
-			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
-			     (range.max + 5), rate[0], result);
+		if (result < 75) {
+			test_cleanup(data, pipe, output);
+			igt_assert_f(result > 75,
+				     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
+				     (range.max + 5), rate[0], result);
+		}
 	}
 
 	if (flags & ~(TEST_NEGATIVE | TEST_MAXMIN)) {
 		rate[0] = vtest_ns.rate_ns;
 		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
-		igt_assert_f(result > 75,
-			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
-			     ((range.max + range.min) / 2), rate[0], result);
+		if (result < 75) {
+			test_cleanup(data, pipe, output);
+			igt_assert_f(result > 75,
+				     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
+				     ((range.max + range.min) / 2), rate[0], result);
+		}
 	}
 
 	if (flags & TEST_FLIPLINE) {
 		rate[0] = igt_kms_frame_time_from_vrefresh(range.min - 10);
 		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
-		igt_assert_f(result < 50,
-			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold exceeded, result was %u%%\n",
-			     (range.min - 10), rate[0], result);
+		if (result > 50) {
+			test_cleanup(data, pipe, output);
+			igt_assert_f(result < 50,
+				     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold exceeded, result was %u%%\n",
+				     (range.min - 10), rate[0], result);
+		}
 	}
 
 	if (flags & TEST_MAXMIN) {
@@ -732,10 +753,12 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 		};
 
 		result = flip_and_measure(data, output, pipe, maxmin_rates, 2, data->duration_ns);
-		igt_assert_f(result > 75,
-			     "Refresh rates (%u/%u Hz) %"PRIu64"ns/%"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
-			     range.max, range_min, maxmin_rates[0], maxmin_rates[1], result);
-		return;
+		if (result < 75) {
+			test_cleanup(data, pipe, output);
+			igt_assert_f(result > 75,
+				     "Refresh rates (%u/%u Hz) %"PRIu64"ns/%"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
+				     range.max, range_min, maxmin_rates[0], maxmin_rates[1], result);
+		}
 	}
 
 	/*
@@ -746,9 +769,12 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	set_vrr_on_pipe(data, pipe, !(flags & TEST_FASTSET), (flags & TEST_NEGATIVE) ? true : false);
 	rate[0] = vtest_ns.rate_ns;
 	result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
-	igt_assert_f(result < 10,
-		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold exceeded, result was %u%%\n",
-		     ((range.max + range.min) / 2), rate[0], (flags & TEST_NEGATIVE)? "on" : "off", result);
+	if (result > 10) {
+		test_cleanup(data, pipe, output);
+		igt_assert_f(result < 10,
+			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold exceeded, result was %u%%\n",
+			     ((range.max + range.min) / 2), rate[0], (flags & TEST_NEGATIVE) ? "on" : "off", result);
+	}
 }
 
 static void
@@ -758,6 +784,7 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 	vtest_ns_t vtest_ns;
 	uint64_t rate[] = {0};
 	bool vrr = !!(flags & TEST_SEAMLESS_VRR);
+	uint32_t ret;
 
 	igt_info("Use HIGH_RR Mode as default (VRR: %s): ", vrr ? "ON" : "OFF");
 	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
@@ -773,14 +800,21 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 		 * so switch to High clock mode as test preparation
 		 */
 		igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
-		igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
+		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+		if (ret != 0) {
+			test_cleanup(data, pipe, output);
+			igt_assert(!ret);
+		}
 	}
 
 	rate[0] = vtest_ns.max;
 	result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
-	igt_assert_f(result > 75,
-		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold not reached, result was %u%%\n",
-		     data->range.max, rate[0], vrr ? "on" : "off", result);
+	if (result < 75) {
+		test_cleanup(data, pipe, output);
+		igt_assert_f(result > 75,
+			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold not reached, result was %u%%\n",
+			     data->range.max, rate[0], vrr ? "on" : "off", result);
+	}
 
 	/* Switch to low rr mode without modeset. */
 	igt_info("Switch to LOW_RR Mode (VRR: %s): ", vrr ? "ON" : "OFF");
@@ -790,22 +824,32 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 
 	rate[0] = vtest_ns.min;
 	result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
-	igt_assert_f(result > 75,
-		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold not reached, result was %u%%\n",
-		     data->range.min, rate[0], vrr ? "on" : "off", result);
+	if (result < 75) {
+		test_cleanup(data, pipe, output);
+		igt_assert_f(result > 75,
+			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold not reached, result was %u%%\n",
+			     data->range.min, rate[0], vrr ? "on" : "off", result);
+	}
 
 	/* Switch back to high rr mode without modeset. */
 	igt_info("Switch back to HIGH_RR Mode (VRR: %s): ", vrr ? "ON" : "OFF");
 	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
-	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
+	ret = igt_display_try_commit_atomic(&data->display, 0, NULL);
+	if (ret != 0) {
+		test_cleanup(data, pipe, output);
+		igt_assert(!ret);
+	}
 
 	rate[0] = vtest_ns.rate_ns;
 	result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
-	igt_assert_f(vrr ? (result > 75) : (result < 10),
-		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold %s, result was %u%%\n",
-		     ((data->range.max + data->range.min) / 2), rate[0],
-		     vrr ? "on" : "off", vrr ? "not reached" : "exceeded", result);
+	if (vrr ? (result < 75) : (result > 10)) {
+		test_cleanup(data, pipe, output);
+		igt_assert_f(vrr ? (result > 75) : (result < 10),
+			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold %s, result was %u%%\n",
+			     ((data->range.max + data->range.min) / 2), rate[0],
+			     vrr ? "on" : "off", vrr ? "not reached" : "exceeded", result);
+	}
 }
 
 static void
@@ -815,6 +859,7 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
 	unsigned int vrefresh;
 	uint64_t rate[] = {0};
 	uint32_t step_size;
+	uint32_t ret;
 	drmModeModeInfo virtual_mode;
 
 	igt_info("Use HIGH_RR Mode as default\n");
@@ -828,12 +873,19 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
 	 * switch to highest refresh rate mode.
 	 */
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
-	igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
+	ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+	if (ret != 0) {
+		test_cleanup(data, pipe, output);
+		igt_assert(!ret);
+	}
 
 	result = flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
-	igt_assert_f(result > 75,
-		     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
-		     data->switch_modes[HIGH_RR_MODE].vrefresh, rate[0], result);
+	if (result < 75) {
+		test_cleanup(data, pipe, output);
+		igt_assert_f(result > 75,
+			     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
+			     data->switch_modes[HIGH_RR_MODE].vrefresh, rate[0], result);
+	}
 
 	/*
 	 * Calculate step size by considering the no. of steps required to
@@ -851,13 +903,21 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
 		kmstest_dump_mode(&virtual_mode);
 
 		igt_output_override_mode(output, &virtual_mode);
-		igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
+
+		ret = igt_display_try_commit_atomic(&data->display, 0, NULL);
+		if (ret != 0) {
+			test_cleanup(data, pipe, output);
+			igt_assert(!ret);
+		}
 
 		rate[0] = igt_kms_frame_time_from_vrefresh(vrefresh);
 		result = flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
-		igt_assert_f(result > 75,
-			     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
-			     vrefresh, rate[0], result);
+		if (result < 75) {
+			test_cleanup(data, pipe, output);
+			igt_assert_f(result > 75,
+				     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
+				     vrefresh, rate[0], result);
+		}
 	}
 }
 
@@ -924,26 +984,16 @@ test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	if (!igt_display_try_commit2(&data->display, COMMIT_ATOMIC)) {
 		prepare_test(data, output, pipe);
 		result = flip_and_measure_cmrr(data, output, pipe, TEST_DURATION_NS * 2);
-		igt_assert_f(result > 75,
-			     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on threshold not reached, result was %u%%\n",
-			     mode.vrefresh, igt_kms_frame_time_from_vrefresh(mode.vrefresh),
-			     result);
+		if (result < 75) {
+			test_cleanup(data, pipe, output);
+			igt_assert_f(result > 75,
+				     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on threshold not reached, result was %u%%\n",
+				     mode.vrefresh, igt_kms_frame_time_from_vrefresh(mode.vrefresh),
+				     result);
+		}
 	}
 }
 
-static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
-{
-	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, false);
-
-	igt_plane_set_fb(data->primary, NULL);
-	igt_output_set_pipe(output, PIPE_NONE);
-	igt_output_override_mode(output, NULL);
-	igt_display_commit2(&data->display, COMMIT_ATOMIC);
-
-	igt_remove_fb(data->drm_fd, &data->fb[1]);
-	igt_remove_fb(data->drm_fd, &data->fb[0]);
-}
-
 static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags)
 {
 	data->debugfs_fd = igt_debugfs_dir(data->drm_fd);
@@ -1060,10 +1110,9 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 				      kmstest_pipe_name(pipe), output->name)
 				test(data, pipe, output, flags);
 
-			test_cleanup(data, pipe, output);
-
-			break;
 		}
+		igt_output_set_pipe(output, PIPE_NONE);
+		igt_output_override_mode(output, NULL);
 	}
 }
 
-- 
2.43.0

