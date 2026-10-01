Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11600CA5FCE
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 07:18:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4F210E1E1;
	Thu,  1 Oct 2026 07:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i0LNAbKz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C637810F598
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 07:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790838997; x=1822374997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UQhdD32naQ/R4O0JrG/YlgDw+nwRdc8t15VTPZTBsUA=;
 b=i0LNAbKzWlKV4Riu0xsE6uAhNNDYMiPA51gv3H+ULjKwy9/og8V3OF14
 2ti09vYaxSgfWQ6lAHQalWIsodLZ2wm4fOuDgtVQW8Bzr87YZ412SFzwg
 5eJX/T5+Lxe1cw9TE9hKtLIN/MZvZgxu+FtUW9zwSea0Ta0V0XteGn0Hu
 pBV+2Ht4p/gxaGKtn1PbMqOG3oV7WPtjgHH/hMMriv1LNYGMu/cghKQp2
 pJbS9iGCUwkqQXdMaruAk1ibWRf1/ibAxSgwZUKkWnNlGdn+mno5lnrT0
 wD5iyTERU9ELbP/BfijQGIwCemd4G40iLYJmpmFPS9vj6aY8eEIJQ7zwr w==;
X-CSE-ConnectionGUID: hyQlbpxZTAyLpGWxwft8PA==
X-CSE-MsgGUID: K3/ePBMHQN2fZ1xst6Pn3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91605985"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="91605985"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 00:15:46 -0700
X-CSE-ConnectionGUID: DT2WpXs1RX22MFq1zdPIrg==
X-CSE-MsgGUID: VPYYgzjFT+mvy/vvUEk6ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="279138306"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:15:45 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t 02/13] tests/intel/kms_dp_link_training: use
 i915_dp_is_uhbr_rate()
Date: Thu,  1 Oct 2026 13:06:52 +0530
Message-Id: <20261001073703.5067-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261001073703.5067-1-kunal1.joshi@intel.com>
References: <20261001073703.5067-1-kunal1.joshi@intel.com>
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

Remove the local duplicate of the UHBR check by switching to use
i915_dp_is_uhbr_rate() from lib/i915/i915_dp.h.

There should be no functional changes here.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
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

