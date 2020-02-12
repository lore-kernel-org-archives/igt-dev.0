Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1D06E10C
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2020 21:50:59 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Wed, 12 Feb 2020 23:50:34 +0200
Message-Id: <20200212215036.27407-1-imre.deak@intel.com>
In-Reply-To: <20200211023108.25369-5-imre.deak@intel.com>
References: <20200211023108.25369-5-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v3 5/8] tests/kms_draw_crc: Fix generating
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

Generate reference CRCs by drawing through a WC mapping on platforms w/o
a GTT aperture.

v2:
- Fix code comment in draw_method_subtest(). (Matt)
v3:
- Use WC instead of CPU mapping. (Ashutosh)

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com> (v2)
---
 tests/kms_draw_crc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/kms_draw_crc.c b/tests/kms_draw_crc.c
index 6de9feaeb..fa7433ab2 100644
--- a/tests/kms_draw_crc.c
+++ b/tests/kms_draw_crc.c
@@ -183,11 +183,13 @@ static void draw_method_subtest(enum igt_draw_method method,
 
 	igt_require(format_is_supported(formats[format_index], tiling));
 
-	/* Use IGT_DRAW_MMAP_GTT on an untiled buffer as the parameter for
+	/* Use IGT_DRAW_MMAP_GTT/WC on an untiled buffer as the parameter for
 	 * comparison. Cache the value so we don't recompute it for every single
 	 * subtest. */
 	if (!base_crcs[format_index].set) {
-		get_method_crc(IGT_DRAW_MMAP_GTT, formats[format_index],
+		get_method_crc(gem_has_mappable_ggtt(drm_fd) ? IGT_DRAW_MMAP_GTT :
+							       IGT_DRAW_MMAP_WC,
+			       formats[format_index],
 			       LOCAL_DRM_FORMAT_MOD_NONE,
 			       &base_crcs[format_index].crc);
 		base_crcs[format_index].set = true;
@@ -225,7 +227,9 @@ static void fill_fb_subtest(void)
 	igt_create_fb(drm_fd, ms.mode->hdisplay, ms.mode->vdisplay,
 		      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, &fb);
 
-	igt_draw_rect_fb(drm_fd, bufmgr, NULL, &fb, IGT_DRAW_MMAP_GTT,
+	igt_draw_rect_fb(drm_fd, bufmgr, NULL, &fb,
+			 gem_has_mappable_ggtt(drm_fd) ? IGT_DRAW_MMAP_GTT :
+							 IGT_DRAW_MMAP_WC,
 			 0, 0, fb.width, fb.height, 0xFF);
 
 	rc = drmModeSetCrtc(drm_fd, ms.crtc_id, fb.fb_id, 0, 0,
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
