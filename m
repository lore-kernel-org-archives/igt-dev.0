Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DBC10E00F
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 05:17:03 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 15 Jun 2023 10:54:38 +0530
Message-Id: <20230615052438.15220-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_cursor: Pipe-D is invalid
 in big joiner
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

Pipe D is invalid in big joiner and because of that currently
test throws as skip for all the pipes as it is within the
dynamic subtest block.
Fixed in IGT by not executing the subtest if valid combo of pipe
and output not found for big joiner and go on to check for the
next pipe.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_plane_cursor.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 59b105c6..b1f3cecc 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -86,7 +86,6 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output)
 	data->cursor = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
 
 	igt_output_set_pipe(data->output, data->pipe_id);
-	igt_require(i915_pipe_output_combo_valid(display));
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
 		 kmstest_pipe_name(data->pipe_id), igt_output_name(data->output));
@@ -268,6 +267,7 @@ igt_main
 	static const int cursor_sizes[] = { 64, 128, 256 };
 	data_t data = { .max_curw = 64, .max_curh = 64 };
 	enum pipe pipe;
+	bool result;
 	igt_output_t *output;
 	int i, j;
 	struct {
@@ -312,6 +312,13 @@ igt_main
 
 				test_init(&data, pipe, output);
 
+				result = i915_pipe_output_combo_valid(&data.display);
+				if (result == false) {
+					igt_info("pipe %s + %s is not a valid combo for big joiner\n",
+						kmstest_pipe_name(data.pipe_id), igt_output_name(data.output));
+					continue;
+				}
+
 				for (j = 0; j < ARRAY_SIZE(cursor_sizes); j++) {
 					int size = cursor_sizes[j];
 
-- 
2.39.0
