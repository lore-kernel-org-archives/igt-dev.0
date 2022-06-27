Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DFA113356
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jun 2022 09:51:29 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Jun 2022 15:24:43 +0530
Message-Id: <20220627095444.29430-2-nidhi1.gupta@intel.com>
In-Reply-To: <20220627095444.29430-1-nidhi1.gupta@intel.com>
References: <20220627095444.29430-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_invalid_mode: Convert tests
 to dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Convert the existing subtests to dynamic subtests at pipe level.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_invalid_mode.c | 54 ++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 30 deletions(-)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 630798d8..0287ee02 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -32,6 +32,7 @@ typedef struct _data data_t;
 
 struct _data {
 	int drm_fd;
+	enum pipe pipe;
 	igt_display_t display;
 	igt_output_t *output;
 	drmModeResPtr res;
@@ -177,21 +178,21 @@ adjust_mode_bad_vtotal(data_t *data, drmModeModeInfoPtr mode)
 	return true;
 }
 
-static int
+static void
 test_output(data_t *data)
 {
 	igt_output_t *output = data->output;
 	drmModeModeInfo mode;
 	struct igt_fb fb;
-	int i;
+	int ret;
+	uint32_t crtc_id;
 
 	/*
 	 * FIXME test every mode we have to be more
 	 * sure everything is really getting rejected?
 	 */
 	mode = *igt_output_get_mode(output);
-	if (!data->adjust_mode(data, &mode))
-		return 0;
+	igt_require(data->adjust_mode(data, &mode));
 
 	igt_create_fb(data->drm_fd,
 		      max_t(uint16_t, mode.hdisplay, 64),
@@ -202,32 +203,14 @@ test_output(data_t *data)
 
 	kmstest_unset_all_crtcs(data->drm_fd, data->res);
 
-	for (i = 0; i < data->res->count_crtcs; i++) {
-		int ret;
-
-		igt_info("Checking pipe %c connector %s with mode %s\n",
-			 'A'+i, output->name, mode.name);
+	crtc_id = data->display.pipes[data->pipe].crtc_id;
 
-		ret = drmModeSetCrtc(data->drm_fd, data->res->crtcs[i],
-				     fb.fb_id, 0, 0,
-				     &output->id, 1, &mode);
-		igt_assert_lt(ret, 0);
-	}
+	ret = drmModeSetCrtc(data->drm_fd, crtc_id,
+			     fb.fb_id, 0, 0,
+			     &output->id, 1, &mode);
+	igt_assert_lt(ret, 0);
 
 	igt_remove_fb(data->drm_fd, &fb);
-
-	return 1;
-}
-
-static void test(data_t *data)
-{
-	int valid_connectors = 0;
-
-	for_each_connected_output(&data->display, data->output) {
-		valid_connectors += test_output(data);
-	}
-
-	igt_require_f(valid_connectors, "No suitable connectors found\n");
 }
 
 static int i915_max_dotclock(data_t *data)
@@ -297,6 +280,10 @@ static data_t data;
 
 igt_main
 {
+
+	enum pipe pipe;
+	igt_output_t *output;
+
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
@@ -310,10 +297,17 @@ igt_main
 		igt_info("Max dotclock: %d kHz\n", data.max_dotclock);
 	}
 
+	igt_describe("Make sure all modesets are rejected when the requested mode is invalid");
 	for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
-		igt_subtest(subtests[i].name) {
-			data.adjust_mode = subtests[i].adjust_mode;
-			test(&data);
+		igt_subtest_with_dynamic(subtests[i].name) {
+			for_each_pipe_with_valid_output(&data.display, pipe, output) {
+				igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe)) {
+					data.output = output;
+					data.pipe = pipe;
+					data.adjust_mode = subtests[i].adjust_mode;
+					test_output(&data);
+				}
+			}
 		}
 	}
 
-- 
2.26.2
