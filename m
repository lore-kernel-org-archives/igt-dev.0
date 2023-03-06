Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2075.outbound.protection.outlook.com [40.107.100.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074A410E109
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Mar 2023 14:35:55 +0000 (UTC)
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <alex.hung@amd.com>, <aurabindo.pillai@amd.com>
Date: Mon, 6 Mar 2023 09:35:20 -0500
Message-ID: <20230306143520.32257-1-hersenxs.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] [i-g-t] [v3] tests/amdgpu/amd_dp_dsc: fix basic
 and bpc test be skipped
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

amd_dp_dsc tests are skipped when output max value (n_outputs)
is fewer than pipe max value (n_pipes) because a pipe may not
be enabled, i.e. display->pipes[i].enable == false. As a result,
n_outputs should be used instead.

Reviewed-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 tests/amdgpu/amd_dp_dsc.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index e6b5a43b..b3f3cafb 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -49,7 +49,7 @@ static void test_fini(data_t *data)
 	igt_display_t *display = &data->display;
 	int i;
 
-	for (i = 0; i < display->n_pipes; ++i) {
+	for_each_pipe(display, i) {
 		igt_pipe_crc_free(data->pipe_crc[i]);
 	}
 
@@ -63,7 +63,7 @@ static void test_init(data_t *data)
 	igt_display_t *display = &data->display;
 	int i, n;
 
-	for (i = 0; i < display->n_pipes; ++i) {
+	for_each_pipe(display, i) {
 		data->pipe_id[i] = PIPE_A + i;
 		data->pipe[i] = &data->display.pipes[data->pipe_id[i]];
 		data->primary[i] = igt_pipe_get_plane_type(
@@ -110,7 +110,7 @@ static void test_dsc_enable(data_t *data)
 	test_init(data);
 	igt_enable_connectors(data->fd);
 
-	for (i = 0; i < display->n_pipes; i++) {
+	for (i = 0; i < display->n_outputs; i++) {
 		/* Setup the output */
 		output = data->output[i];
 		if (!output || !igt_output_is_connected(output))
@@ -248,7 +248,7 @@ static void test_dsc_slice_dimensions_change(data_t *data)
 	test_init(data);
 	igt_enable_connectors(data->fd);
 
-	for (i = 0; i < display->n_pipes; i++) {
+	for (i = 0; i < display->n_outputs; i++) {
 		/* Setup the output */
 		output = data->output[i];
 		if (!output || !igt_output_is_connected(output))
@@ -341,7 +341,7 @@ static void test_dsc_link_settings(data_t *data)
     test_init(data);
 
     /* Setup all outputs */
-	for (i = 0; i < display->n_pipes; i++) {
+	for (i = 0; i < display->n_outputs; i++) {
 		output = data->output[i];
 		if (!output || !igt_output_is_connected(output))
 			continue;
@@ -358,7 +358,7 @@ static void test_dsc_link_settings(data_t *data)
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
     /* Collect reference CRCs */
-	for (i = 0; i < display->n_pipes; i++) {
+	for (i = 0; i < display->n_outputs; i++) {
 		output = data->output[i];
 		if (!output || !igt_output_is_connected(output))
 			continue;
@@ -369,7 +369,7 @@ static void test_dsc_link_settings(data_t *data)
 	for (lc = 0; lc < ARRAY_SIZE(lane_count_vals); lc++) {
 		for (lr = 0; lr < ARRAY_SIZE(link_rate_vals); lr++) {
 			/* Write new link_settings */
-			for (i = 0; i < display->n_pipes; i++) {
+			for (i = 0; i < display->n_outputs; i++) {
 				output = data->output[i];
 				if (!output || !igt_output_is_connected(output))
 					continue;
@@ -387,7 +387,7 @@ static void test_dsc_link_settings(data_t *data)
 			/* Trigger commit after writing new link settings */
 			igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
-			for (i = 0; i < display->n_pipes; i++) {
+			for (i = 0; i < display->n_outputs; i++) {
 				output = data->output[i];
 				if (!output || !igt_output_is_connected(output))
 					continue;
@@ -416,7 +416,7 @@ static void test_dsc_link_settings(data_t *data)
 	}
 
 	/* Cleanup all fbs */
-	for (i = 0; i < display->n_pipes; i++) {
+	for (i = 0; i < display->n_outputs; i++) {
 		output = data->output[i];
 		if (!output || !igt_output_is_connected(output))
 			continue;
@@ -439,7 +439,7 @@ static void test_dsc_bpc(data_t *data)
     test_init(data);
 
 	/* Find max supported bpc */
-	for (i = 0; i < display->n_pipes; i++) {
+	for (i = 0; i < display->n_outputs; i++) {
 		output = data->output[i];
 		if (!output || !igt_output_is_connected(output))
 			continue;
@@ -451,7 +451,7 @@ static void test_dsc_bpc(data_t *data)
 	for (bpc = 0; bpc < ARRAY_SIZE(bpc_vals); bpc++) {
 		igt_info("Testing bpc = %d\n", bpc_vals[bpc]);
 
-		for (i = 0; i < display->n_pipes; i++) {
+		for (i = 0; i < display->n_outputs; i++) {
 			output = data->output[i];
 			if (!output || !igt_output_is_connected(output))
 				continue;
@@ -474,7 +474,7 @@ static void test_dsc_bpc(data_t *data)
 
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
-		for (i = 0; i < display->n_pipes; i++) {
+		for (i = 0; i < display->n_outputs; i++) {
 			output = data->output[i];
 			if (!output || !igt_output_is_connected(output))
 				continue;
@@ -501,7 +501,7 @@ static void test_dsc_bpc(data_t *data)
 		}
 
 		/* Cleanup all fbs */
-		for (i = 0; i < display->n_pipes; i++) {
+		for (i = 0; i < display->n_outputs; i++) {
 			output = data->output[i];
 			if (!output || !igt_output_is_connected(output))
 				continue;
-- 
2.25.1
