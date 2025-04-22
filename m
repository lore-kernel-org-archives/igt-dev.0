Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BD0C369D7
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 19:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46FF10E5FC;
	Tue, 22 Apr 2025 19:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mTxGQ9BW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F8610E3A3
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 19:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745350513; x=1776886513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rCyn13YcoRYuO4Mhq4orqcaKfxy/aRaLP3MetmX1b+g=;
 b=mTxGQ9BWQvLKcA+HN+exR7Gt1n6txTPzhFFYDF2CvKiTDoIg9CKqeN8k
 BvY28lq/QAARIAWYl5DfRNFwaSsweH97zP/NZqN0EE1JOevZaMVzJRv9r
 Gw4S+1gbk4rqvDJtcSxvNjxA5ywWgcgIqUU+SgIFKJv2re7U3cd7d80yB
 5bIWpv95PZNqskYia4j0DtqBrVmcvjWawm3+LwLivUt0qVfaSkGfqNKys
 rPEKvpXw2sTSyxiLgf2LyxpkYx3QIkqt+NQfc9/BH5Mz8kdT6khv4Qe6w
 hWqd1AsIwZTgWpyaEanX/2zLz97hY5EMyTcA4G/8C1+Anbqd93G25U63L w==;
X-CSE-ConnectionGUID: pMLyTT3eTBWN/4m+oOUPVQ==
X-CSE-MsgGUID: CwAQITZ5TrCuzG6+iUQFag==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57584551"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="57584551"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:35:13 -0700
X-CSE-ConnectionGUID: CUPXsYcvQV2d4rZ8BVVkzA==
X-CSE-MsgGUID: 845uT1SaR2yJYE/KBhUttQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="136892161"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:35:13 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 6/6] tests/intel/xe_oa: Drop pec_sanity_check_one
Date: Tue, 22 Apr 2025 12:34:58 -0700
Message-ID: <20250422193458.1467567-7-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250422193458.1467567-1-ashutosh.dixit@intel.com>
References: <20250422193458.1467567-1-ashutosh.dixit@intel.com>
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

We only care about delta between two reports, so pec_sanity_check_one() is
not needed, only retain pec_sanity_check_two.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 40 +++-------------------------------------
 1 file changed, 3 insertions(+), 37 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index c01adbad34..5324595995 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -994,40 +994,8 @@ accumulator_print(struct accumulator *accumulator, const char *title)
  * These equations are not exact due to fluctuations, but are precise when
  * averaged over long periods.
  */
-static void pec_sanity_check_one(const u32 *report)
-{
-	int xecore_idx[] = {3, 4, 5, 6, 21, 22, 23, 24};
-	u64 first, *pec = (u64 *)(report + 8);
-
-	igt_debug("\ttest_event1_cycles: %#lx\n", pec[2]);
-	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++)
-		igt_debug("\ttest_event1_cycles_xecore %d: %#lx\n", i, pec[xecore_idx[i]]);
-
-	/* Compare against the first non-zero test_event1_cycles_xecore* */
-	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++) {
-		first = pec[xecore_idx[i]];
-		if (first)
-			break;
-	}
-
-	/* test_event1_cycles_xecore* should be within an epsilon of each other */
-	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++) {
-		int n = xecore_idx[i];
-
-		igt_debug("n %d: pec[n] %#lx, first %#lx\n", n, pec[n], first);
-		/* 0 value for pec[xecore_idx[i]] indicates missing xecore */
-		if (pec[n])
-			assert_within_epsilon(pec[n], first, 0.1);
-	}
-
-	igt_debug("first * num_xecores: %#lx, pec[2] %#lx\n",
-		  first * intel_xe_perf->devinfo.n_eu_sub_slices, pec[2]);
-	/* test_event1_cycles should be close to (test_event1_cycles_xecore* * num_xecores) */
-	assert_within_epsilon(first * intel_xe_perf->devinfo.n_eu_sub_slices, pec[2], 0.1);
-}
-
-static void pec_sanity_check_two(const u32 *report0, const u32 *report1,
-				 struct intel_xe_perf_metric_set *set)
+static void pec_sanity_check(const u32 *report0, const u32 *report1,
+			     struct intel_xe_perf_metric_set *set)
 {
 	u64 tick_delta = oa_tick_delta(report1, report0, set->perf_oa_format);
 	int xecore_idx[] = {3, 4, 5, 6, 21, 22, 23, 24};
@@ -1087,9 +1055,7 @@ static void pec_sanity_check_reports(const u32 *report0, const u32 *report1,
 	dump_report(report0, set->perf_raw_size, "pec_report0");
 	dump_report(report1, set->perf_raw_size, "pec_report1");
 
-	pec_sanity_check_one(report0);
-	pec_sanity_check_one(report1);
-	pec_sanity_check_two(report0, report1, set);
+	pec_sanity_check(report0, report1, set);
 }
 
 /* The TestOa metric set is designed so */
-- 
2.48.1

