Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C47E7719E
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jan 2025 06:31:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A6110E164;
	Mon, 13 Jan 2025 06:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a25UHyPr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E7610E164
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jan 2025 06:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736749894; x=1768285894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=et797MAfCdlwhuQu1nIYXYPioPUDSpU3zB/cTtwCQFc=;
 b=a25UHyPrJH5vr784LKxiArHcgwkbYmaj7Jkcb833lCwV8pQKAGHATBY3
 obz9pyUyi618iQKB/0m11zav3HeSo3CJ8NsgnPAmhwYaY2tvx63QSDb25
 HVRtwA5YnA8KmhvILMAsyuMMRRBS1dUJ0wCpCR6L1dWraYhGFrTR21oNZ
 kikdNK04s0bZ0W1FaEtBzEuJKW4gNNHcLL1rtim9mzBnXiGx5YtuyuHEC
 hC9xNP20XtoVyHb6C/0kb87Shcl4yFYyfweTdHugOfU3TybMCIGPaM4mu
 BCp9JL6NIpihlGy78+anMMSmsXuP6fWVUy/YSCQrfGBBVFwyj+jAQvme5 A==;
X-CSE-ConnectionGUID: dwwQSRBJRNqCNMTaAj/Irw==
X-CSE-MsgGUID: /eugSUlnRTegOSoMczSkRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="48411393"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="48411393"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2025 22:31:33 -0800
X-CSE-ConnectionGUID: t5XnwgBmRTCajre2i16MOg==
X-CSE-MsgGUID: BEcmdi/xT4CGHtDV4uORHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135260414"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2025 22:31:31 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, sai.teja.pottumuttu@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH i-g-t v3 1/3] tests/intel/xe_oa: Remove unused function
 arguments
Date: Mon, 13 Jan 2025 11:49:47 +0530
Message-Id: <20250113061949.753864-2-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113061949.753864-1-sai.teja.pottumuttu@intel.com>
References: <20250113061949.753864-1-sai.teja.pottumuttu@intel.com>
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

The oa_exponent argument is unused in oa_report_is_periodic
function. Thus remove it.

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_oa.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 492a6b5d6..ad3526406 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -791,7 +791,7 @@ emit_report_perf_count(struct intel_bb *ibb,
 }
 
 static bool
-oa_report_is_periodic(uint32_t oa_exponent, const uint32_t *report)
+oa_report_is_periodic(const uint32_t *report)
 {
 	if (report_reason(report) & OAREPORT_REASON_TIMER)
 		return true;
@@ -1342,7 +1342,7 @@ read_2_oa_reports(int format_id,
 			igt_assert_neq_u64(oa_timestamp(report, format_id), 0);
 
 			if (timer_only) {
-				if (!oa_report_is_periodic(exponent, report)) {
+				if (!oa_report_is_periodic(report)) {
 					igt_debug("skipping non timer report\n");
 					continue;
 				}
@@ -1752,7 +1752,7 @@ static void test_oa_exponents(const struct drm_xe_engine_class_instance *hwe)
 				if (oa_status & DRM_XE_OASTATUS_REPORT_LOST)
 					igt_debug("report loss\n");
 
-				if (!oa_report_is_periodic(exponent, report))
+				if (!oa_report_is_periodic(report))
 					continue;
 
 				memcpy(timer_reports, report, format_size);
@@ -1969,7 +1969,7 @@ static void test_blocking(uint64_t requested_oa_period,
 		for (int offset = 0; offset < ret; offset += format_size) {
 			uint32_t *report = (void *)(buf + offset);
 
-			if (oa_report_is_periodic(oa_exponent, report))
+			if (oa_report_is_periodic(report))
 				timer_report_read = true;
 			else
 				non_timer_report_read = true;
@@ -2142,7 +2142,7 @@ static void test_polling(uint64_t requested_oa_period,
 		for (int offset = 0; offset < ret; offset += format_size) {
 			uint32_t *report = (void *)(buf + offset);
 
-			if (oa_report_is_periodic(oa_exponent, report))
+			if (oa_report_is_periodic(report))
 				timer_report_read = true;
 			else
 				non_timer_report_read = true;
@@ -2463,7 +2463,7 @@ again_1:
 					  " ts_delta_last_periodic=%"PRIu64" is_timer=%i ctx_id=%8x nb_periodic=%u\n",
 					  oa_timestamp(report, fmt),
 					  n_periodic_reports > 0 ?  oa_timestamp_delta(report, last_periodic_report, fmt) : 0,
-					  oa_report_is_periodic(oa_exponent, report),
+					  oa_report_is_periodic(report),
 					  oa_report_get_ctx_id(report),
 					  n_periodic_reports);
 
@@ -2471,7 +2471,7 @@ again_1:
 					first_timestamp = oa_timestamp(report, fmt);
 				last_timestamp = oa_timestamp(report, fmt);
 
-				if (oa_report_is_periodic(oa_exponent, report)) {
+				if (oa_report_is_periodic(report)) {
 					memcpy(last_periodic_report, report, report_size);
 					n_periodic_reports++;
 				}
@@ -2677,12 +2677,12 @@ test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
 					  " ts_delta_last_periodic=%s%"PRIu64""
 					  " is_timer=%i ctx_id=0x%8x\n",
 					  oa_timestamp(report, fmt),
-					  oa_report_is_periodic(oa_exponent, report) ? " " : "*",
+					  oa_report_is_periodic(report) ? " " : "*",
 					  n_periodic_reports > 0 ?  oa_timestamp_delta(report, last_periodic_report, fmt) : 0,
-					  oa_report_is_periodic(oa_exponent, report),
+					  oa_report_is_periodic(report),
 					  oa_report_get_ctx_id(report));
 
-				if (oa_report_is_periodic(oa_exponent, report)) {
+				if (oa_report_is_periodic(report)) {
 					memcpy(last_periodic_report, report, report_size);
 
 					/* We want to measure only the periodic reports,
@@ -4380,7 +4380,7 @@ static void check_reports(void *oa_vaddr, uint32_t oa_size,
 	for (reports = (uint32_t *)oa_vaddr;
 	     timer_reports < 20 && reports[0] && oa_timestamp(reports, fmt);
 	     reports += report_words) {
-		if (!oa_report_is_periodic(oa_exp_1_millisec, reports))
+		if (!oa_report_is_periodic(reports))
 			continue;
 
 		timer_reports++;
-- 
2.34.1

