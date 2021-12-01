Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4266E0FF
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Dec 2021 06:55:19 +0000 (UTC)
From: Stylon Wang <stylon.wang@amd.com>
Date: Wed, 1 Dec 2021 14:54:30 +0800
Message-ID: <20211201065434.48827-8-stylon.wang@amd.com>
In-Reply-To: <20211201065434.48827-1-stylon.wang@amd.com>
References: <20211130083503.10221-1-stylon.wang@amd.com>
 <20211201065434.48827-1-stylon.wang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v2 07/11] tests/amdgpu/amd_plane: Create mpo
 scaling tests
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
Cc: Bhawanpreet.Lakha@amd.com, Ahmad.Othman@amd.com, Hayden.Goodfellow@amd.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

[Why]
Resizing MPO window is a common usecase (video in windowed mode)

Our MPO feature has scaling limitations (0.25x -> 16x). So this test
creates a window of various reolutions and scales them between 0.25x -> 16x

[How]
The test creates common video sizes and scales them from (0.30x->16x).
The lower limit is 0.25 but some combination of configs fail at 0.25x so
0.30 is used as the starting point.

CRTC#1                            CRTC#1
+--------------------+           +---------------------+
| +-------+          |           | +------------+      |
| |Primary|          |           | |Primary     |      |
| +-------+          |    -->    | |            |      |
|                    |   scale   | |            |      |
|                    |           | +------------+      |
|overlay             |           |Overlay              |
+--------------------+           +---------------------+

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
---
 tests/amdgpu/amd_plane.c | 53 ++++++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 7 deletions(-)

diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index fe2389df..9506421d 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -141,7 +141,8 @@ static void lut_free(lut_t *lut)
 
 enum test {
 	MPO_SINGLE_PAN,
-	MPO_MULTI_PAN
+	MPO_MULTI_PAN,
+	MPO_SCALE
 };
 
 static void test_init(data_t *data)
@@ -273,7 +274,7 @@ static void set_regamma_lut(data_t *data, lut_t const *lut, int n)
  * NOTE: The reason for using White+White is to speed up the crc (reuse the ref crc for all cases vs taking
  * a ref crc per flip)
  */
-static void test_plane(data_t *data, int n, int x, int y, int w, int h, int pw, int ph, struct fbc *fbc){
+static void test_plane(data_t *data, int n, int x, int y, double w, double h, double scale, int pw, int ph, struct fbc *fbc){
 
 	igt_crc_t test_crc;
 	igt_display_t *display = &data->display;
@@ -290,14 +291,14 @@ static void test_plane(data_t *data, int n, int x, int y, int w, int h, int pw,
 	/* Test: */
 	/* Draw a white overlay with a cutout */
 	draw_color_alpha(&fbc[n].test_overlay, 0, 0, pw, ph, 1.0, 1.0, 1.0, 1.00);
-	draw_color_alpha(&fbc[n].test_overlay, x, y, w, h, 0.0, 0.0, 0.0, 0.0);
+	draw_color_alpha(&fbc[n].test_overlay, x, y, w*scale, h*scale, 0.0, 0.0, 0.0, 0.0);
 
 	igt_plane_set_fb(data->primary[n], &fbc[n].test_primary);
 	igt_plane_set_fb(data->overlay[n], &fbc[n].test_overlay);
 
 	/* Move the overlay to cover the cutout */
 	igt_plane_set_position(data->primary[n], x, y);
-	igt_plane_set_size(data->primary[n], w, h);
+	igt_plane_set_size(data->primary[n], w*scale, h*scale);
 
 	igt_display_commit_atomic(display, 0, 0);
 	igt_pipe_crc_collect_crc(data->pipe_crc[n], &test_crc);
@@ -350,7 +351,7 @@ static void test_panning_1_display(data_t *data, int display_count, int w, int h
 				if (pw <= w && ph <= h)
 					break;
 
-				test_plane(data, n, x, y, w, h, pw, ph, fb);
+				test_plane(data, n, x, y, w, h, 1.0, pw, ph, fb);
 
 			}
 		}
@@ -361,6 +362,40 @@ static void test_panning_1_display(data_t *data, int display_count, int w, int h
 
 }
 
+ /* MPO_SCALE: This test scales a window of size (w,h) from x1/4->x16.
+  */
+static void test_scaling_planes(data_t *data, int display_count, int w, int h, struct fbc *fb)
+{
+
+	/* Scale limit is x1/4 -> x16
+	 * some combinations of mode/window sizes fail for x0.25 so start from 0.30 -> 16
+	 */
+	double scale[]= {
+		0.30,
+		0.50,
+		0.75,
+		1.50,
+		3.00,
+		6.00,
+		12.00,
+		16.00
+
+	};
+
+	for (int n = 0; n < display_count; n++) {
+		int pw = data->w[n];
+		int ph = data->h[n];
+
+		for (int i=0;i<ARRAY_SIZE(scale);i++) {
+			/* No need to scale a overley that is bigger than the display */
+			if (pw <= w*scale[i] && ph <= h*scale[i])
+				break;
+			test_plane(data, n, 0, 0, w, h, scale[i], pw, ph, fb);
+		}
+	}
+
+	return;
+}
 /*
  * MPO_MULTI_PAN: Requires 2 displays. This test swaps a window (w,h) between 2 displays at 3 different
  * vertical locations (top, middle, bottom)
@@ -390,9 +425,9 @@ static void test_panning_2_display(data_t *data, int w, int h, struct fbc *fbc)
 	for (int j = 0; j < ARRAY_SIZE(y); j++){
 		for (int i = 0; i < it; i++){
 			if (toggle)
-				test_plane(data, 0, pw-w, y[j], w, h, pw, ph, fbc);
+				test_plane(data, 0, pw-w, y[j], w, h, 1.0, pw, ph, fbc);
 			else
-				test_plane(data, 1, 0, y[j], w, h, pw2, ph2, fbc);
+				test_plane(data, 1, 0, y[j], w, h, 1.0, pw2, ph2, fbc);
 
 			toggle = !toggle;
 		}
@@ -472,6 +507,8 @@ static void test_display_mpo(data_t *data, enum test test, uint32_t format, int
 			test_panning_1_display(data, display_count, videos[i][0], videos[i][1], fb);
 		if (test == MPO_MULTI_PAN)
 			test_panning_2_display(data, videos[i][0], videos[i][1], fb);
+		if(test == MPO_SCALE)
+			test_scaling_planes(data, display_count, videos[i][0], videos[i][1], fb);
 
 		for (int n = 0; n < display_count; n++)
 			igt_remove_fb(data->fd, &fb[n].test_primary);
@@ -707,6 +744,8 @@ igt_main
 	igt_subtest("mpo-pan-nv12") test_display_mpo(&data, MPO_SINGLE_PAN, DRM_FORMAT_NV12, DISPLAYS_TO_TEST);
 	igt_subtest("mpo-pan-multi-rgb") test_display_mpo(&data, MPO_MULTI_PAN, DRM_FORMAT_XRGB8888, DISPLAYS_TO_TEST);
 	igt_subtest("mpo-pan-multi-nv12") test_display_mpo(&data, MPO_MULTI_PAN, DRM_FORMAT_NV12, DISPLAYS_TO_TEST);
+	igt_subtest("mpo-scale-rgb") test_display_mpo(&data, MPO_SCALE, DRM_FORMAT_XRGB8888, DISPLAYS_TO_TEST);
+	igt_subtest("mpo-scale-nv12") test_display_mpo(&data, MPO_SCALE, DRM_FORMAT_NV12, DISPLAYS_TO_TEST);
 
 	igt_fixture
 	{
-- 
2.33.1
