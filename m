Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C77410ED5E
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Apr 2023 13:57:49 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 14 Apr 2023 19:23:16 +0530
Message-Id: <20230414135319.1270913-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20230414135319.1270913-1-bhanuprakash.modem@intel.com>
References: <20230414135319.1270913-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 3/6] tests/i915/kms_dsc: Update bigjoiner pipe
 constraint
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

Instead of writing own logic at test level, use existing IGT
helper to check the bigjoiner support.

V2: - git squash to include i915_pipe_output_combo_valid()

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/i915/kms_dsc.c        | 30 +++++++++++++++---------------
 tests/i915/kms_dsc_helper.h |  2 --
 2 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index b3c5e60c773..cf34dc8a8b0 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -47,7 +47,6 @@ typedef struct {
 	unsigned int plane_format;
 	igt_output_t *output;
 	int input_bpc;
-	int n_pipes;
 	int disp_ver;
 	enum pipe pipe;
 } data_t;
@@ -72,19 +71,24 @@ static drmModeModeInfo *get_highres_mode(igt_output_t *output)
 	return highest_mode;
 }
 
-static bool check_big_joiner_pipe_constraint(data_t *data)
+static bool pipe_output_combo_valid(data_t *data)
 {
 	igt_output_t *output = data->output;
-	drmModeModeInfo *mode = get_highres_mode(output);
+	drmModeModeInfo *mode;
+	bool ret = true;
 
-	if (mode->hdisplay >= HDISPLAY_5K &&
-	    data->pipe == (data->n_pipes - 1)) {
-		igt_debug("Pipe-%s not supported due to bigjoiner limitation\n",
-			   kmstest_pipe_name(data->pipe));
-		return false;
-	}
+	igt_display_reset(&data->display);
+	mode = get_highres_mode(output);
+
+	igt_output_set_pipe(output, data->pipe);
+	igt_output_override_mode(output, mode);
+
+	if (!i915_pipe_output_combo_valid(&data->display))
+		ret = false;
+
+	igt_output_set_pipe(output, PIPE_NONE);
 
-	return true;
+	return ret;
 }
 
 static void test_cleanup(data_t *data)
@@ -190,7 +194,7 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
 		if (!check_gen11_bpc_constraint(data->drm_fd, data->output, data->input_bpc))
 			continue;
 
-		if (!check_big_joiner_pipe_constraint(data))
+		if (!pipe_output_combo_valid(data))
 			continue;
 
 		if (test_type == TEST_DSC_BPC)
@@ -206,7 +210,6 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
 igt_main
 {
 	data_t data = {};
-	int i;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
@@ -217,9 +220,6 @@ igt_main
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
 		igt_require(data.disp_ver >= 11);
-		data.n_pipes = 0;
-		for_each_pipe(&data.display, i)
-			data.n_pipes++;
 	}
 
 	igt_describe("Tests basic display stream compression functionality if supported "
diff --git a/tests/i915/kms_dsc_helper.h b/tests/i915/kms_dsc_helper.h
index fe479dac472..b3828dcd44a 100644
--- a/tests/i915/kms_dsc_helper.h
+++ b/tests/i915/kms_dsc_helper.h
@@ -21,8 +21,6 @@
 #include <fcntl.h>
 #include <termios.h>
 
-#define HDISPLAY_5K	5120
-
 void force_dsc_enable(int drmfd, igt_output_t *output);
 void force_dsc_enable_bpc(int drmfd, igt_output_t *output, int input_bpc);
 void save_force_dsc_en(int drmfd, igt_output_t *output);
-- 
2.40.0
