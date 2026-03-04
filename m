Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DBEEDEC04
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 04:37:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764A310E94C;
	Wed,  4 Mar 2026 04:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H7swq3Ft";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D49110E94C
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 04:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772599070; x=1804135070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Jcr3KS6vKv980XA+Qde4HVaHirZNFF+79WTDrKm0tM=;
 b=H7swq3FtczGyYbMMa+TU4DqUw2UwM56ZPl8mHJRwHAjb6fnkGuDUJvWp
 Qn5/WlEEY2hYRH4ZWQfoWRLedCKckh5vLosqssKlg4iYYGJr3baLnCSKL
 obQD/dPslKUUT9rkCd+PoQwjXfqRB6dDcN3FxLe9Sj3Phfqrubb7Jex/I
 46FAECvMeWhi4RESNGPGcrEOgbQemDLEkQw8TiwwlxKtBCkS5yUWVR9OY
 PtQR/CyI7fVy022cnraYHUEjOJgMxkBjZktC3aQvZB1FeO2e7KvUiffcq
 DINU4dtdeEAZ9qdHQsvQvI8CDTuP44KuPhEdWySbtbhwnbY9jQkyzysQ/ Q==;
X-CSE-ConnectionGUID: ej6V++YLQViSV45AxVdnBw==
X-CSE-MsgGUID: CN+8/A2xSSOW07xF4EtHvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73560237"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="73560237"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 20:37:50 -0800
X-CSE-ConnectionGUID: tVWogF8RQxO6/aUHjgNVeg==
X-CSE-MsgGUID: a0DCmUpISUC6V6lNHvprkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="218332559"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 20:37:48 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/4] tests/intel/kms_pm_dc: Replace require with proper
 assertion
Date: Wed,  4 Mar 2026 10:08:02 +0530
Message-ID: <20260304043805.572087-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304043805.572087-1-jeevan.b@intel.com>
References: <20260304043805.572087-1-jeevan.b@intel.com>
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
---
 tests/intel/kms_pm_dc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 39e94f36b..507b6168d 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -312,8 +312,7 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
 		usleep(delay);
 	}
 
-	igt_require_f(igt_dc_state_wait_entry(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO,
-					      dc3co_prev_cnt), "dc3co-vpb-simulation not enabled\n");
+	check_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_prev_cnt);
 }
 
 static void setup_dc3co(data_t *data)
-- 
2.43.0

