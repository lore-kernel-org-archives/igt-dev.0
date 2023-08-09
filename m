Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFC110E232
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 05:02:20 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  9 Aug 2023 10:27:40 +0530
Message-Id: <20230809045740.275175-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4] tests/kms_plane_cursor: Handle invalid
 pipe in big joiner
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

If any pipe is invalid in big joiner currently test throws
as skip for all the pipes as it is within the dynamic subtest
block.
Fixed in IGT by not executing the subtest if valid combo of pipe
and output not found for big joiner and go on to check for the
next pipe.

v2: Fix commit subject and message (Bhanu)
    Fix nitpicks (Bhanu)

v3: Have pipe/output valid combo before checking
    for big joiner for the pipe. (Bhanu)

v4: Move igt_display_reset (Bhanu)

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_plane_cursor.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index a7acb18e1..f7917ae57 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -77,17 +77,12 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output)
 	data->pipe = &data->display.pipes[data->pipe_id];
 	data->output = output;
 
-	igt_display_reset(display);
-
 	data->mode = igt_output_get_mode(data->output);
 
 	data->primary = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 	data->overlay = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVERLAY);
 	data->cursor = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
 
-	igt_output_set_pipe(data->output, data->pipe_id);
-	igt_require(i915_pipe_output_combo_valid(display));
-
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
 		 kmstest_pipe_name(data->pipe_id), igt_output_name(data->output));
 
@@ -310,6 +305,12 @@ igt_main
 							     DRM_PLANE_TYPE_OVERLAY))
 					continue;
 
+				igt_display_reset(display);
+
+				igt_output_set_pipe(output, pipe);
+				if (!i915_pipe_output_combo_valid(&data.display))
+					continue;
+
 				test_init(&data, pipe, output);
 
 				for (j = 0; j < ARRAY_SIZE(cursor_sizes); j++) {
-- 
2.25.1
