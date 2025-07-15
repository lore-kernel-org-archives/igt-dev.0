Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449C6C83F17
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 00:35:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC4010E0F2;
	Tue, 15 Jul 2025 00:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZvREO2v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF4310E0F2
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 00:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752539750; x=1784075750;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1N+Hei/4CNu/WvyfKQX/ZVA/XMLzHTEVMgcvTfqk9MM=;
 b=XZvREO2v2DUXNNfVIM8PotwRBMSOSUs79BUuGr3aKqPJUZKl7cLD74Vp
 FLQVTOZ9qK3tQMGB1+3Yan4quFTdxCnuEgjP44WnMhpB1HPdNpc+Cfjdf
 sBjVzTm++SU5Vz2FeV0ZqyYGd/ZGavFpCbBhbR+wXPx2rd+6AqxTpBw/b
 UgsNhzKOVa6ScfaPdOkL5TcoOjK5pBSzd7YqNXOYZz0v4t/58df3rT9Tx
 /GtEzkTxx1iREGl0z6DL6F8bgrhTgfrm0d1nJCBbiiWfL3aAzT5xiHWhn
 w4dbiWsyB5iELqFnVdUoJzqiGKpXdLuu32DKjwks1zYUlzHrbI+AGS3rV g==;
X-CSE-ConnectionGUID: 6bvTYgIKR92kbcEcj8uoTA==
X-CSE-MsgGUID: hEib/e0FQCekQ03r9gc+Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65813336"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="65813336"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 17:35:50 -0700
X-CSE-ConnectionGUID: Qmq+hegHRIuL5hKsqhOF9g==
X-CSE-MsgGUID: xh8Mo7qKSe+JpEJLGQt1Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="162622525"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 17:35:50 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v2 i-g-t] tests/intel/xe-oa: Use subslice_mask in
 pec_sanity_check
Date: Mon, 14 Jul 2025 17:35:46 -0700
Message-ID: <20250715003546.2391524-1-ashutosh.dixit@intel.com>
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

v2: s/xecore_idx/xecore_to_pec/ (Umesh)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 724fea73f0..68c6ccf5b5 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -998,7 +998,7 @@ static void pec_sanity_check(const u32 *report0, const u32 *report1,
 			     struct intel_xe_perf_metric_set *set)
 {
 	u64 tick_delta = oa_tick_delta(report1, report0, set->perf_oa_format);
-	int xecore_idx[] = {3, 4, 5, 6, 21, 22, 23, 24};
+	int xecore_to_pec[] = {3, 4, 5, 6, 21, 22, 23, 24};
 	u64 *pec0 = (u64 *)(report0 + 8);
 	u64 *pec1 = (u64 *)(report1 + 8);
 
@@ -1018,17 +1018,17 @@ static void pec_sanity_check(const u32 *report0, const u32 *report1,
 	igt_debug("tick delta = %#" PRIx64 "\n", tick_delta);
 
 	/* Difference in test_event1_cycles_xecore* values should be close to tick_delta */
-	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++) {
-		int n = xecore_idx[i];
+	for (int i = 0; i < ARRAY_SIZE(xecore_to_pec); i++) {
+		int n = xecore_to_pec[i];
 
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

