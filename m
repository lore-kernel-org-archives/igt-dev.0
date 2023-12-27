Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1E310E0D6
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Dec 2023 13:35:45 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t 3/4] tests/intel/kms_frontbuffer_tracking: Re-use devid &
 display_ver
Date: Wed, 27 Dec 2023 19:00:19 +0530
Message-Id: <20231227133020.685916-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20231227133020.685916-1-bhanuprakash.modem@intel.com>
References: <20231227133020.685916-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Instead of querying for devid & display_ver, just cache them
and re-use where ever it's required.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 37 +++++++++++---------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 5324a0bef..2a2690d18 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1302,6 +1302,8 @@ struct {
 	igt_display_t display;
 
 	struct buf_ops *bops;
+	uint32_t devid;
+	unsigned display_ver;
 } drm;
 
 struct {
@@ -2873,8 +2875,6 @@ static bool enable_features_for_test(const struct test_mode *t)
 
 static void check_test_requirements(const struct test_mode *t)
 {
-	int ver;
-
 	if (t->pipes == PIPE_DUAL)
 		igt_require_f(scnd_mode_params.output,
 			    "Can't test dual pipes with the current outputs\n");
@@ -2904,8 +2904,7 @@ static void check_test_requirements(const struct test_mode *t)
 		igt_require(t->pipes == opt.only_pipes);
 
 	/* Kernel disables fbc for display versions 12 and 13 if psr is enabled. */
-	ver = intel_display_ver(intel_get_drm_devid(drm.fd));
-	if (ver >= 12 && ver <= 13)
+	if (drm.display_ver >= 12 && drm.display_ver <= 13)
 		igt_require_f(!((t->feature & FEATURE_PSR) &&
 				(t->feature & FEATURE_FBC)),
 			      "Can't test PSR and FBC together\n");
@@ -3081,11 +3080,9 @@ static bool is_valid_plane(igt_plane_t *plane)
 
 static void plane_fbc_rte_subtest(const struct test_mode *t)
 {
-	int ver;
 	igt_plane_t *plane;
 
-	ver = intel_display_ver(intel_get_drm_devid(drm.fd));
-	igt_require_f((ver >= 20), "Can't test fbc for each plane\n");
+	igt_require_f((drm.display_ver >= 20), "Can't test fbc for each plane\n");
 
 	prepare_subtest_data(t, NULL);
 	unset_all_crtcs();
@@ -3294,8 +3291,6 @@ static void multidraw_subtest(const struct test_mode *t)
 static bool format_is_valid(int feature_flags,
 			    enum pixel_format format)
 {
-	int devid = intel_get_drm_devid(drm.fd);
-
 	if (!(feature_flags & FEATURE_FBC))
 		return true;
 
@@ -3303,7 +3298,7 @@ static bool format_is_valid(int feature_flags,
 	case FORMAT_RGB888:
 		return true;
 	case FORMAT_RGB565:
-		if (IS_GEN2(devid) || IS_G4X(devid))
+		if (IS_GEN2(drm.devid) || IS_G4X(drm.devid))
 			return false;
 		return true;
 	case FORMAT_RGB101010:
@@ -3374,19 +3369,17 @@ static void format_draw_subtest(const struct test_mode *t)
 
 static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
 {
-	int devid = intel_get_drm_devid(drm.fd);
-
 	if (!(feature_flags & FEATURE_FBC))
 		return true;
 
 	switch (tiling) {
 	case TILING_LINEAR:
-		return AT_LEAST_GEN(devid, 9);
+		return AT_LEAST_GEN(drm.devid, 9);
 	case TILING_X:
 	case TILING_Y:
 		return true;
 	case TILING_4:
-		return AT_LEAST_GEN(devid, 12);
+		return AT_LEAST_GEN(drm.devid, 12);
 	default:
 		igt_assert(false);
 		return false;
@@ -3805,7 +3798,7 @@ static void scaledprimary_subtest(const struct test_mode *t)
 	struct igt_fb new_fb, *old_fb;
 	struct modeset_params *params = pick_params(t);
 	struct fb_region *reg = &params->primary;
-	int gen = intel_display_ver(intel_get_drm_devid(drm.fd));
+	int gen = drm.display_ver;
 	int src_y_upscale = ALIGN(reg->h / 4, 4);
 
 	igt_require_f(gen >= 9,
@@ -3990,7 +3983,7 @@ static void farfromfence_subtest(const struct test_mode *t)
 	struct draw_pattern_info *pattern = &pattern1;
 	struct fb_region *target;
 	int max_height, assertions = 0;
-	int gen = intel_display_ver(intel_get_drm_devid(drm.fd));
+	int gen = drm.display_ver;
 
 	switch (gen) {
 	case 2:
@@ -4461,13 +4454,13 @@ struct option long_options[] = {
 igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	struct test_mode t;
-	int devid;
 	enum pipe pipe;
 	igt_output_t *output;
 
 	igt_fixture {
 		setup_environment();
-		devid = intel_get_drm_devid(drm.fd);
+		drm.devid = intel_get_drm_devid(drm.fd);
+		drm.display_ver = intel_display_ver(drm.devid);
 	}
 
 	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
@@ -4765,14 +4758,14 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
 					/* Tiling Y is only supported on GEN9+ */
 					if (t.tiling == TILING_Y) {
-						igt_require(AT_LEAST_GEN(devid, 9));
-						igt_require(!intel_get_device_info(devid)->has_4tile);
+						igt_require(AT_LEAST_GEN(drm.devid, 9));
+						igt_require(!intel_get_device_info(drm.devid)->has_4tile);
 					}
 
 					/* Tiling 4 is only supported on GEN12+ */
 					if (t.tiling == TILING_4) {
-						igt_require(AT_LEAST_GEN(devid, 12));
-						igt_require(intel_get_device_info(devid)->has_4tile);
+						igt_require(AT_LEAST_GEN(drm.devid, 12));
+						igt_require(intel_get_device_info(drm.devid)->has_4tile);
 					}
 
 					if (tiling_is_valid(t.feature, t.tiling))
-- 
2.40.0
