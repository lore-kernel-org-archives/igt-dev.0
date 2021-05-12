Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552E86EB4C
 for <igt-dev@lists.freedesktop.org>; Wed, 12 May 2021 09:16:11 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 12 May 2021 22:35:27 +0530
Message-Id: <20210512170536.4778-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20210512170536.4778-1-bhanuprakash.modem@intel.com>
References: <20210512170536.4778-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [v6 i-g-t 05/14] tests/kms_content_protection: Fix mode
 selection for 2x tests
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

This patch will find the connector/mode combination that fits
into the bandwidth when more than one monitor is connected.

Example:
  When two monitors connected through MST, the second monitor
  also tries to use the same mode. So two such modes may not
  fit into the link bandwidth. So, iterate through connected
  outputs & modes and find a combination of modes those fit
  into the link BW.

V2:
* Fix commit message (Ankit)

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_content_protection.c | 41 +++++++++++++---------------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 5a75b871c..1d1a439a9 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -452,39 +452,18 @@ static bool sink_hdcp2_capable(igt_output_t *output)
 	return strstr(buf, "HDCP2.2");
 }
 
-static void prepare_modeset_on_mst_output(igt_output_t *output, enum pipe pipe)
+static void prepare_modeset_on_mst_output(igt_output_t *output)
 {
-	drmModeConnectorPtr c = output->config.connector;
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
-	int i, width, height;
+	int width, height;
+	enum pipe pipe = output->pending_pipe;
 
 	mode = igt_output_get_mode(output);
 
-	/*
-	 * TODO: Add logic to use the highest possible modes on each output.
-	 * Currently using 2k modes by default on all the outputs.
-	 */
-	igt_debug("Before mode override: Output %s Mode hdisplay %d Mode vdisplay %d\n",
-		   output->name, mode->hdisplay, mode->vdisplay);
-
-	if (mode->hdisplay > 1920 && mode->vdisplay > 1080) {
-		for (i = 0; i < c->count_modes; i++) {
-			if (c->modes[i].hdisplay <= 1920 && c->modes[i].vdisplay <= 1080) {
-				mode = &c->modes[i];
-				igt_output_override_mode(output, mode);
-				break;
-			}
-		}
-	}
-
-	igt_debug("After mode overide: Output %s Mode hdisplay %d Mode vdisplay %d\n",
-		   output->name, mode->hdisplay, mode->vdisplay);
-
 	width = mode->hdisplay;
 	height = mode->vdisplay;
 
-	igt_output_set_pipe(output, pipe);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
 	igt_plane_set_fb(primary, pipe % 2 ? &data.red : &data.green);
@@ -624,7 +603,8 @@ test_content_protection_mst(int content_type)
 
 		igt_assert_f(igt_pipe_connector_valid(pipe, output), "Output-pipe combination invalid\n");
 
-		prepare_modeset_on_mst_output(output, pipe);
+		igt_output_set_pipe(output, pipe);
+		prepare_modeset_on_mst_output(output);
 		mst_output[dp_mst_outputs++] = output;
 
 		pipe++;
@@ -635,6 +615,17 @@ test_content_protection_mst(int content_type)
 
 	igt_require_f(dp_mst_outputs > 1, "No DP MST set up with >= 2 outputs found in a single topology\n");
 
+	if (igt_display_try_commit_atomic(display,
+				DRM_MODE_ATOMIC_TEST_ONLY |
+				DRM_MODE_ATOMIC_ALLOW_MODESET,
+				NULL) != 0) {
+		bool found = igt_override_all_active_output_modes_to_fit_bw(display);
+		igt_require_f(found, "No valid mode combo found for MST modeset\n");
+
+		for (count = 0; count < dp_mst_outputs; count++)
+			prepare_modeset_on_mst_output(mst_output[count]);
+	}
+
 	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
 	igt_require_f(ret == 0, "Commit failure during MST modeset\n");
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
