Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A921BCCD195
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 20:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F07A10E540;
	Mon, 13 Oct 2025 20:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TKakn2E6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3220A10E534
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 20:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760387450; x=1791923450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oeKQdHjI0CuJ/KS37/Z6RHm+mHmvgh9Px8sYGA9TG+8=;
 b=TKakn2E6PsIMA6SmFVS5hGNxLjDlbXIznJlpE4j4KvtZ/Z1EntxSvciL
 y7Zi4Z6RKbR6WekfSRlkwN37QT/1KhycAYL+3kLeeJGA1+dCBfLuB2g+W
 a+aso0as3omosyzCjUHAzTX4aTwUTYmu5Mk4vS5eJLnXuR6TJ4JwdFS3F
 ecO/5t7Y6Ir1EG2+gK4SIQ+PgUL91HwU40nXJgWKiIYXHOjrqg8UpGBqD
 JS15r0u66aFtv2zFP/XbFGh6EpwS1XvEE2sWs9EVQYjIGFRrukvV9W9WC
 PFZzmc+V9OhuJLlemgVVWtjzfcYK1miJGhb/lebK4qTy0YFdYfdOSaDFo w==;
X-CSE-ConnectionGUID: 4ngUjxdWQWWz+Hw5Jku5fg==
X-CSE-MsgGUID: 9rFUv3kLTUumeexYB8H23Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73641937"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="73641937"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:48 -0700
X-CSE-ConnectionGUID: 8f81r4/9SxOWACF/2v/5AQ==
X-CSE-MsgGUID: cmwnxMkITT6JW3RD13ekCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="180924035"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 10/18] tests/intel/xe_oa: Convert blocking/polling tests
 to take OA unit arguments
Date: Mon, 13 Oct 2025 13:30:33 -0700
Message-ID: <20251013203042.925115-11-ashutosh.dixit@intel.com>
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

Convert blocking/polling tests to take 'struct drm_xe_oa_unit *' arguments,
to enable these to be run on all OA units.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index c44ce3c56a..3f9743a90b 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2109,7 +2109,7 @@ get_time(void)
 static void test_blocking(uint64_t requested_oa_period,
 			  bool set_kernel_hrtimer,
 			  uint64_t kernel_hrtimer,
-			  const struct drm_xe_engine_class_instance *hwe)
+			  struct drm_xe_oa_unit *oau)
 {
 	int oa_exponent = max_oa_exponent_for_period_lte(requested_oa_period);
 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
@@ -2138,7 +2138,7 @@ static void test_blocking(uint64_t requested_oa_period,
 	int min_iterations = (test_duration_ns / (oa_period + kernel_hrtimer + kernel_hrtimer / 5));
 	int64_t start, end;
 	int n = 0;
-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	size_t format_size = get_oa_format(test_set->perf_oa_format).size;
 
 	ADD_PROPS(props, idx, SAMPLE_OA, true);
@@ -2146,7 +2146,7 @@ static void test_blocking(uint64_t requested_oa_period,
 	ADD_PROPS(props, idx, OA_FORMAT, __ff(test_set->perf_oa_format));
 	ADD_PROPS(props, idx, OA_PERIOD_EXPONENT, oa_exponent);
 	ADD_PROPS(props, idx, OA_DISABLED, true);
-	ADD_PROPS(props, idx, OA_UNIT_ID, 0);
+	ADD_PROPS(props, idx, OA_UNIT_ID, oau->oa_unit_id);
 
 	param.num_properties = (idx - props) / 2;
 	param.properties_ptr = to_user_pointer(props);
@@ -2252,7 +2252,7 @@ static void test_blocking(uint64_t requested_oa_period,
 static void test_polling(uint64_t requested_oa_period,
 			 bool set_kernel_hrtimer,
 			 uint64_t kernel_hrtimer,
-			 const struct drm_xe_engine_class_instance *hwe)
+			 struct drm_xe_oa_unit *oau)
 {
 	int oa_exponent = max_oa_exponent_for_period_lte(requested_oa_period);
 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
@@ -2282,7 +2282,7 @@ static void test_polling(uint64_t requested_oa_period,
 	int min_iterations = (test_duration_ns / (oa_period + (kernel_hrtimer + kernel_hrtimer / 5)));
 	int64_t start, end;
 	int n = 0;
-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	size_t format_size = get_oa_format(test_set->perf_oa_format).size;
 
 	ADD_PROPS(props, idx, SAMPLE_OA, true);
@@ -2290,7 +2290,7 @@ static void test_polling(uint64_t requested_oa_period,
 	ADD_PROPS(props, idx, OA_FORMAT, __ff(test_set->perf_oa_format));
 	ADD_PROPS(props, idx, OA_PERIOD_EXPONENT, oa_exponent);
 	ADD_PROPS(props, idx, OA_DISABLED, true);
-	ADD_PROPS(props, idx, OA_UNIT_ID, 0);
+	ADD_PROPS(props, idx, OA_UNIT_ID, oau->oa_unit_id);
 
 	param.num_properties = (idx - props) / 2;
 	param.properties_ptr = to_user_pointer(props);
@@ -4399,13 +4399,13 @@ test_oa_unit_concurrent_oa_buffer_read(void)
 	struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
 
 	igt_fork(child, qoa->num_oa_units) {
-		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oa_unit_by_id(drm_fd, child));
+		struct drm_xe_oa_unit *oau = oa_unit_by_id(drm_fd, child);
 
 		/* No OAM support yet */
-		if (oa_unit_by_id(drm_fd, child)->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
+		if (oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
 			exit(0);
 
-		test_blocking(40 * 1000 * 1000, false, 5 * 1000 * 1000, hwe);
+		test_blocking(40 * 1000 * 1000, false, 5 * 1000 * 1000, oau);
 	}
 	igt_waitchildren();
 }
@@ -5163,20 +5163,20 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 
 	igt_subtest_with_dynamic("blocking") {
 		igt_require(!igt_run_in_simulation());
-		__for_one_hwe_in_oag(hwe)
+		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
 			test_blocking(40 * 1000 * 1000 /* 40ms oa period */,
 				      false /* set_kernel_hrtimer */,
 				      5 * 1000 * 1000 /* default 5ms/200Hz hrtimer */,
-				      hwe);
+				      oau);
 	}
 
 	igt_subtest_with_dynamic("polling") {
 		igt_require(!igt_run_in_simulation());
-		__for_one_hwe_in_oag(hwe)
+		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
 			test_polling(40 * 1000 * 1000 /* 40ms oa period */,
 				     false /* set_kernel_hrtimer */,
 				     5 * 1000 * 1000 /* default 5ms/200Hz hrtimer */,
-				     hwe);
+				     oau);
 	}
 
 	igt_subtest("polling-small-buf")
-- 
2.48.1

