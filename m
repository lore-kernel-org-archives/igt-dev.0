Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B60A10E1AD
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jun 2023 08:14:49 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 30 Jun 2023 13:52:38 +0530
Message-Id: <20230630082238.26305-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3] tests/kms_plane_cursor: Handle invalid
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

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_plane_cursor.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index a7acb18e1..fb290322e 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -85,9 +85,6 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output)
 	data->overlay = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVERLAY);
 	data->cursor = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
 
-	igt_output_set_pipe(data->output, data->pipe_id);
-	igt_require(i915_pipe_output_combo_valid(display));
-
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
 		 kmstest_pipe_name(data->pipe_id), igt_output_name(data->output));
 
@@ -310,6 +307,10 @@ igt_main
 							     DRM_PLANE_TYPE_OVERLAY))
 					continue;
 
+				igt_output_set_pipe(output, pipe);
+				if (!i915_pipe_output_combo_valid(&data.display))
+					continue;
+
 				test_init(&data, pipe, output);
 
 				for (j = 0; j < ARRAY_SIZE(cursor_sizes); j++) {
-- 
2.39.0
