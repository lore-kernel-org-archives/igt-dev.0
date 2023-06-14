Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F2A10E139
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jun 2023 11:45:02 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 14 Jun 2023 17:22:25 +0530
Message-Id: <20230614115225.8863-1-nidhi1.gupta@intel.com>
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
test throws as skip for all the pipes and as it is within the
dynamic subtest block.
Fixed in IGT to skip the big joiner validity check for pipe-D
and execute for the rest of the pipes as it is.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_plane_cursor.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 59b105c6..38918bb7 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -86,7 +86,10 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output)
 	data->cursor = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
 
 	igt_output_set_pipe(data->output, data->pipe_id);
-	igt_require(i915_pipe_output_combo_valid(display));
+
+	/*Pipe D is invalid in big joiner*/
+	if (data->pipe_id != PIPE_D)
+		igt_require(i915_pipe_output_combo_valid(display));
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
 		 kmstest_pipe_name(data->pipe_id), igt_output_name(data->output));
-- 
2.39.0
