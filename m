Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD01E77188
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 03:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E5B10E12B;
	Mon,  6 Jan 2025 03:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZmmg2aG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB0910E1CE
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 03:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736135847; x=1767671847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=et797MAfCdlwhuQu1nIYXYPioPUDSpU3zB/cTtwCQFc=;
 b=KZmmg2aGvu4QJ3Eg3b9TvJo/Lifkx8Tbu99OrFuG3VF5l3ZEMFpIM411
 8dCBPnOo1wkXgyhHGS4ws0F+XYQ5eYvY9TzPeSs/Wnjqcj3Xke4zUqK7W
 A6BCtBoHgcMzU9raEPrwoobVEAeF4OMayZVZglM0WPwVSg0R04jwmRTgZ
 VaB2JKP6F6tOMc6NTRlAtm1eQ5Z+IRZgFJ+TabuvizHXtw1x3JERdK/VB
 ttptiNtzI96f0GRHURXVVfu1i3fYI2YWic2Mds9URG8neTSEr6znCuthS
 SJnIOrD0ycE1WXwA2c+x/VdFCSOXLAfuLNkwHf742acI+IdLcNOdwNTGC w==;
X-CSE-ConnectionGUID: H85eFRcISIicpyQ9PMjnjQ==
X-CSE-MsgGUID: xpzkL+bmQ5StvvAXnhtCQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="46858243"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="46858243"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 19:57:26 -0800
X-CSE-ConnectionGUID: wPpQvzWvTYKcs71NOqVpMg==
X-CSE-MsgGUID: dHMCfrpARjOEzFhEzVBlmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="139669331"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 19:57:24 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, sai.teja.pottumuttu@intel.com,
 lucas.demarchi@intel.com, jonathan.cavitt@intel.com
Subject: [PATCH i-g-t v2 1/2] tests/intel/xe_oa: Remove unused function
 arguments
Date: Mon,  6 Jan 2025 09:16:37 +0530
Message-Id: <20250106034638.1746051-2-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250106034638.1746051-1-sai.teja.pottumuttu@intel.com>
References: <20250106034638.1746051-1-sai.teja.pottumuttu@intel.com>
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

