Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86037C282E3
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 23:15:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0184D10E4EE;
	Mon,  3 Mar 2025 23:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iy/eX0/s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A77910E4EB
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 23:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741043708; x=1772579708;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=PA9ZtIJDJnAO3444yA/I4/03GtlEt3T5WSDkSa6e9o8=;
 b=Iy/eX0/s68WeFFm/DqiSk9FZA8j1SrM/f5AkMayal6TFCaxrnhEpS4NP
 N+b2G26ddQV8cGUKuPKWl9wc3zW/3+IfqO9we053oBsJQ+3gxUp0KZWeF
 MQjCg6oQLCU4MBL+1ik58RnPLt4JgeGuZONTuAYtRM5sIEI6z65Nd1moe
 +E7cpKNDF+85VQUTn+k85yh6Bju8rvIviqj8ETsKP2g/Pgd43PqmfV3T3
 i0kqC4ggdCDfIrDfIwCRCOb16KR9TrPhpQOr2vY7ViS9U0cWiFskJ5Qez
 2n9824IcQ4uxJTityC104HBfUt/fouBeD5Y1oyF1K6xbruwqxjD9Aiolk w==;
X-CSE-ConnectionGUID: +eh2JfVhSnqAK44OTh59Iw==
X-CSE-MsgGUID: eJ0SR441QtCswX1bqAy2WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41793048"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41793048"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:08 -0800
X-CSE-ConnectionGUID: Xhj8iCUjT06iW5S5ATUWbA==
X-CSE-MsgGUID: abNCRBUxRDWzMaNGbndCdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118716711"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:08 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 09/14] tests/intel/xe_oa: Use default buffer size for
 non-zero reason
Date: Mon,  3 Mar 2025 15:14:57 -0800
Message-Id: <20250303231502.135720-10-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303231502.135720-1-umesh.nerlige.ramappa@intel.com>
References: <20250303231502.135720-1-umesh.nerlige.ramappa@intel.com>
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

Use a default buffer size for non-zero-reason for and strip
out testing buffer size in the same test.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 3b9f13d9e..206e3e617 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2437,7 +2437,7 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
 		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
-		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, oa_buffer_size,
+		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, oa_buffer_size ?: buffer_fill_size
 	};
 	struct intel_xe_oa_open_prop param = {
 		.num_properties = ARRAY_SIZE(properties) / 2,
@@ -4796,15 +4796,9 @@ igt_main
 		__for_one_hwe_in_oag(hwe)
 			test_buffer_fill(hwe);
 
-	igt_subtest_with_dynamic("non-zero-reason") {
-		if (oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE) {
-			__for_one_hwe_in_oag_w_arg(hwe, "16M")
-				test_non_zero_reason(hwe, SZ_16M);
-		} else {
-			__for_one_hwe_in_oag_w_arg(hwe, "default")
-				test_non_zero_reason(hwe, 0);
-		}
-	}
+	igt_subtest_with_dynamic("non-zero-reason")
+		__for_one_hwe_in_oag(hwe)
+			test_non_zero_reason(hwe, 0);
 
 	igt_subtest("disabled-read-error")
 		test_disabled_read_error();
-- 
2.34.1

