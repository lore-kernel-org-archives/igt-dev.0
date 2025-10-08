Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE03CCD190
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:18:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E4F10E8F3;
	Wed,  8 Oct 2025 21:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nmJNjUtf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A187410E8E5
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759958296; x=1791494296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HP1UBKXt4i87bzfk8Lf8Vbpa+baSIpTieQQqd0ctONA=;
 b=nmJNjUtfn/JrhB07reOXrzDFgBul9s+oS0SYeCperpmhvg595I8d9GiQ
 cQy6YTdUjr3YG32kkCZsudJPWZ92dVjFzgzMu8DYSzSPzz/fEVTDk6IQK
 9KsUrCRpYwZv4Tw+sh0zMHtWYUrPXULssdVMNnLzqdvJjm3MB3D6nIdiy
 XNRWR8MvYBi/KF9peGapdb2VgO5z/hzjrqg+ucwuphb1J2E4YXCB/YNwd
 8jTomB59eAZUEY+hJohcaMX0+HzPXiqb4fh+aaebUdDVynA0IGPVxKrTB
 Mezb8yMdWox6ycRTz7C8hLfk6SnS4sXIBaXpiQqMCaWq5oQwfZLNAYJIM Q==;
X-CSE-ConnectionGUID: zUw8heqIRoCZo2qPqFKnqQ==
X-CSE-MsgGUID: rmYhVSbORCiwb4ByLnFyjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65989652"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65989652"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
X-CSE-ConnectionGUID: VWrm58XaT8yQwiRYZK68Ag==
X-CSE-MsgGUID: /6Uu0L9LTniuRWiub78wBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184805286"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 10/18] tests/intel/xe_oa: Convert blocking/polling tests
 to take OA unit arguments
Date: Wed,  8 Oct 2025 14:17:57 -0700
Message-ID: <20251008211806.625154-11-ashutosh.dixit@intel.com>
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

Convert blocking/polling tests to take 'struct drm_xe_oa_unit *' arguments,
to enable these to be run on all OA units.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 8ee8a85ed7..739da370ef 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2099,7 +2099,7 @@ get_time(void)
 static void test_blocking(uint64_t requested_oa_period,
 			  bool set_kernel_hrtimer,
 			  uint64_t kernel_hrtimer,
-			  const struct drm_xe_engine_class_instance *hwe)
+			  struct drm_xe_oa_unit *oau)
 {
 	int oa_exponent = max_oa_exponent_for_period_lte(requested_oa_period);
 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
@@ -2128,7 +2128,7 @@ static void test_blocking(uint64_t requested_oa_period,
 	int min_iterations = (test_duration_ns / (oa_period + kernel_hrtimer + kernel_hrtimer / 5));
 	int64_t start, end;
 	int n = 0;
-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	size_t format_size = get_oa_format(test_set->perf_oa_format).size;
 
 	ADD_PROPS(props, idx, SAMPLE_OA, true);
@@ -2136,7 +2136,7 @@ static void test_blocking(uint64_t requested_oa_period,
 	ADD_PROPS(props, idx, OA_FORMAT, __ff(test_set->perf_oa_format));
 	ADD_PROPS(props, idx, OA_PERIOD_EXPONENT, oa_exponent);
 	ADD_PROPS(props, idx, OA_DISABLED, true);
-	ADD_PROPS(props, idx, OA_UNIT_ID, 0);
+	ADD_PROPS(props, idx, OA_UNIT_ID, oau->oa_unit_id);
 
 	param.num_properties = (idx - props) / 2;
 	param.properties_ptr = to_user_pointer(props);
@@ -2242,7 +2242,7 @@ static void test_blocking(uint64_t requested_oa_period,
 static void test_polling(uint64_t requested_oa_period,
 			 bool set_kernel_hrtimer,
 			 uint64_t kernel_hrtimer,
-			 const struct drm_xe_engine_class_instance *hwe)
+			 struct drm_xe_oa_unit *oau)
 {
 	int oa_exponent = max_oa_exponent_for_period_lte(requested_oa_period);
 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
@@ -2272,7 +2272,7 @@ static void test_polling(uint64_t requested_oa_period,
 	int min_iterations = (test_duration_ns / (oa_period + (kernel_hrtimer + kernel_hrtimer / 5)));
 	int64_t start, end;
 	int n = 0;
-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	size_t format_size = get_oa_format(test_set->perf_oa_format).size;
 
 	ADD_PROPS(props, idx, SAMPLE_OA, true);
@@ -2280,7 +2280,7 @@ static void test_polling(uint64_t requested_oa_period,
 	ADD_PROPS(props, idx, OA_FORMAT, __ff(test_set->perf_oa_format));
 	ADD_PROPS(props, idx, OA_PERIOD_EXPONENT, oa_exponent);
 	ADD_PROPS(props, idx, OA_DISABLED, true);
-	ADD_PROPS(props, idx, OA_UNIT_ID, 0);
+	ADD_PROPS(props, idx, OA_UNIT_ID, oau->oa_unit_id);
 
 	param.num_properties = (idx - props) / 2;
 	param.properties_ptr = to_user_pointer(props);
@@ -4389,13 +4389,13 @@ test_oa_unit_concurrent_oa_buffer_read(void)
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
@@ -5153,20 +5153,20 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 
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

