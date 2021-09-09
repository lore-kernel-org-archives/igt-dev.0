Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A68A6E88F
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Sep 2021 15:31:22 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu,  9 Sep 2021 18:30:44 +0300
Message-Id: <20210909153047.16729-9-ville.syrjala@linux.intel.com>
In-Reply-To: <20210909153047.16729-1-ville.syrjala@linux.intel.com>
References: <20210909153047.16729-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 08/11] tests/kms_big_fb: Nuke the
 stride/format overrides
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

format_override/stride_override are never set. Nuke them.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_big_fb.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
index 0022f2ad264b..6be3062bd335 100644
--- a/tests/kms_big_fb.c
+++ b/tests/kms_big_fb.c
@@ -55,8 +55,6 @@ typedef struct {
 	int hw_stride;
 	int max_hw_fb_width;
 	double planeclearrgb[3];
-	uint32_t format_override;
-	uint32_t stride_override;
 } data_t;
 
 static struct intel_buf *init_buf(data_t *data,
@@ -949,18 +947,7 @@ igt_main
 					igt_subtest_f("%s-max-hw-stride-%dbpp-rotate-%d%s", modifiers[i].name,
 						formats[j].bpp, rotations[k].angle, fliptab[l].flipname) {
 						igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 5);
-						if (data.format_override != 0) {
-							igt_info("using format override fourcc %.4s\n", (char *)&data.format_override);
-							data.format = data.format_override;
-						}
-						if (data.stride_override != 0) {
-							igt_info("using FB width override %.d\n", data.stride_override);
-							data.hw_stride = data.stride_override;
-							data.max_hw_fb_width = data.stride_override;
-
-						} else {
-							data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
-						}
+						data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
 
 						test_scanout(&data);
 					}
-- 
2.31.1
