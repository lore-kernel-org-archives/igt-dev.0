Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E273D10E43E
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Feb 2022 14:30:39 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Feb 2022 20:14:36 +0530
Message-Id: <20220225144436.17718-9-swati2.sharma@intel.com>
In-Reply-To: <20220225144436.17718-1-swati2.sharma@intel.com>
References: <20220225144436.17718-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v7 8/8] tests/kms_plane_scaling: Cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index e6ebb46d..5ae973c7 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -26,7 +26,6 @@
 #include "igt_vec.h"
 #include <math.h>
 
-
 IGT_TEST_DESCRIPTION("Test display plane scaling");
 
 enum scaler_combo_test_type {
@@ -39,10 +38,6 @@ typedef struct {
 	uint32_t devid;
 	int drm_fd;
 	igt_display_t display;
-	igt_crc_t ref_crc;
-
-	int image_w;
-	int image_h;
 
 	struct igt_fb fb[4];
 
@@ -316,8 +311,7 @@ static void test_scaler_with_rotation_pipe(data_t *d,
 {
 	igt_display_t *display = &d->display;
 	igt_plane_t *plane;
-	uint64_t modifier = is_i915_device(d->drm_fd) ?
-		I915_FORMAT_MOD_Y_TILED : DRM_FORMAT_MOD_LINEAR;
+	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 
 	igt_require(get_num_scalers(d, pipe) > 0);
 
@@ -732,12 +726,12 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	mode1 = igt_output_get_mode(output1);
 	mode2 = igt_output_get_mode(output2);
 
-	/* Upscaling Primary */
+	/* upscaling primary */
 	igt_plane_set_size(d->plane1, mode1->hdisplay, mode1->vdisplay);
 	igt_plane_set_size(d->plane3, mode2->hdisplay, mode2->vdisplay);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
-	/* Upscaling Sprites */
+	/* upscaling sprites */
 	igt_plane_set_size(d->plane2 ?: d->plane1, mode1->hdisplay, mode1->vdisplay);
 	igt_plane_set_size(d->plane4 ?: d->plane3, mode2->hdisplay, mode2->vdisplay);
 	igt_display_commit2(display, COMMIT_ATOMIC);
-- 
2.25.1
