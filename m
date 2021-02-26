Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB096E3D6
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Feb 2021 11:53:11 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Fri, 26 Feb 2021 17:23:34 +0530
Message-Id: <20210226115334.1077936-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4] tests/kms_addfb_basic:Added subtest
 description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Bharadiya@freedesktop.org, Laxminarayan@freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Added description for all subtests

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: Laxminarayan Bharadiya, Pankaj<Pankaj.Laxminarayan.Bharadiya@intel.com>

v2: Modified description to be more specific. (Pankaj)
v3, v4: Modified description. (Pankaj)
Reviewed-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 tests/kms_addfb_basic.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 090abe7f..1302b1c7 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -94,6 +94,7 @@ static void invalid_tests(int fd)
 
 	f.flags = LOCAL_DRM_MODE_FB_MODIFIERS;
 
+	igt_describe("Test that addfb2 call fails correctly for unused handle");
 	igt_subtest("unused-handle") {
 		igt_require_fb_modifiers(fd);
 
@@ -103,6 +104,7 @@ static void invalid_tests(int fd)
 		f.handles[1] = 0;
 	}
 
+	igt_describe("Test that addfb2 call fails correctly for unused pitches");
 	igt_subtest("unused-pitches") {
 		igt_require_fb_modifiers(fd);
 
@@ -112,6 +114,7 @@ static void invalid_tests(int fd)
 		f.pitches[1] = 0;
 	}
 
+	igt_describe("Test that addfb2 call fails correctly for unused offset");
 	igt_subtest("unused-offsets") {
 		igt_require_fb_modifiers(fd);
 
@@ -121,6 +124,7 @@ static void invalid_tests(int fd)
 		f.offsets[1] = 0;
 	}
 
+	igt_describe("Test that addfb2 call fails correctly for unused modifier");
 	igt_subtest("unused-modifier") {
 		igt_require_fb_modifiers(fd);
 
@@ -130,6 +134,7 @@ static void invalid_tests(int fd)
 		f.modifier[1] = 0;
 	}
 
+	igt_describe("Check if addfb2 call works for clobbered modifier");
 	igt_subtest("clobberred-modifier") {
 		igt_require_intel(fd);
 		f.flags = 0;
@@ -141,6 +146,7 @@ static void invalid_tests(int fd)
 		igt_assert(f.modifier[0] == 0);
 	}
 
+	igt_describe("Check if addfb2 call works for legacy formats");
 	igt_subtest("legacy-format") {
 		struct {
 			/* drm_mode_legacy_fb_format() */
@@ -266,11 +272,13 @@ static void pitch_tests(int fd)
 		igt_assert(gem_bo);
 	}
 
+	igt_describe("Test that addfb2 call fails correctly without handle");
 	igt_subtest("no-handle") {
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
 			   errno == EINVAL);
 	}
 
+	igt_describe("Check if addfb2 call works with given handle");
 	f.handles[0] = gem_bo;
 	igt_subtest("basic") {
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
@@ -278,6 +286,7 @@ static void pitch_tests(int fd)
 		f.fb_id = 0;
 	}
 
+	igt_describe("Test that addfb2 call fails correctly for bad-pitches");
 	for (i = 0; i < ARRAY_SIZE(bad_pitches); i++) {
 		igt_subtest_f("bad-pitch-%i", bad_pitches[i]) {
 			f.pitches[0] = bad_pitches[i];
@@ -331,6 +340,7 @@ static void tiling_tests(int fd)
 		}
 
 		f.pitches[0] = 1024*4;
+		igt_describe("Check if addfb2 and rmfb call works for basic x-tiling test");
 		igt_subtest("basic-x-tiled-legacy") {
 			f.handles[0] = tiled_x_bo;
 
@@ -339,6 +349,7 @@ static void tiling_tests(int fd)
 			f.fb_id = 0;
 		}
 
+		igt_describe("Check if addfb2 call works for x and y tiling");
 		igt_subtest("framebuffer-vs-set-tiling") {
 			f.handles[0] = gem_bo;
 
@@ -350,7 +361,8 @@ static void tiling_tests(int fd)
 			f.fb_id = 0;
 		}
 
-		f.pitches[0] = 512*4;
+		igt_describe("Test that addfb2 call fails correctly for pitches mismatch");
+			f.pitches[0] = 512*4;
 		igt_subtest("tile-pitch-mismatch") {
 			f.handles[0] = tiled_x_bo;
 
@@ -358,6 +370,7 @@ static void tiling_tests(int fd)
 				   errno == EINVAL);
 		}
 
+		igt_describe("Test that addfb2 call fails correctly for basic y-tiling test");
 		f.pitches[0] = 1024*4;
 		igt_subtest("basic-y-tiled-legacy") {
 			f.handles[0] = tiled_y_bo;
@@ -409,6 +422,7 @@ static void size_tests(int fd)
 	f_16.handles[0] = gem_bo;
 	f_8.handles[0] = gem_bo;
 
+	igt_describe("Check if addfb2 call works with max size of  buffer object");
 	igt_subtest("size-max") {
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
@@ -424,6 +438,7 @@ static void size_tests(int fd)
 	f.width++;
 	f_16.width++;
 	f_8.width++;
+	igt_describe("Test that addfb2 call fails correctly with increased width of fb");
 	igt_subtest("too-wide") {
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
 			   errno == EINVAL);
@@ -438,6 +453,7 @@ static void size_tests(int fd)
 	f.height++;
 	f_16.height++;
 	f_8.height++;
+	igt_describe("Test that addfb2 call fails correctly with increased height of fb");
 	igt_subtest("too-high") {
 		for (i = 0; i < ARRAY_SIZE(framebuffers); i++) {
 			igt_debug("Checking framebuffer %i\n", i);
@@ -453,6 +469,7 @@ static void size_tests(int fd)
 		}
 	}
 
+	igt_describe("Test that addfb2 call fails correctly with small size of buffer object");
 	f.handles[0] = gem_bo_small;
 	igt_subtest("bo-too-small") {
 		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f), -1);
@@ -467,6 +484,7 @@ static void size_tests(int fd)
 	}
 
 	/* Just to check that the parameters would work. */
+	igt_describe("Check if addfb2 call works for given height");
 	f.height = 1020;
 	igt_subtest("small-bo") {
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
@@ -474,6 +492,7 @@ static void size_tests(int fd)
 		f.fb_id = 0;
 	}
 
+	igt_describe("Test that addfb2 call fails correctly with small buffer object after changing tile");
 	igt_subtest("bo-too-small-due-to-tiling") {
 		igt_require_intel(fd);
 		gem_set_tiling(fd, gem_bo_small, I915_TILING_X, 1024*4);
@@ -508,6 +527,7 @@ static void addfb25_tests(int fd)
 		f.handles[0] = gem_bo;
 	}
 
+	igt_describe("Test that addfb2 call fails correctly for x-tiling with given modifier");
 	igt_subtest("addfb25-modifier-no-flag") {
 		igt_require_fb_modifiers(fd);
 
@@ -518,6 +538,7 @@ static void addfb25_tests(int fd)
 	igt_fixture
 		f.flags = LOCAL_DRM_MODE_FB_MODIFIERS;
 
+	igt_describe("Test that addfb2 call fails correctly for irrelevant modifier");
 	igt_subtest("addfb25-bad-modifier") {
 		igt_require_fb_modifiers(fd);
 
@@ -532,11 +553,13 @@ static void addfb25_tests(int fd)
 			igt_require_fb_modifiers(fd);
 		}
 
+		igt_describe("Test that addfb2 call fails correctly for irrelevant x-tiling");
 		igt_subtest("addfb25-x-tiled-mismatch-legacy") {
 			f.modifier[0] = LOCAL_DRM_FORMAT_MOD_NONE;
 			igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) < 0 && errno == EINVAL);
 		}
 
+		igt_describe("Check if addfb2 call works for x-tiling");
 		igt_subtest("addfb25-x-tiled-legacy") {
 			f.modifier[0] = LOCAL_I915_FORMAT_MOD_X_TILED;
 			igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) == 0);
@@ -544,6 +567,7 @@ static void addfb25_tests(int fd)
 			f.fb_id = 0;
 		}
 
+		igt_describe("Check if addfb2 call works for relevant combination of tiling and fbs");
 		igt_subtest("addfb25-framebuffer-vs-set-tiling") {
 			f.modifier[0] = LOCAL_I915_FORMAT_MOD_X_TILED;
 			igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) == 0);
@@ -596,6 +620,7 @@ static void addfb25_ytile(int fd)
 		f.handles[0] = gem_bo;
 	}
 
+	igt_describe("Check if addfb2 call works for y-tiling");
 	igt_subtest("addfb25-y-tiled-legacy") {
 		igt_require_fb_modifiers(fd);
 		igt_require_intel(fd);
@@ -608,6 +633,7 @@ static void addfb25_ytile(int fd)
 		f.fb_id = 0;
 	}
 
+	igt_describe("Check if addfb2 call works for yf-tiling");
 	igt_subtest("addfb25-yf-tiled-legacy") {
 		igt_require_fb_modifiers(fd);
 		igt_require_intel(fd);
@@ -620,6 +646,7 @@ static void addfb25_ytile(int fd)
 		f.fb_id = 0;
 	}
 
+	igt_describe("Test that addfb2 call fails correctly for y-tiling with given height and modifier");
 	igt_subtest("addfb25-y-tiled-small-legacy") {
 		igt_require_fb_modifiers(fd);
 		igt_require_intel(fd);
@@ -667,6 +694,7 @@ static void prop_tests(int fd)
 	get_props.count_props = 1;
 	get_props.obj_id = f.fb_id;
 
+	igt_describe("Test that get-properties ioctl call fails correctly for invalid object type");
 	igt_subtest("invalid-get-prop-any") {
 		get_props.obj_type = 0; /* DRM_MODE_OBJECT_ANY */
 
@@ -674,6 +702,7 @@ static void prop_tests(int fd)
 				    &get_props) == -1 && errno == EINVAL);
 	}
 
+	igt_describe("Test that get-properties ioctl call fails correctly for fb mode object");
 	igt_subtest("invalid-get-prop") {
 		get_props.obj_type = DRM_MODE_OBJECT_FB;
 
@@ -685,6 +714,7 @@ static void prop_tests(int fd)
 	set_prop.prop_id = 1;
 	set_prop.obj_id = f.fb_id;
 
+	igt_describe("Test that set-properties ioctl call fails correctly for invalid object type");
 	igt_subtest("invalid-set-prop-any") {
 		set_prop.obj_type = 0; /* DRM_MODE_OBJECT_ANY */
 
@@ -692,6 +722,7 @@ static void prop_tests(int fd)
 				    &set_prop) == -1 && errno == EINVAL);
 	}
 
+	igt_describe("Test that get-properties ioctl call fails correctly for fb mode object");
 	igt_subtest("invalid-set-prop") {
 		set_prop.obj_type = DRM_MODE_OBJECT_FB;
 
@@ -723,6 +754,7 @@ static void master_tests(int fd)
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
 	}
 
+	igt_describe("Check that only master can rmfb");
 	igt_subtest("master-rmfb") {
 		int master2_fd;
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
