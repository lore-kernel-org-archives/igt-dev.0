Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E7410E2E7
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 05:57:08 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	karthik.b.s@intel.com
Date: Fri, 24 Nov 2023 11:16:56 +0530
Message-Id: <20231124054656.2314283-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/intel/kms_pm_lpsp: Use lib helper to
 iterate connector modes
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

Instead of writing a new logic at test level, use library helper
to iterate all connector modes.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_pm_lpsp.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index a85e4e795..9a6ef1be9 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -63,7 +63,6 @@ typedef struct {
 	char *pwr_dmn_info;
 	igt_display_t display;
 	struct igt_fb fb;
-	drmModeModeInfo *mode;
 	igt_output_t *output;
 	enum pipe pipe;
 } data_t;
@@ -124,12 +123,13 @@ static void screens_disabled_subtest(data_t *data)
 static void setup_lpsp_output(data_t *data)
 {
 	igt_plane_t *primary;
+	drmModeModeInfo *mode = igt_output_get_mode(data->output);
 
 	primary = igt_output_get_plane_type(data->output,
 					    DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
 	igt_create_pattern_fb(data->drm_fd,
-			      data->mode->hdisplay, data->mode->vdisplay,
+			      mode->hdisplay, mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
 			      DRM_FORMAT_MOD_LINEAR,
 			      &data->fb);
@@ -155,22 +155,22 @@ static void test_cleanup(data_t *data)
 
 static bool test_constraint(data_t *data)
 {
-	drmModeConnectorPtr c = data->output->config.connector;
-	int i;
+	drmModeModeInfo *mode;
 
 	igt_display_reset(&data->display);
 	igt_output_set_pipe(data->output, data->pipe);
 
-	data->mode = igt_output_get_mode(data->output);
+	mode = igt_output_get_mode(data->output);
 
 	/* For LPSP avoid Bigjoiner. */
-	if (igt_bigjoiner_possible(data->mode, max_dotclock)) {
-		for (i = 0; i < c->count_modes; i++) {
-			data->mode = &c->modes[i];
-			if (igt_bigjoiner_possible(data->mode, max_dotclock))
+	if (igt_bigjoiner_possible(mode, max_dotclock)) {
+		for_each_connector_mode(data->output) {
+			mode = &data->output->config.connector->modes[j__];
+
+			if (igt_bigjoiner_possible(mode, max_dotclock))
 				continue;
 
-			igt_output_override_mode(data->output, data->mode);
+			igt_output_override_mode(data->output, mode);
 
 			return true;
 		}
-- 
2.40.0
