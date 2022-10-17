Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A4F10EBC8
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Oct 2022 00:50:01 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Sun, 16 Oct 2022 18:49:35 -0600
Message-ID: <20221017004936.574303-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 1/2][V2] tests/kms_universal_plane: turn off pipe
 when primary plane is off
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

GPU drivers can reject when crtc is on and primary plane is off,
so turn crtc off with primary plane and turn it on afterwards.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_universal_plane.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 64416afd..2db1d7e8 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -228,11 +228,14 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_7);
 
 	/* Step 11: Disable primary plane */
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, COMMIT_ATOMIC);
 	igt_plane_set_fb(primary, NULL);
 	igt_display_commit2(display, COMMIT_UNIVERSAL);
 
 	/* Step 12: Legacy modeset to yellow FB (CRC 8) */
 	igt_plane_set_fb(primary, &test.yellow_fb);
+	igt_output_set_pipe(output, pipe);
 	igt_display_commit2(display, COMMIT_LEGACY);
 	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_8);
 
@@ -497,6 +500,8 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_display_commit2(&data->display, COMMIT_LEGACY);
 
 	/* Disable the primary plane */
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 	igt_plane_set_fb(primary, NULL);
 	igt_display_commit2(&data->display, COMMIT_UNIVERSAL);
 
@@ -506,6 +511,7 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	 * Note that crtc->primary->fb = NULL causes flip to return EBUSY for
 	 * historical reasons...
 	 */
+	igt_output_set_pipe(output, pipe);
 	igt_assert(drmModePageFlip(data->drm_fd, output->config.crtc->crtc_id,
 				   test.red_fb.fb_id, 0, NULL) == -EBUSY);
 
@@ -520,9 +526,13 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	 * completes, which we don't have a good way to specifically test for,
 	 * but at least we can make sure that nothing blows up.
 	 */
+	igt_output_set_pipe(output, pipe);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 	igt_assert(drmModePageFlip(data->drm_fd, output->config.crtc->crtc_id,
 				   test.red_fb.fb_id, DRM_MODE_PAGE_FLIP_EVENT,
 				   &test) == 0);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 	igt_plane_set_fb(primary, NULL);
 	igt_display_commit2(&data->display, COMMIT_UNIVERSAL);
 
-- 
2.38.0
