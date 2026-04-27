Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD18FF8868
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 15:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABC910E7AF;
	Mon, 27 Apr 2026 15:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJ6bPE8N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C66010E7AF
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 15:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777303334; x=1808839334;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fdw8jSKFfNIdi6bNcVGrwwIQDXOirftouMREuYbNhJM=;
 b=ZJ6bPE8NekPZwg9RacUla9vKm9PklHSmPvc8bnCm6uKgQxVuuy4VqNMN
 mYiD4ij+i0M9YM04GgRhnxxckicD3eDLq+NK+csqh8ImX7gC1qtT8xIkk
 hVdHgIOIkwSRfdR4RD3L0iXXLvEEXxx5g9hFANcsRGtezo9OWodELwLyo
 7daNcbFFUWN5IUKl4VDDqVt9fAtCkAOYX1nBc3Tr73x9wKTY67LeUEoO6
 l/sP2h/yI58ZQw0NZak15cNJkL1glcCqar2QBmRtQL7SQWhGx6t6Q7Srg
 +wGt/wrIsroerjdRq6iwJbht0FIgyKyVoFItCUT5JpaV/C2XEJJRZMFdk g==;
X-CSE-ConnectionGUID: 7Wvhy+N6T3uvCL3bzHr+3Q==
X-CSE-MsgGUID: VmwH5qE/QLqV3InJvz15Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="88890892"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="88890892"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 08:22:13 -0700
X-CSE-ConnectionGUID: XrhxhrigQu2dtjD2yAyWjw==
X-CSE-MsgGUID: l0vptRn4QvOPIyZ4022hGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="237995885"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 08:22:12 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 "Claude Opus 4 . 6" <claude@anthropic.com>
Subject: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Remove plane-scaler
 subtests
Date: Mon, 27 Apr 2026 21:00:59 +0530
Message-Id: <20260427153059.2252606-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Remove filter-modifiers, filter-rotations, and filter-formats
subtests since the sharpness filter operates on the pipe scaler,
not the plane scaler, making these tests irrelevant.

Remove filter-tap since we don't know from igt whether the correct
tap is selected or not.

Co-developed-by: Claude Opus 4.6 <claude@anthropic.com>
---
 tests/intel/kms_sharpness_filter.c | 175 -----------------------------
 1 file changed, 175 deletions(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index ff2efb154..24747cc75 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -21,22 +21,9 @@
  * SUBTEST: filter-strength
  * Description: Verify that varying strength (0-255), affects the degree of sharpness applied.
  *
- * SUBTEST: filter-modifiers
- * Description: Verify content adaptive sharpness filter with varying modifiers.
- *
- * SUBTEST: filter-rotations
- * Description: Verify content adaptive sharpness filter with varying rotations.
- *
- * SUBTEST: filter-formats
- * Description: Verify content adaptive sharpness filter with varying formats.
- *
  * SUBTEST: filter-toggle
  * Description: Verify toggling between enabling and disabling content adaptive sharpness filter.
  *
- * SUBTEST: filter-tap
- * Description: Verify content adaptive sharpness filter with resolution change, resolution change
- * 		will lead to selection of distinct taps.
- *
  * SUBTEST: filter-dpms
  * Description: Verify content adaptive sharpness filter with DPMS.
  *
@@ -78,26 +65,17 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
  * is seen without corruption for each subtest.
  */
 
-#define TAP_3				3
-#define TAP_5				5
-#define TAP_7				7
 #define DISABLE_FILTER			0
 #define MIN_FILTER_STRENGTH		1
 #define MID_FILTER_STRENGTH		128
 #define MAX_FILTER_STRENGTH		255
-#define MAX_PIXELS_FOR_3_TAP_FILTER	(1920 * 1080)
-#define MAX_PIXELS_FOR_5_TAP_FILTER	(3840 * 2160)
 #define NROUNDS				10
 #define DEFAULT_FILTER_STRENGTH		-1
 
 enum test_type {
 	TEST_FILTER_BASIC,
-	TEST_FILTER_MODIFIERS,
-	TEST_FILTER_ROTATION,
-	TEST_FILTER_FORMATS,
 	TEST_FILTER_STRENGTH,
 	TEST_FILTER_TOGGLE,
-	TEST_FILTER_TAP,
 	TEST_FILTER_DPMS,
 	TEST_FILTER_SUSPEND,
 	TEST_FILTER_UPSCALE,
@@ -115,29 +93,6 @@ const int filter_strength_list[] = {
 	(MID_FILTER_STRENGTH + MAX_FILTER_STRENGTH) / 2,
 	MAX_FILTER_STRENGTH,
 };
-const int filter_tap_list[] = {
-	TAP_3,
-	TAP_5,
-	TAP_7,
-};
-static const struct {
-	uint64_t modifier;
-	const char *name;
-} modifiers[] = {
-	{ DRM_FORMAT_MOD_LINEAR, "linear", },
-	{ I915_FORMAT_MOD_X_TILED, "x-tiled", },
-	{ I915_FORMAT_MOD_4_TILED, "4-tiled", },
-};
-static const int formats[] = {
-	DRM_FORMAT_NV12,
-	DRM_FORMAT_RGB565,
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_XBGR16161616F,
-};
-static const igt_rotation_t rotations[] = {
-	IGT_ROTATION_0,
-	IGT_ROTATION_180,
-};
 static const uint32_t scaling_modes[] = {
 	DRM_MODE_SCALE_FULLSCREEN,
 	DRM_MODE_SCALE_ASPECT,
@@ -146,9 +101,6 @@ static const uint32_t scaling_modes[] = {
 enum subtest_iter {
 	ITER_NONE,
 	ITER_STRENGTH,
-	ITER_MODIFIER,
-	ITER_ROTATION,
-	ITER_FORMAT,
 	ITER_SCALING_MODE,
 };
 
@@ -173,40 +125,12 @@ static const struct subtest_entry {
 		.filter_strength = DEFAULT_FILTER_STRENGTH,
 		.iter     = ITER_STRENGTH,
 	},
-	{
-		.name     = "filter-modifiers",
-		.describe = "Verify content adaptive sharpness filter with varying modifiers.",
-		.type     = TEST_FILTER_MODIFIERS,
-		.filter_strength = DEFAULT_FILTER_STRENGTH,
-		.iter     = ITER_MODIFIER,
-	},
-	{
-		.name     = "filter-rotations",
-		.describe = "Verify content adaptive sharpness filter with varying rotations.",
-		.type     = TEST_FILTER_ROTATION,
-		.filter_strength = DEFAULT_FILTER_STRENGTH,
-		.iter     = ITER_ROTATION,
-	},
-	{
-		.name     = "filter-formats",
-		.describe = "Verify content adaptive sharpness filter with varying formats.",
-		.type     = TEST_FILTER_FORMATS,
-		.filter_strength = DEFAULT_FILTER_STRENGTH,
-		.iter     = ITER_FORMAT,
-	},
 	{
 		.name     = "filter-toggle",
 		.describe = "Verify toggling between enabling and disabling content adaptive sharpness filter.",
 		.type     = TEST_FILTER_TOGGLE,
 		.filter_strength = MAX_FILTER_STRENGTH,
 	},
-	{
-		.name     = "filter-tap",
-		.describe = "Verify content adaptive sharpness filter with resolution change; "
-			    "resolution change will lead to selection of distinct taps.",
-		.type     = TEST_FILTER_TAP,
-		.filter_strength = DEFAULT_FILTER_STRENGTH,
-	},
 	{
 		.name     = "filter-dpms",
 		.describe = "Verify content adaptive sharpness filter with DPMS.",
@@ -278,11 +202,8 @@ typedef struct {
 	igt_plane_t *plane[4];
 	drmModeModeInfo *mode;
 	int filter_strength;
-	int filter_tap;
 	uint64_t modifier;
-	const char *modifier_name;
 	uint32_t format;
-	igt_rotation_t rotation;
 	uint32_t scaling_mode;
 } data_t;
 
@@ -400,32 +321,6 @@ static void cleanup(data_t *data)
 	cleanup_fbs(data);
 }
 
-static void get_modes_for_filter_taps(igt_output_t *output, drmModeModeInfo *mode[3])
-{
-	drmModeConnector *connector = output->config.connector;
-	int total_pixels = 0;
-
-	/*
-	 * TAP 3: mode->hdisplay <= 1920 && mode->vdisplay <= 1080
-	 * TAP 5: (mode->hdisplay > 1920 && mode->hdisplay < 3840) &&
-	 * 	  (mode->vdisplay > 1080 && mode->vdisplay < 2160)
-	 * TAP 7: mode->hdisplay >= 3840 && mode->vdisplay >= 2160
-	 */
-	for (int i = 0; i < connector->count_modes; i++) {
-		total_pixels = connector->modes[i].hdisplay * connector->modes[i].vdisplay;
-
-		if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
-			mode[0] = &connector->modes[i];
-
-		if (total_pixels > MAX_PIXELS_FOR_3_TAP_FILTER &&
-		    total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER)
-			mode[1] = &connector->modes[i];
-
-		if (total_pixels > MAX_PIXELS_FOR_5_TAP_FILTER)
-			mode[2] = &connector->modes[i];
-	}
-}
-
 static int test_filter_toggle(data_t *data)
 {
 	int ret = 0;
@@ -488,14 +383,6 @@ static void test_sharpness_filter(data_t *data, enum test_type type)
 		 data->format, data->modifier, &data->fb[0]);
 	igt_plane_set_fb(data->plane[0], &data->fb[0]);
 
-	if (type == TEST_FILTER_ROTATION) {
-		igt_skip_on_f(!igt_plane_has_rotation(data->plane[0],
-						      data->rotation),
-			      "No requested rotation on pipe %s\n",
-			      igt_crtc_name(data->crtc));
-		igt_plane_set_rotation(data->plane[0], data->rotation);
-	}
-
 	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
 		igt_require_f(has_scaling_mode(output), "No connecter scaling mode found on %s\n", output->name);
 
@@ -561,12 +448,8 @@ static bool has_sharpness_filter(igt_crtc_t *crtc)
 
 static const char * const test_type_names[] = {
 	[TEST_FILTER_BASIC]                     = "basic",
-	[TEST_FILTER_MODIFIERS]                 = NULL,
-	[TEST_FILTER_ROTATION]                  = NULL,
-	[TEST_FILTER_FORMATS]                   = NULL,
 	[TEST_FILTER_STRENGTH]                  = NULL,
 	[TEST_FILTER_TOGGLE]                    = "toggle",
-	[TEST_FILTER_TAP]                       = NULL,
 	[TEST_FILTER_DPMS]                      = "dpms",
 	[TEST_FILTER_SUSPEND]                   = "suspend",
 	[TEST_FILTER_UPSCALE]                   = "upscale",
@@ -587,16 +470,6 @@ static void build_test_suffix(data_t *data, enum test_type type,
 
 	/* suffix depends on the current test parameters */
 	switch (type) {
-	case TEST_FILTER_MODIFIERS:
-		snprintf(name, len, "-%s", data->modifier_name);
-		break;
-	case TEST_FILTER_ROTATION:
-		snprintf(name, len, "-%srot",
-			 igt_plane_rotation_name(data->rotation));
-		break;
-	case TEST_FILTER_FORMATS:
-		snprintf(name, len, "-%s", igt_format_str(data->format));
-		break;
 	case TEST_FILTER_STRENGTH:
 		snprintf(name, len, "-strength-%d", data->filter_strength);
 		break;
@@ -692,36 +565,6 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 				continue;
 			}
 
-			if (type == TEST_FILTER_TAP) {
-				drmModeModeInfo *modes[3] = { NULL, NULL, NULL };
-
-				get_modes_for_filter_taps(output, modes);
-				for (int i = 0; i < 3; i++) {
-					data->filter_tap = filter_tap_list[i];
-					if (!modes[i])
-						continue;
-					data->mode = modes[i];
-					igt_info("Mode %dx%d@%d on output %s\n",
-						 data->mode->hdisplay,
-						 data->mode->vdisplay,
-						 data->mode->vrefresh,
-						 igt_output_name(data->output));
-					igt_output_override_mode(data->output,
-								 data->mode);
-
-					snprintf(name, sizeof(name), "-tap-%d",
-						 data->filter_tap);
-					igt_dynamic_f("pipe-%s-%s%s",
-						       igt_crtc_name(data->crtc),
-						       data->output->name, name)
-						test_sharpness_filter(data, type);
-				}
-
-				if (data->limited)
-					break;
-				continue;
-			}
-
 			build_test_suffix(data, type, name, sizeof(name));
 
 			igt_dynamic_f("pipe-%s-%s%s",
@@ -738,8 +581,6 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 static void set_data_defaults(data_t *data)
 {
 	data->modifier        = DRM_FORMAT_MOD_LINEAR;
-	data->modifier_name   = modifiers[0].name;
-	data->rotation        = IGT_ROTATION_0;
 	data->format          = DRM_FORMAT_XRGB8888;
 	data->filter_strength = MID_FILTER_STRENGTH;
 }
@@ -749,12 +590,6 @@ static int iter_count(enum subtest_iter iter)
 	switch (iter) {
 	case ITER_STRENGTH:
 		return ARRAY_SIZE(filter_strength_list);
-	case ITER_MODIFIER:
-		return ARRAY_SIZE(modifiers);
-	case ITER_ROTATION:
-		return ARRAY_SIZE(rotations);
-	case ITER_FORMAT:
-		return ARRAY_SIZE(formats);
 	case ITER_SCALING_MODE:
 		return ARRAY_SIZE(scaling_modes);
 	default:
@@ -768,16 +603,6 @@ static void apply_iter_param(data_t *data, const struct subtest_entry *st, int i
 	case ITER_STRENGTH:
 		data->filter_strength = filter_strength_list[idx];
 		break;
-	case ITER_MODIFIER:
-		data->modifier = modifiers[idx].modifier;
-		data->modifier_name = modifiers[idx].name;
-		break;
-	case ITER_ROTATION:
-		data->rotation = rotations[idx];
-		break;
-	case ITER_FORMAT:
-		data->format = formats[idx];
-		break;
 	case ITER_SCALING_MODE:
 		data->scaling_mode = scaling_modes[idx];
 		break;
-- 
2.25.1

