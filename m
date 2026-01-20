Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778D3D2ECF7
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 04:54:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A69110E2B8;
	Tue, 20 Jan 2026 04:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hmNeTVFf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68FD10E235
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 04:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768884896; x=1800420896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+JNbovU877vNXCpa3ha46nLr+JwiSXBqT+KHhNn3QGE=;
 b=hmNeTVFf/KsqR590yLnU+fvEiIxiRahBkGDlun+uv1Zcy0yUyp18DLlZ
 D3D30z9fpWIJwpBYZIcZgnYrWVG2iUXfoitti8SmT/GHFmZEpfWL5wqjV
 l26DzMrClXeVeIB0jP6UzQ7ZSkcD6CIclrB0FBrh6MQq5mEPnnBOdhYz9
 t4pBZna4VsIgjyC3NLVA77DM/nnSG1tYrc3txmU1le+Xg7DvW7O7un9o/
 Av29XghyvPup9CVZu2ohZCbcbFCFy52oXjJUANhKl089ZsRmK6hpmsmQW
 ZIMUt1m4P71qvWOSuM8oQTmE7hSD0p6YAEwPYmYoBkWnvsdV9/vuDS6bJ g==;
X-CSE-ConnectionGUID: B9NQ1FscQqOkOzqMdISTeQ==
X-CSE-MsgGUID: 0mYiD9T/SLWfRsfC53mwkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70057627"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="70057627"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 20:54:55 -0800
X-CSE-ConnectionGUID: yVXGefoORSml8M8jAjnhkA==
X-CSE-MsgGUID: rcsdYzuWSgCVxi2yU4k63w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="205817000"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 20:54:54 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, juha-pekka.heikkila@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 1/3] =?UTF-8?q?tests/kms=5Fplane:=20Split=20pixel?=
 =?UTF-8?q?=E2=80=91format=20validation=20into=20modifier=20specific?=
Date: Tue, 20 Jan 2026 10:25:43 +0530
Message-ID: <20260120045545.102676-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120045545.102676-1-ramanaidu.naladala@intel.com>
References: <20260120045545.102676-1-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Change restructures the pixel-format test flow so that each
modifier is validated through its own dynamic subtest.
Previously, all supported modifiers were exercised within a
single test path, which made failures harder to isolate.
The new structure improves clarity and debuggability by
generating explicit subtest names for each modifier.
Subtests now run only for the selected modifier, and
unsupported combinations are cleanly skipped.

v2: Fix review comments. (Jeevan)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane.c | 91 ++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 79 insertions(+), 12 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index ec3245c9f..653a911ad 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -72,13 +72,32 @@
  */
 
 /**
- * SUBTEST: pixel-%s
+ * SUBTEST: pixel-format-%s-modifier
  * Description: verify the pixel formats for given plane and pipe
  *
+ * SUBTEST: pixel-format-%s-modifier-source-clamping
+ * Description: verify the pixel formats for given plane and pipe with source clamping
+ *
  * arg[1]:
  *
- * @format:
- * @format-source-clamping:          with source clamping
+ * @x-tiled:                     x tiled
+ * @y-tiled:                     y tiled
+ * @yf-tiled:                    yf tiled
+ * @y-tiled-ccs:                 y tiled ccs
+ * @yf-tiled-ccs:                yf tiled ccs
+ * @y-tiled-gen12-rc-ccs:        y tiled gen12 rc ccs
+ * @y-tiled-gen12-mc-ccs:        y tiled gen12 mc ccs
+ * @y-tiled-gen12-rc-ccs-cc:     y tiled gen12 rc ccs cc
+ * @4-tiled:                     4 tiled
+ * @4-tiled-dg2-rc-ccs:          4 tiled dg2 rc ccs
+ * @4-tiled-dg2-mc-ccs:          4 tiled dg2 mc ccs
+ * @4-tiled-dg2-rc-ccs-cc:       4 tiled dg2 rc ccs cc
+ * @4-tiled-mtl-rc-ccs:          4 tiled mtl rc ccs
+ * @4-tiled-mtl-mc-ccs:          4 tiled mtl mc ccs
+ * @4-tiled-mtl-mc-ccs-cc:       4 tiled mtl mc ccs cc
+ * @4-tiled-lnl-ccs:             4 tiled lnl ccs
+ * @4-tiled-bmg-ccs:             4 tiled bmg ccs
+ * @linear:                      linear
  */
 
 /*
@@ -114,6 +133,7 @@ typedef struct {
 	uint32_t crop;
 	bool extended;
 	unsigned int flags;
+	uint64_t mod;
 } data_t;
 
 static bool all_pipes;
@@ -149,6 +169,30 @@ enum {
 	TEST_SUSPEND_RESUME             = 1 << 4,
 };
 
+static const struct {
+	uint64_t modifier;
+	const char *str;
+} modifiers[] = {
+	{I915_FORMAT_MOD_X_TILED, "x-tiled"},
+	{I915_FORMAT_MOD_Y_TILED, "y-tiled"},
+	{I915_FORMAT_MOD_Yf_TILED, "yf-tiled"},
+	{I915_FORMAT_MOD_Y_TILED_CCS, "y-tiled-ccs"},
+	{I915_FORMAT_MOD_Yf_TILED_CCS, "yf-tiled-ccs"},
+	{I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, "y-tiled-gen12-rc-ccs"},
+	{I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS, "y-tiled-gen12-mc-ccs"},
+	{I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC, "y-tiled-gen12-rc-ccs-cc"},
+	{I915_FORMAT_MOD_4_TILED, "4-tiled"},
+	{I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, "4-tiled-dg2-rc-ccs"},
+	{I915_FORMAT_MOD_4_TILED_DG2_MC_CCS, "4-tiled-dg2-mc-ccs"},
+	{I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC, "4-tiled-dg2-rc-ccs-cc"},
+	{I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, "4-tiled-mtl-rc-ccs"},
+	{I915_FORMAT_MOD_4_TILED_MTL_MC_CCS, "4-tiled-mtl-mc-ccs"},
+	{I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC, "4-tiled-mtl-mc-ccs-cc"},
+	{I915_FORMAT_MOD_4_TILED_LNL_CCS, "4-tiled-lnl-ccs"},
+	{I915_FORMAT_MOD_4_TILED_BMG_CCS, "4-tiled-bmg-ccs"},
+	{DRM_FORMAT_MOD_LINEAR, "linear"},
+};
+
 /*
  * create a colored fb, possibly with a series of 64x64 colored rectangles (used
  * for position tests)
@@ -1040,6 +1084,7 @@ static void test_format_plane(data_t *data, enum pipe pipe,
 	struct format_mod ref = {};
 	igt_crc_t* crcset;
 	bool result = true;
+	bool found = false;
 
 	/*
 	 * No clamping test for cursor plane
@@ -1047,6 +1092,17 @@ static void test_format_plane(data_t *data, enum pipe pipe,
 	if (data->crop != 0 && plane->type == DRM_PLANE_TYPE_CURSOR)
 		return;
 
+	for (int i = 0; i < plane->format_mod_count; i++) {
+		if (data->mod == plane->modifiers[i]) {
+			found = true;
+			break;
+		}
+	}
+
+	igt_skip_on_f(!found,
+		      "Modifier " IGT_MODIFIER_FMT " not supported on plane %d\n",
+		      IGT_MODIFIER_ARGS(data->mod), plane->index);
+
 	igt_vec_init(&tested_formats, sizeof(struct format_mod));
 
 	mode = igt_output_get_mode(output);
@@ -1101,6 +1157,9 @@ static void test_format_plane(data_t *data, enum pipe pipe,
 			.modifier = plane->modifiers[i],
 		};
 
+		if (data->mod != f.modifier)
+			continue;
+
 		if (f.format == ref.format &&
 		    f.modifier == ref.modifier)
 			continue;
@@ -1433,17 +1492,25 @@ static void dynamic_test_handler(data_t *data, enum pipe pipe)
 static void
 run_tests_for_pipe_plane(data_t *data)
 {
-	igt_describe("verify the pixel formats for given plane and pipe");
-	igt_subtest_with_dynamic_f("pixel-format")
-		run_test(data, test_pixel_formats);
-
-	igt_describe("verify the pixel formats for given plane and pipe with source clamping");
-	igt_subtest_with_dynamic_f("pixel-format-source-clamping") {
-		data->crop = 4;
-		run_test(data, test_pixel_formats);
+	for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
+		igt_describe("verify the pixel formats for given plane and pipe");
+		igt_subtest_with_dynamic_f("pixel-format-%s-modifier", modifiers[i].str) {
+			data->mod = modifiers[i].modifier;
+			run_test(data, test_pixel_formats);
+		}
+	}
+
+	for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
+		igt_describe("verify the pixel formats for given plane and pipe with source clamping");
+		igt_subtest_with_dynamic_f("pixel-format-%s-modifier-source-clamping",
+					   modifiers[i].str) {
+			data->mod = modifiers[i].modifier;
+			data->crop = 4;
+			run_test(data, test_pixel_formats);
+		}
+		data->crop = 0;
 	}
 
-	data->crop = 0;
 	igt_describe("verify plane position using two planes to create a fully covered screen");
 	igt_subtest_with_dynamic_f("plane-position-covered") {
 		data->flags = 0;
-- 
2.43.0

