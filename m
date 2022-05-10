Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC4110EAE9
 for <igt-dev@lists.freedesktop.org>; Tue, 10 May 2022 02:41:19 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 9 May 2022 22:41:08 -0400
Message-ID: <20220510024111.404004-2-dingchen.zhang@amd.com>
In-Reply-To: <20220510024111.404004-1-dingchen.zhang@amd.com>
References: <20220510024111.404004-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v2 1/4] tests/amdgpu/amd_psr: some fix for PSR-SU
 MPO test case
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
Analogous to usermode behavior, when there are primary plane and
overlay plane committed, alpha region of overlay corresponding to
the primary plane position/size should be set to zero to explicitly
display the content of primary plane (emulated as video playback in
this test case) in general.

The input arguments of width/height of the helper to paint the
framebuffer should not exceed the size of the created framebuffer.

[how]
- set the alpha region of overlay plane framebuffer to zero aligned
  to the position/size of the primary plane
- paint the primary plane framebuffer background/foreground w/ the
  valid width/height.

Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Jay Pillai <aurabindo.pillai@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>

changes in v2:
------------------
- correct the word "toplay" and replace w/ "overlay" to make it
  more clear and accurate

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 tests/amdgpu/amd_psr.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index b930b20e..de12bd04 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -351,9 +351,9 @@ static void run_check_psr_su_mpo(data_t *data)
 		cr = igt_get_cairo_ctx(data->fd, &rect_fb[i]);
 		igt_assert_f(cr, "Failed to get cairo context\n");
 		/* background in black */
-		igt_paint_color(cr, 0, 0, data->w, data->h, .0, .0, .0);
+		igt_paint_color(cr, 0, 0, data->w / 2, data->h / 2, .0, .0, .0);
 		/* foreground (megenta strip) */
-		igt_paint_color(cr, i * strip_w, 0, strip_w, data->h, 1.0, .0, 1.0);
+		igt_paint_color(cr, i * strip_w, 0, strip_w, data->h / 2, 1.0, .0, 1.0);
 
 		igt_put_cairo_ctx(cr);
 	}
@@ -364,8 +364,18 @@ static void run_check_psr_su_mpo(data_t *data)
 	igt_plane_set_position(data->primary, 0, 0);
 	igt_plane_set_size(data->primary, data->w / 2, data->h / 2);
 
-	/* adjust alpha for vpb (primary plane) region in overlay */
-	draw_color_alpha(&ov_fb, 0, 0, data->w / 2, data->h / 2, .5, .5, .5, .3);
+	/**
+	 * adjust alpha for vpb (primary plane) region in overlay.
+	 * given alpha, we have below formula:
+	 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+	 *    blended = alpha * overlay + (1 - alpha) * underlay
+	 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+	 * since primary plane is underlay while overlay plane is overlay,
+	 * to display the content of primary plane w/ blending, we'd set
+	 * the alpha of each pixel in overlay corresponding to primary plane
+	 * position/size to be zero.
+	 */
+	draw_color_alpha(&ov_fb, 0, 0, data->w / 2, data->h / 2, .5, .5, .5, .0);
 
 	igt_output_set_pipe(data->output, data->pipe_id);
 	igt_display_commit_atomic(&data->display, 0, NULL);
-- 
2.25.1
