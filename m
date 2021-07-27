Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B670D6E55E
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jul 2021 19:05:20 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Wed, 28 Jul 2021 00:24:45 +0530
Message-Id: <20210727185445.11804-1-vidya.srinivas@intel.com>
In-Reply-To: <20210727145714.27046-1-vidya.srinivas@intel.com>
References: <20210727145714.27046-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Fix hw stride length tests
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
Cc: Charlton Lin <charlton.lin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

We see the HW stride length tests are crashing
when run in sequence. Individually, they PASS.
This is happening due to missing data.ibb creation
before the test_scanout. Patch fixes the same.

Signed-off-by: Charlton Lin <charlton.lin@intel.com>
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
Change-Id: I8a9ec8dd00ff249ef2ef72e0c2da28467e65563c
---
 tests/kms_big_fb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
index c6f374bdd073..26c7b8b200eb 100644
--- a/tests/kms_big_fb.c
+++ b/tests/kms_big_fb.c
@@ -852,7 +852,6 @@ igt_main
 			data.render_copy = igt_get_render_copyfunc(data.devid);
 
 		data.bops = buf_ops_create(data.drm_fd);
-		data.ibb = intel_bb_create(data.drm_fd, 4096);
 
 		data.planeclearrgb[0] = 0.0;
 		data.planeclearrgb[1] = 0.0;
@@ -978,7 +977,9 @@ igt_main
 						igt_require(data.format == DRM_FORMAT_C8 ||
 							igt_fb_supported_format(data.format));
 						igt_require(igt_display_has_format_mod(&data.display, data.format, data.modifier));
+						data.ibb = intel_bb_create(data.drm_fd, 4096);
 						test_scanout(&data);
+						intel_bb_destroy(data.ibb);
 					}
 
 					// async flip doesn't support linear fbs.
@@ -994,7 +995,9 @@ igt_main
 							igt_require(igt_display_has_format_mod(&data.display, data.format, data.modifier));
 							igt_require_f(data.async_flip_support, "Async Flip is not supported\n");
 							data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
+							data.ibb = intel_bb_create(data.drm_fd, 4096);
 							test_scanout(&data);
+							intel_bb_destroy(data.ibb);
 					}
 					data.async_flip_test = false;
 				}
-- 
2.32.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
