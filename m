Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C1AC47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 06:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BD910F7DB;
	Thu, 25 Jan 2024 06:14:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C90A10F7DB
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 06:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706163288; x=1737699288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KFu8PMQcSLcurrS2nrCM79lZHpp+zVhm2rzaosj348c=;
 b=j7t8zOLWuqBf3tkxIEEomAXhFnAfOxnfupGBidEQtP3ec82Nwyk1oxfg
 HtYP9M4j7uHCxT11lAI9H1uPCVgwcWAxyUrrEqqCqqa0MOkjVeYEfC98t
 M0Kx5j9XifeXXoVsrT/7l83aJrMlrJiR3n6w4MVptI14lmSjCj9+0hjP+
 um38HHPmRDC4aRIuMDpEb27DhgPJ3WZB7AY77x1zwOM7xO8DOe0CGAMFF
 tkwL1myv6rCUUxwhdeDN4xsebCNw5jhnpAGQd49cJgt+6Vu5yp53zrG7i
 9Y/pfFyyhZy2rJvCSlHOvik0F4ipwF2O3dzaYE9NieHWcVUX7Ch3zfKP7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8726006"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8726006"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 22:14:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="736221787"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="736221787"
Received: from vsrini4-xps-8920.iind.intel.com (HELO localhost.localdomain)
 ([10.223.163.48])
 by orsmga003.jf.intel.com with ESMTP; 24 Jan 2024 22:14:45 -0800
From: Vidya Srinivas <vidya.srinivas@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/kms_vrr: Reset to High refresh rate before begin
 drrs test
Date: Thu, 25 Jan 2024 11:28:25 +0530
Message-Id: <20240125055825.8915-1-vidya.srinivas@intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20240123041403.31259-1-vidya.srinivas@intel.com>
References: <20240123041403.31259-1-vidya.srinivas@intel.com>
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
 tests/kms_vrr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 44bc3480d..07b50cb4c 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -522,6 +522,10 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 
 	if (vrr)
 		set_vrr_on_pipe(data, pipe, false, true);
+	else {
+		igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
+		igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
+	}
 
 	rate = vtest_ns.max;
 	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
-- 
2.33.0

