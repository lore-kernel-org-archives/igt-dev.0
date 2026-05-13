Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD878CD37AC
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 19:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F08410F01F;
	Wed, 13 May 2026 19:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ExTDMigK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5972310F018
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 19:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778699329; x=1810235329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/jGs4dBqamxpb6nM2Z60r9+xy3Reyejs9h0pkcJlhWU=;
 b=ExTDMigKnLeoJNMrkc9UKv2xyzaVS8DYD6Lnjs72O1nLOCMCTcz8MnCh
 c6RIYgfWrWXvJjaHvJOHb8tCU9SbxgAHPJ922PaIle6jGnXMxbeIy/VE1
 4gQzTAgR7w3LlS+qlux8FwnTOXxUF+dxiheIbknTYEh9kAYCJEOV6XW6b
 OzXixozpUvBkNOa9OQGdQbYgIogSyCMoKsAWX17+q8hosrjWQEiPWdRyn
 g1ciKo2GiG8zxUreHYC4hUeqqR3d7D9P54J+Kb+MXlPAGmhV61QjHKRSX
 iirQZjPns25F1hQF8012UH82pcN4pNLl1EIKABTHmzhnHbAryzY05+LWJ w==;
X-CSE-ConnectionGUID: LjLXS9HyQueCNQkl9ruHdw==
X-CSE-MsgGUID: 0NtotMaqSMiJ60XBpqXKMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79350488"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="79350488"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 12:08:49 -0700
X-CSE-ConnectionGUID: ibfz6BPqQJeqfZnHNsAVEw==
X-CSE-MsgGUID: 6KbPqw3OSMmRu9/fUFPx6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="242511692"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 12:08:48 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>, Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH i-g-t,
 v2 1/3] tests/intel/kms_sharpness_filter: Remove plane-scaler subtests
Date: Thu, 14 May 2026 00:47:30 +0530
Message-Id: <20260513191732.2420879-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260513191732.2420879-1-swati2.sharma@intel.com>
References: <20260513191732.2420879-1-swati2.sharma@intel.com>
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

v2: -Keep filter-tap test, as it verifies that the correct mode is
     selected based on the tap value (Nemesa)

Co-developed-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 95 ------------------------------
 1 file changed, 95 deletions(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index ff2efb154..96eec8919 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -21,15 +21,6 @@
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
@@ -92,9 +83,6 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
 
 enum test_type {
 	TEST_FILTER_BASIC,
-	TEST_FILTER_MODIFIERS,
-	TEST_FILTER_ROTATION,
-	TEST_FILTER_FORMATS,
 	TEST_FILTER_STRENGTH,
 	TEST_FILTER_TOGGLE,
 	TEST_FILTER_TAP,
@@ -120,24 +108,6 @@ const int filter_tap_list[] = {
 	TAP_5,
 	TAP_7,
 };
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
@@ -146,9 +116,6 @@ static const uint32_t scaling_modes[] = {
 enum subtest_iter {
 	ITER_NONE,
 	ITER_STRENGTH,
-	ITER_MODIFIER,
-	ITER_ROTATION,
-	ITER_FORMAT,
 	ITER_SCALING_MODE,
 };
 
@@ -173,27 +140,6 @@ static const struct subtest_entry {
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
@@ -280,9 +226,7 @@ typedef struct {
 	int filter_strength;
 	int filter_tap;
 	uint64_t modifier;
-	const char *modifier_name;
 	uint32_t format;
-	igt_rotation_t rotation;
 	uint32_t scaling_mode;
 } data_t;
 
@@ -488,14 +432,6 @@ static void test_sharpness_filter(data_t *data, enum test_type type)
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
 
@@ -561,9 +497,6 @@ static bool has_sharpness_filter(igt_crtc_t *crtc)
 
 static const char * const test_type_names[] = {
 	[TEST_FILTER_BASIC]                     = "basic",
-	[TEST_FILTER_MODIFIERS]                 = NULL,
-	[TEST_FILTER_ROTATION]                  = NULL,
-	[TEST_FILTER_FORMATS]                   = NULL,
 	[TEST_FILTER_STRENGTH]                  = NULL,
 	[TEST_FILTER_TOGGLE]                    = "toggle",
 	[TEST_FILTER_TAP]                       = NULL,
@@ -587,16 +520,6 @@ static void build_test_suffix(data_t *data, enum test_type type,
 
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
@@ -738,8 +661,6 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 static void set_data_defaults(data_t *data)
 {
 	data->modifier        = DRM_FORMAT_MOD_LINEAR;
-	data->modifier_name   = modifiers[0].name;
-	data->rotation        = IGT_ROTATION_0;
 	data->format          = DRM_FORMAT_XRGB8888;
 	data->filter_strength = MID_FILTER_STRENGTH;
 }
@@ -749,12 +670,6 @@ static int iter_count(enum subtest_iter iter)
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
@@ -768,16 +683,6 @@ static void apply_iter_param(data_t *data, const struct subtest_entry *st, int i
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

