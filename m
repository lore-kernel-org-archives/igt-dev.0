Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2086E891
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Sep 2021 15:31:12 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu,  9 Sep 2021 18:30:43 +0300
Message-Id: <20210909153047.16729-8-ville.syrjala@linux.intel.com>
In-Reply-To: <20210909153047.16729-1-ville.syrjala@linux.intel.com>
References: <20210909153047.16729-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 07/11] tests/kms_big_fb: Move
 format/modifier checks lower
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

No reason to keep repeating the same format checks multiple
times. Just move them into test_scanout().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_big_fb.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
index 9e98ed3f9edc..0022f2ad264b 100644
--- a/tests/kms_big_fb.c
+++ b/tests/kms_big_fb.c
@@ -575,6 +575,11 @@ static void test_scanout(data_t *data)
 {
 	igt_output_t *output;
 
+	igt_require(data->format == DRM_FORMAT_C8 ||
+		    igt_fb_supported_format(data->format));
+
+	igt_require(igt_display_has_format_mod(&data->display, data->format, data->modifier));
+
 	if (data->max_hw_stride_test) {
 		data->big_fb_width = data->max_hw_fb_width;
 		data->big_fb_height = 0;
@@ -903,12 +908,8 @@ igt_main
 				igt_describe("Sanity check if addfb ioctl works correctly for given "
 						"combination of modifier formats and rotation");
 				igt_subtest_f("%s-%dbpp-rotate-%d", modifiers[i].name,
-					      formats[j].bpp, rotations[k].angle) {
-					igt_require(data.format == DRM_FORMAT_C8 ||
-						    igt_fb_supported_format(data.format));
-					igt_require(igt_display_has_format_mod(&data.display, data.format, data.modifier));
+					      formats[j].bpp, rotations[k].angle)
 					test_scanout(&data);
-				}
 			}
 
 			igt_fixture
@@ -961,9 +962,6 @@ igt_main
 							data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
 						}
 
-						igt_require(data.format == DRM_FORMAT_C8 ||
-							igt_fb_supported_format(data.format));
-						igt_require(igt_display_has_format_mod(&data.display, data.format, data.modifier));
 						test_scanout(&data);
 					}
 
@@ -975,9 +973,6 @@ igt_main
 					igt_describe("test async flip on maximum hardware supported stride length for given bpp and modifiers.");
 					igt_subtest_f("%s-max-hw-stride-%dbpp-rotate-%d%s-async-flip", modifiers[i].name,
 						formats[j].bpp, rotations[k].angle, fliptab[l].flipname) {
-							igt_require(data.format == DRM_FORMAT_C8 ||
-								igt_fb_supported_format(data.format));
-							igt_require(igt_display_has_format_mod(&data.display, data.format, data.modifier));
 							igt_require(igt_has_drm_cap(data.drm_fd, DRM_CAP_ASYNC_PAGE_FLIP));
 							data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
 							test_scanout(&data);
-- 
2.31.1
