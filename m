Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14607C982DA
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 14:21:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F4210EC97;
	Fri, 18 Sep 2026 14:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FvlmtEAD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63ED10F3DF
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Sep 2026 14:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789741224; x=1821277224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7PrLb5gYHh0U9NPiQtWIkzMOb7BRhxkBWXw5Q4y+PZw=;
 b=FvlmtEADDt6sfein9FX7rH13uv0gCTMOqxhuAnOxRvsqV3c4PpbxRPAN
 O8/p2KQTfpapF321sAiF74N35vJr1pUkij7Nt1z8AJ788gV35oYBVi0xt
 K/X9V/HbsnIhqsWllkvc2wiNjetIF0IjAsVUt/Q4rgclHcAZdFZiBWeI/
 Ccc2Je4sx57p1LRSrz4ju97abiuEqOIBxo3Ydjyw46UBmVQrRD8ZvkGca
 E7aWnfx8IqpBkxyf9aede1MpG4SKls/2LVKBqTGGpoBiB3YrpasZJcuaQ
 2CftHRcuCNulYBNo7oe9N9v0FMx1LfwCGc0i0TJEdsGjOyetsQVVwXmdV Q==;
X-CSE-ConnectionGUID: /wt2C5J8Sm63w7bbxIMVcw==
X-CSE-MsgGUID: Rj5iLv6JQW+EpzJMBsZiUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="100913928"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="100913928"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 07:20:24 -0700
X-CSE-ConnectionGUID: X2qi1e43Q8yi1flQ5qitlQ==
X-CSE-MsgGUID: R6kvrQy/Qniz4476DcH1Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="268164356"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 07:20:22 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 1/2] tests/kms_vrr: Retry LOBF detection on low
 refresh mode
Date: Fri, 18 Sep 2026 19:50:21 +0530
Message-ID: <20260918142022.4096908-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918142022.4096908-1-ramanaidu.naladala@intel.com>
References: <20260918142022.4096908-1-ramanaidu.naladala@intel.com>
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

Replace the synthetic refresh-rate sweep with standard video timing
rates to better reflect real content playback patterns.

Commit the selected mode before running measurements and retry the
validation in the low refresh rate mode when LOBF does not engage
in the high refresh rate mode.

v2: Rebase all changes onto latest.

Assisted-by: Copilot:Claude-Opus-5
Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Animesh Manna <animesh.manna@intel.com>
---
 tests/kms_vrr.c | 72 ++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 56 insertions(+), 16 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 3eaf29bb7..9c71ab9e7 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -1047,6 +1047,46 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
 	}
 }
 
+/**
+ * lobf_flip_video_timing_fps:
+ * @data: test data
+ * @output: output under test
+ * @mode: mode currently committed on @output
+ *
+ * Flips at every standard video timing rate, from the highest to the lowest,
+ * on the currently committed @mode. Rates above the panel refresh rate can't
+ * be driven, so they are skipped.
+ *
+ * Returns: true as soon as LOBF gets enabled, false if no rate enables it.
+ */
+static bool
+lobf_flip_video_timing_fps(data_t *data, igt_output_t *output,
+			   const drmModeModeInfo *mode)
+{
+	uint64_t rate[] = {0};
+
+	for (int i = igt_vrr_standard_video_timing_fps_count - 1; i >= 0; i--) {
+		uint32_t fps = igt_vrr_standard_video_timing_fps[i];
+
+		if (fps > mode->vrefresh)
+			continue;
+
+		igt_info("Testing LOBF with a %u hz flip rate on %u hz panel refresh rate: ",
+			 fps, mode->vrefresh);
+
+		rate[0] = igt_kms_frame_time_from_vrefresh(fps);
+		flip_and_measure(data, output, rate, 1, NSECS_PER_SEC);
+
+		if (igt_get_i915_edp_lobf_status(data->drm_fd, output->name)) {
+			igt_info("LOBF enabled\n");
+			return true;
+		}
+		igt_info("LOBF not enabled\n");
+	}
+
+	return false;
+}
+
 /* FIXME: test_lobf : Lobf can be enabled when
  * (Set Context Latency + Guardband) > (First SDP Position + Wake Time)
  * one the depends patches are merged please fix this function.
@@ -1057,10 +1097,8 @@ test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 	  uint32_t flags)
 {
 	uint64_t rate[] = {0};
-	uint32_t step_size, vrefresh;
 	bool lobf_enabled = false;
 
-	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
 	prepare_test(data, output, crtc);
 	data->flag |= flags;
 
@@ -1083,26 +1121,28 @@ test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 		 output->name, igt_crtc_name(crtc), data->range.min,
 		 data->range.max);
 
+	/* Settle on the high refresh rate mode and sweep the content rates. */
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
-	flip_and_measure(data, output, rate, 1, TEST_DURATION_NS);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	step_size = (data->range.max - data->range.min) / 5;
+	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
+	flip_and_measure(data, output, rate, 1, TEST_DURATION_NS);
 
-	for (vrefresh = data->range.max - step_size;
-	     vrefresh >= data->range.min; vrefresh -= step_size) {
-		igt_info("Testing LOBF with a %u hz flip rate on %u hz panel refresh rate\n",
-			 vrefresh, data->switch_modes[HIGH_RR_MODE].vrefresh);
+	lobf_enabled = lobf_flip_video_timing_fps(data, output,
+						  &data->switch_modes[HIGH_RR_MODE]);
 
-		rate[0] = igt_kms_frame_time_from_vrefresh(vrefresh);
-		flip_and_measure(data, output, rate, 1, NSECS_PER_SEC);
+	/* No content rate enabled LOBF, retry the sweep on the low RR mode. */
+	if (!lobf_enabled) {
+		igt_info("LOBF test execution with lower refresh rate\n");
+		igt_output_override_mode(output, &data->switch_modes[LOW_RR_MODE]);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-		if (igt_get_i915_edp_lobf_status(data->drm_fd, output->name)) {
-			lobf_enabled = true;
-			break;
-		}
+		rate[0] = igt_kms_frame_time_from_vrefresh(
+				data->switch_modes[LOW_RR_MODE].vrefresh);
+		flip_and_measure(data, output, rate, 1, TEST_DURATION_NS);
 
-		if (vrefresh == data->range.min)
-			break;
+		lobf_enabled = lobf_flip_video_timing_fps(data, output,
+							  &data->switch_modes[LOW_RR_MODE]);
 	}
 
 	igt_assert_f(lobf_enabled, "LOBF not enabled\n");
-- 
2.43.0

