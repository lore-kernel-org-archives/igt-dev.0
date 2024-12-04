Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2818DE7716D
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 08:23:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84C510EC4F;
	Wed,  4 Dec 2024 08:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n7lMGlC5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0FF10EC4F
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 08:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733300622; x=1764836622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bLhGjvw0VTcTdPNf574VX0fJjPcsRXOr3Dr9NLTtW9k=;
 b=n7lMGlC5/SYFlTqI21bMJ3B3n4p+T/khWO0s4vgLX4u+bxLOIx3YS1Sv
 JL8dVxaq6SynmzNpLoaDihRkWchlv0Mq+2cSCXUr8K7Ki2dDsowrpj6n+
 XmJkhlSDMtuorAzgRXaXBDU+ocOsxCN/6rI4PzFrcOnJwNlVsg2S3Sp9R
 swSEdvGFX+Vp4/Z1rTl5At0z1sZHnO/V/V5o2O+P80Euey4PdQ9Ld24PD
 OYc0+DL2mkfzrahtoyLJucXc0l+xnfewDLlAH/IWfzNs136N15Z4MPHsU
 TSjW/wbAovRCjX++4gcpyXKRO3eYEqHz0TNDQdHCryJWIzOFO/W+65drd A==;
X-CSE-ConnectionGUID: 5eZYMP2gTL2tCLcMat2w0w==
X-CSE-MsgGUID: pYztK4mhSkyb9S4oQ2gE+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44163538"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="44163538"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 00:23:41 -0800
X-CSE-ConnectionGUID: wqGnC21OSamS//p9vXK8xg==
X-CSE-MsgGUID: e8frHW0GQEeRts3/rTbVLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="98768721"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 00:23:41 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 4/9] tests/kms_sharpness_filter: Add toggle subtest
Date: Wed,  4 Dec 2024 13:56:22 +0530
Message-Id: <20241204082627.1800617-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241204082627.1800617-1-swati2.sharma@intel.com>
References: <20241204082627.1800617-1-swati2.sharma@intel.com>
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

Subtest is added to verify toggling/switching between enabling
and disabling of content adaptive sharpness filter.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_sharpness_filter.c | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
index ac12d13bf..8ade3b0bc 100644
--- a/tests/kms_sharpness_filter.c
+++ b/tests/kms_sharpness_filter.c
@@ -34,6 +34,9 @@
  * SUBTEST: filter-formats
  * Description: Verify content adaptive sharpness filter with varying formats.
  * Functionality: casf, pixel-format
+ *
+ * SUBTEST: filter-toggle
+ * Description: Verify toggling between enabling and disabling content adaptive sharpness filter.
 */
 
 IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
@@ -44,9 +47,11 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
  * is seen without corruption for each subtest.
  */
 
+#define DISABLE_FILTER			0
 #define MIN_FILTER_STRENGTH		1
 #define MID_FILTER_STRENGTH		128
 #define MAX_FILTER_STRENGTH		255
+#define NROUNDS				10
 
 enum test_type {
 	TEST_FILTER_BASIC,
@@ -54,6 +59,7 @@ enum test_type {
 	TEST_FILTER_ROTATION,
 	TEST_FILTER_FORMATS,
 	TEST_FILTER_STRENGTH,
+	TEST_FILTER_TOGGLE,
 };
 
 const int filter_strength_list[] = {
@@ -145,6 +151,23 @@ static void cleanup(data_t *data)
 	cleanup_fbs(data);
 }
 
+static int test_filter_toggle(data_t *data)
+{
+	int ret = 0;
+
+	for (int k = 0; k < NROUNDS; k++) {
+		if (k % 2 == 0)
+			data->filter_strength = DISABLE_FILTER;
+		else
+			data->filter_strength = MAX_FILTER_STRENGTH;
+
+		set_filter_strength_on_pipe(data);
+		ret |= igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+	}
+
+	return ret;
+}
+
 static void test_sharpness_filter(data_t *data,  enum test_type type)
 {
 	drmModeModeInfo *mode = data->mode;
@@ -171,6 +194,9 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 
 	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 
+	if (type == TEST_FILTER_TOGGLE)
+		ret |= test_filter_toggle(data);
+
 	igt_assert_eq(ret, 0);
 
 	cleanup(data);
@@ -227,6 +253,9 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 			case TEST_FILTER_STRENGTH:
 				snprintf(name, sizeof(name), "-strength-%d", data->filter_strength);
 				break;
+			case TEST_FILTER_TOGGLE:
+				snprintf(name, sizeof(name), "-toggle");
+				break;
 			default:
 				igt_assert(0);
 			}
@@ -340,6 +369,17 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 		}
 	}
 
+	igt_describe("Verify toggling between enabling and disabling "
+		     "content adaptive sharpness filter.");
+	igt_subtest_with_dynamic("filter-toggle") {
+		data.modifier = DRM_FORMAT_MOD_LINEAR;
+		data.rotation = IGT_ROTATION_0;
+		data.format = DRM_FORMAT_XRGB8888;
+
+		data.filter_strength = MAX_FILTER_STRENGTH;
+		run_sharpness_filter_test(&data, TEST_FILTER_TOGGLE);
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.25.1

