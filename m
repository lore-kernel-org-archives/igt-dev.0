Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C056E260
 for <igt-dev@lists.freedesktop.org>; Sat,  7 Mar 2020 21:19:27 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Sun,  8 Mar 2020 02:47:50 +0530
Message-Id: <20200307211751.22125-3-mohammed.khajapasha@intel.com>
In-Reply-To: <20200307211751.22125-1-mohammed.khajapasha@intel.com>
References: <20200307211751.22125-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] test/kms: Loop for enable pipes only in
 static iteration
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

In non-contiguous pipes display, the static iteration of pipes
in test can cause iteration over disabled pipes and segmentation
fault in test.

for example, if PIPE_C,D are disabled and PIPE_A,B are enabled
in kernel, test case will iterate over PIPE_C,D in
for_each_pipe_static() even pipes C,D disabled and cause
segmentation fault while accessing pipes display pipes.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 lib/igt_kms.h                 | 7 +++++--
 tests/kms_busy.c              | 2 +-
 tests/kms_ccs.c               | 2 +-
 tests/kms_color.c             | 2 +-
 tests/kms_color_chamelium.c   | 2 +-
 tests/kms_concurrent.c        | 2 +-
 tests/kms_cursor_crc.c        | 2 +-
 tests/kms_cursor_edge_walk.c  | 2 +-
 tests/kms_cursor_legacy.c     | 2 +-
 tests/kms_pipe_crc_basic.c    | 2 +-
 tests/kms_plane.c             | 2 +-
 tests/kms_plane_alpha_blend.c | 2 +-
 tests/kms_plane_cursor.c      | 2 +-
 tests/kms_plane_lowres.c      | 2 +-
 tests/kms_plane_multiple.c    | 2 +-
 tests/kms_plane_scaling.c     | 2 +-
 tests/kms_universal_plane.c   | 2 +-
 tests/kms_vblank.c            | 2 +-
 18 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index cd3fdbc0..b534ae64 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -494,8 +494,11 @@ static inline bool igt_output_is_connected(igt_output_t *output)
  * This should be used to enumerate per-pipe subtests since it has no runtime
  * depencies.
  */
-#define for_each_pipe_static(pipe) \
-	for (pipe = 0; pipe < IGT_MAX_PIPES; pipe++)
+#define for_each_pipe_static(display, __pipe)	\
+	for (int p__ = (__pipe) = 0;	\
+			__pipe < IGT_MAX_PIPES && p__ < (display)->n_pipes; __pipe++, p__++)	\
+			for_each_if ((((display)->pipes[(p__)].pipe) == __pipe))
+
 
 /**
  * for_each_pipe:
diff --git a/tests/kms_busy.c b/tests/kms_busy.c
index 7e495fe2..eaf2b297 100644
--- a/tests/kms_busy.c
+++ b/tests/kms_busy.c
@@ -317,7 +317,7 @@ igt_main
 		}
 	}
 
-	for_each_pipe_static(n) igt_subtest_group {
+	for_each_pipe_static(&display, n) igt_subtest_group {
 		igt_hang_t hang;
 
 		errno = 0;
diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index bc34aec5..c2864030 100644
--- a/tests/kms_ccs.c
+++ b/tests/kms_ccs.c
@@ -474,7 +474,7 @@ igt_main_args("c", NULL, help_str, opt_handler, NULL)
 		igt_display_require(&data.display, data.drm_fd);
 	}
 
-	for_each_pipe_static(pipe) {
+	for_each_pipe_static(&data.display, pipe) {
 		const char *pipe_name = kmstest_pipe_name(pipe);
 
 		data.pipe = pipe;
diff --git a/tests/kms_color.c b/tests/kms_color.c
index 7f2fbd4a..18077306 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -840,7 +840,7 @@ igt_main
 		igt_display_require(&data.display, data.drm_fd);
 	}
 
-	for_each_pipe_static(pipe)
+	for_each_pipe_static(&data.display, pipe)
 		igt_subtest_group
 			run_tests_for_pipe(&data, pipe);
 
diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index 34a1888c..65a4812b 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -738,7 +738,7 @@ igt_main
 		igt_require(data.display.is_atomic);
 	}
 
-	for_each_pipe_static(pipe)
+	for_each_pipe_static(&data.display, pipe)
 		igt_subtest_group
 			run_tests_for_pipe(&data, pipe);
 	igt_describe("Negative test case gamma lut size");
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 14ca5fab..34e4a8bd 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -395,7 +395,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		igt_require(data.display.is_atomic);
 	}
 
-	for_each_pipe_static(pipe) {
+	for_each_pipe_static(&data.display, pipe) {
 		igt_subtest_group
 			run_tests_for_pipe(&data, pipe);
 	}
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index f105e295..b337da9c 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -819,7 +819,7 @@ igt_main
 	data.cursor_max_w = cursor_width;
 	data.cursor_max_h = cursor_height;
 
-	for_each_pipe_static(pipe)
+	for_each_pipe_static(&data.display, pipe)
 		igt_subtest_group
 			run_tests_on_pipe(&data, pipe);
 
diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 6feb32a8..600848f8 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -324,7 +324,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_display_require(&data.display, data.drm_fd);
 	}
 
-	for_each_pipe_static(data.pipe) {
+	for_each_pipe_static(&data.display, data.pipe) {
 		igt_subtest_group {
 			igt_fixture {
 				igt_display_require_output_on_pipe(&data.display, data.pipe);
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index f41f68d8..4be9b114 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1376,7 +1376,7 @@ igt_main
 
 	igt_subtest_group {
 		enum pipe n;
-		for_each_pipe_static(n) {
+		for_each_pipe_static(&display, n) {
 			errno = 0;
 
 			igt_fixture {
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index d169b7bd..9f0af59f 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -173,7 +173,7 @@ igt_main
 	igt_subtest("bad-source")
 		test_bad_source(&data);
 
-	for_each_pipe_static(pipe) {
+	for_each_pipe_static(&data.display, pipe) {
 		igt_subtest_f("read-crc-pipe-%s", kmstest_pipe_name(pipe))
 			test_read_crc(&data, pipe, 0);
 
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 805795cd..d65b827d 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1016,7 +1016,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_display_require(&data.display, data.drm_fd);
 	}
 
-	for_each_pipe_static(pipe)
+	for_each_pipe_static(&data.display, pipe)
 		run_tests_for_pipe_plane(&data, pipe);
 
 	igt_fixture {
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 085099f8..9bd00e94 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -571,7 +571,7 @@ igt_main
 		igt_require(data.display.is_atomic);
 	}
 
-	for_each_pipe_static(pipe)
+	for_each_pipe_static(&data.display, pipe)
 		igt_subtest_group
 			run_subtests(&data, pipe);
 
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index adcdf5e8..91ba1513 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -316,7 +316,7 @@ igt_main
 		igt_display_require_output(&data.display);
 	}
 
-	for_each_pipe_static(pipe)
+	for_each_pipe_static(&data.display, pipe)
 		for (i = 0; i < ARRAY_SIZE(cursor_sizes); ++i) {
 			int size = cursor_sizes[i];
 
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 012b25e3..a31cad62 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -299,7 +299,7 @@ igt_main
 		igt_require(data.display.is_atomic);
 	}
 
-	for_each_pipe_static(pipe) {
+	for_each_pipe_static(&data.display, pipe) {
 		data.pipe = pipe;
 		igt_subtest_f("pipe-%s-tiling-none", kmstest_pipe_name(pipe))
 			test_planes_on_pipe(&data, LOCAL_DRM_FORMAT_MOD_NONE);
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 899b6c5e..7954fef1 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -441,7 +441,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		igt_require(data.display.is_atomic);
 	}
 
-	for_each_pipe_static(pipe) {
+	for_each_pipe_static(&data.display, pipe) {
 		igt_describe("Check that the kernel handles atomic updates of "
 			     "multiple planes correctly by changing their "
 			     "geometry and making sure the changes are "
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 19087286..d3a3ef61 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -700,7 +700,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_require(data.display.is_atomic);
 	}
 
-	for_each_pipe_static(pipe) igt_subtest_group {
+	for_each_pipe_static(&data.display, pipe) igt_subtest_group {
 		igt_output_t *output;
 
 		igt_fixture {
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 676be633..fefb15d9 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -800,7 +800,7 @@ igt_main
 		igt_display_require(&data.display, data.drm_fd);
 	}
 
-	for_each_pipe_static(pipe) {
+	for_each_pipe_static(&data.display, pipe) {
 		igt_subtest_group
 			run_tests_for_pipe(&data, pipe);
 	}
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index a895ab80..3cd57364 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -528,7 +528,7 @@ igt_main
 	igt_subtest("crtc-id")
 		crtc_id_subtest(&data, fd);
 
-	for_each_pipe_static(data.pipe)
+	for_each_pipe_static(&data.display, data.pipe)
 		igt_subtest_group
 			run_subtests_for_pipe(&data);
 }
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
