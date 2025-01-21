Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7556CC02182
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 12:00:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F0310E584;
	Tue, 21 Jan 2025 12:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bNhymL8b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1299910E58B
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 12:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737460832; x=1768996832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4pHJ7QzQqcD5Y6kRo2k13Kew6zAvuAyaxgX9AkkZMCA=;
 b=bNhymL8b0oCpoUpiRy0WHpKMJ0bSGkkXFlWSKVwFb63YugW7UX5OCLqD
 0g3C4DmpdGpSmAIman1ye630M9NhxpG8kP7mxKNrJvs1yM9pJDNpN6VKE
 MHAjW6ry7g/0lHV7P9ozO7nhm4/KcCoFY8OK1DFW1TbSzWr/eRe7mDLaP
 4MVXpkDSzaqdJyR6sTcb1yVo4evPt5E1B88CxUPgBPiw/iSw0IUKfceeo
 KPDLFBjfK6f/CSjdTteFxLGOG7IiMErc4nSH2zhiI5I0XlHT5tnZ6aNm9
 +m6qAnXYgn2IfoseQ10zjjsOvJxz14r71zgTOa0VRC+A6ai8HBi8xxzIx Q==;
X-CSE-ConnectionGUID: +otrLo1GRb+wg1rTTm8Itw==
X-CSE-MsgGUID: rbHg9gE+RjOs/WK9TTFgPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="55279534"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="55279534"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 04:00:32 -0800
X-CSE-ConnectionGUID: t/oy150hTqm3d7buxUJCkA==
X-CSE-MsgGUID: /YRY+CMWSRiOdr0d0p8Ykg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111404284"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 04:00:27 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH i-g-t v3 1/1] tests/intel/xe_oa: Extend non-zero-reason test
Date: Tue, 21 Jan 2025 17:29:35 +0530
Message-Id: <20250121115935.1654625-2-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250121115935.1654625-1-sai.teja.pottumuttu@intel.com>
References: <20250121115935.1654625-1-sai.teja.pottumuttu@intel.com>
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

Extend non-zero-reason test to use/test configurable OA buffer size
property if the capability is available.

v2 (Ashutosh):
  - Define and use __for_one_hwe_in_oag_w_arg
  - Introduce and use 'oau' variable at igt_main scope for parsing
    capabilities

v3:
  - Limit the tests only to 16MB to make it faster (Ashutosh)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 tests/intel/xe_oa.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index df7fa3229..0242fd594 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2504,7 +2504,7 @@ again_1:
  * Description: Test reason field is non-zero. Can also check OA buffer wraparound issues
  */
 static void
-test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe)
+test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_buffer_size)
 {
 	/* ~20 micro second period */
 	int oa_exponent = max_oa_exponent_for_period_lte(20000);
@@ -2522,6 +2522,7 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe)
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
 		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
+		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, oa_buffer_size,
 	};
 	struct intel_xe_oa_open_prop param = {
 		.num_properties = ARRAY_SIZE(properties) / 2,
@@ -2541,6 +2542,9 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe)
 	load_helper_init();
 	load_helper_run(HIGH);
 
+	if (!oa_buffer_size)
+		param.num_properties = param.num_properties - 1;
+
 	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
         set_fd_flags(stream_fd, O_CLOEXEC);
 
@@ -4779,6 +4783,11 @@ static const char *xe_engine_class_name(uint32_t engine_class)
 		igt_dynamic_f("%s-%d", xe_engine_class_name(hwe->engine_class), \
 			      hwe->engine_instance)
 
+#define __for_one_hwe_in_oag_w_arg(hwe, str) \
+	if ((hwe = oa_unit_engine(drm_fd, 0))) \
+		igt_dynamic_f("%s-%d-%s", xe_engine_class_name(hwe->engine_class), \
+			      hwe->engine_instance, str)
+
 #define __for_one_render_engine_0(hwe) \
 	xe_for_each_engine(drm_fd, hwe) \
 		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER) \
@@ -4813,6 +4822,7 @@ igt_main
 		{ NULL },
 	};
 	struct drm_xe_engine_class_instance *hwe = NULL;
+	struct drm_xe_oa_unit *oau;
 	struct xe_device *xe_dev;
 
 	igt_fixture {
@@ -4842,6 +4852,7 @@ igt_main
 
 		/* See xe_query_oa_units_new() */
 		igt_require(xe_dev->oa_units);
+		oau = nth_oa_unit(drm_fd, 0);
 
 		devid = intel_get_drm_devid(drm_fd);
 		sysfs = igt_sysfs_open(drm_fd);
@@ -4884,8 +4895,13 @@ igt_main
 			test_buffer_fill(hwe);
 
 	igt_subtest_with_dynamic("non-zero-reason") {
-		__for_one_hwe_in_oag(hwe)
-			test_non_zero_reason(hwe);
+		if (oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE) {
+			__for_one_hwe_in_oag_w_arg(hwe, "16M")
+				test_non_zero_reason(hwe, SZ_16M);
+		} else {
+			__for_one_hwe_in_oag_w_arg(hwe, "default")
+				test_non_zero_reason(hwe, 0);
+		}
 	}
 
 	igt_subtest("disabled-read-error")
@@ -5016,9 +5032,6 @@ igt_main
 
 	igt_subtest_group {
 		igt_fixture {
-			struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
-			struct drm_xe_oa_unit *oau = (struct drm_xe_oa_unit *)&qoa->oa_units[0];
-
 			igt_require(oau->capabilities & DRM_XE_OA_CAPS_SYNCS);
 		}
 
-- 
2.34.1

