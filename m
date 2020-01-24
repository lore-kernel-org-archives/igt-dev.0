Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BEE6FF12
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2020 06:10:34 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Fri, 24 Jan 2020 11:40:24 +0530
Message-Id: <20200124061024.18369-2-mohammed.khajapasha@intel.com>
In-Reply-To: <20200124061024.18369-1-mohammed.khajapasha@intel.com>
References: <20200124061024.18369-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/1] tests/kms_concurrent: Move
 simultaneously allowed planes to main thread
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
Cc: juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

High resolution consumes more bandwidth so if amount of max planes is
calculated during low resolution switch back to high resolution will
immediately fail with bandwidth problem.

To avoid bandwidth exceed,move the simultaneously allowed planes to
before switching to low resolution mode in main thread.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 tests/kms_concurrent.c | 65 +++++++++++++++++++-----------------------
 1 file changed, 30 insertions(+), 35 deletions(-)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index a0280d15..14ca5fab 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -57,33 +57,11 @@ struct {
 static void test_init(data_t *data, enum pipe pipe, int n_planes,
 		      igt_output_t *output)
 {
-	drmModeModeInfo *mode;
-	igt_plane_t *primary;
-	int ret;
-
 	data->plane = calloc(n_planes, sizeof(*data->plane));
 	igt_assert_f(data->plane != NULL, "Failed to allocate memory for planes\n");
 
 	data->fb = calloc(n_planes, sizeof(struct igt_fb));
 	igt_assert_f(data->fb != NULL, "Failed to allocate memory for FBs\n");
-
-	igt_output_set_pipe(output, pipe);
-
-	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	data->plane[primary->index] = primary;
-
-	mode = igt_output_get_mode(output);
-
-	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-			    DRM_FORMAT_XRGB8888,
-			    LOCAL_I915_FORMAT_MOD_X_TILED,
-			    0.0f, 0.0f, 1.0f,
-			    &data->fb[primary->index]);
-
-	igt_plane_set_fb(data->plane[primary->index], &data->fb[primary->index]);
-
-	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
-	igt_skip_on(ret != 0);
 }
 
 static void test_fini(data_t *data, enum pipe pipe, int n_planes,
@@ -184,7 +162,6 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
 	y[primary->index] = 0;
 	for (i = 0; i < max_planes; i++) {
 		igt_plane_t *plane = igt_output_get_plane(output, i);
-		int ret;
 
 		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
 			continue;
@@ -207,18 +184,7 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
 
 		igt_plane_set_position(data->plane[i], x[i], y[i]);
 		igt_plane_set_fb(data->plane[i], &data->fb[i]);
-
-		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
-		if (ret) {
-			igt_plane_set_fb(data->plane[i], NULL);
-			igt_remove_fb(data->drm_fd, &data->fb[i]);
-			data->plane[i] = NULL;
-			break;
-		}
 	}
-	max_planes = i;
-
-	igt_assert_lt(0, max_planes);
 
 	/* primary plane */
 	data->plane[primary->index] = primary;
@@ -282,10 +248,39 @@ test_resolution_with_output(data_t *data, enum pipe pipe, igt_output_t *output)
 	const drmModeModeInfo *mode_hi, *mode_lo;
 	int iterations = opt.iterations < 1 ? 1 : opt.iterations;
 	bool loop_forever = opt.iterations == LOOP_FOREVER ? true : false;
-	int i;
+	int i, c, ret;
+	int max_planes = data->display.pipes[pipe].n_planes;
+	igt_plane_t *primary;
+	drmModeModeInfo *mode;
 
 	i = 0;
 	while (i < iterations || loop_forever) {
+		igt_output_set_pipe(output, pipe);
+		for (c = 0; c < max_planes; c++) {
+			igt_plane_t *plane = igt_output_get_plane(output, c);
+
+			if (plane->type != DRM_PLANE_TYPE_PRIMARY)
+				continue;
+			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+			data->plane[primary->index] = primary;
+			mode = igt_output_get_mode(output);
+			igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+						DRM_FORMAT_XRGB8888,
+						LOCAL_I915_FORMAT_MOD_X_TILED,
+						0.0f, 0.0f, 1.0f,
+						&data->fb[primary->index]);
+			igt_plane_set_fb(data->plane[primary->index], &data->fb[primary->index]);
+			ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+			if (ret) {
+				igt_plane_set_fb(data->plane[i], NULL);
+				igt_remove_fb(data->drm_fd, &data->fb[i]);
+				data->plane[i] = NULL;
+				break;
+			}
+		}
+		max_planes = c;
+		igt_assert_lt(0, max_planes);
+
 		mode_hi = igt_output_get_mode(output);
 		mode_lo = get_lowres_mode(data, mode_hi, output);
 
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
