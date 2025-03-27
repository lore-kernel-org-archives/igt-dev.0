Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E57C3600C
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 08:42:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434B110E884;
	Thu, 27 Mar 2025 08:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WtQ1kZQX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B73F10E881
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 08:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743064974; x=1774600974;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4UfW4Wr6urmEsV4b3oJH6N7/MZRRR1ceVSdzSliHaG0=;
 b=WtQ1kZQXNPLSAE974XezaLTcuLcroDEe0QNgjfW2NtpJNxBO0j0wA91t
 nNWBdyV0Vnww8ioEybCq0L7yWFICQFHZHOYmASgVGdraEQF/N0/zhKX+Z
 jk0sGFGyop6C5dFJfCJJ4CtTAH++uF4hwVJy9aBCqr1KYpAQzUk2tcGEX
 fGQagYtV6kbJuTvSlCwzWZrLhqgZzXZxzhoOt+5T0uVgeb4UntDOwLdcu
 NCrB0orrklFZWcyDTAOY/zKE1wtvsYYK5AUJ9c5c0fwCxnz7zSCcVvNT0
 vqqSZQxHNNQ1fWBcPxjVo1+3ObAAAvyIb1y/KwzLM3g9fQ+UC9a98AGLk Q==;
X-CSE-ConnectionGUID: XT2s8SvXRmaWI+xh7edRHQ==
X-CSE-MsgGUID: ayJziSdLTLySgWdTuGjpmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43539572"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="43539572"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 01:42:54 -0700
X-CSE-ConnectionGUID: 0XM8zP9DTzWv6Wfcti+95A==
X-CSE-MsgGUID: OP6DbaMJScSPOhMaQa2UOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="129920462"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa003.jf.intel.com with ESMTP; 27 Mar 2025 01:42:52 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, ramanaidu.naladala@intel.com,
 mitulkumar.ajitkumar.golani@intel.com, ankit.k.nautiyal@intel.com
Subject: [PATCH v1 1/2] tests/kms_vrr: Bucketize refresh rate tolerance
Date: Thu, 27 Mar 2025 14:10:25 +0530
Message-ID: <20250327084027.622793-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250327084027.622793-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20250327084027.622793-1-mitulkumar.ajitkumar.golani@intel.com>
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

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 tests/kms_vrr.c | 48 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index c4bb30f6a..cca2bce14 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -410,6 +410,50 @@ do_flip(data_t *data, igt_fb_t *fb)
 	igt_reset_timeout();
 }
 
+static void
+calculate_tolerance(uint64_t *threshold_hi, uint64_t *threshold_lo, uint64_t rates_ns)
+{
+	if (NSECS_PER_SEC/rates_ns < 0)
+		return;
+
+	/*
+	 * Current IGT implementation follows this sequence:
+	 * 1. Perform a page flip (`do_flip`).
+	 * 2. Wait for the flip completion event.
+	 * 3. Compare the timestamp of the flip completion event with the previous frame’s completion timestamp.
+	 * 4. Adjust CPU cycle burning based on the relative frame time.
+	 *
+	 * If a flip completes too early or too late, it is marked as out of tolerance.
+	 * As a result, additional CPU cycles are burned to match the `target_ns`.
+	 * Even if the next frame is on time, the total frame time now includes:
+	 * Burned CPU cycle time (from the previous frame) + Flip completion event time.
+	 * This leads to miscalculation, causing **false out-of-range detections**.
+	 * The impact is more significant on High Refresh Rate (HRR) panels, where: The allowed tolerance
+	 * window is smaller and more correction time is required. i.e. for 210hz (4.762ms), allowed range is
+	 * 209hz(4.784ms) to 211hz(4.739ms). This comes just 23 microsecond tolerance, which is much lesser
+	 * for accounting HW/SW latency, CPU burn cycle latency and correction logic applied in igt for
+	 * validation.
+	 *
+	 * To address this implement a Bucketing Strategy:
+	 * Provide a small tolerance buffer to allow IGT tests to account for correction. based on range of
+	 * asked refresh rate. This prevents excessive failures due to minor timing adjustments.
+	 * Although an imperical number but already IGT is living with that.
+	 * This also ensures that asked refresh rate is not too off and always catch the real HW/software 
+	 * latencies.
+	 */
+
+	if (rates_ns <= 120) {
+		*threshold_hi = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) + 1);
+		*threshold_lo = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) - 1);
+	} else if (rates_ns >= 120 && rates_ns <= 240) {
+		*threshold_hi = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) + 5);
+		*threshold_lo = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) - 5);
+	} else {
+		*threshold_hi = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) + 10);
+		*threshold_lo = NSECS_PER_SEC / (((float)NSECS_PER_SEC / rates_ns) - 10);
+	}
+}
+
 /*
  * Flips at the given rate and measures against the expected value.
  * Returns the pass rate as a percentage from 0 - 100.
@@ -439,9 +483,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 		else
 			exp_rate_ns = vtest_ns.max;
 
-		/* Allow ~1 Hz deviation for different reasons causing delay. */
-		threshold_hi[i] = NSECS_PER_SEC / (((float)NSECS_PER_SEC / exp_rate_ns) + 1);
-		threshold_lo[i] = NSECS_PER_SEC / (((float)NSECS_PER_SEC / exp_rate_ns) - 1);
+		calculate_tolerance(&threshold_hi[i], &threshold_lo[i], exp_rate_ns);
 
 		igt_info("Requested rate[%d]: %"PRIu64" ns, Expected rate between: %"PRIu64" ns to %"PRIu64" ns\n",
 				i, rates_ns[i], threshold_hi[i], threshold_lo[i]);
-- 
2.48.1

