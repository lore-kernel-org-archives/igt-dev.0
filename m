Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC9910E168
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 17:00:46 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Nov 2022 22:28:41 +0530
Message-Id: <20221115165916.196084-19-bhanuprakash.modem@intel.com>
In-Reply-To: <20221115165916.196084-1-bhanuprakash.modem@intel.com>
References: <20221115165916.196084-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v5 17/52] tests/kms_flip_event_leak: Add support
 for Bigjoiner
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

This patch will add a check to Skip the subtest if a selected pipe/output
combo won't support Bigjoiner or 8K mode.

Example:
* Pipe-D wont support a mode > 5K
* To use 8K mode on a pipe then consecutive pipe must be available & free.

V2: - Use updated helper name

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_flip_event_leak.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index 56ff2af2..75206ee6 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -48,10 +48,6 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
 	struct igt_fb fb[2];
 	int fd, ret;
 
-	igt_display_reset(&data->display);
-	/* select the pipe we want to use */
-	igt_output_set_pipe(output, pipe);
-
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	mode = igt_output_get_mode(output);
 
@@ -104,9 +100,14 @@ igt_main
 		igt_display_require_output(&data.display);
 	}
 
-
 	igt_subtest_with_dynamic("basic") {
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_display_reset(&data.display);
+
+			igt_output_set_pipe(output, pipe);
+			if (!i915_pipe_output_combo_valid(&data.display))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 				test(&data, pipe, output);
 			}
-- 
2.38.0
