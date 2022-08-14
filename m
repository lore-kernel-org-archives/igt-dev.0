Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA3C98C81
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:33 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:39 +0530
Message-Id: <20220814180908.2553394-23-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 22/51] tests/kms_plane: Add support for Bigjoiner
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_plane.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 3cf3cfd3..62dc9af6 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -56,6 +56,7 @@ typedef struct {
 typedef struct {
 	int drm_fd;
 	igt_display_t display;
+	igt_output_t *output;
 	igt_pipe_crc_t *pipe_crc;
 	const color_t *colors;
 	int num_colors;
@@ -273,11 +274,11 @@ static void
 test_plane_position(data_t *data, enum pipe pipe)
 {
 	int n_planes = data->display.pipes[pipe].n_planes;
-	igt_output_t *output;
+	igt_output_t *output = data->output;
 	igt_crc_t reference_crc;
 
-	output = igt_get_single_output_for_pipe(&data->display, pipe);
-	igt_require(output);
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
 
 	test_init(data, pipe);
 	test_grab_crc(data, output, pipe, &green, data->flags, &reference_crc);
@@ -380,11 +381,11 @@ test_plane_panning_with_output(data_t *data,
 static void
 test_plane_panning(data_t *data, enum pipe pipe)
 {
-	igt_output_t *output;
+	igt_output_t *output = data->output;
 	igt_crc_t ref_crc;
 
-	output = igt_get_single_output_for_pipe(&data->display, pipe);
-	igt_require(output);
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
 
 	test_init(data, pipe);
 
@@ -1050,7 +1051,7 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	bool result;
-	igt_output_t *output;
+	igt_output_t *output = data->output;
 	igt_plane_t *plane;
 
 	if (data->extended) {
@@ -1061,10 +1062,10 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 		data->num_colors = ARRAY_SIZE(colors_reduced);
 	}
 
-	test_init(data, pipe);
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
 
-	output = igt_get_single_output_for_pipe(&data->display, pipe);
-	igt_require(output);
+	test_init(data, pipe);
 
 	mode = igt_output_get_mode(output);
 
@@ -1108,7 +1109,14 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
 	enum pipe pipe;
 	int count = 0;
 
-	for_each_pipe(&data->display, pipe) {
+	for_each_pipe_with_single_output(&data->display, pipe, data->output) {
+		igt_display_reset(&data->display);
+
+		igt_output_set_pipe(data->output, pipe);
+		if (!igt_test_constraint(&data->display))
+			continue;
+
+		igt_output_set_pipe(data->output, PIPE_NONE);
 		igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
 			test(data, pipe);
 
-- 
2.35.1
