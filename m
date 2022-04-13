Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 950D110F0DE
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Apr 2022 22:05:38 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 13 Apr 2022 18:05:14 -0400
Message-ID: <20220413220514.1740383-5-dingchen.zhang@amd.com>
In-Reply-To: <20220413220514.1740383-1-dingchen.zhang@amd.com>
References: <20220413220514.1740383-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v2 4/4] tests/amdgpu/amd_psr: add PSR-SU test case
 for cursor move + MPO scenario
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

[why & how]
Besides the static background + cursor movement, a more generic use
case from usermode is MPO + cursor movement, e.g. a video stream
is playing on screen and user moves the cursor randomly. We'd have
a test case to validate PSR-SU enablement and SU region updates by
visual confirm for MPO + cursor movement scenario.

Refactoring the function for static background + cursor movement
test case by adding a flag indicating to test MPO or not. Adding
primary FBs as member of data structure used in PSR-SU test cases.

For MPO + cursormovement test case, create two primary FBs w/ diff
color and fix the position, and during iteration, flip the primary
FB together w/ cursor positon update. By enabling visual confirm
debug option, the equivalent dirty rectangle region fo SU update
is the combination of the old cursor position, new cursor position,
and the dirty rectangle for MPO plane. It is expected to observe
a green bar on the right side of the screen with height of the
combinated dirty rectangle.

Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Jay Pillai <aurabindo.pillai@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
---
 tests/amdgpu/amd_psr.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 3a65c4b2..dc33ac3b 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -55,6 +55,7 @@ typedef struct data {
 	igt_pipe_t *pipe;
 	igt_pipe_crc_t *pipe_crc;
 	igt_fb_t ov_fb[2];
+	igt_fb_t pm_fb[2];
 	drmModeModeInfo *mode;
 	enum pipe pipe_id;
 	int fd;
@@ -477,10 +478,11 @@ static void run_check_psr_su_ffu(data_t *data)
 	test_fini(data);
 }
 
-static void test_cursor_movement(data_t *data, int iters, igt_fb_t * pfb, int cs_size, enum cursor_move move_type)
+static void test_cursor_movement(data_t *data, int iters, int cs_size, enum cursor_move move_type, bool test_mpo)
 {
 	int i, pos_x, pos_y;
 	int ret;
+	igt_fb_t *pfb;
 
 	/* incremental step == cursor size / 16 */
 	for (i = 0, pos_y = 0, pos_x = 0; i < iters; ++i) {
@@ -491,7 +493,11 @@ static void test_cursor_movement(data_t *data, int iters, igt_fb_t * pfb, int cs
 		else if (move_type == DIAGONAL && ((pos_y + cs_size > data->h) || (pos_x + cs_size > data->w)))
 			pos_x = pos_y = 0;
 
+		/* move cursor */
 		igt_plane_set_position(data->cursor, pos_x, pos_y);
+
+		/* flip primary FB if MPO flag set */
+		pfb = test_mpo ? &data->pm_fb[i % 2] : &data->pm_fb[0];
 		igt_plane_set_fb(data->primary, pfb);
 
 		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL);
@@ -510,10 +516,9 @@ static void test_cursor_movement(data_t *data, int iters, igt_fb_t * pfb, int cs
 	}
 }
 
-static void run_check_psr_su_cursor(data_t *data)
+static void run_check_psr_su_cursor(data_t *data, bool test_mpo)
 {
 	int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
-	igt_fb_t rect_fb;	// primary FB
 	igt_fb_t cs_fb;		// cursor FB
 	const int cs_size = 128;
 	const int delay_sec = 5; // seconds
@@ -533,7 +538,9 @@ static void run_check_psr_su_cursor(data_t *data)
 
 	/* primary & overlay FB creation and set alpha region of overlay to show */
 	igt_create_color_fb(data->fd, pb_w, pb_h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
-			    .0, .0, 1.0, &rect_fb);
+			    .0, .0, 1.0, &data->pm_fb[0]);
+	igt_create_color_fb(data->fd, pb_w, pb_h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    .0, 1.0, .0, &data->pm_fb[1]);
 	igt_create_color_fb(data->fd, ob_w, ob_h, DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
 			    1.0, 1.0, 1.0, &data->ov_fb[0]);
 	draw_color_alpha(&data->ov_fb[0], 0, 0, pb_w, pb_h, 1.0, 1.0, 1.0, .0);
@@ -542,7 +549,7 @@ static void run_check_psr_su_cursor(data_t *data)
 	igt_create_fb(data->fd, cs_size, cs_size, DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, &cs_fb);
 	draw_color_cursor(&cs_fb, cs_size, 1.0, .0, 1.0);
 
-	igt_plane_set_fb(data->primary, &rect_fb);
+	igt_plane_set_fb(data->primary, &data->pm_fb[0]);
 	igt_plane_set_fb(data->overlay, &data->ov_fb[0]);
 	igt_plane_set_fb(data->cursor, &cs_fb);
 	igt_plane_set_position(data->cursor, 0, 0);
@@ -558,15 +565,16 @@ static void run_check_psr_su_cursor(data_t *data)
 	 */
 
 	/* horizontal */
-	test_cursor_movement(data, frame_rate * delay_sec, &rect_fb, cs_size, HORIZONTAL);
+	test_cursor_movement(data, frame_rate * delay_sec, cs_size, HORIZONTAL, test_mpo);
 
 	/* vertical */
-	test_cursor_movement(data, frame_rate * delay_sec, &rect_fb, cs_size, VERTICAL);
+	test_cursor_movement(data, frame_rate * delay_sec, cs_size, VERTICAL, test_mpo);
 
 	/* diagonal */
-	test_cursor_movement(data, frame_rate * delay_sec, &rect_fb, cs_size, DIAGONAL);
+	test_cursor_movement(data, frame_rate * delay_sec, cs_size, DIAGONAL, test_mpo);
 
-	igt_remove_fb(data->fd, &rect_fb);
+	igt_remove_fb(data->fd, &data->pm_fb[0]);
+	igt_remove_fb(data->fd, &data->pm_fb[1]);
 	igt_remove_fb(data->fd, &cs_fb);
 	igt_remove_fb(data->fd, &data->ov_fb[0]);
 	test_fini(data);
@@ -637,7 +645,11 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
 	igt_describe("Test to validate PSR SU enablement with Visual Confirm "
 		     "and to validate cursor movement + static background scenario");
-	igt_subtest("psr_su_cursor") run_check_psr_su_cursor(&data);
+	igt_subtest("psr_su_cursor") run_check_psr_su_cursor(&data, false);
+
+	igt_describe("Test to validate PSR SU enablement with Visual Confirm "
+		     "and to validate cursor movement + MPO scenario");
+	igt_subtest("psr_su_cursor_mpo") run_check_psr_su_cursor(&data, true);
 
 	igt_fixture
 	{
-- 
2.25.1
