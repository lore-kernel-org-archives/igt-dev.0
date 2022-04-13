Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2050.outbound.protection.outlook.com [40.107.96.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A643510E805
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Apr 2022 20:07:01 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 13 Apr 2022 16:03:59 -0400
Message-ID: <20220413200359.1725251-4-dingchen.zhang@amd.com>
In-Reply-To: <20220413200359.1725251-1-dingchen.zhang@amd.com>
References: <20220413200359.1725251-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 3/3] tests/amdgpu/amd_psr: add PSR-SU cursor
 movement test case
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

[why]
We'd have a test case to validate PSR-SU enablement and selective
region update when cursor movement occurs by visual confirm. This
is to emulate the scenario of usermode behavior that only the
cursor is moving on top of the static screen.

[how]
create overlay plane w/ screen size and primary plane w/ quarter
of screen size and positioned at the top-left of screen. create
a cursor plane w/ size of (currently set to) 128 pixels.

move the cursor plane along horizonal/vertical/diagonal three
directions w/ the incremental step of 16 pixels for a couple of
seconds to allow visual confirm of PSR-SU update.

Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Jay Pillai <aurabindo.pillai@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
---
 tests/amdgpu/amd_psr.c | 106 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index f40bf183..3355e1dd 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -63,6 +63,13 @@ typedef struct data {
 	int h;
 } data_t;
 
+enum cursor_move {
+	HORIZONTAL,
+	VERTICAL,
+	DIAGONAL,
+	INVALID
+};
+
 struct {
 	bool visual_confirm;
 } opt = {
@@ -470,6 +477,101 @@ static void run_check_psr_su_ffu(data_t *data)
 	test_fini(data);
 }
 
+static void test_cursor_movement(data_t *data, int iters, igt_fb_t * pfb, int cs_size, enum cursor_move move_type)
+{
+	int i, pos_x, pos_y;
+	int ret;
+
+	/* incremental step == cursor size / 16 */
+	for (i = 0, pos_y = 0, pos_x = 0; i < iters; ++i) {
+		if (move_type == HORIZONTAL && (pos_x + cs_size > data->w))
+			pos_x = 0;
+		else if (move_type == VERTICAL && (pos_y + cs_size > data->h))
+			pos_y = 0;
+		else if (move_type == DIAGONAL && ((pos_y + cs_size > data->h) || (pos_x + cs_size > data->w)))
+			pos_x = pos_y = 0;
+
+		igt_plane_set_position(data->cursor, pos_x, pos_y);
+		igt_plane_set_fb(data->primary, pfb);
+
+		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+		igt_require(ret == 0);
+		kmstest_wait_for_pageflip(data->fd);
+
+		/* update position */
+		if (move_type == HORIZONTAL)
+			pos_x += cs_size / 16;
+		else if (move_type == VERTICAL)
+			pos_y += cs_size / 16;
+		else if (move_type == DIAGONAL) {
+			pos_x += cs_size / 16;
+			pos_y += cs_size / 16;
+		}
+	}
+}
+
+static void run_check_psr_su_cursor(data_t *data)
+{
+	int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
+	igt_fb_t rect_fb;	// primary FB
+	igt_fb_t cs_fb;		// cursor FB
+	const int cs_size = 128;
+	const int delay_sec = 5; // seconds
+	int frame_rate = 0;
+	int pb_w, pb_h, ob_w, ob_h;
+
+	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
+
+	test_init(data);
+	igt_skip_on(!psr_su_supported(data));
+
+	ob_w = data->w;
+	ob_h = data->h;
+	pb_w = data->w / 2;
+	pb_h = data->h / 2;
+	frame_rate = data->mode->vrefresh;
+
+	/* primary & overlay FB creation and set alpha region of overlay to show */
+	igt_create_color_fb(data->fd, pb_w, pb_h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    .0, .0, 1.0, &rect_fb);
+	igt_create_color_fb(data->fd, ob_w, ob_h, DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
+			    1.0, 1.0, 1.0, &data->ov_fb[0]);
+	draw_color_alpha(&data->ov_fb[0], 0, 0, pb_w, pb_h, 1.0, 1.0, 1.0, .0);
+
+	/* cursor FB creation, draw cursor pattern/set alpha regions */
+	igt_create_fb(data->fd, cs_size, cs_size, DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, &cs_fb);
+	draw_color_cursor(&cs_fb, cs_size, 1.0, .0, 1.0);
+
+	igt_plane_set_fb(data->primary, &rect_fb);
+	igt_plane_set_fb(data->overlay, &data->ov_fb[0]);
+	igt_plane_set_fb(data->cursor, &cs_fb);
+	igt_plane_set_position(data->cursor, 0, 0);
+
+	igt_output_set_pipe(data->output, data->pipe_id);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+	/*
+	 * test by setting different cursor position in screen
+	 * - horizontal movement
+	 * - vertial movement
+	 * - diagonal movement
+	 */
+
+	/* horizontal */
+	test_cursor_movement(data, frame_rate * delay_sec, &rect_fb, cs_size, HORIZONTAL);
+
+	/* vertical */
+	test_cursor_movement(data, frame_rate * delay_sec, &rect_fb, cs_size, VERTICAL);
+
+	/* diagonal */
+	test_cursor_movement(data, frame_rate * delay_sec, &rect_fb, cs_size, DIAGONAL);
+
+	igt_remove_fb(data->fd, &rect_fb);
+	igt_remove_fb(data->fd, &cs_fb);
+	igt_remove_fb(data->fd, &data->ov_fb[0]);
+	test_fini(data);
+}
+
 const char *help_str =
 "  --visual-confirm           PSR visual confirm debug option enable\n";
 
@@ -533,6 +635,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		     "and to validate Full Frame Update scenario");
 	igt_subtest("psr_su_ffu") run_check_psr_su_ffu(&data);
 
+	igt_describe("Test to validate PSR SU enablement with Visual Confirm "
+		     "and to validate cursor movement + static background use cases");
+	igt_subtest("psr_su_cursor") run_check_psr_su_cursor(&data);
+
 	igt_fixture
 	{
 		if (opt.visual_confirm) {
-- 
2.25.1
