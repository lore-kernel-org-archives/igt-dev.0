Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B7DD2CDF4
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 00:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1159310E9F2;
	Fri,  5 Dec 2025 00:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nkn2Nzrg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C6D10E9EC
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 00:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764893135; x=1796429135;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f1aBfmMCiqepsOKsxjE9hMpr1ibVy09c7lpGO/RIyKg=;
 b=nkn2NzrgYbU4i8Opg0+nbACnO8A0TLpe+i53ihyQ1opL9bwcJbKAbDrM
 Rz2XAyLKN+NhyNjeaTQQY1MDTHj3z7TxOszJ5fGrCOStGyJ4tuQOzb54z
 o2HIGl1GiZPh03Zrvh2Jt4EZC3dxHzuXS8mSPmLP378RzdTPyTAij3ccV
 UkgkdJDTIhNXyz21fVljvUgFlxXiBLRs8NM1b8oxMreuYg2wJ7ns7/0G8
 luENIxZ9K0Wd9xaUXnfq3rRPY4I2lfZIkpdalEhyZ2FfhM0ISyHIDarnx
 DMrx6dajpQEcve0s2XXdPT7uFl+8iZyAOHMLX0vbV7DBmHZ6reX8Gjzwo w==;
X-CSE-ConnectionGUID: XGN8UuRyS/6EmSs8xb9vQw==
X-CSE-MsgGUID: W+Zjt1W2Qt6/nZAXXxYr8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66820503"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="66820503"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 16:05:34 -0800
X-CSE-ConnectionGUID: VAhhjk5pSCKooM/OKLTTrg==
X-CSE-MsgGUID: jOW9gpRuQXuThIaT8Sz4pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="194192922"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 16:05:33 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 4/4] tests/intel/xe_oa: Use separate oa unit variables
 for caps and iterator
Date: Thu,  4 Dec 2025 16:05:28 -0800
Message-ID: <20251205000528.720706-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251205000528.720706-1-ashutosh.dixit@intel.com>
References: <20251205000528.720706-1-ashutosh.dixit@intel.com>
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

The __for_each_oa_unit() iterator places the oau pointer at the end of the
oa unit array. If the iterator is followed by 'oau->capabilities' check,
'oau->capabilities' is undefined after the end of the oa unit array. To
resolve this situation use separate oa unit variables for checking the
caps and for the iterator.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 2f966e808f..502fa47323 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -5031,7 +5031,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 		{ "ufence-wait", OA_SYNC_TYPE_UFENCE, WAIT },
 		{ NULL },
 	};
-	const struct drm_xe_oa_unit *oau;
+	const struct drm_xe_oa_unit *oau0, *oau;
 	struct xe_device *xe_dev;
 
 	igt_fixture {
@@ -5063,7 +5063,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 		/* See xe_query_oa_units_new() */
 		igt_require(xe_dev->oa_units);
 		igt_require(xe_dev->oa_units->num_oa_units);
-		oau = oa_unit_by_id(drm_fd, 0);
+		oau0 = oa_unit_by_id(drm_fd, 0);
 
 		devid = intel_get_drm_devid(drm_fd);
 		sysfs = igt_sysfs_open(drm_fd);
@@ -5102,7 +5102,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 			test_oa_exponents(oau);
 
 	igt_subtest_with_dynamic("buffer-fill") {
-		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
+		igt_require(oau0->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
 		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
 			test_buffer_fill(oau);
 	}
@@ -5114,14 +5114,14 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 	igt_subtest_with_dynamic("buffer-size") {
 		long k = random() % num_buf_sizes;
 
-		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
+		igt_require(oau0->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
 		__for_oa_unit_by_type_w_arg(DRM_XE_OA_UNIT_TYPE_OAG, buf_sizes[k].name)
 			test_non_zero_reason(oau, buf_sizes[k].size);
 	}
 
 	igt_subtest_with_dynamic("non-zero-reason") {
 		igt_require(!igt_run_in_simulation());
-		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
+		igt_require(oau0->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
 		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
 			test_non_zero_reason(oau, 0);
 	}
@@ -5131,7 +5131,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 	 * Description: Non zero reason over all OA units
 	 */
 	igt_subtest_with_dynamic("non-zero-reason-all") {
-		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
+		igt_require(oau0->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
 		__for_each_oa_unit(oau)
 			test_non_zero_reason(oau, SZ_128K);
 	}
@@ -5249,7 +5249,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 	igt_subtest_with_dynamic("tail-address-wrap") {
 		long k = random() % num_buf_sizes;
 
-		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
+		igt_require(oau0->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
 		__for_oa_unit_by_type_w_arg(DRM_XE_OA_UNIT_TYPE_OAG, buf_sizes[k].name)
 			test_tail_address_wrap(oau, buf_sizes[k].size);
 	}
@@ -5265,14 +5265,14 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 
 		igt_subtest_with_dynamic("mmio-triggered-reports") {
 			igt_require(HAS_OA_MMIO_TRIGGER(devid));
-			igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_UNIT_GT_ID);
+			igt_require(oau0->capabilities & DRM_XE_OA_CAPS_OA_UNIT_GT_ID);
 			__for_each_oa_unit(oau)
 				test_mmio_triggered_reports(oau, false);
 		}
 
 		igt_subtest_with_dynamic("mmio-triggered-reports-read") {
 			igt_require(HAS_OA_MMIO_TRIGGER(devid));
-			igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_UNIT_GT_ID);
+			igt_require(oau0->capabilities & DRM_XE_OA_CAPS_OA_UNIT_GT_ID);
 			__for_each_oa_unit(oau)
 				test_mmio_triggered_reports(oau, true);
 		}
@@ -5280,7 +5280,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 
 	igt_subtest_group {
 		igt_fixture {
-			igt_require(oau->capabilities & DRM_XE_OA_CAPS_SYNCS);
+			igt_require(oau0->capabilities & DRM_XE_OA_CAPS_SYNCS);
 		}
 
 		for (const struct sync_section *s = sync_sections; s->name; s++) {
-- 
2.48.1

