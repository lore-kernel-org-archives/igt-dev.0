Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67B6C47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 09:46:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C7010E208;
	Thu, 25 Jan 2024 09:46:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F9210F886
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 09:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706175989; x=1737711989;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5nYwjX9Jgl3uyx5VXAI6T0Lw/z02AsvkLyj8I5YnbZA=;
 b=mpnOfmdBPfSEh+9nzMK1yS9MQGVsYzM9fSLEyYw0aTaNh6HItpGuMuIb
 xul18/B+rfjx5cv5OQg85Jo+/ufX0bSwe32I8i9VuDAHjr5SB8VIK+tFE
 PPVQghRzPj4IUtK9NQ6C+2iJ2k4bkNAJDt/xMK1Cr+RRheb4ul6Pu30kQ
 NxX87EZxXagAtZwL+91B3BfsoYkFwu4ZRE1V84RTIz618VgiRqqJqLtiX
 1YTdIu6RCDUFjnBFIEvwDQ5RMd+NCu9WBFvb/72cZ1DK0n8JSjHp6AfE6
 02kNfne+zfRp1goZa0f3YZThixTi+DSjq54ebCfRZDTi/zAfrpmC6ZqaI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="392523035"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="392523035"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 01:46:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="736263634"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="736263634"
Received: from vsrini4-xps-8920.iind.intel.com (HELO localhost.localdomain)
 ([10.223.163.48])
 by orsmga003.jf.intel.com with ESMTP; 25 Jan 2024 01:46:16 -0800
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/kms_vrr: Reset to High refresh rate before begin
 drrs test
Date: Thu, 25 Jan 2024 14:59:57 +0530
Message-Id: <20240125092957.9518-1-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <0240125055825.8915-1-vidya.srinivas@intel.com>
References: <0240125055825.8915-1-vidya.srinivas@intel.com>
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

Sink with DRRS and VRR can be in downclock mode,
so switch to High clock mode as test preparation.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_vrr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 44bc3480d..697697b4e 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -522,6 +522,14 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 
 	if (vrr)
 		set_vrr_on_pipe(data, pipe, false, true);
+	else {
+		/*
+		 Sink with DRRS and VRR can be in downclock mode.
+		 so switch to High clock mode as test preparation
+		*/
+		igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
+		igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
+	}
 
 	rate = vtest_ns.max;
 	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
-- 
2.33.0

