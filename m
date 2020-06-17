Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0F96E9FD
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2020 17:47:10 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Wed, 17 Jun 2020 23:15:50 +0530
Message-Id: <20200617174550.17589-7-mohammed.khajapasha@intel.com>
In-Reply-To: <20200617174550.17589-1-mohammed.khajapasha@intel.com>
References: <20200610193724.16436-2-mohammed.khajapasha@intel.com>
 <20200617174550.17589-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 6/6] tests/kms: Skip kms test cases for
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
To: suresh.kumar.kurmi@intel.com, kishore.kunche@intel.com, petri.latvala@intel.com, mohammed.khajapasha@freedesktop.org, arkadiusz.hiler@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Skip the kms test cases for disabled pipes with
non-contiguous pipe display.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 tests/kms_color.c           |  3 ++-
 tests/kms_color_chamelium.c |  3 ++-
 tests/kms_concurrent.c      |  3 ++-
 tests/kms_pipe_crc_basic.c  |  6 ++++--
 tests/kms_plane.c           |  3 ++-
 tests/kms_plane_lowres.c    |  3 ++-
 tests/kms_plane_multiple.c  |  3 ++-
 tests/kms_universal_plane.c | 18 ++++++++++++------
 8 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 7f2fbd4a..19f0f9b5 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -628,7 +628,8 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	igt_fixture {
 		igt_require_pipe_crc(data->drm_fd);
 
-		igt_require(p < data->display.n_pipes);
+		igt_require((p < data->display.n_pipes) &&
+				(data->display.pipes[p].enabled));
 
 		pipe = &data->display.pipes[p];
 		igt_require(pipe->n_planes >= 0);
diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index 7f5a911c..2d690ca3 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -519,7 +519,8 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 
 	igt_fixture {
 
-		igt_require(p < data->display.n_pipes);
+		igt_require((p < data->display.n_pipes) &&
+				(data->display.pipes[p].enabled));
 
 		pipe = &data->display.pipes[p];
 		igt_require(pipe->n_planes >= 0);
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 89016563..1730bb2b 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -320,7 +320,8 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 	igt_fixture {
 		int valid_tests = 0;
 
-		igt_skip_on(pipe >= data->display.n_pipes);
+		igt_skip_on((pipe >= data->display.n_pipes) ||
+				!(data->display.pipes[pipe].enabled));
 		igt_require(data->display.pipes[pipe].n_planes > 0);
 
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index d169b7bd..ec31e2ca 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -71,7 +71,8 @@ static void test_read_crc(data_t *data, enum pipe pipe, unsigned flags)
 	igt_crc_t *crcs = NULL;
 	int c, j;
 
-	igt_skip_on(pipe >= data->display.n_pipes);
+	igt_skip_on((pipe >= display->n_pipes) ||
+			!(display->pipes[pipe].enabled));
 	igt_require_f(output, "No connector found for pipe %s\n",
 		      kmstest_pipe_name(pipe));
 
@@ -187,7 +188,8 @@ igt_main
 			test_read_crc(&data, pipe, TEST_SEQUENCE | TEST_NONBLOCK);
 
 		igt_subtest_f("suspend-read-crc-pipe-%s", kmstest_pipe_name(pipe)) {
-			igt_skip_on(pipe >= data.display.n_pipes);
+			igt_skip_on((pipe >= data.display.n_pipes) ||
+					!(data.display.pipes[pipe].enabled));
 
 			test_read_crc(&data, pipe, 0);
 
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index c6ead813..85ed4f94 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -940,7 +940,8 @@ static void
 run_tests_for_pipe_plane(data_t *data, enum pipe pipe)
 {
 	igt_fixture {
-		igt_skip_on(pipe >= data->display.n_pipes);
+		igt_skip_on((pipe >= data->display.n_pipes) ||
+				!(data->display.pipes[pipe].enabled));
 		igt_require(data->display.pipes[pipe].n_planes > 0);
 	}
 
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 012b25e3..16afe570 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -259,7 +259,8 @@ test_planes_on_pipe(data_t *data, uint64_t modifier)
 	igt_plane_t *plane;
 	unsigned tested = 0;
 
-	igt_skip_on(data->pipe >= data->display.n_pipes);
+	igt_skip_on((data->pipe >= data->display.n_pipes) ||
+			!(data->display.pipes[data->pipe].enabled));
 	igt_display_require_output_on_pipe(&data->display, data->pipe);
 	igt_skip_on(!igt_display_has_format_mod(&data->display,
 						DRM_FORMAT_XRGB8888, modifier));
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 6cf060b3..e7b5951c 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -378,7 +378,8 @@ static void
 run_tests_for_pipe(data_t *data, enum pipe pipe)
 {
 	igt_fixture {
-		igt_skip_on(pipe >= data->display.n_pipes);
+		igt_skip_on((pipe >= data->display.n_pipes) ||
+				!(data->display.pipes[pipe].enabled));
 		igt_require(data->display.pipes[pipe].n_planes > 0);
 	}
 
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 676be633..ce28b37d 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -135,7 +135,8 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	int num_primary = 0, num_cursor = 0;
 	int i;
 
-	igt_skip_on(pipe >= display->n_pipes);
+	igt_skip_on((pipe >= display->n_pipes) ||
+			!(display->pipes[pipe].enabled));
 
 	igt_info("Testing connector %s using pipe %s\n", igt_output_name(output),
 		 kmstest_pipe_name(pipe));
@@ -364,7 +365,8 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	int i;
 	int expect;
 
-	igt_skip_on(pipe >= data->display.n_pipes);
+	igt_skip_on((pipe >= data->display.n_pipes) ||
+			!(data->display.pipes[pipe].enabled));
 
 	igt_output_set_pipe(output, pipe);
 	mode = igt_output_get_mode(output);
@@ -476,7 +478,8 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	fd_set fds;
 	int ret = 0;
 
-	igt_skip_on(pipe >= data->display.n_pipes);
+	igt_skip_on((pipe >= data->display.n_pipes) ||
+			!(data->display.pipes[pipe].enabled));
 
 	igt_output_set_pipe(output, pipe);
 
@@ -577,7 +580,8 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	int r, g, b;
 	int count1, count2;
 
-	igt_skip_on(pipe >= display->n_pipes);
+	igt_skip_on((pipe >= display->n_pipes) ||
+			!(display->pipes[pipe].enabled));
 	igt_require(display->has_cursor_plane);
 
 	igt_output_set_pipe(output, pipe);
@@ -705,7 +709,8 @@ gen9_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	int ret = 0;
 
 	igt_skip_on(data->gen < 9);
-	igt_skip_on(pipe >= data->display.n_pipes);
+	igt_skip_on((pipe >= data->display.n_pipes) ||
+			!(data->display.pipes[pipe].enabled));
 
 	igt_output_set_pipe(output, pipe);
 
@@ -750,7 +755,8 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 	igt_fixture {
 		int valid_tests = 0;
 
-		igt_skip_on(pipe >= data->display.n_pipes);
+		igt_skip_on((pipe >= data->display.n_pipes) ||
+			!(data->display.pipes[pipe].enabled));
 
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
 			valid_tests++;
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
