Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C238FD3B7F8
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 18:57:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7A610E48A;
	Mon,  8 Dec 2025 18:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BmC/DiHG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884DF10E054
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 18:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765220266; x=1796756266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f1aBfmMCiqepsOKsxjE9hMpr1ibVy09c7lpGO/RIyKg=;
 b=BmC/DiHGVa6cDDb/bgen1PblSTwRSxOoDxRhEfJjwaSAIK6oSWf3BEj2
 2btk3cliaNol2f5Q3qIpE3VLua1IBGN9SUp6f4+j0D5M1OLp8oVxp6s0q
 RIvPFHGlfchhTemAA0+2Urmm7i7q3YSKOWWGkU44gA0fhu/30gMxnXKwe
 RX8rc8kRIb48OKptVIUeXzCOdIK7uglMBHZMrKP2S+rpNZ4SLVTFIG3aA
 cnQHWbc7oxl3XBhX4oeSN3Yru8IaQ1veha4BRBN22Xtx0aX0HJTAvIOpq
 wO78q0CdwMIwvJgjob3gXloxI/DAkK/kEB6EDbiy2rUpR30NUgjM8dE2u Q==;
X-CSE-ConnectionGUID: ptdxY7v8SgeyX/5vkwgzfw==
X-CSE-MsgGUID: 4sbC8El5Sx6Pj9xpy0b/6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67219739"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="67219739"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 10:57:45 -0800
X-CSE-ConnectionGUID: x4+LD8woQziaGdKwR7KUHQ==
X-CSE-MsgGUID: H7vtC1ceSl60Xft1nCakLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="233384680"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 10:57:44 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 4/5] tests/intel/xe_oa: Use separate oa unit variables
 for caps and iterator
Date: Mon,  8 Dec 2025 10:57:36 -0800
Message-ID: <20251208185737.966218-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251208185737.966218-1-ashutosh.dixit@intel.com>
References: <20251208185737.966218-1-ashutosh.dixit@intel.com>
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

