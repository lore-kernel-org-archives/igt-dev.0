Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A357710E52E
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 13:31:21 +0000 (UTC)
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <stylon.wang@amd.com>,
 <hamza.mahfooz@amd.com>, <sunpeng.li@amd.com>
Date: Wed, 12 Jul 2023 09:30:59 -0400
Message-ID: <20230712133059.34021-1-hersenxs.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] [i-g-t] tests/amdgpu/amd_psr: Fix eDP PSR1 test
 failure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Hersen Wu <Hersenxs.Wu@amd.com>, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Hersen Wu <Hersenxs.Wu@amd.com>

1. Replace for_each_pipe_with_single_output with
   for_each_connected_output to avoid
   igt_display_commit_atomic return failure.

   Linux kernel AMD implementaion does not support dynamic
   allocatation for pipe connector combination. Kernel
   atomic check will return true only for one specific
   pipe connector combination, return false for other
   combinations.

2. Add eDP Rx PSR capability check psr_mode_supported.

3. Increase PSR_SETTLE_DELAY to 10 seconds.
   Measure Linux kernel AMD implementation, it will take around 8
   seconds for driver and firmmware to enter PSR1 state.

Signed-off-by: Hersen Wu <Hersenxs.Wu@amd.com>
---
 lib/igt_amd.c          |  4 +++-
 tests/amdgpu/amd_psr.c | 54 ++++++++++++++++++++++--------------------
 2 files changed, 31 insertions(+), 27 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 8837714f7..8da405649 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -1037,7 +1037,9 @@ bool igt_amd_psr_support_sink(int drm_fd, char *connector_name, enum psr_mode mo
 		return false;
 
 	if (mode == PSR_MODE_1)
-		return strstr(buf, "Sink support: yes [0x01]");
+		return strstr(buf, "Sink support: yes [0x01]") ||
+		       strstr(buf, "Sink support: yes [0x03]") ||
+		       strstr(buf, "Sink support: yes [0x04]");
 	else
 		return strstr(buf, "Sink support: yes [0x03]") ||
 		       strstr(buf, "Sink support: yes [0x04]");
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 3932e143a..9da161a09 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -38,8 +38,11 @@ IGT_TEST_DESCRIPTION("Basic test for enabling Panel Self Refresh for eDP display
 
 /* After a full update, a few fast updates are necessary for PSR to be enabled */
 #define N_FLIPS 6
-/* DMCUB takes some time to actually enable PSR. Worst case delay is 4 seconds */
-#define PSR_SETTLE_DELAY 4
+/* Linux kernel AMD implementaion, After static image is submitted by kernel driver,
+ * kernel driver notify DMCUB FW ready to enter PSR1, DMUB DW takes around 8 seconds
+ * to actually enable PSR1 state.
+ */
+#define PSR_SETTLE_DELAY 10
 
 typedef struct {
 	int x, y;
@@ -234,7 +237,7 @@ static int check_conn_type(data_t *data, uint32_t type) {
 	return -1;
 }
 
-static bool psr_su_supported(data_t *data)
+static bool psr_mode_supported(data_t *data, enum psr_mode mode)
 {
 	/* run PSR-SU test i.i.f. eDP panel and kernel driver both support PSR-SU */
 	if (!igt_amd_output_has_psr_cap(data->fd, data->output->name)) {
@@ -247,24 +250,24 @@ static bool psr_su_supported(data_t *data)
 		return false;
 	}
 
-	if (!igt_amd_psr_support_sink(data->fd, data->output->name, PSR_MODE_2)) {
-		igt_warn(" output %s not support PSR-SU\n", data->output->name);
+	if (!igt_amd_psr_support_sink(data->fd, data->output->name, mode)) {
+		igt_warn(" output %s not support PSR mode %d\n", data->output->name, mode);
 		return false;
 	}
 
-	if (!igt_amd_psr_support_drv(data->fd, data->output->name, PSR_MODE_2)) {
-		igt_warn(" kernel driver not support PSR-SU\n");
+	if (!igt_amd_psr_support_drv(data->fd, data->output->name, mode)) {
+		igt_warn(" kernel driver not support PSR mode %d\n", mode);
 		return false;
 	}
 
 	return true;
 }
 
+/* run_check_psr does not work with dual eDP */
 static void run_check_psr(data_t *data, bool test_null_crtc) {
-	int fd, edp_idx, dp_idx, ret, i, psr_state;
+	int edp_idx, dp_idx, ret, i, psr_state;
 	igt_fb_t ref_fb, ref_fb2;
 	igt_fb_t *flip_fb;
-	enum pipe pipe;
 	igt_output_t *output;
 
 	test_init(data);
@@ -273,7 +276,12 @@ static void run_check_psr(data_t *data, bool test_null_crtc) {
 	dp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_DisplayPort);
 	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
 
-	for_each_pipe_with_single_output(&data->display, pipe, output) {
+	/* check if eDP support PSR1, PSR-SU.
+	 * test_null_crtc test is valid only with PSR eDP connected
+	 */
+	igt_skip_on(!psr_mode_supported(data, PSR_MODE_1) && !psr_mode_supported(data, PSR_MODE_2));
+
+	for_each_connected_output(&data->display, output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
 
@@ -285,7 +293,7 @@ static void run_check_psr(data_t *data, bool test_null_crtc) {
 				    1.0, 0.0, &ref_fb2);
 
 		igt_plane_set_fb(data->primary, &ref_fb);
-		igt_output_set_pipe(output, pipe);
+
 		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
 		for (i = 0; i < N_FLIPS; i++) {
@@ -299,29 +307,26 @@ static void run_check_psr(data_t *data, bool test_null_crtc) {
 			igt_require(ret == 0);
 			kmstest_wait_for_pageflip(data->fd);
 		}
-	}
 
-	/* PSR state takes some time to settle its value on static screen */
-	sleep(PSR_SETTLE_DELAY);
-
-	for_each_pipe_with_single_output(&data->display, pipe, output) {
-		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
-			continue;
+		/* PSR state takes some time to settle its value on static screen */
+		sleep(PSR_SETTLE_DELAY);
 
 		psr_state =  igt_amd_read_psr_state(data->fd, output->name);
 		igt_fail_on_f(psr_state < PSR_STATE0, "Open PSR state debugfs failed\n");
 		igt_fail_on_f(psr_state < PSR_STATE1, "PSR was not enabled for connector %s\n", output->name);
 		igt_fail_on_f(psr_state == PSR_STATE_INVALID, "PSR is invalid for connector %s\n", output->name);
 		igt_fail_on_f(psr_state != PSR_STATE3, "PSR state is expected to be at PSR_STATE3 (Active) on a "
-
 			      "static screen for connector %s\n", output->name);
+
+		igt_remove_fb(data->fd, &ref_fb);
+		igt_remove_fb(data->fd, &ref_fb2);
 	}
 
 	if (test_null_crtc) {
 		/* check whether settings crtc to null generated any warning (eDP+DP) */
 		igt_skip_on_f(dp_idx == -1, "no DP connector found\n");
 
-		for_each_pipe_with_single_output(&data->display, pipe, output) {
+		for_each_connected_output(&data->display, output) {
 			if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort)
 				continue;
 
@@ -330,9 +335,6 @@ static void run_check_psr(data_t *data, bool test_null_crtc) {
 		}
 	}
 
-	igt_remove_fb(data->fd, &ref_fb);
-	igt_remove_fb(data->fd, &ref_fb2);
-	close(fd);
 	test_fini(data);
 }
 
@@ -363,7 +365,7 @@ static void run_check_psr_su_mpo(data_t *data, bool scaling, float scaling_ratio
 	}
 
 	/* run the test i.i.f. eDP panel supports and kernel driver both support PSR-SU  */
-	igt_skip_on(!psr_su_supported(data));
+	igt_skip_on(!psr_mode_supported(data, PSR_MODE_2));
 
 	/* reference background pattern in grey */
 	igt_create_color_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
@@ -504,7 +506,7 @@ static void run_check_psr_su_ffu(data_t *data)
 	test_init(data);
 
 	/* run the test i.i.f. eDP panel supports and kernel driver both support PSR-SU  */
-	igt_skip_on(!psr_su_supported(data));
+	igt_skip_on(!psr_mode_supported(data, PSR_MODE_2));
 
 	/* reference background pattern in grey */
 	igt_create_color_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
@@ -616,7 +618,7 @@ static void run_check_psr_su_cursor(data_t *data, bool test_mpo)
 	igt_skip_on_f(edp_idx == -1, "no eDP connector found\n");
 
 	test_init(data);
-	igt_skip_on(!psr_su_supported(data));
+	igt_skip_on(!psr_mode_supported(data, PSR_MODE_2));
 
 	frame_rate = data->mode->vrefresh;
 
-- 
2.25.1
