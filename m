Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A655FCCD190
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 06:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F4C10E299;
	Wed, 15 Oct 2025 06:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="APmDhdB+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18AC10E299
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 06:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760509783; x=1792045783;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GJ50bx/FMHIDrWcEyrCVV0WhmmpxFZKPLLtWhjOvbHg=;
 b=APmDhdB+EYPocm0Yx7yEq1Amh5kErSor6rkVcDCzgOIt1KcKQdYducmu
 1wlSkRGEoQUqjqLsYysXKxgQxvd+xA4qr1CfSs5jalzCwLmB0X2ML6ebc
 //UZDCIJPKyumBhfACw+1Q+fxKdpxTnS2ntSeeNpQRd3XU02swr46YYb6
 uxDHpDvVMHKIGI8t4kHXItYMiN115SDHc4/z2MAFBFqwOYHo1tFZrERWa
 OresA6fTAUzO/dTnNRY0ns0JOYs7X5646F/125fFoWPXSLp7T5aGmZ8PQ
 goUFkPBS24itDTCqqUZ7vMmtJ1v77kaFpHVmtuyTqid7TvzuLCocEc+zI A==;
X-CSE-ConnectionGUID: O2s8cuGlRoqAa/j8LsXdJQ==
X-CSE-MsgGUID: BUjFMh0UTryDCrNkpl3ceA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66503640"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66503640"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 23:29:42 -0700
X-CSE-ConnectionGUID: XZ3wpENoTPymC4ruL0NZ8A==
X-CSE-MsgGUID: OR4PJRVpRoa7vsgjVWon1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="182559278"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 23:29:41 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 2/2] tests/kms_vrr: Reduce unnecessary logging in
 specific test cases
Date: Wed, 15 Oct 2025 11:59:22 +0530
Message-ID: <20251015062922.447336-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015062922.447336-1-ramanaidu.naladala@intel.com>
References: <20251015062922.447336-1-ramanaidu.naladala@intel.com>
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

Add a way to control log output based on the test scenario. This
helps avoid printing detailed information when it's not needed,
making the logs cleaner and easier to read.

v2: Add info logs.
v3: Split the patch.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 1e4d9cdac..0c439bcd9 100644
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
-	}
-	igt_info("]\n");
+	if (data->flag != TEST_LINK_OFF) {
+		igt_info("Completed %u flips, %u were in threshold for [", total_flip, total_pass);
 
-	return total_flip ? ((total_pass * 100) / total_flip) : 0;
+		for (int i = 0; i < num_rates; ++i) {
+			igt_info("(%llu Hz) %" PRIu64 "ns%s", (NSECS_PER_SEC / rates_ns[i]),
+				 rates_ns[i], i < num_rates - 1 ? "," : "");
+		}
+		igt_info("]\n");
+
+		return total_flip ? ((total_pass * 100) / total_flip) : 0;
+	}
+	return 0;
 }
 
 static uint32_t
@@ -875,6 +881,7 @@ test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
 	prepare_test(data, output, pipe);
+	data->flag = flags;
 
 	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
 		 output->name, kmstest_pipe_name(pipe), data->range.min, data->range.max);
@@ -886,6 +893,9 @@ test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 	for (vrefresh = data->range.max - step_size;
 	     vrefresh >= data->range.min; vrefresh -= step_size) {
+		igt_info("Testing LOBF with a %u hz flip rate on %u hz panel refresh rate\n",
+			 vrefresh, data->switch_modes[HIGH_RR_MODE].vrefresh);
+
 		rate[0] = igt_kms_frame_time_from_vrefresh(vrefresh);
 		flip_and_measure(data, output, pipe, rate, 1, NSECS_PER_SEC);
 
-- 
2.43.0

