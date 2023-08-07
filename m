Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC33410E388
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Aug 2023 20:02:36 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Aug 2023 01:24:49 +0530
Message-Id: <20230807195500.4103092-10-bhanuprakash.modem@intel.com>
In-Reply-To: <20230807195500.4103092-1-bhanuprakash.modem@intel.com>
References: <20230807195500.4103092-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 09/20] tests/i915/kms_big_fb: Add tiling
 support for XE
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

Remove the tiling restrictions in Xe specific tests

V2: - Update XE blocklist

Fixes: 34168d915 (tests/i915/kms_big_fb: Add XE support)
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_big_fb.c         | 23 +----------------------
 tests/intel-ci/xe.blocklist.txt |  1 -
 2 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index 44ea117a1..cffab8e56 100644
--- a/tests/i915/kms_big_fb.c
+++ b/tests/i915/kms_big_fb.c
@@ -928,10 +928,6 @@ igt_main
 	for (int i = 1; i < ARRAY_SIZE(modifiers); i++) {
 		igt_subtest_f("%s-addfb-size-overflow",
 			      modifiers[i].name) {
-			/* No tiling support in XE. */
-			igt_skip_on(is_xe_device(data.drm_fd) &&
-				    modifiers[i].modifier != DRM_FORMAT_MOD_LINEAR);
-
 			data.modifier = modifiers[i].modifier;
 			test_size_overflow(&data);
 		}
@@ -941,10 +937,6 @@ igt_main
 	for (int i = 1; i < ARRAY_SIZE(modifiers); i++) {
 		igt_subtest_f("%s-addfb-size-offset-overflow",
 			      modifiers[i].name) {
-			/* No tiling support in XE. */
-			igt_skip_on(is_xe_device(data.drm_fd) &&
-				    modifiers[i].modifier != DRM_FORMAT_MOD_LINEAR);
-
 			data.modifier = modifiers[i].modifier;
 			test_size_offset_overflow(&data);
 		}
@@ -953,10 +945,6 @@ igt_main
 	igt_describe("Sanity check if addfb ioctl works correctly for given size and strides of fb");
 	for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
 		igt_subtest_f("%s-addfb", modifiers[i].name) {
-			/* No tiling support in XE. */
-			igt_skip_on(is_xe_device(data.drm_fd) &&
-				    modifiers[i].modifier != DRM_FORMAT_MOD_LINEAR);
-
 			data.modifier = modifiers[i].modifier;
 			test_addfb(&data);
 		}
@@ -974,13 +962,8 @@ igt_main
 				igt_describe("Sanity check if addfb ioctl works correctly for given "
 						"combination of modifier formats and rotation");
 				igt_subtest_f("%s-%dbpp-rotate-%d", modifiers[i].name,
-					      formats[j].bpp, rotations[k].angle) {
-					/* No tiling support in XE. */
-					igt_skip_on(is_xe_device(data.drm_fd) &&
-						    data.modifier != DRM_FORMAT_MOD_LINEAR);
-
+					      formats[j].bpp, rotations[k].angle)
 					test_scanout(&data);
-				}
 			}
 
 			igt_fixture
@@ -1022,10 +1005,6 @@ igt_main
 						igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 5);
 						data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
 
-						/* No tiling support in XE. */
-						igt_skip_on(is_xe_device(data.drm_fd) &&
-							    modifiers[i].modifier != DRM_FORMAT_MOD_LINEAR);
-
 						test_scanout(&data);
 					}
 
diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index cc6a68c73..dc6984c44 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -66,7 +66,6 @@ igt@kms_psr@.*_mmap_(cpu|gtt)
 igt@kms_legacy_colorkey@basic
 igt@kms_legacy_colorkey@invalid-plane
 igt@kms_flip_scaled_crc@flip-(32|64)bpp-(4|x|y|yf|tileccs)tile-.*
-igt@kms_big_fb@(4|x|y|yf)-tiled-.*
 igt@kms_flip@2x-flip-vs-fences
 igt@kms_flip@flip-vs-fences(-interruptible)
 igt@kms_addfb_basic@clobberred-modifier
-- 
2.40.0
