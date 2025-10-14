Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB19CCD184
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 12:49:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F6910E5F2;
	Tue, 14 Oct 2025 12:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KFdFzlDr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5BE10E5F2
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 12:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760446155; x=1791982155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I3SUYyo6HeyM87eQTN/04eaew2i9MBq6WcMyTGAGuKQ=;
 b=KFdFzlDrec1G0rgfpsM8EL60qsEJmgpP38WJ9+a9jiM7DNQorUtQ+M64
 Q9dOjwinec2GLvvy4LuifNmFNjCa3xGIZNN56kHrrdEWVlWmErtCgjfjK
 SlZYcZk831Ui9oVBhin7CCODtudSKVyUdWM83lUqiz4U2/UuNOGNQDU+z
 S8tOJI4ySeCn+tq3CX+3VTNOQr1zvc30SOgRxo9X7ujsRYVhOgigBLkYz
 DgEAvxyJ8fdbvF1O/Qi8bhH1RR02zxRY1nZ5f86RzOs+8jAQVXgs9+4gX
 MNxFZJ5a3HOmRtAX6iDfhg8RRmBIUtYeVqMd1Sr9ZPcaU62VoyFre9EYX Q==;
X-CSE-ConnectionGUID: n0W32jLyTZOclpmCkxtehQ==
X-CSE-MsgGUID: ebN45N/RSJCLOO93SHzVpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62494142"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="62494142"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 05:49:14 -0700
X-CSE-ConnectionGUID: UO19XP8ATNadNj5eub+YoQ==
X-CSE-MsgGUID: jQFko/NNTzu3WqN8tNL9jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="187173947"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 05:49:13 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_vrr: Dynamically verify LOBF across
 vrefresh steps
Date: Tue, 14 Oct 2025 18:18:54 +0530
Message-ID: <20251014124854.425479-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251010085708.273552-1-ramanaidu.naladala@intel.com>
References: <20251010085708.273552-1-ramanaidu.naladala@intel.com>
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

Replace the static LOBF check with iterative vrefresh stepping
to detect LOBF enablement. Add a configurable mechanism to
control test output verbosity, enabling selective suppression
of detailed logs under specific conditions.

v2: Add info logs.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 51 ++++++++++++++++++++++++++++++++++---------------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index ee0f057d5..23722182f 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -154,6 +154,7 @@ typedef struct data {
 	vtest_ns_t vtest_ns;
 	uint64_t duration_ns;
 	bool static_image;
+	uint32_t flag;
 } data_t;
 
 typedef void (*test_t)(data_t*, enum pipe, igt_output_t*, uint32_t);
@@ -512,10 +513,11 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 
 		calculate_tolerance(&threshold_hi[i], &threshold_lo[i], exp_rate_ns);
 
-		igt_info("Requested rate[%d]: %" PRIu64 " ns (%.2f Hz), Expected rate between: %" PRIu64 " ns (%.2f Hz) to %" PRIu64 " ns (%.2f Hz)\n",
-			 i, rates_ns[i], (float)NSECS_PER_SEC / rates_ns[i], threshold_hi[i],
-			 (float)NSECS_PER_SEC / threshold_hi[i], threshold_lo[i],
-			 (float)NSECS_PER_SEC / threshold_lo[i]);
+		if (data->flag != TEST_LINK_OFF)
+			igt_info("Requested rate[%d]: %" PRIu64 " ns (%.2f Hz), Expected rate between: %" PRIu64 " ns (%.2f Hz) to %" PRIu64 " ns (%.2f Hz)\n",
+				 i, rates_ns[i], (float)NSECS_PER_SEC / rates_ns[i],
+				 threshold_hi[i], (float)NSECS_PER_SEC / threshold_hi[i],
+				 threshold_lo[i], (float)NSECS_PER_SEC / threshold_lo[i]);
 	}
 
 	/* Align with the flip completion event to speed up convergence. */
@@ -581,14 +583,18 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 		while (get_time_ns() < target_ns - 10);
 	}
 
-	igt_info("Completed %u flips, %u were in threshold for [", total_flip, total_pass);
-	for (int i = 0; i < num_rates; ++i) {
-		igt_info("(%llu Hz) %"PRIu64"ns%s", (NSECS_PER_SEC/rates_ns[i]), rates_ns[i],
-			 i < num_rates - 1 ? "," : "");
+	if (data->flag != TEST_LINK_OFF) {
+		igt_info("Completed %u flips, %u were in threshold for [", total_flip, total_pass);
+		for (int i = 0; i < num_rates; ++i) {
+			igt_info("(%llu Hz) %" PRIu64 "ns%s", (NSECS_PER_SEC / rates_ns[i]),
+				 rates_ns[i], i < num_rates - 1 ? "," : "");
+		}
+		igt_info("]\n");
+
+		return total_flip ? ((total_pass * 100) / total_flip) : 0;
 	}
-	igt_info("]\n");
 
-	return total_flip ? ((total_pass * 100) / total_flip) : 0;
+	return 0;
 }
 
 static uint32_t
@@ -870,20 +876,35 @@ static void
 test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 {
 	uint64_t rate[] = {0};
+	uint32_t step_size, vrefresh;
+	bool lobf_enabled = false;
 
 	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
 	prepare_test(data, output, pipe);
+	data->flag = flags;
 
 	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
 		 output->name, kmstest_pipe_name(pipe), data->range.min, data->range.max);
 
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
 	flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
-	igt_output_override_mode(output, &data->switch_modes[LOW_RR_MODE]);
-	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[LOW_RR_MODE].vrefresh);
-	flip_and_measure(data, output, pipe, rate, 1, NSECS_PER_SEC);
-	igt_assert_f(igt_get_i915_edp_lobf_status(data->drm_fd, output->name),
-		     "LOBF not enabled\n");
+
+	step_size = (data->range.max - data->range.min) / 5;
+
+	for (vrefresh = data->range.max - step_size;
+	     vrefresh >= data->range.min; vrefresh -= step_size) {
+		igt_info("Testing LOBF with a %u hz flip rate on %u hz panel refresh rate\n",
+			 vrefresh, data->switch_modes[HIGH_RR_MODE].vrefresh);
+		rate[0] = igt_kms_frame_time_from_vrefresh(vrefresh);
+		flip_and_measure(data, output, pipe, rate, 1, NSECS_PER_SEC);
+
+		if (igt_get_i915_edp_lobf_status(data->drm_fd, output->name)) {
+			lobf_enabled = true;
+			break;
+		}
+	}
+
+	igt_assert_f(lobf_enabled, "LOBF not enabled\n");
 }
 
 static void
-- 
2.43.0

