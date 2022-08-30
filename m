Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D2B10E1E4
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Aug 2022 16:59:50 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 30 Aug 2022 10:59:27 -0600
Message-ID: <20220830165928.1597238-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 1/2][V3] tests/kms_universal_plane: Enable
 gen9_test_pipe for all devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This subtest runs on non-i915 devices, and let's make it generic by
removing igt_require_intel and renaming it.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Mark Yacoub <markyacoub@chromium.org>
---
 tests/kms_universal_plane.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 3cb6d704..9eab1a57 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -699,15 +699,14 @@ gen9_test_fini(gen9_test_t *test, igt_output_t *output)
  * windowing)
  */
 static void
-gen9_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
+pageflip_win_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	gen9_test_t test = { .data = data };
 	igt_plane_t *primary;
 
 	int ret = 0;
 
-	igt_require_intel(data->drm_fd);
-	igt_skip_on(data->display_ver < 9);
+	igt_skip_on(is_i915_device(data->drm_fd) && data->display_ver < 9);
 	igt_require_pipe(&data->display, pipe);
 
 	igt_output_set_pipe(output, pipe);
@@ -787,10 +786,10 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 			cursor_leak_test_pipe(data, pipe, output);
 
 	igt_describe("Check if pageflip succeeds in windowed setting");
-	igt_subtest_f("universal-plane-gen9-features-pipe-%s",
+	igt_subtest_f("universal-plane-pageflip-windowed-pipe-%s",
 		      kmstest_pipe_name(pipe))
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
-			gen9_test_pipe(data, pipe, output);
+			pageflip_win_test_pipe(data, pipe, output);
 }
 
 static data_t data;
-- 
2.34.1
