Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668B8FF8860
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 12:18:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B78F10E720;
	Mon, 27 Apr 2026 12:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hFQIz8vA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8678510E718
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 12:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777292299; x=1808828299;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e3jck9kDZYgqZzKAGRiZc08U2g/lCxKtWvFG1ONQbHE=;
 b=hFQIz8vAItY2HvMirTlaqfyn6Xnz7ZLyPPz6fWTBCsiLJ7s1k33+tJY3
 L3lbLlh8bZjj580nJEOMtz018GyEF85mVbAqu2ZjXFdUd8Am8LN0PkW1D
 PrTvOxqXsMYyZfsX+MpBk9/k6oWtsLQHY2XMDSBaPBMPmg2x7w7U9oZFu
 0GkRqU369/Kxw6HHvGEwurU5zNgt0BDM35ZXsEVwjT2h4KWhaAixRUtY5
 x+cHOKmXFnp7x70hK93ef95U0XyBS1geb1SAdKs8z54C7t289blAtoAAe
 nuT9WJ8+31almOQkr4Icn/Dk6nOsEsXVKOXLYUjFD52mTRv8v+fZ9e5+Z w==;
X-CSE-ConnectionGUID: bBQTpkmfS+qF+6sIbwlDsw==
X-CSE-MsgGUID: BCPCuLKNR9Ggfs/HQti28Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78289673"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78289673"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 05:18:19 -0700
X-CSE-ConnectionGUID: y90fZGl3TsSpm67JwNO5mA==
X-CSE-MsgGUID: wfFOanFTQn270Q+txKwswQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="237587270"
Received: from shawnle1-i9-build-machine.itwn.intel.com ([10.225.64.200])
 by orviesa003.jf.intel.com with ESMTP; 27 Apr 2026 05:18:18 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Subject: [PATCH i-g-t] tests/kms_vrr: add support for full range refresh rate
 testing
Date: Mon, 27 Apr 2026 12:09:55 +0000
Message-Id: <20260427120955.3537070-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.34.1
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

Currently, kms_vrr tests fixed step increments within the VRR range.
To better validate hardware stability and potential issues across the
entire spectrum, this patch adds a 'full-range' testing mode.

When the full-range flag is enabled, the test will:
1. Iterate from the maximum to the minimum refresh rate (stepping by 1).
2. For standard testing, maintain the existing behavior of incrementing
   from minimum to maximum using the defined step size.

Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 tests/kms_vrr.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 6043d40f1d74..93bc9d3485ba 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -93,9 +93,10 @@ enum {
 	TEST_FLIPLINE = 1 << 3,
 	TEST_SEAMLESS_VRR = 1 << 4,
 	TEST_SEAMLESS_DRRS = 1 << 5,
-	TEST_SEAMLESS_VIRTUAL_RR = 1 << 6,
-	TEST_FASTSET = 1 << 7,
-	TEST_MAXMIN = 1 << 8,
+	TEST_SEAMLESS_VIRTUAL_RR_FAST = 1 << 6,
+	TEST_SEAMLESS_VIRTUAL_RR_FULL = 1 << 7,
+	TEST_FASTSET = 1 << 8,
+	TEST_MAXMIN = 1 << 9,
 	TEST_LINK_OFF = 1 << 10,
 	TEST_NEGATIVE = 1 << 11,
 	TEST_FORCE_RR = 1 << 12,
@@ -754,10 +755,12 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
 			       igt_output_t *output, uint32_t flags)
 {
 	uint32_t result;
-	unsigned int vrefresh;
+	int vrefresh;
 	uint64_t rate[] = {0};
 	uint32_t step_size;
+	int start, end, step;
 	drmModeModeInfo virtual_mode;
+	bool full_vrr_range = !!(flags & TEST_SEAMLESS_VIRTUAL_RR_FULL);
 
 	igt_info("Use HIGH_RR Mode as default\n");
 	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
@@ -795,7 +798,17 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
 		   (((data->range.max + data->range.min) / 2) + step_size) :
 		   data->range.min + step_size;
 
-	for ( ; vrefresh < data->range.max; vrefresh += step_size) {
+	if (full_vrr_range) {
+		start = data->range.max;
+		end = data->range.min;
+		step = -1;
+	} else {
+		start = data->range.min;
+		end = data->range.max;
+		step = step_size;
+	}
+
+	for (vrefresh = start; (step > 0) ? (vrefresh <= end) : (vrefresh >= end); vrefresh += step) {
 		virtual_rr_vrr_range_mode(&virtual_mode, vrefresh);
 
 		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
@@ -1103,7 +1116,11 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 
 		igt_describe("Test to switch to any custom virtual mode in VRR range without modeset.");
 		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
-			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
+			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR_FAST);
+
+		igt_describe("Test to switch to all virtual modes in VRR range without modeset.");
+		igt_subtest_with_dynamic("seamless-rr-switch-virtual-full")
+			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR_FULL);
 
 		igt_describe("Test to validate the link-off between active frames in "
 			     "non-PSR operation.");
-- 
2.34.1

