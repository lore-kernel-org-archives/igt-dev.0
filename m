Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2059.outbound.protection.outlook.com [40.107.236.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B036ED6B
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Sep 2020 18:31:00 +0000 (UTC)
From: Victor Lu <victorchengchi.lu@amd.com>
Date: Fri, 18 Sep 2020 14:30:50 -0400
Message-ID: <20200918183049.19563-1-victorchengchi.lu@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] tests/kms_plane_multiple: Start continuous CRC
 capture after commit
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
Cc: Victor Lu <victorchengchi.lu@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

atomic-pipe-a-tiling-none fails on some AMD devices because it fails
due to a timeout when reading the CRC when there is no CRC generated.

Move igt_pipe_crc_start to be after the first nonzero FB commit in
kms_plane_multiple.

Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 tests/kms_plane_multiple.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 8310981c..d0d41cec 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -290,6 +290,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 	igt_plane_t *plane;
 	int i;
 	int err, c = 0;
+	int crc_enabled = 0;
 	int iterations = opt.iterations < 1 ? 1 : opt.iterations;
 	bool loop_forever;
 	char info[256];
@@ -329,14 +330,16 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 		 igt_output_name(output), kmstest_pipe_name(pipe), c,
 		 info, opt.seed);
 
-	igt_pipe_crc_start(data->pipe_crc);
-
 	i = 0;
 	while (i < iterations || loop_forever) {
 		/* randomize planes and set up the holes */
 		prepare_planes(data, pipe, &blue, tiling, c, output);
 
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+		if (!crc_enabled) {
+			igt_pipe_crc_start(data->pipe_crc);
+			crc_enabled = 1;
+		}
 
 		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc, &crc);
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
