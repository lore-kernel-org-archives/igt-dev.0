Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABFD10E357
 for <igt-dev@lists.freedesktop.org>; Mon, 30 May 2022 11:21:27 +0000 (UTC)
From: Melissa Wen <mwen@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 30 May 2022 10:20:45 -0100
Message-Id: <20220530112045.1196027-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] test/kms_plane_alpha_blend: clearer
 validation for coverage-7efc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, markyacoub@google.com, Sungjoon.Kim@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Inspired by previous change in alpha-7efc[1], get a clearer validation
for the swappable property of plane_alpha and fg.alpha in the coverage
blend formula. Get rid of the 8-increment alpha loop by refactoring
coverage-7efc to a one-shot assert format, avoiding doubts related to
bit precision and rounding issue.

[1] Commit f9efaee9565f ("tests/kms_plane_alpha_blend: refactor
alpha-7efc for clearer validation")

v2:
- add commit reference to alpha-7efc change

Signed-off-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Sung Joon Kim <sungkim@amd.com>
---
 tests/kms_plane_alpha_blend.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 8e54dfd6..001a1479 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -420,20 +420,18 @@ static void coverage_7efc(data_t *data, enum pipe pipe, igt_plane_t *plane)
 	igt_pipe_crc_start(data->pipe_crc);
 
 	/* for coverage, plane alpha and fb alpha should be swappable, so swap fb and alpha */
-	for (i = 0; i < 256; i += 8) {
-		igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, ((i/2) << 8) | (i/2));
-		igt_plane_set_fb(plane, &data->argb_fb_cov_fc);
-		igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0x7e7e);
+	igt_plane_set_fb(plane, &data->argb_fb_cov_fc);
+	igt_display_commit2(display, COMMIT_ATOMIC);
 
-		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &ref_crc);
+	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &ref_crc);
 
-		igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, (i << 8) | i);
-		igt_plane_set_fb(plane, &data->argb_fb_cov_7e);
-		igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0xfcfc);
+	igt_plane_set_fb(plane, &data->argb_fb_cov_7e);
+	igt_display_commit2(display, COMMIT_ATOMIC);
 
-		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
-		igt_assert_crc_equal(&ref_crc, &crc);
-	}
+	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
+	igt_assert_crc_equal(&ref_crc, &crc);
 
 	igt_pipe_crc_stop(data->pipe_crc);
 }
@@ -537,7 +535,8 @@ static void run_subtests(data_t *data, enum pipe pipe)
 	igt_subtest_f("pipe-%s-alpha-7efc", kmstest_pipe_name(pipe))
 		run_test_on_pipe_planes(data, pipe, false, true, alpha_7efc);
 
-	igt_describe("Tests pipe coverage blending properties.");
+	igt_describe("Uses alpha values 0x7e and 0xfc to validate fg.alpha and "
+		     "plane_alpha are swappable on coverage blend mode.");
 	igt_subtest_f("pipe-%s-coverage-7efc", kmstest_pipe_name(pipe))
 		run_test_on_pipe_planes(data, pipe, true, true, coverage_7efc);
 
-- 
2.35.1
