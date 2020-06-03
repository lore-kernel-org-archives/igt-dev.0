Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C50B89DE3
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2020 20:55:47 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Thu,  4 Jun 2020 02:25:07 +0530
Message-Id: <20200603205507.16908-3-mohammed.khajapasha@intel.com>
In-Reply-To: <20200603205507.16908-1-mohammed.khajapasha@intel.com>
References: <20200603205507.16908-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] test/kms: In static iteration skip the
 testcases for disable pipes
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
To: suresh.kumar.kurmi@intel.com, kishore.kunche@intel.com, petri.latvala@intel.com, mohammed.khajapasha@freedesktop.org, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

In non-contiguous display pipes, the static iteration of pipes
in the testcases can cause iteration over disabled pipes and
segmentation fault, hence skip the testcase for disable pipes.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 lib/igt_core.h              | 22 ++++++++++++++++++++++
 lib/igt_kms.c               |  5 ++---
 tests/kms_color.c           |  2 +-
 tests/kms_color_chamelium.c |  2 +-
 tests/kms_concurrent.c      |  2 +-
 tests/kms_cursor_legacy.c   |  2 +-
 tests/kms_pipe_crc_basic.c  |  2 +-
 tests/kms_plane.c           |  2 +-
 tests/kms_plane_cursor.c    |  3 +++
 tests/kms_plane_lowres.c    |  2 +-
 tests/kms_plane_multiple.c  |  2 +-
 tests/kms_universal_plane.c |  2 +-
 12 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index c5871520..2cd483e8 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -987,6 +987,28 @@ void igt_describe_f(const char *fmt, ...);
 	else igt_debug("Test requirement passed: %s\n", #expr); \
 } while (0)
 
+/**
+* igt_require_pipe:
+* @display: pointer to igt_display_t
+* @pipe: pipe which need to check
+*
+* Skip a (sub-)test if the pipe not enabled.
+*
+* Should be used everywhere where a test checks pipe and skip
+* test when pipe is not enabled.
+*/
+#define igt_require_pipe(display, p)	\
+	do { \
+		bool expr = 0; \
+		for (int n = 0; n < igt_display_get_n_pipes(display); n++) { \
+			if (((display)->pipes[(n)].pipe) == p) { \
+				expr = true; \
+				break;	\
+			} \
+		}	\
+		igt_skip_on_f(!expr, "Pipe %s does not exist.\n", kmstest_pipe_name(p)); \
+	} while (0)
+
 /**
  * igt_skip_on:
  * @expr: condition to test
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a42a44c5..397127e0 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2136,8 +2136,7 @@ void igt_display_require_output_on_pipe(igt_display_t *display, enum pipe pipe)
 {
 	igt_output_t *output;
 
-	igt_skip_on_f(pipe >= igt_display_get_n_pipes(display),
-		      "Pipe %s does not exist.\n", kmstest_pipe_name(pipe));
+	igt_require_pipe(display, pipe);
 
 	for_each_valid_output_on_pipe(display, pipe, output)
 		return;
@@ -2486,7 +2485,7 @@ igt_output_t *igt_get_single_output_for_pipe(igt_display_t *display, enum pipe p
 	igt_output_t *chosen_outputs[display->n_pipes];
 
 	igt_assert(pipe != PIPE_NONE);
-	igt_require(pipe < display->n_pipes);
+	igt_require_pipe(display, pipe);
 
 	__igt_pipe_populate_outputs(display, chosen_outputs);
 
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
index 89016563..f332d332 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -320,7 +320,7 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 	igt_fixture {
 		int valid_tests = 0;
 
-		igt_skip_on(pipe >= data->display.n_pipes);
+		igt_require_pipe(&data->display, pipe);
 		igt_require(data->display.pipes[pipe].n_planes > 0);
 
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 9306e54b..f544a6c9 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1389,7 +1389,7 @@ igt_main
 			errno = 0;
 
 			igt_fixture {
-				igt_skip_on(n >= display.n_pipes);
+				igt_require_pipe(&display, n);
 			}
 
 			igt_subtest_f("pipe-%s-single-bo", kmstest_pipe_name(n))
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index d169b7bd..ae6cb3e9 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -71,7 +71,7 @@ static void test_read_crc(data_t *data, enum pipe pipe, unsigned flags)
 	igt_crc_t *crcs = NULL;
 	int c, j;
 
-	igt_skip_on(pipe >= data->display.n_pipes);
+	igt_require_pipe(display, pipe);
 	igt_require_f(output, "No connector found for pipe %s\n",
 		      kmstest_pipe_name(pipe));
 
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index c6ead813..7d3f95d1 100644
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
 
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index adcdf5e8..4ab10204 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -317,6 +317,9 @@ igt_main
 	}
 
 	for_each_pipe_static(pipe)
+		igt_fixture {
+			igt_require_pipe(&data.display, pipe);
+		}
 		for (i = 0; i < ARRAY_SIZE(cursor_sizes); ++i) {
 			int size = cursor_sizes[i];
 
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 012b25e3..a1f1fade 100644
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
index 6cf060b3..520ec1fe 100644
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
index 676be633..cba54c4c 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
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
