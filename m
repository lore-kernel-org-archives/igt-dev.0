Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A717CCD18C
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 20:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613E810E53C;
	Mon, 13 Oct 2025 20:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRpR7tMo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B85D10E153
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 20:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760387450; x=1791923450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZnuZDvOHcMZAK8CDvI97dwKy1xCEPL1f6FYX9WJBouc=;
 b=LRpR7tMoyjJmq0HjHXSiO4ZkVKCzQ2ElNVrjT+aypkRJxHqrbfcH5Sxg
 LGyT7WgmPPOGJEDBp6/5ExskvAXc1P78V/9VTZmHgq+74MX44tN0IoUL/
 PaYHpVdOJ16F4jD1zyR+U2uNnmiJceW+DVrm6rYm+Q/Yhi4MnKvpIV/4d
 qM6EcoOmiqxiBGYgtXVl0hzx/J6jWzcxXH23WGCUqgw79MOLKuEAYFb32
 KZm3xwwbljZxmOl/XZt1A9OItZN7AMSOnxjKWrzDqyzaqXtRPq0jdB2Ke
 VeVTkMlNZlokjcaN5f+yVQmXaHz7w34S3vEmEskuwWr/bm5DLAH6RmEzt Q==;
X-CSE-ConnectionGUID: PDOuCHxCSK+3SzZaRMxPgg==
X-CSE-MsgGUID: 9hkWq5ykRQK7yzQsXehAZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73641943"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="73641943"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:48 -0700
X-CSE-ConnectionGUID: Qpgu7wMtSJOoVcgZDSEWQw==
X-CSE-MsgGUID: Fc3LQmB3SLCIOzjzunUOMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="180924053"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 16/18] tests/intel/xe_oa: Run
 test_oa_unit_exclusive_stream on multiple OA units
Date: Mon, 13 Oct 2025 13:30:39 -0700
Message-ID: <20251013203042.925115-17-ashutosh.dixit@intel.com>
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

Change test_oa_unit_exclusive_stream to run simultaneously on all OA units
which have an hwe. Also removed unused code now that all tests are
converted to use OA units rather than hwe's.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 86 ++++++---------------------------------------
 1 file changed, 10 insertions(+), 76 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 0e7d9d063e..128283ddd7 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -385,48 +385,6 @@ static struct intel_xe_perf_metric_set *oa_unit_metric_set(struct drm_xe_oa_unit
 
 	return test_set;
 }
-
-static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_class_instance *hwe)
-{
-	const char *test_set_name = NULL;
-	struct intel_xe_perf_metric_set *metric_set_iter;
-	struct intel_xe_perf_metric_set *test_set = NULL;
-
-	if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
-	    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
-		test_set_name = "TestOa";
-	else if ((hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ||
-		  hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE) &&
-		 HAS_OAM(devid))
-		test_set_name = "MediaSet1";
-	else
-		igt_assert(!"reached");
-
-	igt_list_for_each_entry(metric_set_iter, &intel_xe_perf->metric_sets, link) {
-		if (strcmp(metric_set_iter->symbol_name, test_set_name) == 0) {
-			test_set = metric_set_iter;
-			break;
-		}
-	}
-
-	igt_assert(test_set);
-
-	/*
-	 * configuration was loaded in init_sys_info() ->
-	 * intel_xe_perf_load_perf_configs(), and test_set->perf_oa_metrics_set
-	 * should point to metric id returned by the config add ioctl. 0 is
-	 * invalid.
-	 */
-	igt_assert_neq_u64(test_set->perf_oa_metrics_set, 0);
-
-	igt_debug("engine %d:%d - %s metric set UUID = %s\n",
-		  hwe->engine_class,
-		  hwe->engine_instance,
-		  test_set->symbol_name,
-		  test_set->hw_config_guid);
-
-	return test_set;
-}
 #define default_test_set oa_unit_metric_set(oa_unit_by_type(drm_fd, DRM_XE_OA_UNIT_TYPE_OAG))
 
 static void set_fd_flags(int fd, int flags)
@@ -4303,8 +4261,8 @@ static void
 test_oa_unit_exclusive_stream(bool exponent)
 {
 	struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
+	struct drm_xe_engine_class_instance *hwe;
 	struct drm_xe_oa_unit *oau;
-	u8 *poau = (u8 *)&qoa->oa_units[0];
 	uint64_t properties[] = {
 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
@@ -4325,12 +4283,12 @@ test_oa_unit_exclusive_stream(bool exponent)
 
 	/* for each oa unit, open one random perf stream with sample OA */
 	for (i = 0; i < qoa->num_oa_units; i++) {
-		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oa_unit_by_id(drm_fd, i));
+		oau = oa_unit_by_id(drm_fd, i);
+		hwe = oa_unit_engine(oau);
 
-		oau = (struct drm_xe_oa_unit *)poau;
-		if (oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
+		if (!hwe)
 			continue;
-		test_set = metric_set(hwe);
+		test_set = oa_unit_metric_set(oau);
 
 		igt_debug("opening OA buffer with c:i %d:%d\n",
 			  hwe->engine_class, hwe->engine_instance);
@@ -4346,7 +4304,6 @@ test_oa_unit_exclusive_stream(bool exponent)
 		properties[9] = hwe->engine_instance;
 		perf_fd[i] = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param);
 		igt_assert(perf_fd[i] >= 0);
-		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
 	}
 
 	/* Xe KMD holds reference to the exec_q's so they shouldn't be really destroyed */
@@ -4355,15 +4312,15 @@ test_oa_unit_exclusive_stream(bool exponent)
 			xe_exec_queue_destroy(drm_fd, exec_q[i]);
 
 	/* for each oa unit make sure no other streams can be opened */
-	poau = (u8 *)&qoa->oa_units[0];
 	for (i = 0; i < qoa->num_oa_units; i++) {
-		struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oa_unit_by_id(drm_fd, i));
 		int err;
 
-		oau = (struct drm_xe_oa_unit *)poau;
-		if (oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
+		oau = oa_unit_by_id(drm_fd, i);
+		hwe = oa_unit_engine(oau);
+
+		if (!hwe)
 			continue;
-		test_set = metric_set(hwe);
+		test_set = oa_unit_metric_set(oau);
 
 		igt_debug("try with exp with c:i %d:%d\n",
 			  hwe->engine_class, hwe->engine_instance);
@@ -4386,7 +4343,6 @@ test_oa_unit_exclusive_stream(bool exponent)
 		err = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param);
 		igt_assert_lt(err, 0);
 		igt_assert(errno == EBUSY || errno == ENODEV);
-		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
 	}
 
 	for (i = 0; i < qoa->num_oa_units; i++) {
@@ -4967,28 +4923,6 @@ exit:
 	oa_sync_free(&osync);
 }
 
-#define __for_one_hwe_in_each_oa_unit(hwe) \
-	for (int m = 0; !m || hwe; m++) \
-		for_each_if(hwe = oa_unit_engine(oa_unit_by_id(drm_fd, m))) \
-			igt_dynamic_f("%s-%d", xe_engine_class_name(hwe->engine_class), \
-				      hwe->engine_instance)
-
-/* Only OAG (not OAM) is currently supported */
-#define __for_one_hwe_in_oag(hwe) \
-	if ((hwe = oa_unit_engine(oa_unit_by_type(drm_fd, DRM_XE_OA_UNIT_TYPE_OAG)))) \
-		igt_dynamic_f("%s-%d", xe_engine_class_name(hwe->engine_class), \
-			      hwe->engine_instance)
-
-#define __for_one_hwe_in_oag_w_arg(hwe, str) \
-	if ((hwe = oa_unit_engine(oa_unit_by_type(drm_fd, DRM_XE_OA_UNIT_TYPE_OAG)))) \
-		igt_dynamic_f("%s-%d-%s", xe_engine_class_name(hwe->engine_class), \
-			      hwe->engine_instance, str)
-
-#define __for_one_render_engine(hwe) \
-	hwe = &xe_find_engine_by_class(drm_fd, DRM_XE_ENGINE_CLASS_RENDER)->instance; \
-	igt_require_f(hwe, "no render engine\n"); \
-	igt_dynamic_f("rcs-%d", hwe->engine_instance)
-
 #define __for_oa_unit_by_type(k) \
 	if ((oau = oa_unit_by_type(drm_fd, k))) \
 		igt_dynamic_f("%s-%d", oa_unit_name[oau->oa_unit_type], oau->oa_unit_id)
-- 
2.48.1

