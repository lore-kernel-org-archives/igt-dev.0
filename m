Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679B96E524
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Dec 2021 06:55:11 +0000 (UTC)
From: Stylon Wang <stylon.wang@amd.com>
Date: Wed, 1 Dec 2021 14:54:29 +0800
Message-ID: <20211201065434.48827-7-stylon.wang@amd.com>
In-Reply-To: <20211201065434.48827-1-stylon.wang@amd.com>
References: <20211130083503.10221-1-stylon.wang@amd.com>
 <20211201065434.48827-1-stylon.wang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v2 06/11] tests/amdgpu/amd_plane: Create mpo
 swap between 2 displays test
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
In a multi display MPO config the MPO window is dragged from one display
to the other. In this usecase there is an instance when the overlay is
moved from one display to the next. This test recreates the scenario
(MPO swap)

[How]
Overlay should switch to the display that has >50% of the video. This
test was created with this asumption.

The test creates common video sizes and swaps a window of size (w/2,h)
between 2 displays bezzels at the top,middle and bottom of the display.

CRTC#1           CRTC#2                CRTC#1           CRTC#2
+-------------+------------+           +-------------+------------+
|             |            |           |             |            |
|    +--------+            |           |             +--------+   |
|    |Primary |   Primary  |    <=>    |   Primary   |Primary |   |
|    |        |            |   Swap    |             |        |   |
|    +--------+            |           |             +--------+   |
|overlay      |            |           |             |Overlay     |
+-------------+------------+           +-------------+------------+

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
---
 tests/amdgpu/amd_plane.c | 53 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index 09fcf3eb..fe2389df 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -140,7 +140,8 @@ static void lut_free(lut_t *lut)
 }
 
 enum test {
-	MPO_SINGLE_PAN
+	MPO_SINGLE_PAN,
+	MPO_MULTI_PAN
 };
 
 static void test_init(data_t *data)
@@ -360,6 +361,46 @@ static void test_panning_1_display(data_t *data, int display_count, int w, int h
 
 }
 
+/*
+ * MPO_MULTI_PAN: Requires 2 displays. This test swaps a window (w,h) between 2 displays at 3 different
+ * vertical locations (top, middle, bottom)
+ *
+ * MPO will usually be the 'largest' part of the video window. Which means when a window is
+ * being dragged between 2 displays there is a instance where the MPO will jump between the displays.
+ * This test should be called with w/2 to emulate the behaviour of MPO switching between displays
+ */
+static void test_panning_2_display(data_t *data, int w, int h, struct fbc *fbc)
+{
+	bool toggle = true;
+	int pw =  data->w[0];
+	int ph =  data->h[0];
+	int pw2 =  data->w[1];
+	int ph2 =  data->h[1];
+	int smallest_h = min(ph, ph2);
+	int y[] = {0, smallest_h/2-h/2, smallest_h-h};
+	int it = 3; /* # of times to swap */
+
+	/* Set y to 0 if window is bigger than one of the displays
+	 * beacause y will be negative in that case
+	 */
+	if (h >= smallest_h)
+		y[0] = y[1] = y[2] = 0;
+
+
+	for (int j = 0; j < ARRAY_SIZE(y); j++){
+		for (int i = 0; i < it; i++){
+			if (toggle)
+				test_plane(data, 0, pw-w, y[j], w, h, pw, ph, fbc);
+			else
+				test_plane(data, 1, 0, y[j], w, h, pw2, ph2, fbc);
+
+			toggle = !toggle;
+		}
+	}
+
+	return;
+
+}
 
 /*
  * Setup and runner for panning test. Creates common video sizes and pans them across the display
@@ -417,12 +458,20 @@ static void test_display_mpo(data_t *data, enum test test, uint32_t format, int
 
 	for (int i = 0; i < ARRAY_SIZE(videos); ++i) {
 
+		/* Video(mpo) should be in the middle when it transitions between displays. This
+		 * means MPO plane will be w/2
+		 */
+		if (test == MPO_MULTI_PAN)
+			videos[i][0] = videos[i][0]/2;
+
 		for (int n = 0; n < display_count; n++)
 			igt_create_color_fb(data->fd, videos[i][0], videos[i][1],
 					    format, 0, 1.0, 1.0, 1.0, &fb[n].test_primary);
 
 		if (test == MPO_SINGLE_PAN)
 			test_panning_1_display(data, display_count, videos[i][0], videos[i][1], fb);
+		if (test == MPO_MULTI_PAN)
+			test_panning_2_display(data, videos[i][0], videos[i][1], fb);
 
 		for (int n = 0; n < display_count; n++)
 			igt_remove_fb(data->fd, &fb[n].test_primary);
@@ -656,6 +705,8 @@ igt_main
 		test_mpo_swizzle_toggle_multihead(&data);
 	igt_subtest("mpo-pan-rgb") test_display_mpo(&data, MPO_SINGLE_PAN, DRM_FORMAT_XRGB8888, DISPLAYS_TO_TEST);
 	igt_subtest("mpo-pan-nv12") test_display_mpo(&data, MPO_SINGLE_PAN, DRM_FORMAT_NV12, DISPLAYS_TO_TEST);
+	igt_subtest("mpo-pan-multi-rgb") test_display_mpo(&data, MPO_MULTI_PAN, DRM_FORMAT_XRGB8888, DISPLAYS_TO_TEST);
+	igt_subtest("mpo-pan-multi-nv12") test_display_mpo(&data, MPO_MULTI_PAN, DRM_FORMAT_NV12, DISPLAYS_TO_TEST);
 
 	igt_fixture
 	{
-- 
2.33.1
