Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC3FCCD187
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1937210E8E1;
	Wed,  8 Oct 2025 21:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lq+2/HEz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F4310E8DE
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759958294; x=1791494294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pHUAJUxh8/2fs4PPXalTL8nUCtMcCYCevbtXnclKFsI=;
 b=Lq+2/HEznvEnzDLsFbAmSafbL1db9a/GBhlt64hAlT1vY3vmA/uckAGV
 idKwMmJ/oh+mT27bW7Fx6hoScEB3bq3SY9LS27AwvZj7VyiKjn/6LtuuR
 N6mHzgRXJuYFH6jHQcykELtlg8unQMiYR3LxnNjQUXfHhQwFVgBPwxUyW
 hqqbTxajZEKWIyFcUFxrV2vH9K0wrpwz/qpFpTMD9U7NgO5AaBAzL5eqI
 pN/rjGlg0vj/TpVFy8OGkC6WHa4NUl+qxQArZAYnGzO4tKtIxj/yIk17j
 ebZZofcNfQtD6Ele4qKwfm3FLSvLbs/v+InaKT2oS6UkZkDpaJOR8hoGH w==;
X-CSE-ConnectionGUID: f2nzYYfmQ7+dFbwWyZ9atQ==
X-CSE-MsgGUID: VJflHF7AR0KSvVXJpRSDhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65989644"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65989644"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
X-CSE-ConnectionGUID: B1ySQjkRTyqZf93xI6EaBg==
X-CSE-MsgGUID: PERG804PS5alS/YTFyvQzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184805261"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 02/18] tests/intel/xe_oa: Get rid of unnecessary
 DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE
Date: Wed,  8 Oct 2025 14:17:49 -0700
Message-ID: <20251008211806.625154-3-ashutosh.dixit@intel.com>
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

DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE is needed only when input OA
properties include an exec queue. In other cases the kernel does not use
DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE. Stop providing the unnecessary
DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE property for these cases. This is
needed to use OA units which don't have an associated hwe.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 0a00105bd4..a028823e51 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -1559,8 +1559,6 @@ open_and_read_2_oa_reports(int format_id,
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(format_id),
 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, exponent,
-		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
-
 	};
 	struct intel_xe_oa_open_prop param = {
 		.num_properties = ARRAY_SIZE(properties) / 2,
@@ -1877,7 +1875,6 @@ static void test_oa_exponents(const struct drm_xe_engine_class_instance *hwe)
 			DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 			DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
 			DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, exponent,
-			DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
 		};
 		struct intel_xe_oa_open_prop param = {
 			.num_properties = ARRAY_SIZE(properties) / 2,
@@ -2096,7 +2093,6 @@ static void test_blocking(uint64_t requested_oa_period,
 	ADD_PROPS(props, idx, OA_PERIOD_EXPONENT, oa_exponent);
 	ADD_PROPS(props, idx, OA_DISABLED, true);
 	ADD_PROPS(props, idx, OA_UNIT_ID, 0);
-	ADD_PROPS(props, idx, OA_ENGINE_INSTANCE, hwe->engine_instance);
 
 	param.num_properties = (idx - props) / 2;
 	param.properties_ptr = to_user_pointer(props);
@@ -2241,7 +2237,6 @@ static void test_polling(uint64_t requested_oa_period,
 	ADD_PROPS(props, idx, OA_PERIOD_EXPONENT, oa_exponent);
 	ADD_PROPS(props, idx, OA_DISABLED, true);
 	ADD_PROPS(props, idx, OA_UNIT_ID, 0);
-	ADD_PROPS(props, idx, OA_ENGINE_INSTANCE, hwe->engine_instance);
 
 	param.num_properties = (idx - props) / 2;
 	param.properties_ptr = to_user_pointer(props);
@@ -2498,7 +2493,6 @@ test_oa_tlb_invalidate(const struct drm_xe_engine_class_instance *hwe)
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
-		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
 	};
 	struct intel_xe_oa_open_prop param = {
 		.num_properties = ARRAY_SIZE(properties) / 2,
@@ -2563,7 +2557,6 @@ test_buffer_fill(const struct drm_xe_engine_class_instance *hwe)
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
-		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
 		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, buffer_fill_size,
 	};
 	struct intel_xe_oa_open_prop param = {
@@ -2611,7 +2604,6 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
-		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
 		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, oa_buffer_size ?: buffer_fill_size
 	};
 	struct intel_xe_oa_open_prop param = {
@@ -2700,7 +2692,6 @@ test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
-		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
 		DRM_XE_OA_PROPERTY_WAIT_NUM_REPORTS, num_reports,
 	};
 	struct intel_xe_oa_open_prop param = {
@@ -3491,7 +3482,6 @@ test_stress_open_close(const struct drm_xe_engine_class_instance *hwe)
 			DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
 			DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 			DRM_XE_OA_PROPERTY_OA_DISABLED, true,
-			DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
 		};
 		struct intel_xe_oa_open_prop param = {
 			.num_properties = ARRAY_SIZE(properties) / 2,
@@ -4008,7 +3998,6 @@ __test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
-		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
 	};
 	struct intel_xe_oa_open_prop param = {
 		.num_properties = sizeof(properties) / 16,
@@ -4114,7 +4103,6 @@ __test_mmio_triggered_reports_read(struct drm_xe_engine_class_instance *hwe)
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
-		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
 	};
 	struct intel_xe_oa_open_prop param = {
 		.num_properties = sizeof(properties) / 16,
@@ -4593,7 +4581,6 @@ test_tail_address_wrap(const struct drm_xe_engine_class_instance *hwe, size_t oa
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, exponent,
-		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
 		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, buffer_size,
 	};
 	struct intel_xe_oa_open_prop param = {
@@ -4653,7 +4640,6 @@ static void test_mapped_oa_buffer(map_oa_buffer_test_t test_with_fd_open,
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
-		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
 	};
 	struct intel_xe_oa_open_prop param = {
 		.num_properties = ARRAY_SIZE(properties) / 2,
-- 
2.48.1

