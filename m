Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DDECCD192
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 20:30:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290A210E539;
	Mon, 13 Oct 2025 20:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a6Uv7WqZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95CA10E153
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 20:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760387448; x=1791923448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/gkebJPzgtTooqNNgH0YfXXvQaZ4eOZukxxPXfH1FIQ=;
 b=a6Uv7WqZTL3hwhiKxrz2Vf+ebVM+QOpnxmEtoIhJEw8+mE5cMWXrt6G+
 j5ZCZXw6MT1jZUaMtvk1DDbI+sk+azmTDPmoRT91lm0vAcbpAwlFqOdXD
 YI37WbwBdHbxZVfrTolFigqjoDlr6j3ohbHUlVfqRP3f+7UXM0eADFR3d
 8azFuF/5/qsEEq+TIvZypNO449HvFrLbOdx1LifVUKUhsBTrVkjn5EQgF
 n/hX2D4qB5YMKYlULWCqB2dmBlZCfRT2bP6/CfUxO4Ud4nSBdNEasyKpd
 tkny3Bc9EVN9z5TkHuFqt1inIcYNNnQ3+ABibmnAbl7JMzikqIz/XvYG0 w==;
X-CSE-ConnectionGUID: y3Qq4gZfQhiGur2CG8kLDA==
X-CSE-MsgGUID: q0O+aLcISr678pBwrLd7Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73641929"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="73641929"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:48 -0700
X-CSE-ConnectionGUID: SW2P2YPwTgic1qgpFNxejA==
X-CSE-MsgGUID: AiWGh1E0RSi3OcupdJPklQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="180924011"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:47 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 02/18] tests/intel/xe_oa: Get rid of unnecessary
 DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE
Date: Mon, 13 Oct 2025 13:30:25 -0700
Message-ID: <20251013203042.925115-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013203042.925115-1-ashutosh.dixit@intel.com>
References: <20251013203042.925115-1-ashutosh.dixit@intel.com>
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
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
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

