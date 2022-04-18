Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBAF10E23B
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Apr 2022 21:33:21 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 18 Apr 2022 17:32:53 -0400
Message-ID: <20220418213253.2484226-4-dingchen.zhang@amd.com>
In-Reply-To: <20220418213253.2484226-1-dingchen.zhang@amd.com>
References: <20220418213253.2484226-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v4 3/3] tests/amdgpu/amd_psr: define reusable
 wrapper for PSR support check
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

[why & how]
For amdgpu PSR-SU test cases, we'd first check if the sink device
and amdgpu driver support the PSR-SU feature at the beginning. We
define a local helper to wrap the check for PSR-SU support from
sink and driver as well and called by both MPO and FFU test case,
to avoid the code repetition.

Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Jay Pillai <aurabindo.pillai@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>

Changes in v2:
-----------------
- use igt_warn() for any PSR SU cap/support check before FALSE
  returned

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 tests/amdgpu/amd_psr.c | 44 +++++++++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index fac5da77..d4bfb7bb 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -138,6 +138,32 @@ static int check_conn_type(data_t *data, uint32_t type) {
 	return -1;
 }
 
+static bool psr_su_supported(data_t *data)
+{
+	/* run PSR-SU test i.i.f. eDP panel and kernel driver both support PSR-SU */
+	if (!igt_amd_output_has_psr_cap(data->fd, data->output->name)) {
+		igt_warn(" driver does not have %s debugfs interface\n", DEBUGFS_EDP_PSR_CAP);
+		return false;
+	}
+
+	if (!igt_amd_output_has_psr_state(data->fd, data->output->name)) {
+		igt_warn(" driver does not have %s debugfs interface\n", DEBUGFS_EDP_PSR_STATE);
+		return false;
+	}
+
+	if (!igt_amd_psr_support_sink(data->fd, data->output->name, PSR_MODE_2)) {
+		igt_warn(" output %s not support PSR-SU\n", data->output->name);
+		return false;
+	}
+
+	if (!igt_amd_psr_support_drv(data->fd, data->output->name, PSR_MODE_2)) {
+		igt_warn(" kernel driver not support PSR-SU\n");
+		return false;
+	}
+
+	return true;
+}
+
 static void run_check_psr(data_t *data, bool test_null_crtc) {
 	int fd, edp_idx, dp_idx, ret, i, psr_state;
 	igt_fb_t ref_fb, ref_fb2;
@@ -217,8 +243,6 @@ static void run_check_psr(data_t *data, bool test_null_crtc) {
 static void run_check_psr_su_mpo(data_t *data)
 {
 	int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
-	bool sink_support_psrsu = false;
-	bool drv_suport_psrsu = false;
 	igt_fb_t ov_fb;		// fb for overlay
 	igt_fb_t rect_fb[N_MPO_TEST_RECT_FB]; 	// rectangle fbs for primary, emulate as video playback region
 	igt_fb_t ref_fb;	// reference fb
@@ -235,12 +259,7 @@ static void run_check_psr_su_mpo(data_t *data)
 	frame_rate = data->mode->vrefresh;
 
 	/* run the test i.i.f. eDP panel supports and kernel driver both support PSR-SU  */
-	igt_skip_on(!igt_amd_output_has_psr_cap(data->fd, data->output->name));
-	igt_skip_on(!igt_amd_output_has_psr_state(data->fd, data->output->name));
-	sink_support_psrsu = igt_amd_psr_support_sink(data->fd, data->output->name, PSR_MODE_2);
-	igt_skip_on_f(!sink_support_psrsu, "output %s not support PSR-SU\n", data->output->name);
-	drv_suport_psrsu = igt_amd_psr_support_drv(data->fd, data->output->name, PSR_MODE_2);
-	igt_skip_on_f(!drv_suport_psrsu, "kernel driver not support PSR-SU\n");
+	igt_skip_on(!psr_su_supported(data));
 
 	/* reference background pattern in grey */
 	igt_create_color_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
@@ -344,8 +363,6 @@ static void panning_rect_fb(data_t *data, igt_fb_t *rect_fb, int rect_w, int rec
 static void run_check_psr_su_ffu(data_t *data)
 {
 	int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
-	bool sink_support_psrsu = false;
-	bool drv_suport_psrsu = false;
 	igt_fb_t rect_fb; 	// rectangle fbs for primary
 	igt_fb_t ref_fb;	// reference fb
 	int pb_w, pb_h;
@@ -359,12 +376,7 @@ static void run_check_psr_su_ffu(data_t *data)
 	pb_h = data->h / 2;
 
 	/* run the test i.i.f. eDP panel supports and kernel driver both support PSR-SU  */
-	igt_skip_on(!igt_amd_output_has_psr_cap(data->fd, data->output->name));
-	igt_skip_on(!igt_amd_output_has_psr_state(data->fd, data->output->name));
-	sink_support_psrsu = igt_amd_psr_support_sink(data->fd, data->output->name, PSR_MODE_2);
-	igt_skip_on_f(!sink_support_psrsu, "output %s not support PSR-SU\n", data->output->name);
-	drv_suport_psrsu = igt_amd_psr_support_drv(data->fd, data->output->name, PSR_MODE_2);
-	igt_skip_on_f(!drv_suport_psrsu, "kernel driver not support PSR-SU\n");
+	igt_skip_on(!psr_su_supported(data));
 
 	/* reference background pattern in grey */
 	igt_create_color_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
-- 
2.25.1
