Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C1210E51F
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Dec 2022 10:43:57 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 15 Dec 2022 16:10:39 +0530
Message-Id: <20221215104039.1517970-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20221115170855.196572-23-bhanuprakash.modem@intel.com>
References: <20221115170855.196572-23-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v6 22/52] tests/kms_plane: Add support for
 Bigjoiner
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
V3: - Rebase

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_plane.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 164dacf4..a79802f6 100644
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
@@ -274,11 +275,11 @@ static void
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
@@ -383,11 +384,11 @@ test_plane_panning(data_t *data, enum pipe pipe)
 {
 	bool mode_found = false;
 	uint64_t mem_size = 0;
-	igt_output_t *output;
+	igt_output_t *output = data->output;
 	igt_crc_t ref_crc;

-	output = igt_get_single_output_for_pipe(&data->display, pipe);
-	igt_require(output);
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));

 	test_init(data, pipe);

@@ -1076,7 +1077,7 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	bool result;
-	igt_output_t *output;
+	igt_output_t *output = data->output;
 	igt_plane_t *plane;

 	if (data->extended) {
@@ -1087,10 +1088,10 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 		data->num_colors = ARRAY_SIZE(colors_reduced);
 	}

-	test_init(data, pipe);
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));

-	output = igt_get_single_output_for_pipe(&data->display, pipe);
-	igt_require(output);
+	test_init(data, pipe);

 	mode = igt_output_get_mode(output);

@@ -1134,7 +1135,14 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
 	enum pipe pipe;
 	int count = 0;

-	for_each_pipe(&data->display, pipe) {
+	for_each_pipe_with_single_output(&data->display, pipe, data->output) {
+		igt_display_reset(&data->display);
+
+		igt_output_set_pipe(data->output, pipe);
+		if (!i915_pipe_output_combo_valid(&data->display))
+			continue;
+
+		igt_output_set_pipe(data->output, PIPE_NONE);
 		igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
 			test(data, pipe);

--
2.38.1
