Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D1D10E0E6
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Nov 2023 13:12:41 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Nov 2023 18:32:36 +0530
Message-Id: <20231115130237.1522518-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20231115130237.1522518-1-bhanuprakash.modem@intel.com>
References: <20231115130237.1522518-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 3/4] tests/intel/kms_dirtyfb: Use blitter if
 rendercopy isn't present
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

As Rendercopy support in IGT is not present for few latest
platforms. So, fallback to use Blitter if Rendercopy isn't
present.

V2: Use rendorcopy check for entire test.

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/intel/kms_dirtyfb.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index b14cc8bec..151dceb93 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -60,6 +60,7 @@ typedef struct {
 		FEATURE_COUNT = 8,
 		FEATURE_DEFAULT = 8,
 	} feature;
+	igt_render_copyfunc_t rendercopy;
 } data_t;
 
 static const char *feature_str(int feature)
@@ -177,7 +178,8 @@ static void prepare(data_t *data)
 			    &data->fbs[0]);
 
 	igt_draw_rect_fb(data->drm_fd, data->bops, 0, &data->fbs[0],
-			 IGT_DRAW_RENDER, 0, 0, data->fbs[0].width,
+			 data->rendercopy ? IGT_DRAW_RENDER : IGT_DRAW_BLT,
+			 0, 0, data->fbs[0].width,
 			 data->fbs[0].height, 0xFF);
 
 	primary = igt_output_get_plane_type(data->output,
@@ -197,7 +199,8 @@ static void prepare(data_t *data)
 			    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
 			    &data->fbs[1]);
 	igt_draw_rect_fb(data->drm_fd, data->bops, 0, &data->fbs[1],
-			 IGT_DRAW_RENDER, 0, 0, data->fbs[1].width,
+			 data->rendercopy ? IGT_DRAW_RENDER : IGT_DRAW_BLT,
+			 0, 0, data->fbs[1].width,
 			 data->fbs[1].height, 0xFF);
 
 	igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
@@ -233,12 +236,8 @@ static void run_test(data_t *data)
 	struct intel_buf *src, *dst;
 	struct intel_bb *ibb;
 	igt_spin_t *spin;
-	uint32_t devid = intel_get_drm_devid(data->drm_fd);
-	igt_render_copyfunc_t rendercopy = igt_get_render_copyfunc(devid);
 	int r;
 
-	igt_skip_on(!rendercopy);
-
 	src = intel_buf_create_full(data->bops, data->fbs[1].gem_handle,
 				    data->fbs[1].width,
 				    data->fbs[1].height,
@@ -259,13 +258,19 @@ static void run_test(data_t *data)
 	spin = igt_spin_new(data->drm_fd, .ahnd = ibb->allocator_handle);
 	igt_spin_set_timeout(spin, NSEC_PER_SEC);
 
-	rendercopy(ibb, src, 0, 0, data->fbs[2].width, data->fbs[2].height, dst, 0, 0);
+	if (data->rendercopy) {
+		data->rendercopy(ibb, src, 0, 0, data->fbs[2].width, data->fbs[2].height, dst, 0, 0);
+	} else {
+		intel_bb_blt_copy(ibb, src, 0, 0, src->surface[0].stride,
+				  dst, 0, 0, dst->surface[0].stride,
+				  data->fbs[2].width, data->fbs[2].height, dst->bpp);
+	}
 
-	/* Perfom dirtyfb right after initiating rendercopy */
+	/* Perfom dirtyfb right after initiating rendercopy/blitter */
 	r = drmModeDirtyFB(data->drm_fd, data->fbs[2].fb_id, NULL, 0);
 	igt_assert(r == 0 || r == -ENOSYS);
 
-	/* Ensure rendercopy is complete */
+	/* Ensure rendercopy/blitter is complete */
 	intel_bb_sync(ibb);
 
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
@@ -289,6 +294,7 @@ igt_main
 		igt_display_require(&data.display, data.drm_fd);
 
 		data.bops = buf_ops_create(data.drm_fd);
+		data.rendercopy = igt_get_render_copyfunc(intel_get_drm_devid(data.drm_fd));
 
 		igt_display_reset(&data.display);
 	}
-- 
2.40.0
