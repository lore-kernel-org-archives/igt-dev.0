Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4211510E798
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Mar 2022 20:54:33 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Mar 2022 02:24:13 +0530
Message-Id: <20220317205414.13668-4-jeevan.b@intel.com>
In-Reply-To: <20220317205414.13668-1-jeevan.b@intel.com>
References: <20220317205414.13668-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/4] tests/kms_frontbuffer_tracking: Add
 support for 4 tiling
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

From: Mika Kahola <mika.kahola@intel.com>

GEN12 uses 4 tiling instead of Y tiling. Let's add support for
tiling 4.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 1c3acd79..814ddb46 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -136,6 +136,7 @@ struct test_mode {
 		TILING_LINEAR = 0,
 		TILING_X,
 		TILING_Y,
+		TILING_4,
 		TILING_COUNT,
 		TILING_DEFAULT = TILING_X,
 	} tiling;
@@ -462,6 +463,8 @@ static uint64_t tiling_to_modifier(enum tiling_type tiling)
 		return I915_FORMAT_MOD_X_TILED;
 	case TILING_Y:
 		return I915_FORMAT_MOD_Y_TILED;
+	case TILING_4:
+		return I915_FORMAT_MOD_4_TILED;
 	default:
 		igt_assert(false);
 	}
@@ -2234,6 +2237,8 @@ static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
 	case TILING_X:
 	case TILING_Y:
 		return true;
+	case TILING_4:
+		return AT_LEAST_GEN(devid, 12);
 	default:
 		igt_assert(false);
 		return false;
@@ -3210,6 +3215,8 @@ static int opt_handler(int option, int option_index, void *data)
 			opt.tiling = TILING_X;
 		else if (!strcmp(optarg, "y"))
 			opt.tiling = TILING_Y;
+		else if (!strcmp(optarg, "4"))
+			opt.tiling = TILING_4;
 		else if (!strcmp(optarg, "l")) {
 			opt.tiling = TILING_LINEAR;
 		} else {
@@ -3353,6 +3360,8 @@ static const char *tiling_str(enum tiling_type tiling)
 		return "x";
 	case TILING_Y:
 		return "y";
+	case TILING_4:
+		return "4";
 	default:
 		igt_assert(false);
 	}
@@ -3404,9 +3413,12 @@ struct option long_options[] = {
 igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	struct test_mode t;
+	int devid;
 
-	igt_fixture
+	igt_fixture {
 		setup_environment();
+		devid = intel_get_drm_devid(drm.fd);
+	}
 
 	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
 		if (!opt.show_hidden && t.feature == FEATURE_NONE)
@@ -3604,8 +3616,14 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
 					/* Tiling Y is only supported on GEN9+ */
 					if (t.tiling == TILING_Y) {
-						int devid = intel_get_drm_devid(drm.fd);
 						igt_require(AT_LEAST_GEN(devid, 9));
+						igt_require(!intel_get_device_info(devid)->has_4tile);
+					}
+
+					/* Tiling 4 is only supported on GEN12+ */
+					if (t.tiling == TILING_4) {
+						igt_require(AT_LEAST_GEN(devid, 12));
+						igt_require(intel_get_device_info(devid)->has_4tile);
 					}
 
 					if (tiling_is_valid(t.feature, t.tiling))
-- 
2.35.1
