Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861EF6E97F
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Nov 2021 08:35:49 +0000 (UTC)
From: Stylon Wang <stylon.wang@amd.com>
Date: Tue, 30 Nov 2021 16:35:01 +0800
Message-ID: <20211130083503.10221-10-stylon.wang@amd.com>
In-Reply-To: <20211130083503.10221-1-stylon.wang@amd.com>
References: <20211130083503.10221-1-stylon.wang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 09/11] tests/amdgpu/amd_plane: Add full
 screen scaling test case
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
Cc: anson.jacob@amd.com, Bhawanpreet.Lakha@amd.com, Ahmad.Othman@amd.com, Hayden.Goodfellow@amd.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

[Why]
Full screen scaling is a common usecase

[How]
Rework the scaling tests to add a 'fullscreen' test case. Change the
test_plane function to use "dst_w/h" instead of a scale multiplier. This
way we can easily add a full screen scale multiplier.

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
---
 tests/amdgpu/amd_plane.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index 12669239..66302ebf 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -274,7 +274,7 @@ static void set_regamma_lut(data_t *data, lut_t const *lut, int n)
  * NOTE: The reason for using White+White is to speed up the crc (reuse the ref crc for all cases vs taking
  * a ref crc per flip)
  */
-static void test_plane(data_t *data, int n, int x, int y, double w, double h, double scale, int pw, int ph, struct fbc *fbc){
+static void test_plane(data_t *data, int n, int x, int y, double w, double h, double dw, double dh, int pw, int ph, struct fbc *fbc){
 
 	igt_crc_t test_crc;
 	igt_display_t *display = &data->display;
@@ -291,14 +291,14 @@ static void test_plane(data_t *data, int n, int x, int y, double w, double h, do
 	/* Test: */
 	/* Draw a white overlay with a cutout */
 	draw_color_alpha(&fbc[n].test_overlay, 0, 0, pw, ph, 1.0, 1.0, 1.0, 1.00);
-	draw_color_alpha(&fbc[n].test_overlay, x, y, w*scale, h*scale, 0.0, 0.0, 0.0, 0.0);
+	draw_color_alpha(&fbc[n].test_overlay, x, y, dw, dh, 0.0, 0.0, 0.0, 0.0);
 
 	igt_plane_set_fb(data->primary[n], &fbc[n].test_primary);
 	igt_plane_set_fb(data->overlay[n], &fbc[n].test_overlay);
 
 	/* Move the overlay to cover the cutout */
 	igt_plane_set_position(data->primary[n], x, y);
-	igt_plane_set_size(data->primary[n], w*scale, h*scale);
+	igt_plane_set_size(data->primary[n], dw, dh);
 
 	igt_display_commit_atomic(display, 0, 0);
 	igt_pipe_crc_collect_crc(data->pipe_crc[n], &test_crc);
@@ -351,7 +351,7 @@ static void test_panning_1_display(data_t *data, int display_count, int w, int h
 				if (pw <= w && ph <= h)
 					break;
 
-				test_plane(data, n, x, y, w, h, 1.0, pw, ph, fb);
+				test_plane(data, n, x, y, w, h, w, h, pw, ph, fb);
 
 			}
 		}
@@ -390,8 +390,11 @@ static void test_scaling_planes(data_t *data, int display_count, int w, int h, s
 			/* No need to scale a overley that is bigger than the display */
 			if (pw <= w*scale[i] && ph <= h*scale[i])
 				break;
-			test_plane(data, n, 0, 0, w, h, scale[i], pw, ph, fb);
+			test_plane(data, n, 0, 0, w, h, w*scale[i], h*scale[i], pw, ph, fb);
 		}
+
+		/* Test Fullscreen scale*/
+		test_plane(data, n, 0, 0, w, h, pw, ph, pw, ph, fb);
 	}
 
 	return;
@@ -425,9 +428,9 @@ static void test_panning_2_display(data_t *data, int w, int h, struct fbc *fbc)
 	for (int j = 0; j < ARRAY_SIZE(y); j++){
 		for (int i = 0; i < it; i++){
 			if (toggle)
-				test_plane(data, 0, pw-w, y[j], w, h, 1.0, pw, ph, fbc);
+				test_plane(data, 0, pw-w, y[j], w, h, w, h, pw, ph, fbc);
 			else
-				test_plane(data, 1, 0, y[j], w, h, 1.0, pw2, ph2, fbc);
+				test_plane(data, 1, 0, y[j], w, h, w, h, pw2, ph2, fbc);
 
 			toggle = !toggle;
 		}
-- 
2.33.1
