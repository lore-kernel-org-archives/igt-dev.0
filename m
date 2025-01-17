Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F681C02183
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 00:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0221D10E048;
	Fri, 17 Jan 2025 00:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d8OxLxvf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A33010E048
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2025 00:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737075275; x=1768611275;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4LiMmAUMEA1Gc+KzdJkNk+K6ePLs02nvRSlCPjknAP4=;
 b=d8OxLxvfBxU4WA8v4Aj/yTh9N6/d4FtPAA4vBkuR5jwdI6JkqNPEDos4
 wCCh24+61MWIm5mR9qGsJR9wRIVMwxr/dYaODGJgBGrdqi832mdNKZhps
 rzfPzyadS4126TqhHWjHJ/J818ODcCDnIeM0ppNHMMyTVLBGjY4rfQ9Wu
 gt6azrnsnOBidBnC/xOdmHW498u4RIqtZN1W0uk1vzMuCaS0R+YEiwivn
 2uHPa0NPtS34iuZAsxK6AJNYxU/uWui4218dAduwZLQ+joYnmWXKHHlUg
 xQd7jm6QMEgchbQygJ7zPNuHQn0aDewJoJfy9+QYMB1Mgbv4ChDLpIf1h w==;
X-CSE-ConnectionGUID: 74iL0BHTRH+daSlNHWte7A==
X-CSE-MsgGUID: Mg3zYLm4QBGAZiuoQSe6/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48905425"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="48905425"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 16:54:28 -0800
X-CSE-ConnectionGUID: BU5OwGqyQlyHT9paKroBiQ==
X-CSE-MsgGUID: r42QKhYzTD22ShByU1eo6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105506601"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 16:54:28 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Subject: [PATCH v2 i-g-t] tests/intel/xe_oa: Extend non-zero-reason test
Date: Thu, 16 Jan 2025 16:54:24 -0800
Message-ID: <20250117005424.3038122-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.47.1
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

From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

Extend non-zero-reason test to use configurable OA buffer sizes and
execute the test for three different sizes 8,16 and 32MB.

v2 (Ashutosh):
  - Define and use __for_one_hwe_in_oag_w_arg
  - Introduce and use 'oau' variable at igt_main scope for parsing
    capabilities

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 tests/intel/xe_oa.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 492a6b5d64..8d2ebcdcaa 100644
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
 
@@ -4762,6 +4766,11 @@ static const char *xe_engine_class_name(uint32_t engine_class)
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
@@ -4796,6 +4805,7 @@ igt_main
 		{ NULL },
 	};
 	struct drm_xe_engine_class_instance *hwe = NULL;
+	struct drm_xe_oa_unit *oau;
 	struct xe_device *xe_dev;
 
 	igt_fixture {
@@ -4825,6 +4835,7 @@ igt_main
 
 		/* See xe_query_oa_units_new() */
 		igt_require(xe_dev->oa_units);
+		oau = nth_oa_unit(drm_fd, 0);
 
 		devid = intel_get_drm_devid(drm_fd);
 		sysfs = igt_sysfs_open(drm_fd);
@@ -4867,8 +4878,19 @@ igt_main
 			test_buffer_fill(hwe);
 
 	igt_subtest_with_dynamic("non-zero-reason") {
-		__for_one_hwe_in_oag(hwe)
-			test_non_zero_reason(hwe);
+		if (oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE) {
+			__for_one_hwe_in_oag_w_arg(hwe, "8M")
+				test_non_zero_reason(hwe, SZ_8M);
+
+			__for_one_hwe_in_oag_w_arg(hwe, "16M")
+				test_non_zero_reason(hwe, SZ_16M);
+
+			__for_one_hwe_in_oag_w_arg(hwe, "32M")
+				test_non_zero_reason(hwe, SZ_32M);
+		} else {
+			__for_one_hwe_in_oag_w_arg(hwe, "default")
+				test_non_zero_reason(hwe, 0);
+		}
 	}
 
 	igt_subtest("disabled-read-error")
@@ -4999,9 +5021,6 @@ igt_main
 
 	igt_subtest_group {
 		igt_fixture {
-			struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
-			struct drm_xe_oa_unit *oau = (struct drm_xe_oa_unit *)&qoa->oa_units[0];
-
 			igt_require(oau->capabilities & DRM_XE_OA_CAPS_SYNCS);
 		}
 
-- 
2.47.1

