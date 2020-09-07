Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35F56E41B
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2020 10:28:51 +0000 (UTC)
From: Sowmya Kaparthi <sowmyax.kaparthi@intel.com>
Date: Mon,  7 Sep 2020 10:28:46 +0000
Message-Id: <20200907102846.17773-1-sowmyax.kaparthi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t] tests/kms_plane_scaling: set minimum height and
 width to 20
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
To: igt-dev@lists.freedesktop.org, james.ausmus@intel.com, matthew.s.atwood@intel.com, sowmyax.kaparthi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Depending on pixel format minimum width and height can be as
high as 20. Set width and height to 20. Remove is_planar_yuv_format,
no longer used.

Cc: Ausmus, James <james.ausmus@intel.com>
Signed-off-by: Sowmya Kaparthi <sowmyax.kaparthi@intel.com>
---
 tests/kms_plane_scaling.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 19087286..ecd2c2e3 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -62,19 +62,6 @@ static int get_num_scalers(data_t* d, enum pipe pipe)
 		return 1;
 }
 
-static bool is_planar_yuv_format(uint32_t pixelformat)
-{
-	switch (pixelformat) {
-	case DRM_FORMAT_NV12:
-	case DRM_FORMAT_P010:
-	case DRM_FORMAT_P012:
-	case DRM_FORMAT_P016:
-		return true;
-	default:
-		return false;
-	}
-}
-
 static void cleanup_fbs(data_t *data)
 {
 	int i;
@@ -147,9 +134,7 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 	mode = igt_output_get_mode(output);
 
 	/* create buffer in the range of  min and max source side limit.*/
-	width = height = 8;
-	if (is_i915_device(d->drm_fd) && is_planar_yuv_format(pixel_format))
-		width = height = 16;
+	width = height = 20;
 	igt_create_color_fb(display->drm_fd, width, height,
 		       pixel_format, tiling, 0.0, 1.0, 0.0, &d->fb[0]);
 	igt_plane_set_fb(plane, &d->fb[0]);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
