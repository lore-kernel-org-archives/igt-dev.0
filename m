Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809F5CCD189
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CFC10E8DE;
	Wed,  8 Oct 2025 21:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="meDE7Hwj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6D510E8E5
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759958296; x=1791494296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3OonImriW4JeMM5YKGj2g/J4AND+wdUlfp9bUaqN558=;
 b=meDE7HwjFZGVs8V+JDvbribptcoAsiaOdQvBslfHCorft/bzXds/4zol
 srDb/HIx60PcsMByKVtGvsP+am1a/T/B0TDION9B33oY0KuqsXxthuPtP
 QaWzqb4ZMkMO0/BQGT0Iq8QcKQOkPH8faDa0shpxBtwarzUvbQ8iLM/P7
 fiCOL7X+3W2RHDOumKm5zHqIkeg3ktQp6SnUcN3GmyfLZ0tB1gkyDv2MA
 c6rDaHgwaCADH2FgldKjA5B4ltf4TAm8IzGaPZZrdI1mpALxvMRcOHmpQ
 s+gzgFaYoLOu+6dXyD4oc+b9w50AMe0cVkIFzuTBcoFpHzCH4ELw00Pe5 A==;
X-CSE-ConnectionGUID: 20fn4A7rS1qQJf9qOnXiyA==
X-CSE-MsgGUID: P3F2k8/gS7eCwcRREX8irA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65989649"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65989649"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
X-CSE-ConnectionGUID: AnGYOjRkQfKSopLSPIbBKA==
X-CSE-MsgGUID: OVzsBfprR+uYN1cX47DDUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184805278"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 07/18] tests/intel/xe_oa: Convert test_oa_formats to
 take an OA unit argument
Date: Wed,  8 Oct 2025 14:17:54 -0700
Message-ID: <20251008211806.625154-8-ashutosh.dixit@intel.com>
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

To enable OA IGT's to run on all OA units, OA unit tests are converted to
take a 'struct drm_xe_oa_unit *' argument (instead of hwe). This patch
converts the first unit test (test_oa_formats), so it introduces this new
infrastructure.

OA units are now identified via a name (corresponding to OA unit type) and
id. OA units are longer identified by hwe, because some OA units have no
associated hwe's.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 92 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 71 insertions(+), 21 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index bc71bfcd30..af01a79d38 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -327,8 +327,6 @@ static int pm_fd = -1;
 static int stream_fd = -1;
 static uint32_t devid;
 
-static struct drm_xe_engine_class_instance default_hwe;
-
 static struct intel_xe_perf *intel_xe_perf;
 static uint64_t oa_exponent_default;
 static size_t default_oa_buffer_size;
@@ -340,6 +338,54 @@ static uint32_t min_oa_exponent;
 static uint32_t buffer_fill_size;
 static uint32_t num_buf_sizes;
 
+/* OA unit names */
+static const char *oa_unit_name[] = {
+	[DRM_XE_OA_UNIT_TYPE_OAG] = "oag",
+	[DRM_XE_OA_UNIT_TYPE_OAM] = "oam",
+	[DRM_XE_OA_UNIT_TYPE_OAM_SAG] = "sag",
+};
+
+static struct intel_xe_perf_metric_set *oa_unit_metric_set(struct drm_xe_oa_unit *oau)
+{
+	const char *test_set_name = NULL;
+	struct intel_xe_perf_metric_set *metric_set_iter;
+	struct intel_xe_perf_metric_set *test_set = NULL;
+
+	if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAG)
+		test_set_name = "TestOa";
+	else if (HAS_OAM(devid) &&
+		 (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAM ||
+		  oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAM_SAG))
+		test_set_name = "MediaSet1";
+	else
+		igt_assert(!"reached");
+
+	igt_list_for_each_entry(metric_set_iter, &intel_xe_perf->metric_sets, link) {
+		if (strcmp(metric_set_iter->symbol_name, test_set_name) == 0) {
+			test_set = metric_set_iter;
+			break;
+		}
+	}
+
+	igt_assert(test_set);
+
+	/*
+	 * configuration was loaded in init_sys_info() ->
+	 * intel_xe_perf_load_perf_configs(), and test_set->perf_oa_metrics_set
+	 * should point to metric id returned by the config add ioctl. 0 is
+	 * invalid.
+	 */
+	igt_assert_neq_u64(test_set->perf_oa_metrics_set, 0);
+
+	igt_debug("oa_unit %d:%d - %s metric set UUID = %s\n",
+		  oau->oa_unit_id,
+		  oau->oa_unit_type,
+		  test_set->symbol_name,
+		  test_set->hw_config_guid);
+
+	return test_set;
+}
+
 static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_class_instance *hwe)
 {
 	const char *test_set_name = NULL;
@@ -381,7 +427,7 @@ static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_cl
 
 	return test_set;
 }
-#define default_test_set metric_set(&default_hwe)
+#define default_test_set oa_unit_metric_set(oa_unit_by_type(drm_fd, DRM_XE_OA_UNIT_TYPE_OAG))
 
 static void set_fd_flags(int fd, int flags)
 {
@@ -1548,11 +1594,11 @@ open_and_read_2_oa_reports(int format_id,
 			   uint32_t *oa_report0,
 			   uint32_t *oa_report1,
 			   bool timer_only,
-			   const struct drm_xe_engine_class_instance *hwe)
+			   struct drm_xe_oa_unit *oau)
 {
-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t properties[] = {
-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 
 		/* Include OA reports in samples */
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
@@ -1672,32 +1718,28 @@ print_reports(uint32_t *oa_report0, uint32_t *oa_report1, int fmt)
 }
 
 static bool
-hwe_supports_oa_type(int oa_type, const struct drm_xe_engine_class_instance *hwe)
+oau_supports_oa_type(int oa_type, struct drm_xe_oa_unit *oau)
 {
 	switch (oa_type) {
 	case DRM_XE_OA_FMT_TYPE_OAM:
 	case DRM_XE_OA_FMT_TYPE_OAM_MPEC:
-		return hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ||
-		       hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
+		return oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAM ||
+		       oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAM_SAG;
 	case DRM_XE_OA_FMT_TYPE_OAG:
 	case DRM_XE_OA_FMT_TYPE_OAR:
-		return hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER;
 	case DRM_XE_OA_FMT_TYPE_OAC:
-		return hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE;
 	case DRM_XE_OA_FMT_TYPE_PEC:
-		return hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
-		       hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE;
+		return oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAG;
 	default:
 		return false;
 	}
-
 }
 
 /**
  * SUBTEST: oa-formats
  * Description: Test that supported OA formats work as expected
  */
-static void test_oa_formats(const struct drm_xe_engine_class_instance *hwe)
+static void test_oa_formats(struct drm_xe_oa_unit *oau)
 {
 	for (int i = 0; i < XE_OA_FORMAT_MAX; i++) {
 		struct oa_format format = get_oa_format(i);
@@ -1707,7 +1749,7 @@ static void test_oa_formats(const struct drm_xe_engine_class_instance *hwe)
 		if (!format.name) /* sparse, indexed by ID */
 			continue;
 
-		if (!hwe_supports_oa_type(format.oa_type, hwe))
+		if (!oau_supports_oa_type(format.oa_type, oau))
 			continue;
 
 		igt_debug("Checking OA format %s\n", format.name);
@@ -1717,13 +1759,13 @@ static void test_oa_formats(const struct drm_xe_engine_class_instance *hwe)
 					   oa_report0,
 					   oa_report1,
 					   false, /* timer reports only */
-					   hwe);
+					   oau);
 
 		print_reports(oa_report0, oa_report1, i);
 		sanity_check_reports(oa_report0, oa_report1, i);
 
-		if (i == metric_set(hwe)->perf_oa_format)
-			pec_sanity_check_reports(oa_report0, oa_report1, metric_set(hwe));
+		if (i == oa_unit_metric_set(oau)->perf_oa_format)
+			pec_sanity_check_reports(oa_report0, oa_report1, oa_unit_metric_set(oau));
 	}
 }
 
@@ -4946,6 +4988,14 @@ static const char *xe_engine_class_name(uint32_t engine_class)
 	igt_require_f(hwe, "no render engine\n"); \
 	igt_dynamic_f("rcs-%d", hwe->engine_instance)
 
+#define __for_oa_unit_by_type(k) \
+	if ((oau = oa_unit_by_type(drm_fd, k))) \
+		igt_dynamic_f("%s-%d", oa_unit_name[oau->oa_unit_type], oau->oa_unit_id)
+
+#define __for_oa_unit_by_type_w_arg(k, str) \
+	if ((oau = oa_unit_by_type(drm_fd, k))) \
+		igt_dynamic_f("%s-%d-%s", oa_unit_name[oau->oa_unit_type], oau->oa_unit_id, str)
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	uint32_t tmp;
@@ -5057,8 +5107,8 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 		test_missing_sample_flags();
 
 	igt_subtest_with_dynamic("oa-formats")
-		__for_one_hwe_in_oag(hwe)
-			test_oa_formats(hwe);
+		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+			test_oa_formats(oau);
 
 	igt_subtest("invalid-oa-exponent")
 		test_invalid_oa_exponent();
-- 
2.48.1

