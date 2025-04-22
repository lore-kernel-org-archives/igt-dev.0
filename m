Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B73DC369D8
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 19:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C733A10E5FC;
	Tue, 22 Apr 2025 19:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MSbwQ5HY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030C110E5FC
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 19:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745350513; x=1776886513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9eEpczdA/ibGICNpFmBxKhSfh72kxnrvOfnxuSqEfDc=;
 b=MSbwQ5HYdaEcTCJVUg6t6OFbQdkCzTy2EfB0zfN1V3kDSDslRsqiyl2j
 M5Ynd4RW99cqzT8F6OOiLvd64XbrnCl3G6BAzhOQp6OfjslMndjzfR2IE
 m6Q2UnDtIK0JsSezz7b39yjhD7pU8pvJW91Vi63+YSR5S/bSOtX4xssUD
 OUJIsoq5Ef/2/dj8e4t5SjKjqHQ6nM0JwVnQLt9SxEDoSaucmFHuQdtNr
 b62mIwu9Q71f36PdOcVeM9u1WIqONPja6l91YWkp7egE2CFeqg5KWsJJg
 MZ59RzBd7vL8hznVqgB/+aK4x1VaOMjAtRRrWhFL08i21y6l2Q0XQcIF5 g==;
X-CSE-ConnectionGUID: 1gbwczbfR12cvs9vN9Im8w==
X-CSE-MsgGUID: AduFriDGSdq0gjKByAoVcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57584548"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="57584548"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:35:12 -0700
X-CSE-ConnectionGUID: AcQpYl62RYG4TY3OV8XUeA==
X-CSE-MsgGUID: WdTgjJGQS6GO9r1RnmOeNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="136892152"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:35:13 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 3/6] tests/intel/xe_oa: Sanity check PEC report data for
 TestOa metric set
Date: Tue, 22 Apr 2025 12:34:55 -0700
Message-ID: <20250422193458.1467567-4-ashutosh.dixit@intel.com>
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

Implement sanity checking for Xe2 PEC OA reports. Previously there was
sanity checking only for Xe1 OA reports, but no sanity checking for Xe2 PEC
OA reports.

v2: Use 'n = xecore_idx[i]' (Umesh)
    Only check for default OA buffer size

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 127 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 125 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index a774fc289d..07e15943ea 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -968,6 +968,117 @@ accumulator_print(struct accumulator *accumulator, const char *title)
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
+		int n = xecore_idx[i];
+
+		igt_debug("n %d: pec[n] %#lx, first %#lx\n", n, pec[n], first);
+		/* 0 value for pec[xecore_idx[i]] indicates missing xecore */
+		if (pec[n])
+			assert_within_epsilon(pec[n], first, 0.1);
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
+		int n = xecore_idx[i];
+
+		igt_debug("n %d: pec1[n] - pec0[n] %#lx, tick delta %#lx\n",
+			  n, pec1[n] - pec0[n], tick_delta);
+		/* 0 value for pec[xecore_idx[i]] indicates missing xecore */
+		if (pec1[n] && pec0[n])
+			assert_within_epsilon(pec1[n] - pec0[n], tick_delta, 0.1);
+		/* Same test_event1_cycles_xecore* should be present in all reports */
+		if (pec1[n])
+			igt_assert(pec0[n]);
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
@@ -1591,6 +1702,9 @@ static void test_oa_formats(const struct drm_xe_engine_class_instance *hwe)
 
 		print_reports(oa_report0, oa_report1, i);
 		sanity_check_reports(oa_report0, oa_report1, i);
+
+		if (i == metric_set(hwe)->perf_oa_format)
+			pec_sanity_check_reports(oa_report0, oa_report1, metric_set(hwe));
 	}
 }
 
@@ -2531,8 +2645,14 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
 
 		igt_assert_neq(reason, 0);
 
-		if (last_report)
+		/*
+		 * Only check for default OA buffer size, since non-default
+		 * sizes can drop reports due to buffer overrun.
+		 */
+		if (!oa_buffer_size && last_report) {
 			sanity_check_reports(last_report, report, fmt);
+			pec_sanity_check_reports(last_report, report, metric_set(hwe));
+		}
 
 		last_report = report;
 	}
@@ -4275,9 +4395,12 @@ static void mmap_check_reports(void *oa_vaddr, uint32_t oa_size,
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

