Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CE9CCD196
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 20:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7491110E53F;
	Mon, 13 Oct 2025 20:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e26pMw0/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E03410E534
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 20:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760387450; x=1791923450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ub0Tse+mKu7d2HtmHkzrUd6pzXw6sgsMJe75k8prLNI=;
 b=e26pMw0/wo7RtEEFjD/8Ow1t3mVCEh+Zbam3gFkVjYR71nf3aKva82De
 7yE4Yq97TL4Zg8FJffQy6k8RoUXsUS4Zy+4f0N9ByG2X7UB+SBjHLI8OC
 QPm3vnL70XYw8OvJ9cEzj5A9FpXFNV5a+JSBEymnOyjSie6Ykhs20DMQp
 /U8vLjFA0+8nD5THjUTHasaRN9dyM47RjA9a0p3B2PHC05PB8g2L2FE6e
 KkOHx4EhkcWAPBGGAwiVuIsyUY4MpW17c4aqY6xav6rwd8nAtmKfYcKJ9
 85F8G69/fSEofHCQ8RuJlQdjIn4DhpBzrUUdoJHztjexJ7Alro/bNocey Q==;
X-CSE-ConnectionGUID: K5WCa7csRKGNuw5n99RTmQ==
X-CSE-MsgGUID: YT3xp44ASf6CtZRlSXNcYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73641941"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="73641941"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:48 -0700
X-CSE-ConnectionGUID: g9XoTkGuQr+CoIpZ10LzMg==
X-CSE-MsgGUID: kJmZWTEfQ2G4cTX0WXspdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="180924047"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 14/18] tests/intel/xe_oa: Convert MMIO trigger tests to
 take OA unit arguments
Date: Mon, 13 Oct 2025 13:30:37 -0700
Message-ID: <20251013203042.925115-15-ashutosh.dixit@intel.com>
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

Convert MMIO trigger tests to take 'struct drm_xe_oa_unit *' arguments, to
enable them to be run on all OA units.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 50bcb48f0f..ba4d3ddfb7 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4002,11 +4002,12 @@ static u32 oa_get_mmio_base(const struct drm_xe_engine_class_instance *hwe)
  * SUBTEST: oa-regs-whitelisted
  * Description: Verify that OA registers are whitelisted
  */
-static void test_oa_regs_whitelist(const struct drm_xe_engine_class_instance *hwe)
+static void test_oa_regs_whitelist(struct drm_xe_oa_unit *oau)
 {
-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
+	struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
 	uint64_t properties[] = {
-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
@@ -4020,8 +4021,7 @@ static void test_oa_regs_whitelist(const struct drm_xe_engine_class_instance *hw
 	u32 mmio_base;
 
 	/* FIXME: Add support for OAM whitelist testing */
-	if (hwe->engine_class != DRM_XE_ENGINE_CLASS_RENDER &&
-	    hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
+	if (oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
 		return;
 
 	mmio_base = oa_get_mmio_base(hwe);
@@ -4049,10 +4049,12 @@ static void test_oa_regs_whitelist(const struct drm_xe_engine_class_instance *hw
 }
 
 static void
-__test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
+__test_mmio_triggered_reports(struct drm_xe_oa_unit *oau)
 {
-	struct intel_xe_perf_metric_set *test_set = default_test_set;
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
+	struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
 	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
@@ -4154,10 +4156,12 @@ __test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
 }
 
 static void
-__test_mmio_triggered_reports_read(struct drm_xe_engine_class_instance *hwe)
+__test_mmio_triggered_reports_read(struct drm_xe_oa_unit *oau)
 {
-	struct intel_xe_perf_metric_set *test_set = default_test_set;
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
+	struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
 	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
@@ -4250,8 +4254,7 @@ __test_mmio_triggered_reports_read(struct drm_xe_engine_class_instance *hwe)
  * Description: Test MMIO trigger functionality with read system call
  */
 static void
-test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe,
-			    bool with_read)
+test_mmio_triggered_reports(struct drm_xe_oa_unit *oau, bool with_read)
 {
 	struct igt_helper_process child = {};
 	int ret;
@@ -4261,9 +4264,9 @@ test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe,
 		igt_drop_root();
 
 		if (with_read)
-			__test_mmio_triggered_reports_read(hwe);
+			__test_mmio_triggered_reports_read(oau);
 		else
-			__test_mmio_triggered_reports(hwe);
+			__test_mmio_triggered_reports(oau);
 	}
 	ret = igt_wait_helper(&child);
 	write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
@@ -5285,19 +5288,19 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 		}
 
 		igt_subtest_with_dynamic("oa-regs-whitelisted")
-			__for_one_hwe_in_oag(hwe)
-				test_oa_regs_whitelist(hwe);
+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+				test_oa_regs_whitelist(oau);
 
 		igt_subtest_with_dynamic("mmio-triggered-reports") {
 			igt_require(HAS_OA_MMIO_TRIGGER(devid));
-			__for_one_hwe_in_oag(hwe)
-				test_mmio_triggered_reports(hwe, false);
+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+				test_mmio_triggered_reports(oau, false);
 		}
 
 		igt_subtest_with_dynamic("mmio-triggered-reports-read") {
 			igt_require(HAS_OA_MMIO_TRIGGER(devid));
-			__for_one_hwe_in_oag(hwe)
-				test_mmio_triggered_reports(hwe, true);
+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+				test_mmio_triggered_reports(oau, true);
 		}
 	}
 
-- 
2.48.1

