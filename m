Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86779C369A9
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 18:12:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BB110E2D5;
	Tue,  8 Apr 2025 18:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R5CLYQs/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FE310E2BE
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 18:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744135945; x=1775671945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GSe0BHWGIeHetURXlF6hv4gW8S22vTy0GZ5XPk0RLmI=;
 b=R5CLYQs/2i0XGMV5V/05qmQQ4Y1CzRfM2V1dcAPqJE7cdPF16INcsN2h
 Ot2BBfxYetxkqO/sjrT97u/3wU0Rz7FTymXdBJl/SU+ACnH2rI5Ye2hD3
 pQ3cDPtSOe5fRBU5KCvws+Z4KdXKdyR3e5VFEXZR32u1gozkeQUcpwdL1
 lI+CqQBIzA0iaVsopiLHr467UtWWZhGGP5STNos3uczHt7NQIkzLRMbGf
 LsuNZSql2OrPHtTDYGCN4WGf+celenOqUE4K/tNe8vVmquYJjP/0xXswS
 5FG0NuuJgyTbs23TabPQdzUP4KABIIz9UE/vRr7jLoPYCP8hFWuINTpYC g==;
X-CSE-ConnectionGUID: GSqY7kOaTzm5JgAR88vneg==
X-CSE-MsgGUID: 2oggEL1oTM+XKCg+sDwD6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45479356"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="45479356"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:12:25 -0700
X-CSE-ConnectionGUID: uLGotPwoS4m6PndB9VneZA==
X-CSE-MsgGUID: BlSZ9IlvRCeI1TxKx7GI2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="128683608"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:12:24 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 3/6] tests/intel/xe_oa: Sanity check PEC report data for
 TestOa metric set
Date: Tue,  8 Apr 2025 11:12:07 -0700
Message-ID: <20250408181210.1052760-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408181210.1052760-1-ashutosh.dixit@intel.com>
References: <20250408181210.1052760-1-ashutosh.dixit@intel.com>
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

Implement sanity checking for Xe2 PEC OA reports. Previously there was
sanity checking only for Xe1 OA reports, but no sanity checking for Xe2 PEC
OA reports.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 121 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 2440101900..eaf97ae0df 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -966,6 +966,115 @@ accumulator_print(struct accumulator *accumulator, const char *title)
 		igt_debug("\tC%u = %"PRIu64"\n", i, deltas[idx++]);
 }
 
+
+/*
+ * pec_sanity_check_reports() uses the following properties of the TestOa
+ * metric set with the "576B_PEC64LL" or XE_OA_FORMAT_PEC64u64 format. See
+ * e.g. lib/xe/oa-configs/oa-lnl.xml.
+ *
+ * If pec[] is the array of pec qwords following the report header (Bspec
+ * 60942) then we have:
+ *
+ *	pec[2]  : test_event1_cycles
+ *	pec[3]  : test_event1_cycles_xecore0
+ *	pec[4]  : test_event1_cycles_xecore1
+ *	pec[5]  : test_event1_cycles_xecore2
+ *	pec[6]  : test_event1_cycles_xecore3
+ *	pec[21] : test_event1_cycles_xecore4
+ *	pec[22] : test_event1_cycles_xecore5
+ *	pec[23] : test_event1_cycles_xecore6
+ *	pec[24] : test_event1_cycles_xecore7
+ *
+ * test_event1_cycles_xecore* increment with every clock, so they increment
+ * the same as gpu_ticks in report headers in successive reports. And
+ * test_event1_cycles increment by 'gpu_ticks * num_xecores'.
+ *
+ * These equations are not exact due to fluctuations, but are precise when
+ * averaged over long periods.
+ */
+static void pec_sanity_check_one(const u32 *report)
+{
+	int xecore_idx[] = {3, 4, 5, 6, 21, 22, 23, 24};
+	u64 first, *pec = (u64 *)(report + 8);
+
+	igt_debug("\ttest_event1_cycles: %#lx\n", pec[2]);
+	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++)
+		igt_debug("\ttest_event1_cycles_xecore %d: %#lx\n", i, pec[xecore_idx[i]]);
+
+	/* Compare against the first non-zero test_event1_cycles_xecore* */
+	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++) {
+		first = pec[xecore_idx[i]];
+		if (first)
+			break;
+	}
+
+	/* test_event1_cycles_xecore* should be within an epsilon of each other */
+	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++) {
+		igt_debug("n %d: pec[n] %#lx, first %#lx\n",
+			  xecore_idx[i], pec[xecore_idx[i]], first);
+		/* 0 value for pec[xecore_idx[i]] indicates missing xecore */
+		if (pec[xecore_idx[i]])
+			assert_within_epsilon(pec[xecore_idx[i]], first, 0.1);
+	}
+
+	igt_debug("first * num_xecores: %#lx, pec[2] %#lx\n",
+		  first * intel_xe_perf->devinfo.n_eu_sub_slices, pec[2]);
+	/* test_event1_cycles should be close to (test_event1_cycles_xecore* * num_xecores) */
+	assert_within_epsilon(first * intel_xe_perf->devinfo.n_eu_sub_slices, pec[2], 0.1);
+}
+
+static void pec_sanity_check_two(const u32 *report0, const u32 *report1,
+				 struct intel_xe_perf_metric_set *set)
+{
+	u64 tick_delta = oa_tick_delta(report1, report0, set->perf_oa_format);
+	int xecore_idx[] = {3, 4, 5, 6, 21, 22, 23, 24};
+	u64 *pec0 = (u64 *)(report0 + 8);
+	u64 *pec1 = (u64 *)(report1 + 8);
+
+	igt_debug("tick delta = %#lx\n", tick_delta);
+
+	/* Difference in test_event1_cycles_xecore* values should be close to tick_delta */
+	for (int i = 0; i < ARRAY_SIZE(xecore_idx); i++) {
+		igt_debug("n %d: pec1[n] - pec0[n] %#lx, tick delta %#lx\n",
+			  xecore_idx[i], pec1[xecore_idx[i]] - pec0[xecore_idx[i]], tick_delta);
+		/* 0 value for pec[xecore_idx[i]] indicates missing xecore */
+		if (pec1[xecore_idx[i]] && pec0[xecore_idx[i]])
+			assert_within_epsilon(pec1[xecore_idx[i]] - pec0[xecore_idx[i]],
+					      tick_delta, 0.1);
+		/* Same test_event1_cycles_xecore* should be present in all reports */
+		if (pec1[xecore_idx[i]])
+			igt_assert(pec0[xecore_idx[i]]);
+	}
+
+	igt_debug("pec1[2] - pec0[2] %#lx, tick_delta * num_xecores: %#lx\n",
+		  pec1[2] - pec0[2], tick_delta * intel_xe_perf->devinfo.n_eu_sub_slices);
+	/* Difference in test_event1_cycles should be close to (tick_delta * num_xecores) */
+	assert_within_epsilon(pec1[2] - pec0[2],
+			      tick_delta * intel_xe_perf->devinfo.n_eu_sub_slices, 0.1);
+}
+
+/* Sanity check Xe2+ PEC reports. Note: report format must be @set->perf_oa_format */
+static void pec_sanity_check_reports(const u32 *report0, const u32 *report1,
+				     struct intel_xe_perf_metric_set *set)
+{
+	if (igt_run_in_simulation() || intel_graphics_ver(devid) < IP_VER(20, 0)) {
+		igt_debug("%s: Skip checking PEC reports in simulation or Xe1\n", __func__);
+		return;
+	}
+
+	if (strcmp(set->name, "TestOa")) {
+		igt_debug("%s: Can't check reports for metric set %s\n", __func__, set->name);
+		return;
+	}
+
+	dump_report(report0, set->perf_raw_size, "pec_report0");
+	dump_report(report1, set->perf_raw_size, "pec_report1");
+
+	pec_sanity_check_one(report0);
+	pec_sanity_check_one(report1);
+	pec_sanity_check_two(report0, report1, set);
+}
+
 /* The TestOa metric set is designed so */
 static void
 sanity_check_reports(const uint32_t *oa_report0, const uint32_t *oa_report1,
@@ -1589,6 +1698,9 @@ static void test_oa_formats(const struct drm_xe_engine_class_instance *hwe)
 
 		print_reports(oa_report0, oa_report1, i);
 		sanity_check_reports(oa_report0, oa_report1, i);
+
+		if (i == metric_set(hwe)->perf_oa_format)
+			pec_sanity_check_reports(oa_report0, oa_report1, metric_set(hwe));
 	}
 }
 
@@ -2527,8 +2639,10 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
 
 		igt_assert_neq(reason, 0);
 
-		if (last_report)
+		if (last_report) {
 			sanity_check_reports(last_report, report, fmt);
+			pec_sanity_check_reports(last_report, report, metric_set(hwe));
+		}
 
 		last_report = report;
 	}
@@ -4266,9 +4380,12 @@ static void mmap_check_reports(void *oa_vaddr, uint32_t oa_size,
 			continue;
 
 		timer_reports++;
-		if (timer_reports >= 3)
+		if (timer_reports >= 3) {
 			sanity_check_reports(reports - 2 * report_words,
 					     reports - report_words, fmt);
+			pec_sanity_check_reports(reports - 2 * report_words,
+						 reports - report_words, metric_set(hwe));
+		}
 	}
 
 	igt_assert(timer_reports >= 3);
-- 
2.48.1

