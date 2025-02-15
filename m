Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16328C021AA
	for <igt-dev@archiver.kernel.org>; Sat, 15 Feb 2025 01:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E8810ED53;
	Sat, 15 Feb 2025 01:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EEzxKyUu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F9C10E4B3
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Feb 2025 01:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739581589; x=1771117589;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=IqW0N0PV/ehr5WKpX8ZbiNg708uAvmd5fNiXk1VGS98=;
 b=EEzxKyUuX7fk6ep74lhYmjqqBEd+lr5RZck1ZEiGRYyexPwxD4dvXfJV
 zi849Dim7b0qzzy+6ip6dfFOTckwdVC3UTfPfu1o04t6YGsHwvJttiuSj
 +rI8l2ttze9e5e7u2dcpNed8vYOhc3IskoPK+Pnbq8gAjW6LDfbLdsFdW
 NJ15xfNLENwuLlUySEtSufrcaPAuDFzHMXiiyB1C9GMKXkl07sVIzX4dC
 M3WxLyi/5A9vWRIUsYwOpkOePk/fY71EMiV4cxHgq+uSm6TCiPOXgq4Ao
 TUlpUlwVo/7W7kNHkOJD7c94yCHXcxcWT8RwvIRch1XKPlgje9P+Y+wNw g==;
X-CSE-ConnectionGUID: 0fv1Lz/ST3ezxavchRGi9A==
X-CSE-MsgGUID: Gw8q5DkOTf2DtX854xZmEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50555112"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="50555112"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 17:06:29 -0800
X-CSE-ConnectionGUID: MHlrGkRuTmmm68U/q5KiBQ==
X-CSE-MsgGUID: IpnaqdJgRQq6fGU1t7t5ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="118711244"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 17:06:28 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 04/13] tests/intel/xe_oa: Use default exponent for some tests
Date: Fri, 14 Feb 2025 17:06:19 -0800
Message-Id: <20250215010628.1639986-5-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250215010628.1639986-1-umesh.nerlige.ramappa@intel.com>
References: <20250215010628.1639986-1-umesh.nerlige.ramappa@intel.com>
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

Use the default exponent for below tests:

oa-tlb-validate
short-reads
stress-open-close
mmio-triggered-reports

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index e7d6ac5af..7e40e9257 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2316,7 +2316,6 @@ num_valid_reports_captured(struct intel_xe_oa_open_prop *param,
 static void
 test_oa_tlb_invalidate(const struct drm_xe_engine_class_instance *hwe)
 {
-	int oa_exponent = max_oa_exponent_for_period_lte(30000000);
 	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
 	uint64_t properties[] = {
 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
@@ -2324,7 +2323,7 @@ test_oa_tlb_invalidate(const struct drm_xe_engine_class_instance *hwe)
 
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
-		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
 		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
 	};
@@ -2342,14 +2341,14 @@ test_oa_tlb_invalidate(const struct drm_xe_engine_class_instance *hwe)
 	 */
 	duration = 5LL * NSEC_PER_SEC;
 	num_reports1 = num_valid_reports_captured(&param, &duration, test_set->perf_oa_format);
-	num_expected_reports = duration / oa_exponent_to_ns(oa_exponent);
+	num_expected_reports = duration / oa_exponent_to_ns(oa_exponent_default);
 	igt_debug("expected num reports = %d\n", num_expected_reports);
 	igt_debug("actual num reports = %d\n", num_reports1);
 	igt_assert(num_reports1 > 0.95 * num_expected_reports);
 
 	duration = 5LL * NSEC_PER_SEC;
 	num_reports2 = num_valid_reports_captured(&param, &duration, test_set->perf_oa_format);
-	num_expected_reports = duration / oa_exponent_to_ns(oa_exponent);
+	num_expected_reports = duration / oa_exponent_to_ns(oa_exponent_default);
 	igt_debug("expected num reports = %d\n", num_expected_reports);
 	igt_debug("actual num reports = %d\n", num_reports2);
 	igt_assert(num_reports2 > 0.95 * num_expected_reports);
@@ -2738,7 +2737,6 @@ test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
 static void
 test_short_reads(void)
 {
-	int oa_exponent = max_oa_exponent_for_period_lte(5000);
 	uint64_t properties[] = {
 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
 
@@ -2748,7 +2746,7 @@ test_short_reads(void)
 		/* OA unit configuration */
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
-		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 	};
 	struct intel_xe_oa_open_prop param = {
 		.num_properties = ARRAY_SIZE(properties) / 2,
@@ -3464,7 +3462,6 @@ test_stress_open_close(const struct drm_xe_engine_class_instance *hwe)
 	load_helper_run(HIGH);
 
 	igt_until_timeout(2) {
-		int oa_exponent = 5; /* 5 micro seconds */
 		uint64_t properties[] = {
 			DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
 
@@ -3476,7 +3473,7 @@ test_stress_open_close(const struct drm_xe_engine_class_instance *hwe)
 			/* OA unit configuration */
 			DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 			DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
-			DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
+			DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 			DRM_XE_OA_PROPERTY_OA_DISABLED, true,
 			DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
 		};
@@ -3990,12 +3987,11 @@ static void
 __test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
 {
 	struct intel_xe_perf_metric_set *test_set = default_test_set;
-	int oa_exponent = max_oa_exponent_for_period_lte(2 * NSEC_PER_SEC);
 	uint64_t properties[] = {
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
-		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
 	};
 	struct intel_xe_oa_open_prop param = {
-- 
2.34.1

