Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDBAFD9E34
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 06:06:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09A210E0A2;
	Fri, 27 Feb 2026 06:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aCQ4++Zz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142BB10E0A2
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 06:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772172377; x=1803708377;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Cx0yyY7faQhK22opZR4z7hsPiiMtJa7PzZ5JQTThtD0=;
 b=aCQ4++ZzIo6SaGaz1bZVnV05inClXk2tQpLVdwg2UdudlFzy46Pr40P7
 o/WU/m5X+CP9Q/gCNUiBjIkE1fF7DHU9SJQuyAj1fxOAKDcEPdkmAiMTb
 OZJm9X6RCw4RHQYbiUZefx7DSx1Ga18c/O3zGGLjWVtK2TQCq1ojkXeM4
 yS1R7eSW0gVEfkDtCOaKv8SfnItGUCZj52HXZDJXahe7k/7ykH/AkWkfH
 1bzPQK6YD1D4QNIjvEUjEt3FZQDRlgB8oKI9O6QRIPjm9ms5qYACX3lum
 9BoH3PFiIFxWdanGB10pevU479CA084QEfI6TtmeGQV6ekqpFBJ27hxUT g==;
X-CSE-ConnectionGUID: bwYg0hJrR1WGW48jiXWOng==
X-CSE-MsgGUID: yTe0BQkiRFiNkDnLbiRc4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73356966"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="73356966"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 22:06:16 -0800
X-CSE-ConnectionGUID: osepup0YQJaCrm0BLzE7Ig==
X-CSE-MsgGUID: vZLxrYoWSnmxumK3gYrkwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="239791728"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa002.fm.intel.com with ESMTP; 26 Feb 2026 22:06:15 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2] tests/intel/kms_sharpness_filter: Restructure
 modifier validation into per-modifier subtests
Date: Fri, 27 Feb 2026 11:46:56 +0530
Message-Id: <20260227061656.2044321-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

Previously, all modifiers were exercised within a single
subtest, making failures/skips hard to isolate and debug.
This new flow generates explicit subtest names (filter-%s-modifier-%s)
for each format/modifier, improving clarity and CI reporting.

Each subtest now validates only the selected format/modifier, and
unsupported format/modifier combinations are cleanly skipped.

v2:
- Add each format/modifier coverage in single subtest (Rama)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 99 +++++++++++++++++-------------
 1 file changed, 55 insertions(+), 44 deletions(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index ba325b377..7002c0989 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -21,15 +21,9 @@
  * SUBTEST: filter-strength
  * Description: Verify that varying strength (0-255), affects the degree of sharpeness applied.
  *
- * SUBTEST: filter-modifiers
- * Description: Verify content adaptive sharpness filter with varying modifiers.
- *
  * SUBTEST: filter-rotations
  * Description: Verify content adaptive sharpness filter with varying rotations.
  *
- * SUBTEST: filter-formats
- * Description: Verify content adaptive sharpness filter with varying formats.
- *
  * SUBTEST: filter-toggle
  * Description: Verify toggling between enabling and disabling content adaptive sharpness filter.
  *
@@ -70,6 +64,23 @@
  *              sharpness filter.
 */
 
+/**
+ * SUBTEST: filter-format-%s-modifier-%s
+ * Description: Verify content adaptive sharpness filter with format %arg[1] modifier %arg[2]
+ *
+ * arg[1]:
+ *
+ * @nv12:		NV12 format
+ * @rgb565:		RGB565 format
+ * @xrgb8888:		XRGB8888 format
+ * @xbgr16161616f:	XBGR16161616F format
+ *
+ * arg[2]:
+ *
+ * @linear:	Linear modifier
+ * @x-tiled:	x tile modifier
+ * @4-tiled:	4 tile modifier
+ */
 IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
 
 /*
@@ -100,9 +111,8 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
 
 enum test_type {
 	TEST_FILTER_BASIC,
-	TEST_FILTER_MODIFIERS,
+	TEST_FILTER_FORMAT_MODIFIER,
 	TEST_FILTER_ROTATION,
-	TEST_FILTER_FORMATS,
 	TEST_FILTER_STRENGTH,
 	TEST_FILTER_TOGGLE,
 	TEST_FILTER_TAP,
@@ -136,11 +146,15 @@ static const struct {
 	{ I915_FORMAT_MOD_X_TILED, "x-tiled", },
 	{ I915_FORMAT_MOD_4_TILED, "4-tiled", },
 };
-static const int formats[] = {
-	DRM_FORMAT_NV12,
-	DRM_FORMAT_RGB565,
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_XBGR16161616F,
+
+static const struct {
+	int format;
+	const char *name;
+} formats[] = {
+	{ DRM_FORMAT_NV12, "nv12", },
+	{ DRM_FORMAT_RGB565, "rgb565", },
+	{ DRM_FORMAT_XRGB8888, "xrgb8888", },
+	{ DRM_FORMAT_XBGR16161616F, "xbgr16161616f", },
 };
 static const igt_rotation_t rotations[] = {
 	IGT_ROTATION_0,
@@ -165,6 +179,7 @@ typedef struct {
 	int filter_tap;
 	uint64_t modifier;
 	const char *modifier_name;
+	const char *format_name;
 	uint32_t format;
 	igt_rotation_t rotation;
 	uint32_t scaling_mode;
@@ -487,15 +502,14 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 			case TEST_FILTER_BASIC:
 				snprintf(name, sizeof(name), "-basic");
 				break;
-			case TEST_FILTER_MODIFIERS:
-				snprintf(name, sizeof(name), "-%s", data->modifier_name);
+			case TEST_FILTER_FORMAT_MODIFIER:
+				snprintf(name, sizeof(name), "-%s-%s",
+					 igt_format_str(data->format),
+					 data->modifier_name);
 				break;
 			case TEST_FILTER_ROTATION:
 				snprintf(name, sizeof(name), "-%srot", igt_plane_rotation_name(data->rotation));
 				break;
-			case TEST_FILTER_FORMATS:
-				snprintf(name, sizeof(name), "-%s", igt_format_str(data->format));
-				break;
 			case TEST_FILTER_STRENGTH:
 				snprintf(name, sizeof(name), "-strength-%d", data->filter_strength);
 				break;
@@ -597,18 +611,29 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
 		}
 	}
 
-	igt_describe("Verify content adaptive sharpness filter with "
-		     "varying modifiers.");
-	igt_subtest_with_dynamic("filter-modifiers") {
-		data.rotation = IGT_ROTATION_0;
-		data.format = DRM_FORMAT_XRGB8888;
-		data.filter_strength = MID_FILTER_STRENGTH;
-
-		for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
-			data.modifier = modifiers[i].modifier;
-			data.modifier_name = modifiers[i].name;
-
-			run_sharpness_filter_test(&data, TEST_FILTER_MODIFIERS);
+	for (int i = 0; i < ARRAY_SIZE(formats); i++) {
+		data.format = formats[i].format;
+		data.format_name = formats[i].name;
+		for (int j = 0; j < ARRAY_SIZE(modifiers); j++) {
+			data.modifier = modifiers[j].modifier;
+			data.modifier_name = modifiers[j].name;
+
+			igt_describe("Verify content adaptive sharpness filter with "
+				     "all combinations of formats and modifiers.");
+			igt_subtest_with_dynamic_f("filter-format-%s-modifier-%s",
+						   data.format_name,
+						   data.modifier_name) {
+				data.rotation = IGT_ROTATION_0;
+				data.filter_strength = MID_FILTER_STRENGTH;
+				igt_skip_on_f((!igt_display_has_format_mod(&data.display,
+									   data.format,
+									   data.modifier)),
+					       "Skipping: format " IGT_FORMAT_FMT " / modifier "
+					       IGT_MODIFIER_FMT "are not supported on this "
+					       "platform\n", IGT_FORMAT_ARGS(data.format),
+					       IGT_MODIFIER_ARGS(data.modifier));
+				run_sharpness_filter_test(&data, TEST_FILTER_FORMAT_MODIFIER);
+			}
 		}
 	}
 
@@ -626,20 +651,6 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
 		}
 	}
 
-	igt_describe("Verify content adaptive sharpness filter with "
-		     "varying formats.");
-	igt_subtest_with_dynamic("filter-formats") {
-		data.modifier = DRM_FORMAT_MOD_LINEAR;
-		data.rotation = IGT_ROTATION_0;
-		data.filter_strength = MID_FILTER_STRENGTH;
-
-		for (int i = 0; i < ARRAY_SIZE(formats); i++) {
-			data.format = formats[i];
-
-			run_sharpness_filter_test(&data, TEST_FILTER_FORMATS);
-		}
-	}
-
 	igt_describe("Verify toggling between enabling and disabling "
 		     "content adaptive sharpness filter.");
 	igt_subtest_with_dynamic("filter-toggle") {
-- 
2.34.1

