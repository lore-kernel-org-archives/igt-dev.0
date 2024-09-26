Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5E7CDE038
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 20:51:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C8A10E189;
	Thu, 26 Sep 2024 20:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJGMPVjJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2AA210E189
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 20:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727383890; x=1758919890;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EBkB0+ztFMGo7EgtTjgI4ud17fGxqD6gRi4+bkXWRVw=;
 b=AJGMPVjJrsnT3rDVCrF6wj9leKTtAm9nUf8paq0ZH3bEQNrptjYvYvfm
 GL04Se9e0h5l/BJHVTSYNYBnA3cneI8Uipdpv06qQuf9ASd+v603V0ZEn
 Ly/4brF14oatSLGCaqHVuz8BJQtF1XKH0buPxSu6PG6j8k+/euM+k3I1w
 T66ao02Oaf6fh+6bLT1VPkxD1cA3TFcz1QQbGEqTjXr6PQGxun35xUEvB
 QbI/q4pe/bp9enSYvChR8BrWene6nEym+lbPWHS5YkNhPIkcu5JJ7JZnR
 OJK/n58IZwU/bSNqFmtw03/SYitC4J0XkwzTpXVZ250pjozmX2dnkwqfd Q==;
X-CSE-ConnectionGUID: BIu0z44CQjWAkGXw4THCMg==
X-CSE-MsgGUID: ULppo1W/R1Ke3lpAT9XWOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26021327"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="26021327"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 13:51:30 -0700
X-CSE-ConnectionGUID: Z7zq1aOgREmqtjtcmH+KQQ==
X-CSE-MsgGUID: KWqeoD2dT42/d8LcM/Gzyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="95636308"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 13:51:30 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t] tests/intel/oa: Fix oa-exponents test
Date: Thu, 26 Sep 2024 13:51:20 -0700
Message-ID: <20240926205120.3571276-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

test_oa_exponents is assuming that reports is an array of report size
elements, whereas reports is an array of u32's. The same bug exists in both
i915 and xe IGT's.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2723
Fixes: a5565306b277 ("tests/intel/xe_oa: Add oa exponent tests")
Fixes: b3c80c93b544 ("i915/perf: Move OA format array from stack to heap")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/perf.c  | 19 ++++++++++++-------
 tests/intel/xe_oa.c | 19 ++++++++++++-------
 2 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/tests/intel/perf.c b/tests/intel/perf.c
index c5a103c945..a38d1b4919 100644
--- a/tests/intel/perf.c
+++ b/tests/intel/perf.c
@@ -2108,6 +2108,7 @@ test_oa_exponents(const struct intel_execution_engine2 *e)
 #define NUM_TIMER_REPORTS 30
 		uint32_t *reports = malloc(NUM_TIMER_REPORTS * format_size);
 		uint32_t *timer_reports = reports;
+		void *this, *prev;
 
 		igt_debug("testing OA exponent %d,"
 			  " expected ts delta = %"PRIu64" (%"PRIu64"ns/%.2fus/%.2fms)\n",
@@ -2161,21 +2162,25 @@ test_oa_exponents(const struct intel_execution_engine2 *e)
 
 		__perf_close(stream_fd);
 
+		this = reports + format_size / 4;
+		prev = reports;
+
 		igt_debug("report%04i ts=%"PRIx64" hw_id=0x%08x\n", 0,
-			  oa_timestamp(&reports[0], fmt),
-			  oa_report_get_ctx_id(&reports[0]));
+			  oa_timestamp(prev, fmt),
+			  oa_report_get_ctx_id(prev));
 		for (int i = 1; i < n_timer_reports; i++) {
-			uint64_t delta = oa_timestamp_delta(&reports[i],
-							    &reports[i - 1],
-							    fmt);
+			uint64_t delta = oa_timestamp_delta(this, prev, fmt);
 
 			igt_debug("report%04i ts=%"PRIx64" hw_id=0x%08x delta=%"PRIu64" %s\n", i,
-				  oa_timestamp(&reports[i], fmt),
-				  oa_report_get_ctx_id(&reports[i]),
+				  oa_timestamp(this, fmt),
+				  oa_report_get_ctx_id(this),
 				  delta, expected_report_timing_delta(delta,
 								      expected_timestamp_delta) ? "" : "******");
 
 			matches += expected_report_timing_delta(delta,expected_timestamp_delta);
+
+			this += format_size;
+			prev += format_size;
 		}
 
 		igt_debug("matches=%u/%u\n", matches, n_timer_reports - 1);
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index aae9be2c40..5d7a40090b 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -1692,6 +1692,7 @@ static void test_oa_exponents(const struct drm_xe_engine_class_instance *hwe)
 #define NUM_TIMER_REPORTS 30
 		uint32_t *reports = malloc(NUM_TIMER_REPORTS * format_size);
 		uint32_t *timer_reports = reports;
+		void *this, *prev;
 
 		igt_debug("testing OA exponent %d,"
 			  " expected ts delta = %"PRIu64" (%"PRIu64"ns/%.2fus/%.2fms)\n",
@@ -1741,21 +1742,25 @@ static void test_oa_exponents(const struct drm_xe_engine_class_instance *hwe)
 
 		__perf_close(stream_fd);
 
+		this = reports + format_size / 4;
+		prev = reports;
+
 		igt_debug("report%04i ts=%"PRIx64" hw_id=0x%08x\n", 0,
-			  oa_timestamp(&reports[0], fmt),
-			  oa_report_get_ctx_id(&reports[0]));
+			  oa_timestamp(prev, fmt),
+			  oa_report_get_ctx_id(prev));
 		for (int i = 1; i < n_timer_reports; i++) {
-			uint64_t delta = oa_timestamp_delta(&reports[i],
-							    &reports[i - 1],
-							    fmt);
+			uint64_t delta = oa_timestamp_delta(this, prev, fmt);
 
 			igt_debug("report%04i ts=%"PRIx64" hw_id=0x%08x delta=%"PRIu64" %s\n", i,
-				  oa_timestamp(&reports[i], fmt),
-				  oa_report_get_ctx_id(&reports[i]),
+				  oa_timestamp(this, fmt),
+				  oa_report_get_ctx_id(this),
 				  delta, expected_report_timing_delta(delta,
 								      expected_timestamp_delta) ? "" : "******");
 
 			matches += expected_report_timing_delta(delta,expected_timestamp_delta);
+
+			this += format_size;
+			prev += format_size;
 		}
 
 		igt_debug("matches=%u/%u\n", matches, n_timer_reports - 1);
-- 
2.41.0

