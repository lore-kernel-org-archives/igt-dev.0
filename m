Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C4310E491
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 13:01:51 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Mon,  3 Apr 2023 10:01:24 -0300
Message-Id: <20230403130124.15946-5-mcanal@igalia.com>
In-Reply-To: <20230403130124.15946-1-mcanal@igalia.com>
References: <20230403130124.15946-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/4] tests/kms_rotation_crc: create generic
 reflection tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Currently, kms_rotation_crc doesn't have any tests for the reflect-x and
reflect-y properties. Therefore, add generic reflection tests for the
primary and overlay planes. Note that this tests should skip on i915
devices, as i915 devices use reflect-x together with specific modifiers.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/kms_rotation_crc.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 441a298b..47a3973b 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -131,6 +131,9 @@ static void rotate_colors(rgb_color_t *tl, rgb_color_t *tr, rgb_color_t *br,
 	if (rotation & IGT_REFLECT_X) {
 		igt_swap(*tl, *tr);
 		igt_swap(*bl, *br);
+	} else if (rotation & IGT_REFLECT_Y) {
+		igt_swap(*tl, *bl);
+		igt_swap(*tr, *br);
 	}
 
 	if (rotation & IGT_ROTATION_90) {
@@ -1055,6 +1058,10 @@ static const char *rot_test_str(igt_rotation_t rot)
 		return "180";
 	case IGT_ROTATION_270:
 		return "270";
+	case IGT_REFLECT_X:
+		return "x";
+	case IGT_REFLECT_Y:
+		return "y";
 	default:
 		igt_assert(0);
 	}
@@ -1151,6 +1158,17 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		{ 0, 0 }
 	};
 
+	struct generic_reflect {
+		unsigned int plane;
+		igt_rotation_t rot;
+	} *generic_reflect, generic_reflect_subtests[] = {
+		{ DRM_PLANE_TYPE_PRIMARY, IGT_REFLECT_X },
+		{ DRM_PLANE_TYPE_PRIMARY, IGT_REFLECT_Y },
+		{ DRM_PLANE_TYPE_OVERLAY, IGT_REFLECT_X },
+		{ DRM_PLANE_TYPE_OVERLAY, IGT_REFLECT_Y },
+		{ 0, 0 }
+	};
+
 	int gen = 0;
 
 	igt_fixture {
@@ -1187,6 +1205,19 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
+	igt_describe("Generic reflection tests for primary and sprite planes");
+	for (generic_reflect = generic_reflect_subtests; generic_reflect->rot; generic_reflect++) {
+		igt_subtest_f("%s-reflect-%s",
+			      plane_test_str(generic_reflect->plane),
+			      rot_test_str(generic_reflect->rot)) {
+			/* i915 devices have specific modifiers for reflection */
+			igt_require(!is_i915_device(data.gfx_fd));
+
+			data.rotation = IGT_ROTATION_0 | generic_reflect->rot;
+			test_plane_rotation(&data, generic_reflect->plane, false);
+		}
+	}
+
 	igt_describe("Rotation test with 90/180/270 degree for a plane of gen9+ with given position");
 	for (rot_pos = rot_pos_subtests; rot_pos->rot; rot_pos++) {
 		igt_subtest_f("sprite-rotation-%s-pos-%d-%d", rot_test_str(rot_pos->rot),
-- 
2.39.2
