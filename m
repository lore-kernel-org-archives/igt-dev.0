Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F60910E135
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 21:23:45 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 6 May 2022 15:22:53 -0600
Message-ID: <20220506212253.1352246-2-alex.hung@amd.com>
In-Reply-To: <20220506212253.1352246-1-alex.hung@amd.com>
References: <20220506212253.1352246-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 2/2 i-g-t] tests/kms_universal_plane: enable
 gen9_test_pipe for all devices
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

This subtest runs on non-i915 devices, and let's make it generic by
removing igt_require_intel and renaming it.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_universal_plane.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 3a3667e6..65f898fe 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -701,15 +701,14 @@ gen9_test_fini(gen9_test_t *test, igt_output_t *output)
  * windowing)
  */
 static void
-gen9_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
+pageflip_win_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	gen9_test_t test = { .data = data };
 	igt_plane_t *primary;
 
 	int ret = 0;
-
-	igt_require_intel(data->drm_fd);
-	igt_skip_on(data->display_ver < 9);
+	if (is_i915_device(data->drm_fd))
+		igt_skip_on(data->display_ver < 9);
 	igt_require_pipe(&data->display, pipe);
 
 	igt_output_set_pipe(output, pipe);
@@ -789,10 +788,10 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 			cursor_leak_test_pipe(data, pipe, output);
 
 	igt_describe("Check if pageflip succeeds in windowed setting");
-	igt_subtest_f("universal-plane-gen9-features-pipe-%s",
+	igt_subtest_f("universal-plane-pageflip_windowed-pipe-%s",
 		      kmstest_pipe_name(pipe))
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
-			gen9_test_pipe(data, pipe, output);
+			pageflip_win_test_pipe(data, pipe, output);
 }
 
 static data_t data;
-- 
2.25.1
