Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED10CCD190
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 07:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6A910E71E;
	Wed, 15 Oct 2025 07:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KjpCBTx6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1725210E276
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 07:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760513734; x=1792049734;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hS5GD+R7R/2obOsw2xwPeik88DButkP+u1qZ0jiFb2w=;
 b=KjpCBTx6n7MRaA/DHjp//62ZVpYfFGnCKGAdyyrYHH23LZyvWrPVwsQe
 bNMszzQfoSWOrAR1nMLZk9/vcVa/VF6gTu5ONOPDBdjDzggeELQH02NFj
 A190EjyEhYQhF5f0VkT8ktJFaqqVVKy5Te2K2c0SIwDFmvn2WbCyukXS4
 ZZLCYAsKstU9DTB7nPeYO2LtteFac2P19G+SkAv3Z+WnmOpRnYMULAdmD
 clYXVhL4N7U8PiAfEpDhhpcPg5+uAH7qwA4JFFjQg/KmpO/ZM8eKvysEN
 2rAP/hK5P7pAmAbOWDXs3u0KuJ/BIOXyaGKCLQbc1Ec1bx4M0Ja7sxHQ3 g==;
X-CSE-ConnectionGUID: rMR8W65kSImSWr3naEeyrw==
X-CSE-MsgGUID: Ep4xCJe0S0mRb1zbzCiZYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62573603"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="62573603"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 00:35:24 -0700
X-CSE-ConnectionGUID: dVLzgJP2SOqB5nR30KNnaA==
X-CSE-MsgGUID: bb9h2j0nQ5ii++cunCIGNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="182882168"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 00:35:23 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v4 2/2] tests/kms_vrr: Reduce unnecessary logging in
 specific test cases
Date: Wed, 15 Oct 2025 13:05:08 +0530
Message-ID: <20251015073508.448186-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015073508.448186-1-ramanaidu.naladala@intel.com>
References: <20251015073508.448186-1-ramanaidu.naladala@intel.com>
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
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_vrr.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 580527c59..1d9e579b0 100644
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

