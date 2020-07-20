Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167D389BC2
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2020 15:21:03 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Mon, 20 Jul 2020 20:50:41 +0530
Message-Id: <20200720152045.10787-8-mohammed.khajapasha@intel.com>
In-Reply-To: <20200720152045.10787-1-mohammed.khajapasha@intel.com>
References: <20200720152045.10787-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 07/11] tests/kms: Skip kms test cases for
 disabled pipes
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
To: arkadiusz.hiler@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Skip the kms test cases for disabled pipes with
non-contiguous pipe display.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 tests/kms_color.c           |  2 +-
 tests/kms_color_chamelium.c |  2 +-
 tests/kms_concurrent.c      |  2 +-
 tests/kms_pipe_crc_basic.c  |  4 ++--
 tests/kms_plane.c           |  2 +-
 tests/kms_plane_lowres.c    |  2 +-
 tests/kms_plane_multiple.c  |  2 +-
 tests/kms_universal_plane.c | 12 ++++++------
 8 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 7f2fbd4a..8c50ee66 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -628,7 +628,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	igt_fixture {
 		igt_require_pipe_crc(data->drm_fd);
 
-		igt_require(p < data->display.n_pipes);
+		igt_require_pipe(&data->display, p);
 
 		pipe = &data->display.pipes[p];
 		igt_require(pipe->n_planes >= 0);
diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index 7f5a911c..310c021a 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -519,7 +519,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 
 	igt_fixture {
 
-		igt_require(p < data->display.n_pipes);
+		igt_require_pipe(&data->display, p);
 
 		pipe = &data->display.pipes[p];
 		igt_require(pipe->n_planes >= 0);
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 9a4dab24..573631e0 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -320,7 +320,7 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 	igt_fixture {
 		int valid_tests = 0;
 
-		igt_skip_on(pipe >= data->display.n_pipes);
+		igt_require_pipe(&data->display, pipe);
 		igt_require(data->display.pipes[pipe].n_planes > 0);
 
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index d169b7bd..82856efa 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -71,7 +71,7 @@ static void test_read_crc(data_t *data, enum pipe pipe, unsigned flags)
 	igt_crc_t *crcs = NULL;
 	int c, j;
 
-	igt_skip_on(pipe >= data->display.n_pipes);
+	igt_require_pipe(display, pipe);
 	igt_require_f(output, "No connector found for pipe %s\n",
 		      kmstest_pipe_name(pipe));
 
@@ -187,7 +187,7 @@ igt_main
 			test_read_crc(&data, pipe, TEST_SEQUENCE | TEST_NONBLOCK);
 
 		igt_subtest_f("suspend-read-crc-pipe-%s", kmstest_pipe_name(pipe)) {
-			igt_skip_on(pipe >= data.display.n_pipes);
+			igt_require_pipe(&data.display, pipe);
 
 			test_read_crc(&data, pipe, 0);
 
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index e75c045b..42088488 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -940,7 +940,7 @@ static void
 run_tests_for_pipe_plane(data_t *data, enum pipe pipe)
 {
 	igt_fixture {
-		igt_skip_on(pipe >= data->display.n_pipes);
+		igt_require_pipe(&data->display, pipe);
 		igt_require(data->display.pipes[pipe].n_planes > 0);
 	}
 
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 94b18df6..a5af1f8a 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -259,7 +259,7 @@ test_planes_on_pipe(data_t *data, uint64_t modifier)
 	igt_plane_t *plane;
 	unsigned tested = 0;
 
-	igt_skip_on(data->pipe >= data->display.n_pipes);
+	igt_require_pipe(&data->display, data->pipe);
 	igt_display_require_output_on_pipe(&data->display, data->pipe);
 	igt_skip_on(!igt_display_has_format_mod(&data->display,
 						DRM_FORMAT_XRGB8888, modifier));
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 29b6397b..8310981c 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -378,7 +378,7 @@ static void
 run_tests_for_pipe(data_t *data, enum pipe pipe)
 {
 	igt_fixture {
-		igt_skip_on(pipe >= data->display.n_pipes);
+		igt_require_pipe(&data->display, pipe);
 		igt_require(data->display.pipes[pipe].n_planes > 0);
 	}
 
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 676be633..46d6d180 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -135,7 +135,7 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	int num_primary = 0, num_cursor = 0;
 	int i;
 
-	igt_skip_on(pipe >= display->n_pipes);
+	igt_require_pipe(display, pipe);
 
 	igt_info("Testing connector %s using pipe %s\n", igt_output_name(output),
 		 kmstest_pipe_name(pipe));
@@ -364,7 +364,7 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	int i;
 	int expect;
 
-	igt_skip_on(pipe >= data->display.n_pipes);
+	igt_require_pipe(&data->display, pipe);
 
 	igt_output_set_pipe(output, pipe);
 	mode = igt_output_get_mode(output);
@@ -476,7 +476,7 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	fd_set fds;
 	int ret = 0;
 
-	igt_skip_on(pipe >= data->display.n_pipes);
+	igt_require_pipe(&data->display, pipe);
 
 	igt_output_set_pipe(output, pipe);
 
@@ -577,7 +577,7 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	int r, g, b;
 	int count1, count2;
 
-	igt_skip_on(pipe >= display->n_pipes);
+	igt_require_pipe(display, pipe);
 	igt_require(display->has_cursor_plane);
 
 	igt_output_set_pipe(output, pipe);
@@ -705,7 +705,7 @@ gen9_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	int ret = 0;
 
 	igt_skip_on(data->gen < 9);
-	igt_skip_on(pipe >= data->display.n_pipes);
+	igt_require_pipe(&data->display, pipe);
 
 	igt_output_set_pipe(output, pipe);
 
@@ -750,7 +750,7 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 	igt_fixture {
 		int valid_tests = 0;
 
-		igt_skip_on(pipe >= data->display.n_pipes);
+		igt_require_pipe(&data->display, pipe);
 
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
 			valid_tests++;
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
