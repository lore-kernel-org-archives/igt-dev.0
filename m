Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22EE6E201
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2020 14:04:54 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Thu, 12 Mar 2020 19:26:42 +0530
Message-Id: <20200312135642.13845-6-anshuman.gupta@intel.com>
In-Reply-To: <20200312135642.13845-1-anshuman.gupta@intel.com>
References: <20200312135642.13845-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/5] tests/i915_pm_rpm: lpsp/non-lpsp screen
 mode_set_data
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
Cc: jani.nikula@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Initialize the mode set params for lpsp/non-lpsp screen
based upon their output lpsp capability instead
of edp/non-edp screen type.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 9118e895..9f2c4c31 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -94,6 +94,7 @@ struct mode_set_data {
 	drmModeResPtr res;
 	drmModeConnectorPtr connectors[MAX_CONNECTORS];
 	drmModePropertyBlobPtr edids[MAX_CONNECTORS];
+	igt_display_t display;
 
 	uint32_t devid;
 };
@@ -254,29 +255,26 @@ static bool init_modeset_params_for_type(struct mode_set_data *data,
 {
 	drmModeConnectorPtr connector = NULL;
 	drmModeModeInfoPtr mode = NULL;
+	igt_output_t *output = NULL;
+	igt_display_t *display = &data->display;
 
-	if (!data->res)
-		return false;
-
-	for (int i = 0; i < data->res->count_connectors; i++) {
-		drmModeConnectorPtr c = data->connectors[i];
+	for_each_connected_output(display, output) {
+		drmModeConnectorPtr c = output->config.connector;
 
 		if (type == SCREEN_TYPE_LPSP &&
-		    c->connector_type != DRM_MODE_CONNECTOR_eDP)
+		     !igt_output_is_lpsp_capable(drm_fd, output))
 			continue;
 
 		if (type == SCREEN_TYPE_NON_LPSP &&
-		    c->connector_type == DRM_MODE_CONNECTOR_eDP)
+		    igt_output_is_lpsp_capable(drm_fd, output))
 			continue;
 
-		if (c->connection == DRM_MODE_CONNECTED && c->count_modes) {
-			connector = c;
-			mode = &c->modes[0];
-			break;
-		}
+		connector = c;
+		mode = igt_output_get_mode(output);
+		break;
 	}
 
-	if (!connector)
+	if (!output)
 		return false;
 
 	igt_create_pattern_fb(drm_fd, mode->hdisplay, mode->vdisplay,
@@ -398,6 +396,7 @@ static void init_mode_set_data(struct mode_set_data *data)
 	}
 
 	data->devid = intel_get_drm_devid(drm_fd);
+	igt_display_require(&data->display, drm_fd);
 	init_modeset_cached_params(&ms_data);
 }
 
@@ -410,6 +409,8 @@ static void fini_mode_set_data(struct mode_set_data *data)
 		}
 		drmModeFreeResources(data->res);
 	}
+
+	igt_display_fini(&data->display);
 }
 
 static void get_drm_info(struct compare_data *data)
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
