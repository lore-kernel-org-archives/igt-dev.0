Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A4910E4C4
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Oct 2023 08:07:20 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 Oct 2023 13:28:19 +0530
Message-Id: <20231006075819.3055887-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20231006075819.3055887-1-bhanuprakash.modem@intel.com>
References: <20231006075819.3055887-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 4/4] tests/kms_rotation_crc: Use helpers from lib
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

Instead of having local implementations, use helpers from lib.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_rotation_crc.c | 40 ++++------------------------------------
 1 file changed, 4 insertions(+), 36 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index f171fcd22..c48e0d672 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -1178,38 +1178,6 @@ static const char *plane_test_str(unsigned plane)
 	}
 }
 
-static const char *rot_test_str(igt_rotation_t rot)
-{
-	switch (rot) {
-	case IGT_ROTATION_0:
-		return "0";
-	case IGT_ROTATION_90:
-		return "90";
-	case IGT_ROTATION_180:
-		return "180";
-	case IGT_ROTATION_270:
-		return "270";
-	default:
-		igt_assert(0);
-	}
-}
-
-static const char *modifier_test_str(uint64_t modifier)
-{
-	switch (modifier) {
-	case I915_FORMAT_MOD_X_TILED:
-		return "x-tiled";
-	case I915_FORMAT_MOD_Y_TILED:
-		return "y-tiled";
-	case I915_FORMAT_MOD_Yf_TILED:
-		return "yf-tiled";
-	case I915_FORMAT_MOD_4_TILED:
-		return "4-tiled";
-	default:
-		igt_assert(0);
-	}
-}
-
 static int opt_handler(int opt, int opt_index, void *_data)
 {
 	data_t *data = _data;
@@ -1289,7 +1257,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	for (subtest = subtests; subtest->rot; subtest++) {
 		igt_subtest_f("%s-rotation-%s",
 			      plane_test_str(subtest->plane),
-			      rot_test_str(subtest->rot)) {
+			      igt_plane_rotation_name(subtest->rot)) {
 			if (is_amdgpu_device(data.gfx_fd)) {
 				data.override_fmt = DRM_FORMAT_XRGB8888;
 				if (igt_rotation_90_or_270(subtest->rot))
@@ -1339,9 +1307,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_fixture
 			igt_require_intel(data.gfx_fd);
 
-		igt_subtest_f("primary-%s-reflect-x-%s",
-			      modifier_test_str(reflect_x->modifier),
-			      rot_test_str(reflect_x->rot)) {
+		igt_subtest_f("primary-%s-tiled-reflect-x-%s",
+			      igt_fb_modifier_name(reflect_x->modifier),
+			      igt_plane_rotation_name(reflect_x->rot)) {
 			data.rotation = (IGT_REFLECT_X | reflect_x->rot);
 			data.override_modifier = reflect_x->modifier;
 			test_plane_rotation(&data, DRM_PLANE_TYPE_PRIMARY, false);
-- 
2.40.0
