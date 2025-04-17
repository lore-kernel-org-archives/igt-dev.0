Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5176C369CA
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 09:51:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5875510EA81;
	Thu, 17 Apr 2025 09:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kvpY5dXV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBCF10EA7E
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 09:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744883479; x=1776419479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PUAFoY4/mKW194b7+HHvPZVFF7cQFT4TFRzHYjWC+24=;
 b=kvpY5dXVGYHf/PnWNTYUpSWLHJ540A3wXixAqVEdkHbDZJk4Hg+qUZHR
 zwmr+uB9zK9DLcTeiqWamo/ZCt564+E1bXrwhdBB6JKmmoBvUK7GIvj+/
 19fXULYFtdweZ+GOGtZ0UQULTKVt+OUUnMVbwl2MhGx51UuW1lifM85TH
 ZxJ9RD33SdPOeF73auHRongf/m5F3RazhM/cUT9Sql8JgV2+oQgZ6xN8I
 fD9NtFHUDKcMGTLk/sxjdEI7JSDQU51sT8bcNIOowbpN2dxTjneKSqUjW
 28CDFgmrwfqf69dfwy17AAhzdFQe+hvcBWF2qYmgl3NQLyPHdY15lZF6/ w==;
X-CSE-ConnectionGUID: nOarAWEVTP2ehVkTqbU3hQ==
X-CSE-MsgGUID: j3mTHVr8S0SYKCXTVggFcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45695997"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="45695997"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 02:51:18 -0700
X-CSE-ConnectionGUID: JvfCkRDCSrqrstvSjAIjXA==
X-CSE-MsgGUID: +NMIMwQBT8qRX4bAdE7Raw==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="135564772"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa005.fm.intel.com with ESMTP; 17 Apr 2025 02:51:17 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	ramanaidu.naladala@intel.com
Subject: [PATCH v5 1/2] tests/kms_vrr: Bucketize refresh rate tolerance
Date: Thu, 17 Apr 2025 15:19:06 +0530
Message-ID: <20250417094908.1795432-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250417094908.1795432-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20250417094908.1795432-1-mitulkumar.ajitkumar.golani@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Reduce false failures while preserving timing accuracy. Introduce
a small tolerance buffer based on refresh rate which accounts for
HW/SW latency without compromising validation on HRR panel.
Although an imperical number but already IGT is living with that.
This also ensures that asked refresh rate is not too off and always
catch the real HW/software issues.

--v2:
Refresh rate criteria changes.

--v3:
Comment changes (Uma).

--v4:
Use pre-table for refresh rate checks (Ankit).
Commit message changes (Ankit).

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 84 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 81 insertions(+), 3 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index c4bb30f6a..182e7c2fa 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -124,6 +124,24 @@ typedef struct vtest_ns {
 	uint64_t max;
 } vtest_ns_t;
 
+typedef struct tolerance_config{
+	int min_rate;	/* Min refresh rate in Hz */
+	int max_rate;	/* Max refresh rate in Hz */
+	int tolerance;	/* Tolerance in Hz */
+} tolerance_config_t;
+
+/*
+ * Tolerance values are determined based on predefined ranges
+ * ≤ 120 Hz: ±1
+ * 121-240 Hz: ±10
+ * > 240 Hz: ±20
+ */
+tolerance_config_t tolerance_table[] = {
+	{1, 120, 1},
+	{121, 240, 10},
+	{241, INT_MAX, 20}
+};
+
 typedef struct data {
 	igt_display_t display;
 	int drm_fd;
@@ -410,6 +428,59 @@ do_flip(data_t *data, igt_fb_t *fb)
 	igt_reset_timeout();
 }
 
+static void
+calculate_tolerance(uint64_t *threshold_hi, uint64_t *threshold_lo, uint64_t rates_ns)
+{
+	uint32_t refresh_rate = NSECS_PER_SEC / rates_ns;
+
+	if (refresh_rate <= 0)
+		return;
+
+	/*
+	 * Current IGT implementation follows this sequence:
+	 * 1. Perform a page flip (`do_flip`).
+	 * 2. Wait for the flip completion event.
+	 * 3. Compare the timestamp of the flip completion event with the previous frame’s
+	 *    completion timestamp.
+	 * 4. Adjust CPU cycle burning based on the relative frame time.
+	 * 5. Tolerance Check: Determine if the flip completion time falls within
+	 *    the acceptable range.
+	 *
+	 * We set a tolerance value as the acceptable range of time within which a
+	 * flip completion event should occur. If a flip completes too early or too
+	 * late, it is marked as out of tolerance.
+	 * As a result, additional CPU cycles are burned to match the `target_ns`.
+	 * Even if the next frame is on time, the total frame time now includes:
+	 * Burned CPU cycle time (from the previous frame) + Flip completion event time.
+	 * This leads to miscalculation, causing **false out-of-range detections**.
+	 * The impact is more significant on High Refresh Rate (HRR) panels, where:
+	 * The allowed tolerance window is smaller and more correction time is required.
+	 * i.e. for 210hz (4.762ms), allowed range is 209hz(4.784ms) to 211hz(4.739ms).
+	 * This comes just 23 microsecond tolerance, which is much lesser
+	 * for accounting HW/SW latency, CPU burn cycle latency and correction logic
+	 * applied in igt for validation.
+	 *
+	 * To address this implement a Bucketing Strategy:
+	 * Provide a small tolerance buffer to allow IGT tests to account for correction.
+	 * Based on range of asked refresh rate. This prevents excessive failures due to minor
+	 * timing adjustments.
+	 */
+
+	for (int i = 0; i < ARRAY_SIZE(tolerance_table); i++) {
+		if (refresh_rate >= tolerance_table[i].min_rate &&
+		    refresh_rate <= tolerance_table[i].max_rate) {
+			*threshold_hi =
+				NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) +
+							tolerance_table[i].tolerance);
+			*threshold_lo =
+				NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) -
+							tolerance_table[i].tolerance);
+
+			return;
+		}
+	}
+}
+
 /*
  * Flips at the given rate and measures against the expected value.
  * Returns the pass rate as a percentage from 0 - 100.
@@ -439,9 +510,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 		else
 			exp_rate_ns = vtest_ns.max;
 
-		/* Allow ~1 Hz deviation for different reasons causing delay. */
-		threshold_hi[i] = NSECS_PER_SEC / (((float)NSECS_PER_SEC / exp_rate_ns) + 1);
-		threshold_lo[i] = NSECS_PER_SEC / (((float)NSECS_PER_SEC / exp_rate_ns) - 1);
+		calculate_tolerance(&threshold_hi[i], &threshold_lo[i], exp_rate_ns);
 
 		igt_info("Requested rate[%d]: %"PRIu64" ns, Expected rate between: %"PRIu64" ns to %"PRIu64" ns\n",
 				i, rates_ns[i], threshold_hi[i], threshold_lo[i]);
@@ -497,6 +566,15 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 		wait_ns -= diff_ns;
 		target_ns = event_ns + wait_ns;
 
+		/*
+		 * FIXME: This logic makes next immediate frame time calculation
+		 * in inconsistent state, even if next flip comes on correct time,
+		 * it will be marked as fail due to time difference from previous
+		 * flip. Needs to reset at every cycle for correct measurement.
+		 * Once this is corrected, igt/test can ask for more stricter pass
+		 * criteria.
+		 */
+
 		while (get_time_ns() < target_ns - 10);
 	}
 
-- 
2.48.1

