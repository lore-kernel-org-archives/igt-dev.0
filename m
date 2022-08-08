Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9995510E87F
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Feb 2023 10:56:42 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  8 Aug 2022 15:06:22 +0530
Message-Id: <20220808093622.193800-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_display_modes: Add check on
 ENOSPC for DP MST config
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

Added check on ENOSPC when two moniters connected through MST.
This will find the connector mode combo that fits into the
bandwidth when more than one monitor is connected.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_display_modes.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index e4191811..cbcdc0cc 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -44,6 +44,7 @@ static void run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
 	igt_pipe_crc_t *pipe_crc[2] = { 0 };
 	igt_crc_t ref_crc[2], crc[2];
 	int count = 0, width, height;
+	int ret;
 	cairo_t *cr;
 
 	for_each_connected_output(display, output) {
@@ -54,6 +55,7 @@ static void run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
 			break;
 	}
 
+restart:
 	igt_output_set_pipe(extended_output[0], pipe1);
 	igt_output_set_pipe(extended_output[1], pipe2);
 
@@ -79,7 +81,23 @@ static void run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
 	igt_fb_set_size(&fbs[1], plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
 	igt_plane_set_size(plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
 
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
+	if (ret != 0 && errno == ENOSPC) {
+
+		bool found = igt_override_all_active_output_modes_to_fit_bw(display);
+
+		igt_require_f(found, "No valid mode combo found.\n");
+
+		for_each_connected_output(display, output)
+			igt_output_set_pipe(output, PIPE_NONE);
+
+		igt_remove_fb(data->drm_fd, &fbs[0]);
+		igt_remove_fb(data->drm_fd, &fbs[1]);
+
+		goto restart;
+	}
+
+	igt_assert(!ret);
 
 	igt_pipe_crc_collect_crc(pipe_crc[0], &ref_crc[0]);
 	igt_pipe_crc_collect_crc(pipe_crc[1], &ref_crc[1]);
@@ -101,7 +119,6 @@ static void run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
 	igt_plane_set_fb(plane[1], &fb);
 	igt_fb_set_position(&fb, plane[1], mode[0]->hdisplay, 0);
 	igt_fb_set_size(&fb, plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
-
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	igt_pipe_crc_collect_crc(pipe_crc[0], &crc[0]);
-- 
2.25.1
