Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E23BCCA470
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:18:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0660010E8DF;
	Wed,  8 Oct 2025 21:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZn5akDO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FF910E8E7
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759958296; x=1791494296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=scDa2mxcHwugccsrVIJqaK5gUlEn7ZC6866Z2eg8aw4=;
 b=MZn5akDOOSx/hUJl2u/yjQYeCtYTDr7eqkkXO1ymwLhFgNWt6qs2j7dJ
 8MG4rRKHz7nGf0ckwIx5aMvXAsiE7qocalnXjFhPfgmtxFiMUQuC5Swfg
 nsozehOOLCVWZv9krEZ9RJjtRHIjkSEdCnghiyiWGt2X16AoxYl53BW8f
 fi0D5zj02cnvcx6w/ZrqHrBKAwpTEUg3fKnA7Zdn1SU7mCLbHjCLOFmBy
 xXhXcUFKb1adGGRHYZxXyajdnkoxfDPy5224JEN3nZK0sRhlw5aryJEnk
 y3XoPPPJD/0PhS0qTEVq8OK/8zNq5yhiPDhTmhhUPXdU2tyaAhZhSy8VP A==;
X-CSE-ConnectionGUID: UZuve8tsSh23AbJVyRTsTQ==
X-CSE-MsgGUID: SCvpOGtySROR0rtiuesSDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65989650"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65989650"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
X-CSE-ConnectionGUID: zoGdiZi+RsCIad8dJpFZ7A==
X-CSE-MsgGUID: kxzGQz+5RFKphqeZDqDtEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184805280"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 08/18] tests/intel/xe_oa: Convert several more tests to
 take OA unit arguments
Date: Wed,  8 Oct 2025 14:17:55 -0700
Message-ID: <20251008211806.625154-9-ashutosh.dixit@intel.com>
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

Convert the following tests to take 'struct drm_xe_oa_unit *'
arguments (instead of hwe), to enable these to be run on all OA units:

- test_oa_exponents
- test_buffer_fill
- test_enable_disable
- test_oa_tlb_invalidate
- test_stress_open_close
- test_tail_address_wrap

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 60 ++++++++++++++++++++++-----------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index af01a79d38..ac15da09a3 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -1896,9 +1896,9 @@ static bool expected_report_timing_delta(uint32_t delta, uint32_t expected_delta
  * SUBTEST: oa-exponents
  * Description: Test that oa exponent values behave as expected
  */
-static void test_oa_exponents(const struct drm_xe_engine_class_instance *hwe)
+static void test_oa_exponents(struct drm_xe_oa_unit *oau)
 {
-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t fmt = test_set->perf_oa_format;
 
 	load_helper_init();
@@ -1910,7 +1910,7 @@ static void test_oa_exponents(const struct drm_xe_engine_class_instance *hwe)
 	 */
 	for (int exponent = min_oa_exponent; exponent < max_oa_exponent; exponent++) {
 		uint64_t properties[] = {
-			DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+			DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 
 			/* Include OA reports in samples */
 			DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
@@ -2526,11 +2526,11 @@ num_valid_reports_captured(struct intel_xe_oa_open_prop *param,
  * Description: Open OA stream twice to verify OA TLB invalidation
  */
 static void
-test_oa_tlb_invalidate(const struct drm_xe_engine_class_instance *hwe)
+test_oa_tlb_invalidate(struct drm_xe_oa_unit *oau)
 {
-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t properties[] = {
-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
 
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
@@ -2584,15 +2584,15 @@ wait_for_oa_buffer_overflow(int fd, int poll_period_us)
  * Description: Test filling and overflow of OA buffer
  */
 static void
-test_buffer_fill(const struct drm_xe_engine_class_instance *hwe)
+test_buffer_fill(struct drm_xe_oa_unit *oau)
 {
 	/* ~5 micro second period */
 	int oa_exponent = max_oa_exponent_for_period_lte(5000);
 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t fmt = test_set->perf_oa_format;
 	uint64_t properties[] = {
-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 
 		/* Include OA reports in samples */
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
@@ -2724,13 +2724,13 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
  * Description: Test that OA stream enable/disable works as expected
  */
 static void
-test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
+test_enable_disable(struct drm_xe_oa_unit *oau)
 {
 	uint32_t num_reports = 5;
-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t fmt = test_set->perf_oa_format;
 	uint64_t properties[] = {
-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
@@ -3505,16 +3505,16 @@ test_rc6_disable(void)
  * Description: Open/close OA streams in a tight loop
  */
 static void
-test_stress_open_close(const struct drm_xe_engine_class_instance *hwe)
+test_stress_open_close(struct drm_xe_oa_unit *oau)
 {
-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 
 	load_helper_init();
 	load_helper_run(HIGH);
 
 	igt_until_timeout(2) {
 		uint64_t properties[] = {
-			DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+			DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 
 			/* XXX: even without periodic sampling we have to
 			 * specify at least one sample layout property...
@@ -4613,14 +4613,14 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_engine_class_insta
  * has zeroes in it.
  */
 static void
-test_tail_address_wrap(const struct drm_xe_engine_class_instance *hwe, size_t oa_buffer_size)
+test_tail_address_wrap(struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
 {
-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	u64 exponent = max_oa_exponent_for_period_lte(20000);
 	u64 buffer_size = oa_buffer_size ?: buffer_fill_size;
 	u64 fmt = test_set->perf_oa_format;
 	u64 properties[] = {
-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
@@ -5114,13 +5114,13 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 		test_invalid_oa_exponent();
 
 	igt_subtest_with_dynamic("oa-exponents")
-		__for_one_hwe_in_oag(hwe)
-			test_oa_exponents(hwe);
+		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+			test_oa_exponents(oau);
 
 	igt_subtest_with_dynamic("buffer-fill") {
 		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
-		__for_one_hwe_in_oag(hwe)
-			test_buffer_fill(hwe);
+		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+			test_buffer_fill(oau);
 	}
 
 	/**
@@ -5148,8 +5148,8 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 		test_non_sampling_read_error();
 
 	igt_subtest_with_dynamic("enable-disable")
-		__for_one_hwe_in_oag(hwe)
-			test_enable_disable(hwe);
+		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+			test_enable_disable(oau);
 
 	igt_subtest_with_dynamic("blocking") {
 		igt_require(!igt_run_in_simulation());
@@ -5183,8 +5183,8 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 		igt_subtest_with_dynamic("oa-tlb-invalidate") {
 			igt_require(intel_graphics_ver(devid) <= IP_VER(12, 70) &&
 				    intel_graphics_ver(devid) != IP_VER(12, 60));
-			__for_one_hwe_in_oag(hwe)
-				test_oa_tlb_invalidate(hwe);
+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+				test_oa_tlb_invalidate(oau);
 		}
 
 		igt_subtest_with_dynamic("unprivileged-single-ctx-counters") {
@@ -5213,8 +5213,8 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 	}
 
 	igt_subtest_with_dynamic("stress-open-close") {
-		__for_one_hwe_in_oag(hwe)
-			test_stress_open_close(hwe);
+		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+			test_stress_open_close(oau);
 	}
 
 	igt_subtest("invalid-create-userspace-config")
@@ -5259,8 +5259,8 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 		long k = random() % num_buf_sizes;
 
 		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
-		__for_one_hwe_in_oag_w_arg(hwe, buf_sizes[k].name)
-			test_tail_address_wrap(hwe, buf_sizes[k].size);
+		__for_oa_unit_by_type_w_arg(DRM_XE_OA_UNIT_TYPE_OAG, buf_sizes[k].name)
+			test_tail_address_wrap(oau, buf_sizes[k].size);
 	}
 
 	igt_subtest_group {
-- 
2.48.1

