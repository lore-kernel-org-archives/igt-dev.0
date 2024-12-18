Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B227BE77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 08:51:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9DD10EAFD;
	Wed, 18 Dec 2024 08:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aSmRtFz7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A16210EAFD
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 08:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734511881; x=1766047881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=29J0SooiYTEMg0tp6SgiJ50KzWwFttwA/ZjFtJJoajM=;
 b=aSmRtFz7COMVUQN5GGUlwWsFCGY02x8Mk709NoGjTpuB3bwF+gyU7c5b
 lWKupQh6vi4jExsdg6ZC6fcsLc9C3MkrG4BMaU2ylcrNZNz6ZcGa3ipil
 z5QrjTfxz71go+KnEJs5tpjcn6PDAU4IcaradHZG3v//2Gf81Qq5xVBMr
 hN3pC6cH/pfwYVVM3FV2FeTmcRcRjz5o+xdJ/9GUFV5HZsTXiy0MOPylX
 jJ1ehHhcn+ZVNyxmgtrtJod1gP/ZF33KqHjJbSAxKbocib4aXcYgzz72E
 UVsjl4LcPBi1t9LvXaSi3527Ba1CGSSDwaw+pBMZCVRRYCRmkQ39sLo6g w==;
X-CSE-ConnectionGUID: JszQ62elQ1O5q5mFx28UcA==
X-CSE-MsgGUID: 9aBJamwzRfu2VR6D6dqXVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34867283"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="34867283"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 00:51:04 -0800
X-CSE-ConnectionGUID: Ymm8JIyZSqm7ax7YnJaWDA==
X-CSE-MsgGUID: u8B8lghOSWOI4p84i+YFfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="102890869"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 00:51:02 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH i-g-t 1/2] tests/intel/xe_oa: Remove unused function arguments
Date: Wed, 18 Dec 2024 14:11:33 +0530
Message-Id: <20241218084134.2898703-2-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241218084134.2898703-1-sai.teja.pottumuttu@intel.com>
References: <20241218084134.2898703-1-sai.teja.pottumuttu@intel.com>
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

