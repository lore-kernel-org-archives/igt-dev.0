Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03644C83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 21:24:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0EB710E4E6;
	Mon, 14 Jul 2025 21:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kaEJq9Bu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1ED10E4E6
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 21:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752528265; x=1784064265;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x/kKXl+K80g9PW7arpkDOzpravzq7JhjYtiVxIDcQCc=;
 b=kaEJq9Busoihoc7rLa528VnG/0MOSi1zXmWR1QkPpQAYujh9FFL/2tKM
 IwSqAMvRA7ioZ5YFNYWTwpJqW7mdtUNmN4iSugwy83Yc8ul9U3riXY0j2
 axSS2FoMPXBmaaA3NdiVVNfzJl/n20fR6H8uQJrNJuS6dUytsIYm9WifR
 DDDuPISZvEVpqwWrF6mcVBxb+lMOMXJBu3z/W6gBaEzhn3idcdJQqzLl7
 jEapcVT/sRNnjFa6XKyqE0+a//BzyM/vtUjkapknZW271snm4mo5GBSEN
 iEqVHPim3lBQRv48+x+JLt3CbVilAIRBDCDpRmLAhdk4G98i8S1gkiZnX A==;
X-CSE-ConnectionGUID: fC2reGyFTNevlSN5IU37tA==
X-CSE-MsgGUID: nDe2isMaSW2ZCRgCq4cDLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54604190"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="54604190"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 14:24:25 -0700
X-CSE-ConnectionGUID: yqxFCMJHQKyuMcInemA25A==
X-CSE-MsgGUID: vXfBM3x9QN6gcr4ebZxWXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="157380850"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 14:24:23 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe-oa: Use subslice_mask in pec_sanity_check
Date: Mon, 14 Jul 2025 14:24:11 -0700
Message-ID: <20250714212411.2325726-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

pec_sanity_check previously relied on pec counter values being 0 to ignore
missing xecores's. However we are now running into situations where pec
counters are non-zero even when xecores are missing. To get past this, use
subslice_mask (i.e. mask of present xecore's) to ignore missing xecore's.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 724fea73f0..2de5802876 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -1023,12 +1023,12 @@ static void pec_sanity_check(const u32 *report0, const u32 *report1,
 
 		igt_debug("n %d: pec1[n] - pec0[n] %#" PRIx64 ", tick delta %#" PRIx64 "\n",
 			  n, pec1[n] - pec0[n], tick_delta);
-		/* 0 value for pec[xecore_idx[i]] indicates missing xecore */
-		if (pec1[n] && pec0[n])
+
+		/* Skip missing xecore's */
+		if (intel_xe_perf->devinfo.subslice_mask & BIT(i)) {
+			igt_assert(pec1[n] && pec0[n]);
 			assert_within_epsilon(pec1[n] - pec0[n], tick_delta, 0.1);
-		/* Same test_event1_cycles_xecore* should be present in all reports */
-		if (pec1[n])
-			igt_assert(pec0[n]);
+		}
 	}
 
 	igt_debug("pec1[2] - pec0[2] %#" PRIx64 ", tick_delta * num_xecores: %#" PRIx64 "\n",
@@ -1201,6 +1201,7 @@ init_sys_info(void)
 	igt_debug("n_eu_slices: %"PRIu64"\n", intel_xe_perf->devinfo.n_eu_slices);
 	igt_debug("n_eu_sub_slices: %"PRIu64"\n", intel_xe_perf->devinfo.n_eu_sub_slices);
 	igt_debug("n_eus: %"PRIu64"\n", intel_xe_perf->devinfo.n_eus);
+	igt_debug("subslice_mask: %#"PRIx64"\n", intel_xe_perf->devinfo.subslice_mask);
 	igt_debug("timestamp_frequency = %"PRIu64"\n",
 		  intel_xe_perf->devinfo.timestamp_frequency);
 	igt_assert_neq(intel_xe_perf->devinfo.timestamp_frequency, 0);
-- 
2.48.1

