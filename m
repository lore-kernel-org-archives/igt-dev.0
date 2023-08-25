Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A814610E0C2
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 03:32:38 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Aug 2023 09:02:42 +0530
Message-Id: <20230825033243.1690-2-karthik.b.s@intel.com>
In-Reply-To: <20230825033243.1690-1-karthik.b.s@intel.com>
References: <20230825033243.1690-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915/kms_big_joiner: Test Cleanup
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

Instead of storing the output->id of big joiner output in 'data',
store the output structure itself to avoid looping to find the outputs
in each of the subtests.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/i915/kms_big_joiner.c | 31 ++++++++-----------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/tests/i915/kms_big_joiner.c b/tests/i915/kms_big_joiner.c
index ae38e02c5..d438b2211 100644
--- a/tests/i915/kms_big_joiner.c
+++ b/tests/i915/kms_big_joiner.c
@@ -42,7 +42,7 @@ typedef struct {
 	int n_pipes;
 	enum pipe pipe1;
 	enum pipe pipe2;
-	uint32_t big_joiner_output[2];
+	igt_output_t *big_joiner_output[2];
 } data_t;
 
 /**
@@ -107,20 +107,13 @@ static void test_invalid_modeset(data_t *data)
 static void test_basic_modeset(data_t *data)
 {
 	drmModeModeInfo *mode;
-	igt_output_t *output, *big_joiner_output = NULL;
+	igt_output_t *big_joiner_output = data->big_joiner_output[0];
 	igt_display_t *display = &data->display;
 	igt_pipe_t *pipe;
 	igt_plane_t *plane;
 
 	igt_display_reset(display);
 
-	for_each_connected_output(display, output) {
-		if (data->big_joiner_output[0] == output->id) {
-			big_joiner_output = output;
-			break;
-		}
-	}
-
 	igt_output_set_pipe(big_joiner_output, data->pipe1);
 
 	igt_sort_connector_modes(big_joiner_output->config.connector,
@@ -154,23 +147,15 @@ static void test_basic_modeset(data_t *data)
 static void test_dual_display(data_t *data)
 {
 	drmModeModeInfo *mode;
-	igt_output_t *output, *big_joiner_output[2];
+	igt_output_t *big_joiner_output[2];
 	igt_display_t *display = &data->display;
 	igt_pipe_t *pipe;
 	igt_plane_t *plane1, *plane2;
-	int count = 0;
 
 	igt_display_reset(display);
 
-	for_each_connected_output(display, output) {
-		if (data->big_joiner_output[count] == output->id) {
-			big_joiner_output[count] = output;
-			count++;
-		}
-
-		if (count > 1)
-			break;
-	}
+	big_joiner_output[0] = data->big_joiner_output[0];
+	big_joiner_output[1] = data->big_joiner_output[1];
 
 	igt_output_set_pipe(big_joiner_output[0], data->pipe1);
 	igt_output_set_pipe(big_joiner_output[1], data->pipe2);
@@ -233,7 +218,7 @@ igt_main
 
 			mode = &output->config.connector->modes[0];
 			if (mode->hdisplay > MAX_HDISPLAY_PER_PIPE) {
-				data.big_joiner_output[count++] = output->id;
+				data.big_joiner_output[count++] = output;
 
 				width = max(width, mode->hdisplay);
 				height = max(height, mode->vdisplay);
@@ -270,7 +255,7 @@ igt_main
 
 		igt_display_reset(&data.display);
 		for_each_connected_output(&data.display, output) {
-			if (data.big_joiner_output[0] != output->id)
+			if (data.big_joiner_output[0]->id != output->id)
 				continue;
 
 			igt_sort_connector_modes(output->config.connector,
@@ -297,7 +282,7 @@ igt_main
 					igt_sort_connector_modes(output->config.connector,
 								 sort_drm_modes_by_res_dsc);
 
-					if (data.big_joiner_output[0] == output->id) {
+					if (data.big_joiner_output[0]->id == output->id) {
 						first_output = output;
 						igt_output_set_pipe(output, data.pipe1);
 						igt_output_override_mode(output, &output->config.connector->modes[0]);
-- 
2.39.1
