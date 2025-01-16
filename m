Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2640C02187
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 14:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B266910E984;
	Thu, 16 Jan 2025 14:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PALC9VJk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1FB10E985
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 14:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737036430; x=1768572430;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VD9SfkfA2Qk3sAEtXkwE9urc7XLXLhRv9IG8ZIQLdiE=;
 b=PALC9VJk1z9OLhlofOY9VSm0qskb9OBBc414eMwcaUyGHqdXiMLLUZf3
 IcqJ6Xw/gzTJvvxR2m9IjW1K8+s84ymeJf/OZSiofcJUVyq/ERmNDIcRo
 mi+t79HOXr/DAVOF2zIbQNGoSaBb6dF7qdSJKYeYPv+fh9WA52BpsQaac
 +7rDfGLnYGunCK5JyzS6RGdT9sQhiA40TUz21ltt1mR6dfOjsBb+IEw3p
 Nfe8+gCOub3IwxOLjUM2uQSlkazNYn3ciDsry+d+N1+pF9lztaq1PNY9e
 Qs2Fupx7lM/oUjqYKNuxnlu6/BvoHYlLobR2i6y48iF4woatn2JHTW4jv g==;
X-CSE-ConnectionGUID: 5mbI+X0dQ0qH8OsGgWTQ+A==
X-CSE-MsgGUID: EJomvLnYS7mywANKUw5nsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="25023638"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="25023638"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 06:07:09 -0800
X-CSE-ConnectionGUID: rQ3rrPyaQwKtneqEMOkJ/w==
X-CSE-MsgGUID: 6KwAJI7tRmuusc+C0qFRQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105963622"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 06:07:07 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH i-g-t v2 1/1] tests/intel/xe_oa: Extend non-zero-reason test
Date: Thu, 16 Jan 2025 19:24:56 +0530
Message-Id: <20250116135456.4066677-2-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116135456.4066677-1-sai.teja.pottumuttu@intel.com>
References: <20250116135456.4066677-1-sai.teja.pottumuttu@intel.com>
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

Extend non-zero-reason test to use configurable OA buffer sizes and
execute the test for three different sizes 8,16 and 32MB.

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 tests/intel/xe_oa.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 492a6b5d6..f28156a66 100644
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
 
@@ -4867,8 +4871,28 @@ igt_main
 			test_buffer_fill(hwe);
 
 	igt_subtest_with_dynamic("non-zero-reason") {
-		__for_one_hwe_in_oag(hwe)
-			test_non_zero_reason(hwe);
+		struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
+		struct drm_xe_oa_unit *oau = (struct drm_xe_oa_unit *)&qoa->oa_units[0];
+
+		if (oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE) {
+			hwe = oa_unit_engine(drm_fd, 0);
+			if (hwe) {
+				igt_dynamic_f("%s-%d-%s", xe_engine_class_name(hwe->engine_class),
+					      hwe->engine_instance, "8MB")
+					test_non_zero_reason(hwe, SZ_8M);
+
+				igt_dynamic_f("%s-%d-%s", xe_engine_class_name(hwe->engine_class),
+					      hwe->engine_instance, "16MB")
+					test_non_zero_reason(hwe, SZ_16M);
+
+				igt_dynamic_f("%s-%d-%s", xe_engine_class_name(hwe->engine_class),
+					      hwe->engine_instance, "32MB")
+					test_non_zero_reason(hwe, SZ_32M);
+			}
+		} else {
+			__for_one_hwe_in_oag(hwe)
+				test_non_zero_reason(hwe, 0);
+		}
 	}
 
 	igt_subtest("disabled-read-error")
-- 
2.34.1

