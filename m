Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F934C021B7
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 20:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225D910E76C;
	Tue, 18 Feb 2025 20:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K3FxtQnY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9320710E764
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 20:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739910496; x=1771446496;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=oPWZjVzY1lXtmEPfGp99ohBfXBAN2MpLOo62+V6w8ds=;
 b=K3FxtQnYW2rhzyAVQTHi59eQQeyaVRIrjMWKPVKuM/PRyCKr4BZAMr11
 gcxXwMnYHM8tVufkXw8sM0KQoveT2pLfmeuToCEH7gMhwzyZjtyYa4HGu
 DM0IXWUcJBXrN7V47dnWd03nKSpsHVexna/nXz4lmQAgImXRyKlULdcwV
 9qK9w2wKJ4EghlowUVt9sENjEH3gyK+Uf+fo799tFXAJ5nl8wYeqyB2D7
 cK9rwilDUPUWZNZqHCYiBUOlGBxHk8cjHEKHInZLPbd4Y40BVbf1AxKdB
 5n8N8xRwFYsG1qKSGHM3jyVicTyRUuPYMMAz3YC3SypcgaXcWf2Bc1OvB g==;
X-CSE-ConnectionGUID: 4ZYfg+LqS/eJKeT3Y1SD8w==
X-CSE-MsgGUID: mknS5RXYT16E5KT5YVpqNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44545840"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="44545840"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:15 -0800
X-CSE-ConnectionGUID: 5JJYXpJJSZW219f3ksny8g==
X-CSE-MsgGUID: UIK1lxORSp6Gyec5QkrKjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114367457"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:15 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t CI run 08/14] tests/intel/xe_oa: Use default buffer size
 for non-zero reason
Date: Tue, 18 Feb 2025 12:28:06 -0800
Message-Id: <20250218202812.1679653-9-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218202812.1679653-1-umesh.nerlige.ramappa@intel.com>
References: <20250218202812.1679653-1-umesh.nerlige.ramappa@intel.com>
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
---
 tests/intel/xe_oa.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index fc03b74af..03d223df4 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2447,7 +2447,7 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
 		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
-		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, oa_buffer_size,
+		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, oa_buffer_size ?: buffer_fill_size
 	};
 	struct intel_xe_oa_open_prop param = {
 		.num_properties = ARRAY_SIZE(properties) / 2,
@@ -4805,15 +4805,9 @@ igt_main
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

