Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0D9CD98F2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 06:33:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448FF10ECB3;
	Thu, 18 Jun 2026 06:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cUSzHowM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF9D10EC4A
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 06:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781764159; x=1813300159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5KUbiK5+sYvgzRFN3+xEputeB3nJAa2zL+cqPlaybng=;
 b=cUSzHowM1W0VIptWguG15dZ3jG38QFRPnvAx4p4l0MtFKg0dNlhJIYcS
 r6sQXvtnxoPvVfgi0Xt1NEwf1UiZMRkVD5ItjqMxHzlB1QB9ImTCC7e35
 HtPAK+GtHoNVAYhIIODdYnl0l1HCSeike6u356WC1n/Zz5P+p46iBEyVJ
 1HhAr1nkoj8/0Nq99XlA6q2010tl3E2eLF4bbOQiR0yJkZ6/tMoh3tOjB
 TIFDEo0zEvZX+rkWFbCVVxsSKT++0mYkU2dObeml4ewDZcHZkxfN10i3P
 tP05zf15lxofr+UNSPzm7/gKg121KfaNGtbPAzLeMz8ypRAQ2EhEGisd5 w==;
X-CSE-ConnectionGUID: Gt/V3o06Tm2kbi0DYMUx0w==
X-CSE-MsgGUID: uaq3c9WJTNi2kP0ndij04Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82485874"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="82485874"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 23:29:18 -0700
X-CSE-ConnectionGUID: 9xbUTjdHSC+IFLMdlbEAGg==
X-CSE-MsgGUID: lhlATmkYTxSgGWly+BhjVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="245343000"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:29:17 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v10 2/7] tests/intel/kms_pm_dc: Replace require with
 proper assertion
Date: Thu, 18 Jun 2026 11:58:59 +0530
Message-ID: <20260618062904.2789476-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618062904.2789476-1-jeevan.b@intel.com>
References: <20260618062904.2789476-1-jeevan.b@intel.com>
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

The DC3CO video playback simulation test was incorrectly using require at
the end to check if DC3CO state was entered. This causes the test to be
marked as SKIP instead of FAIL when DC3CO doesn't work properly, hiding
real issues. So changing the call from require to assert.

Fixes: b89efa8048e58 ("tests/i915/i915_pm_dc: Check dc3co count to skip the test")
Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 4e8720c6e..73607e764 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -319,8 +319,7 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
 		usleep(delay);
 	}
 
-	igt_require_f(igt_dc_state_wait_entry(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO,
-					      dc3co_prev_cnt), "dc3co-vpb-simulation not enabled\n");
+	assert_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_prev_cnt);
 }
 
 static void setup_dc3co(data_t *data)
-- 
2.43.0

