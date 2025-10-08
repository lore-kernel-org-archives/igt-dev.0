Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D313CCD184
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4E110E8E5;
	Wed,  8 Oct 2025 21:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Or1nZMgy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A054010E8DE
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759958296; x=1791494296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MgYUj9QpdNqr5Qc8P2L7poav+/Vf4kkD2GfbfwODnWg=;
 b=Or1nZMgywv6hKOwhv+v/EolurCQ0f/z5zSTbqILWorSe6QM+b485stLI
 NtriNYKkhLFcKIcBV70vKKW8YFRALfLHFOUivlGEmcD5iP92alZO6VCaW
 cdBVPbdNxEPQEwca0uqtWvGJ2dxcLItHyNPPeWB58QZisvsVT+NWK0a5v
 Lk+fglZpPN8weJNZlrnXcP+CxrXJWBv1a7G97KBdM/LD0sjY54Q1C0YEw
 s3poJYatbelJZQE+jAfjNZFde3/bXknz6e+1z5taonzH5EQ8tx/9M0a3I
 HlY808WWYQVxyIqRm9WmlUcX466dnPA2atPhYfLZzrkdl1ei0HKiV75AG Q==;
X-CSE-ConnectionGUID: ntIJrdYZSRql0BLdNFuC7g==
X-CSE-MsgGUID: +Ra1Imz5RDmjZ2Eclu3nwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65989651"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65989651"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
X-CSE-ConnectionGUID: Z6L+wLfPSI+u85KCQhW0KA==
X-CSE-MsgGUID: gM7EEHj8T2iYi7UzpPp/sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184805283"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 09/18] tests/intel/xe_oa: Convert test_non_zero_reason
 to take an OA unit argument
Date: Wed,  8 Oct 2025 14:17:56 -0700
Message-ID: <20251008211806.625154-10-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008211806.625154-1-ashutosh.dixit@intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
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

Convert test_non_zero_reason to take 'struct drm_xe_oa_unit *' argument, to
enable it to be run on all OA units.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index ac15da09a3..8ee8a85ed7 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2631,15 +2631,15 @@ test_buffer_fill(struct drm_xe_oa_unit *oau)
  * Description: Test reason field is non-zero. Can also check OA buffer wraparound issues
  */
 static void
-test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_buffer_size)
+test_non_zero_reason(struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
 {
 	/* ~20 micro second period */
 	int oa_exponent = max_oa_exponent_for_period_lte(20000);
-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t fmt = test_set->perf_oa_format;
 	size_t report_size = get_oa_format(fmt).size;
 	uint64_t properties[] = {
-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 
 		/* Include OA reports in samples */
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
@@ -2710,7 +2710,7 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
 		 */
 		if (!oa_buffer_size && last_report && (offset / report_size == check_idx)) {
 			sanity_check_reports(last_report, report, fmt);
-			pec_sanity_check_reports(last_report, report, metric_set(hwe));
+			pec_sanity_check_reports(last_report, report, oa_unit_metric_set(oau));
 		}
 
 		last_report = report;
@@ -5131,15 +5131,15 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 		long k = random() % num_buf_sizes;
 
 		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
-		__for_one_hwe_in_oag_w_arg(hwe, buf_sizes[k].name)
-			test_non_zero_reason(hwe, buf_sizes[k].size);
+		__for_oa_unit_by_type_w_arg(DRM_XE_OA_UNIT_TYPE_OAG, buf_sizes[k].name)
+			test_non_zero_reason(oau, buf_sizes[k].size);
 	}
 
 	igt_subtest_with_dynamic("non-zero-reason") {
 		igt_require(!igt_run_in_simulation());
 		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
-		__for_one_hwe_in_oag(hwe)
-			test_non_zero_reason(hwe, 0);
+		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+			test_non_zero_reason(oau, 0);
 	}
 
 	igt_subtest("disabled-read-error")
-- 
2.48.1

