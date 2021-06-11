Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD356E503
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jun 2021 05:31:05 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Fri, 11 Jun 2021 10:50:02 +0530
Message-Id: <20210611052005.303-14-venkata.sai.patnana@intel.com>
In-Reply-To: <20210611052005.303-1-venkata.sai.patnana@intel.com>
References: <20210611052005.303-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 14/17] tests/kms_dp_dsc: Assign all related
 data members together
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

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Currently, members connector and output mode of the data are set separately,
than the other data related members like conn_name and output.
Move these assignments together.

Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_dp_dsc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_dp_dsc.c b/tests/kms_dp_dsc.c
index 71d655af70..eecb9e45da 100644
--- a/tests/kms_dp_dsc.c
+++ b/tests/kms_dp_dsc.c
@@ -62,7 +62,6 @@ typedef struct {
 	igt_output_t *output;
 	int mode_valid;
 	drmModeModeInfo *mode;
-	drmModeConnector *connector;
 	drmModeEncoder *encoder;
 	int crtc;
 	int compression_bpp;
@@ -224,6 +223,8 @@ static bool check_dsc_on_connector(data_t *data, uint32_t drmConnector)
 		return false;
 	}
 	data->output = output;
+	data->mode = igt_output_get_mode(data->output);
+
 	return true;
 }
 
@@ -235,7 +236,6 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 {
 	bool enabled;
 	igt_plane_t *primary;
-	data->connector = data->output->config.connector;
 
 	/* Disable the output first */
 	igt_output_set_pipe(data->output, PIPE_NONE);
@@ -288,7 +288,7 @@ static void run_test(data_t *data, igt_output_t *output,
 		if (is_i915_device(data->drm_fd)) {
 			uint32_t devid = intel_get_drm_devid(data->drm_fd);
 
-			if (data->connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
+			if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
 			    data->pipe == PIPE_A && IS_GEN11(devid)) {
 				igt_debug("DSC not supported on Pipe A on external DP in Gen11 platforms\n");
 				continue;
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
