Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891C0CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704FD10E8EC;
	Wed,  8 Oct 2025 21:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FpHhgzlV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F4A10E8E5
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759958297; x=1791494297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Y2AQjoox+XiPVvH4JOP8GG9C+hmO01vpsdgEnAq3Tw=;
 b=FpHhgzlV1ooauiaziWuhFLj7WFqiOUwMze7RU3C8DYPLMG1JleILMI4E
 R/cC7HqJZHjHg5F55z+vDACQv7+Panu4xjHG0yzD1kSw7g8NkDOuQm50o
 g3soWptZSYVcRappIAaAToogkthMQL6xBj6R3ATUr2RWSclQb2xWms7UP
 VQS/qD533pEgR7+CRVicmVTmRzXodE3jfcPpf63B3aQoUf0uk3JvwsTn7
 22AmT+/GuuEBfABjApKhj4yhKuAKBvKQN0jceZ+67FGh+lWsYUrs/6Ger
 frCU6VCVBG2hhLWoKMtwWhzl17ruBo/guG6sK5GVEOe9e8k576TgLphff w==;
X-CSE-ConnectionGUID: UjNku62eRRyj57FB3zBhzA==
X-CSE-MsgGUID: iwwoajTyTeq5KnAnwzHkjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65989658"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65989658"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:15 -0700
X-CSE-ConnectionGUID: KFxMSuZgTj6c6DsyfUtIUA==
X-CSE-MsgGUID: RBQkyKSsQxyKfb/pp8WebA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184805302"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:15 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 15/18] tests/intel/xe_oa: Convert sync tests to take OA
 unit arguments
Date: Wed,  8 Oct 2025 14:18:02 -0700
Message-ID: <20251008211806.625154-16-ashutosh.dixit@intel.com>
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

Convert sync tests to take 'struct drm_xe_oa_unit *' arguments, to enable
them to be run on all OA units.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 35 ++++++++---------------------------
 1 file changed, 8 insertions(+), 27 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index a3f4a80d6a..75142e610d 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4766,9 +4766,10 @@ struct oa_sync {
 };
 
 static void
-oa_sync_init(enum oa_sync_type sync_type, const struct drm_xe_engine_class_instance *hwe,
+oa_sync_init(enum oa_sync_type sync_type, struct drm_xe_oa_unit *oau,
 	     struct oa_sync *osync, struct drm_xe_sync *sync)
 {
+	struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
 	uint64_t addr = 0x1a0000;
 
 	osync->sync_type = sync_type;
@@ -4890,15 +4891,15 @@ static void oa_sync_free(struct oa_sync *osync)
  * @wait-cfg:	Exercise reconfig path and wait for syncs to signal
  * @wait:	Don't exercise reconfig path and wait for syncs to signal
  */
-static void test_syncs(const struct drm_xe_engine_class_instance *hwe,
+static void test_syncs(struct drm_xe_oa_unit *oau,
 		       enum oa_sync_type sync_type, int flags)
 {
 	struct drm_xe_ext_set_property extn[XE_OA_MAX_SET_PROPERTIES] = {};
-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	struct drm_xe_sync sync = {};
 	struct oa_sync osync = {};
 	uint64_t open_properties[] = {
-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
@@ -4929,7 +4930,7 @@ static void test_syncs(const struct drm_xe_engine_class_instance *hwe,
 	if (sync_type == OA_SYNC_TYPE_USERPTR || sync_type == OA_SYNC_TYPE_UFENCE)
 		flags |= WAIT;
 
-	oa_sync_init(sync_type, hwe, &osync, &sync);
+	oa_sync_init(sync_type, oau, &osync, &sync);
 
 	stream_fd = __perf_open(drm_fd, &open_param, false);
 
@@ -4956,25 +4957,6 @@ exit:
 	oa_sync_free(&osync);
 }
 
-static const char *xe_engine_class_name(uint32_t engine_class)
-{
-	switch (engine_class) {
-		case DRM_XE_ENGINE_CLASS_RENDER:
-			return "rcs";
-		case DRM_XE_ENGINE_CLASS_COPY:
-			return "bcs";
-		case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
-			return "vcs";
-		case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
-			return "vecs";
-		case DRM_XE_ENGINE_CLASS_COMPUTE:
-			return "ccs";
-		default:
-			igt_warn("Engine class 0x%x unknown\n", engine_class);
-			return "unknown";
-	}
-}
-
 #define __for_one_hwe_in_each_oa_unit(hwe) \
 	for (int m = 0; !m || hwe; m++) \
 		for_each_if(hwe = oa_unit_engine(oa_unit_by_id(drm_fd, m))) \
@@ -5055,7 +5037,6 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 		{ "ufence-wait", OA_SYNC_TYPE_UFENCE, WAIT },
 		{ NULL },
 	};
-	struct drm_xe_engine_class_instance *hwe = NULL;
 	struct drm_xe_oa_unit *oau;
 	struct xe_device *xe_dev;
 
@@ -5301,8 +5282,8 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 
 		for (const struct sync_section *s = sync_sections; s->name; s++) {
 			igt_subtest_with_dynamic_f("syncs-%s", s->name) {
-				__for_one_hwe_in_oag(hwe)
-					test_syncs(hwe, s->sync_type, s->flags);
+				__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+					test_syncs(oau, s->sync_type, s->flags);
 			}
 		}
 	}
-- 
2.48.1

