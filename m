Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038C66EE0E
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Sep 2021 14:34:54 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Thu, 16 Sep 2021 19:53:01 +0530
Message-Id: <20210916142301.17796-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_multiple: Fix regression in
 test_plane_position_with_output
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
Cc: Bhanuprakash.Modem@intel.com, markyacoub@google.com, Vidya Srinivas <vidya.srinivas@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Starting commit 4d4a76729b328b65122 "Start continuous CRC capture after commit"
few variants of Intel TGL devices are failing upon CRC mismatch.
Patch switches to older way of obtaining CRC and includes checking of
i915 as patch causing regression is a fix for AMD devices.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_plane_multiple.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 45cabb500774..e6e035dca59b 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -331,18 +331,23 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 		 igt_output_name(output), kmstest_pipe_name(pipe), c,
 		 info, opt.seed);
 
+	if (is_i915_device(data->drm_fd))
+		igt_pipe_crc_start(data->pipe_crc);
+
 	i = 0;
 	while (i < iterations || loop_forever) {
 		/* randomize planes and set up the holes */
 		prepare_planes(data, pipe, &blue, tiling, c, output);
 
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
-		if (!crc_enabled) {
+		if (!crc_enabled && !is_i915_device(data->drm_fd)) {
 			igt_pipe_crc_start(data->pipe_crc);
 			crc_enabled = 1;
 		}
 
 		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc, &crc);
+		igt_assert_crc_equal(&data->ref_crc, &crc);
+		igt_pipe_crc_stop(data->pipe_crc);
 
 		for_each_plane_on_pipe(&data->display, pipe, plane)
 			igt_plane_set_fb(plane, NULL);
@@ -352,8 +357,6 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 		for (int x = 0; x < c; x++)
 			igt_remove_fb(data->drm_fd, &data->fb[x]);
 
-		igt_assert_crc_equal(&data->ref_crc, &crc);
-
 		i++;
 	}
 
-- 
2.33.0
