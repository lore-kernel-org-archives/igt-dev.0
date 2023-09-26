Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D8C10E3B9
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 11:56:32 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Date: Tue, 26 Sep 2023 17:17:51 +0530
Message-Id: <20230926114751.2757259-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20230926114751.2757259-1-bhanuprakash.modem@intel.com>
References: <20230926114751.2757259-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 2/2] tests/intel/kms_pm_lpsp: Fix Bigjoiner checks
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

Instead of writing a new logic to check the Bigjoiner validity,
use the existing helpers from IGT lib.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_pm_lpsp.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index d3e543048..cb3c3e379 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -68,6 +68,8 @@ typedef struct {
 	enum pipe pipe;
 } data_t;
 
+static int max_dotclock;
+
 static bool lpsp_is_enabled(data_t *data)
 {
 	char buf[MAX_SINK_LPSP_INFO_BUF_LEN];
@@ -123,7 +125,6 @@ static void setup_lpsp_output(data_t *data)
 {
 	igt_plane_t *primary;
 
-	igt_output_set_pipe(data->output, data->pipe);
 	primary = igt_output_get_plane_type(data->output,
 					    DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
@@ -158,20 +159,22 @@ static bool test_constraint(data_t *data)
 	int i;
 
 	igt_display_reset(&data->display);
+	igt_output_set_pipe(data->output, data->pipe);
 
 	data->mode = igt_output_get_mode(data->output);
 
-	/* For LPSP avoid pipe big joiner by atleast 4k mode */
-	if (data->mode->hdisplay > 3840 && data->mode->vdisplay > 2160)
+	/* For LPSP avoid Bigjoiner. */
+	if (igt_bigjoiner_possible(data->mode, max_dotclock)) {
 		for (i = 0; i < c->count_modes; i++) {
-			if (c->modes[i].hdisplay <= 3840 &&
-			    c->modes[i].vdisplay <= 2160) {
-				data->mode = &c->modes[i];
-				igt_output_override_mode(data->output,
-							 data->mode);
-				return true;
-			}
+			data->mode = &c->modes[i];
+			if (igt_bigjoiner_possible(data->mode, max_dotclock))
+				continue;
+
+			igt_output_override_mode(data->output, data->mode);
+
+			return true;
 		}
+	}
 
 	return false;
 }
@@ -200,6 +203,8 @@ igt_main
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require(igt_pm_dmc_loaded(data.debugfs_fd));
+
+		max_dotclock = igt_get_max_dotclock(data.drm_fd);
 	}
 
 	igt_describe("This test validates lpsp while all crtc are disabled");
-- 
2.40.0
