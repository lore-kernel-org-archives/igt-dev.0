Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446EC6EB22
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2020 19:15:46 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Fri,  7 Feb 2020 21:15:21 +0200
Message-Id: <20200207191524.19362-5-imre.deak@intel.com>
In-Reply-To: <20200207191524.19362-1-imre.deak@intel.com>
References: <20200207191524.19362-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/8] tests/kms_draw_crc: Fix generating
 reference CRCs on platforms w/o aperture
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
List-ID: <igt-dev@lists.freedesktop.org>

Generate reference CRCs by drawing through a CPU mapping, which is also
available on platforms w/o a GTT aperture.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 tests/kms_draw_crc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_draw_crc.c b/tests/kms_draw_crc.c
index 6de9feae..f9d4b178 100644
--- a/tests/kms_draw_crc.c
+++ b/tests/kms_draw_crc.c
@@ -187,7 +187,7 @@ static void draw_method_subtest(enum igt_draw_method method,
 	 * comparison. Cache the value so we don't recompute it for every single
 	 * subtest. */
 	if (!base_crcs[format_index].set) {
-		get_method_crc(IGT_DRAW_MMAP_GTT, formats[format_index],
+		get_method_crc(IGT_DRAW_MMAP_CPU, formats[format_index],
 			       LOCAL_DRM_FORMAT_MOD_NONE,
 			       &base_crcs[format_index].crc);
 		base_crcs[format_index].set = true;
@@ -225,7 +225,7 @@ static void fill_fb_subtest(void)
 	igt_create_fb(drm_fd, ms.mode->hdisplay, ms.mode->vdisplay,
 		      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, &fb);
 
-	igt_draw_rect_fb(drm_fd, bufmgr, NULL, &fb, IGT_DRAW_MMAP_GTT,
+	igt_draw_rect_fb(drm_fd, bufmgr, NULL, &fb, IGT_DRAW_MMAP_CPU,
 			 0, 0, fb.width, fb.height, 0xFF);
 
 	rc = drmModeSetCrtc(drm_fd, ms.crtc_id, fb.fb_id, 0, 0,
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
