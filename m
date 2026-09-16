Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1FBC88E5C
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 04:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4F310E03E;
	Wed, 16 Sep 2026 04:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iCsv/cQO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FC010E03E
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 04:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789532795; x=1821068795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JwU/N+3kvn0QDk8UyrJBaUlueFXDardab/8ij30E1T0=;
 b=iCsv/cQO6AErnLNOnen8odEf7lOUPgHCvH9kagOMfmYidnWIRJC90z1H
 GZjwkYOWmZp3KiGwEGCCaWbK+kCSSzBcPVndL1k+BFSYhjH76eKOVSp58
 1Bf4e1RJm4zzH0bixEvvQEd189kDWSR/uJ6YkUo7cGFuxnR1DWdc2vMu1
 ky5iN/WBCkj657rm1mioZvWiXWn9mTzE2YTBhbG7Csn2W2yUZjnPP6nTK
 ccS8RIQMjhkrjAdyBs4lqhfzNI7lPrsWpcOaXUmyxWxVDSyg4ZzBEPRAl
 ZF0eRKzCbqDGlqIhRTUOh36b1+UVUf/5uLHeiqSw0rbQr+hgnBaN3eze9 g==;
X-CSE-ConnectionGUID: s1voZk1iQNW8WTlrsTaFaQ==
X-CSE-MsgGUID: nj7rPcvVT36HjDmd0WJxkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100503240"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100503240"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 21:26:35 -0700
X-CSE-ConnectionGUID: hk0bG9S4SLixE3aMxv5m1g==
X-CSE-MsgGUID: dpE27pEzSMKTmqOK9pqJoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271765028"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 21:26:35 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 02/13] tests/intel/kms_dp_link_training: Use the UHBR
 helpers from lib
Date: Wed, 16 Sep 2026 10:17:50 +0530
Message-Id: <20260916044801.1279102-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260916044801.1279102-1-kunal1.joshi@intel.com>
References: <20260916044801.1279102-1-kunal1.joshi@intel.com>
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

The test defines its own UHBR_LINK_RATE and open codes the UHBR
comparison, while lib/i915/i915_dp.h already has
I915_DP_UHBR10_LINK_RATE and i915_dp_is_uhbr_rate() for exactly that.

Drop the local define and use the lib helpers.

There should be no functional changes here.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_link_training.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index f67fdf59d..2d5241246 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -27,11 +27,6 @@
 #include "intel/kms_joiner_helper.h"
 #include "intel/kms_mst_helper.h"
 
-/*
- * DP Spec defines 10, 13.5, and 20 Gbps as UHBR.
- * Anything below that is considered NON-UHBR.
- */
-#define UHBR_LINK_RATE	1000000
 #define RETRAIN_COUNT	1
 
 typedef struct {
@@ -217,7 +212,7 @@ static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
 	max_lane_count = i915_dp_get_max_lane_count(data->drm_fd, data->output);
 
 	/* Check sink supports uhbr or not */
-	is_uhbr_output = (max_link_rate >= UHBR_LINK_RATE);
+	is_uhbr_output = i915_dp_is_uhbr_rate(max_link_rate);
 	if ((uhbr && !is_uhbr_output) || (!uhbr && is_uhbr_output)) {
 		igt_info("Test expects %s, but output %s is %s.\n",
 			 uhbr ? "UHBR" : "NON-UHBR",
@@ -244,9 +239,7 @@ static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
 	igt_info("Current link rate is %d\n", current_link_rate);
 	igt_assert_f(current_link_rate == max_link_rate,
 		     "Link training did not succeed at max link rate.\n");
-	igt_assert_f(is_uhbr_output ?
-		     current_link_rate >= UHBR_LINK_RATE :
-		     current_link_rate < UHBR_LINK_RATE,
+	igt_assert_f(i915_dp_is_uhbr_rate(current_link_rate) == is_uhbr_output,
 		     is_uhbr_output ? "Link training didn't happen at uhbr rates" :
 		     "Link training didn't happen at non-uhbr rates");
 	igt_info("----------------------------------------------------\n");
-- 
2.25.1

