Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B85E897F6
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jun 2021 04:48:38 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
Date: Tue, 15 Jun 2021 09:55:57 +0530
Message-Id: <20210615042557.16507-1-karthik.b.s@intel.com>
In-Reply-To: <20210614102708.10229-1-karthik.b.s@intel.com>
References: <20210614102708.10229-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3] tests/kms_dp_dsc: Use the correct
 variables
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
Cc: kunal1.joshi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Use 'output' here rather than 'data->output' as it is still not populated.
On the same lines, replace 'data->connector' and 'data->pipe' as well.

Fixes: a1772be7dede ("tests/kms_dp_dsc: Bug fix for DP on Pipe A")
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3494

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 tests/kms_dp_dsc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_dp_dsc.c b/tests/kms_dp_dsc.c
index 2446fd82..8a4be4f8 100644
--- a/tests/kms_dp_dsc.c
+++ b/tests/kms_dp_dsc.c
@@ -228,7 +228,7 @@ static void run_test(data_t *data, igt_output_t *output,
 {
 	enum pipe pipe;
 
-	data->mode = igt_output_get_mode(data->output);
+	data->mode = igt_output_get_mode(output);
 	igt_create_pattern_fb(data->drm_fd, data->mode->hdisplay,
 			      data->mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
@@ -239,8 +239,8 @@ static void run_test(data_t *data, igt_output_t *output,
 		if (is_i915_device(data->drm_fd)) {
 			uint32_t devid = intel_get_drm_devid(data->drm_fd);
 
-			if (data->connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
-			    data->pipe == PIPE_A && IS_GEN11(devid)) {
+			if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
+			    pipe == PIPE_A && IS_GEN11(devid)) {
 				igt_debug("DSC not supported on Pipe A on external DP in Gen11 platforms\n");
 				continue;
 			}
-- 
2.22.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
