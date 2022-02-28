Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A6010E657
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Feb 2022 14:39:49 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 28 Feb 2022 20:08:41 +0530
Message-Id: <20220228143841.144043-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms: IGT cleanup: Sanitize before
 starting the subtest
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

Before starting the subtest, clean up the states to default
by igt_display_reset().

This patch sanitizes:
   tests/kms_color.c
   tests/kms_cursor_crc.c
   tests/kms_cursor_legacy.c
   tests/kms_pipe_crc_basic.c

This patch also drops few redundent checks.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c          | 15 +++++++++++++++
 tests/kms_cursor_crc.c     |  6 ++++++
 tests/kms_cursor_legacy.c  |  1 +
 tests/kms_pipe_crc_basic.c |  3 ---
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 854b8f3c31..c4780845e5 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -45,6 +45,9 @@ static void test_pipe_degamma(data_t *data,
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
 
+	/* Sanitize the state before running the test. */
+	igt_display_reset(display);
+
 	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
 	degamma_full = generate_table_max(data->degamma_lut_size);
 
@@ -134,6 +137,9 @@ static void test_pipe_gamma(data_t *data,
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
 
+	/* Sanitize the state before running the test. */
+	igt_display_reset(display);
+
 	gamma_full = generate_table_max(data->gamma_lut_size);
 
 	output = igt_get_single_output_for_pipe(&data->display, primary->pipe->pipe);
@@ -221,6 +227,9 @@ static void test_pipe_legacy_gamma(data_t *data,
 	igt_crc_t crc_fullgamma, crc_fullcolors;
 	int fb_id, fb_modeset_id;
 
+	/* Sanitize the state before running the test. */
+	igt_display_reset(display);
+
 	kms_crtc = drmModeGetCrtc(data->drm_fd, primary->pipe->crtc_id);
 	legacy_lut_size = kms_crtc->gamma_size;
 	drmModeFreeCrtc(kms_crtc);
@@ -327,6 +336,9 @@ static void test_pipe_legacy_gamma_reset(data_t *data,
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
 
+	/* Sanitize the state before running the test. */
+	igt_display_reset(&data->display);
+
 	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
 		degamma_linear = generate_table(data->degamma_lut_size, 1.0);
 	gamma_zero = generate_table_zero(data->gamma_lut_size);
@@ -449,6 +461,9 @@ static bool test_pipe_ctm(data_t *data,
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
 
+	/* Sanitize the state before running the test. */
+	igt_display_reset(display);
+
 	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
 	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
 
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 513c97153e..97ed39a909 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -465,6 +465,9 @@ static void prepare_crtc(data_t *data, igt_output_t *output,
 	igt_display_t *display = &data->display;
 	cairo_t *cr;
 
+	/* Sanitize the state before running the test. */
+	igt_display_reset(display);
+
 	/* select the pipe we want to use */
 	igt_output_set_pipe(output, data->pipe);
 
@@ -587,6 +590,9 @@ static void require_cursor_size(data_t *data, int w, int h)
 	igt_require(w <= data->cursor_max_w &&
 		    h <= data->cursor_max_h);
 
+	/* Sanitize the state before running the test. */
+	igt_display_reset(display);
+
 	igt_output_set_pipe(output, data->pipe);
 
 	mode = igt_output_get_mode(output);
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 47b9b4e105..fa2543d74d 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -425,6 +425,7 @@ static void flip(igt_display_t *display,
 	results = mmap(NULL, PAGE_SIZE, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(results != MAP_FAILED);
 
+	igt_display_reset(display);
 	flip_pipe = find_connected_pipe(display, !!flip_pipe);
 	cursor_pipe = find_connected_pipe(display, !!cursor_pipe);
 
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 0861c46dbd..2b94871489 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -71,7 +71,6 @@ static void test_read_crc(data_t *data, enum pipe pipe, unsigned flags)
 	igt_crc_t *crcs = NULL;
 	int c, j;
 
-	igt_require_pipe(display, pipe);
 	igt_display_require_output_on_pipe(display, pipe);
 	output = igt_get_single_output_for_pipe(display, pipe);
 
@@ -174,7 +173,6 @@ static void test_compare_crc(data_t *data, enum pipe pipe)
 	struct igt_fb fb0, fb1;
 	igt_output_t *output;
 
-	igt_require_pipe(display, pipe);
 	igt_display_require_output_on_pipe(display, pipe);
 	output = igt_get_single_output_for_pipe(display, pipe);
 
@@ -231,7 +229,6 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe)
 	igt_output_t *output;
 	igt_crc_t crc[2];
 
-	igt_require_pipe(display, pipe);
 	igt_display_require_output_on_pipe(display, pipe);
 	output = igt_get_single_output_for_pipe(display, pipe);
 
-- 
2.35.1
