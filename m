Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8130CCF9EB
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 07:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D02310EABE;
	Fri, 31 Oct 2025 07:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BrMDBdwM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6846610EABD
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 07:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761897542; x=1793433542;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xSzY18buMv/C2JXyropoUAWMUET+Ns3v3BrUoxhPbOc=;
 b=BrMDBdwMmT5wnMb8+N8S7Ow6GpIo11wHZ/0bTWL5GDqOygG/XhPCxdGV
 wJij6oiBfGMal1z7LVoO7hX9fd5CBOdwoZrLEHIWQg0UEprYa+epXD/NE
 WnAvaayR4CaMb54bK/y2HDF0qll5hJb/IhXigllwj75Ack3r2jPnXCqr5
 jKyNzHnr+hOsXQLNRIcmYPIoKg/e5TkjJCmpQ6z2xO42gN+0OfUPcKGEp
 rYLn4Sqq4a1hlUyijrM8BHtRBRMB2zQW6lMU5cHgpRlN+JeTlE/cXbP2b
 PhjV/Wo1MYm2Ea9b2dQ2WUm2Fm0X2sxnps6H4wBdGyWJ4bcqb1kx/6B+I g==;
X-CSE-ConnectionGUID: cyuh2/I1T6GVOa3MWZfRsA==
X-CSE-MsgGUID: jP37cPSORSyEyZIA8XoiSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75169886"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="75169886"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 00:59:02 -0700
X-CSE-ConnectionGUID: YuyJj6ljT6+8vT+tl6PPYw==
X-CSE-MsgGUID: WdkaSDIUT7ii1SfhiDrLdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="186287352"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 00:59:01 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t, v2 04/10] tests/kms_sharpness_filter: Add toggle subtest
Date: Fri, 31 Oct 2025 13:35:28 +0530
Message-Id: <20251031080534.880321-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251031080534.880321-1-swati2.sharma@intel.com>
References: <20251031080534.880321-1-swati2.sharma@intel.com>
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

Add subtest to verify toggling between enabling and disabling of
content adaptive sharpness filter.

v2: -Use imperative mood in commit message (Ankit)
    -Change iterator from k to i (Ankit)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_sharpness_filter.c | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
index 1c8f0b5ce..5b0940aac 100644
--- a/tests/kms_sharpness_filter.c
+++ b/tests/kms_sharpness_filter.c
@@ -29,6 +29,9 @@
  *
  * SUBTEST: filter-formats
  * Description: Verify content adaptive sharpness filter with varying formats.
+ *
+ * SUBTEST: filter-toggle
+ * Description: Verify toggling between enabling and disabling content adaptive sharpness filter.
 */
 
 IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
@@ -39,9 +42,11 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
  * is seen without corruption for each subtest.
  */
 
+#define DISABLE_FILTER			0
 #define MIN_FILTER_STRENGTH		1
 #define MID_FILTER_STRENGTH		128
 #define MAX_FILTER_STRENGTH		255
+#define NROUNDS				10
 
 enum test_type {
 	TEST_FILTER_BASIC,
@@ -49,6 +54,7 @@ enum test_type {
 	TEST_FILTER_ROTATION,
 	TEST_FILTER_FORMATS,
 	TEST_FILTER_STRENGTH,
+	TEST_FILTER_TOGGLE,
 };
 
 const int filter_strength_list[] = {
@@ -140,6 +146,23 @@ static void cleanup(data_t *data)
 	cleanup_fbs(data);
 }
 
+static int test_filter_toggle(data_t *data)
+{
+	int ret = 0;
+
+	for (int i = 0; i < NROUNDS; i++) {
+		if (i % 2 == 0)
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
@@ -168,6 +191,9 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 
 	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 
+	if (type == TEST_FILTER_TOGGLE)
+		ret |= test_filter_toggle(data);
+
 	igt_assert_eq(ret, 0);
 
 	cleanup(data);
@@ -224,6 +250,9 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 			case TEST_FILTER_STRENGTH:
 				snprintf(name, sizeof(name), "-strength-%d", data->filter_strength);
 				break;
+			case TEST_FILTER_TOGGLE:
+				snprintf(name, sizeof(name), "-toggle");
+				break;
 			default:
 				igt_assert(0);
 			}
@@ -336,6 +365,17 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
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

