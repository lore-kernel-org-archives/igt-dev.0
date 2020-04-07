Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BC26E871
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2020 13:17:04 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue, 7 Apr 2020 16:16:29 +0300
Message-ID: <20200407131633.1350311-3-arkadiusz.hiler@intel.com>
In-Reply-To: <20200407131633.1350311-1-arkadiusz.hiler@intel.com>
References: <20200407131633.1350311-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/7] lib/igt_psr: Set mode before checking
 if PSR is supported
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

This check was depending on a leftover mode set by something external
(usually fbcon) in order to work. Let's set the mode for the check
ourselves.

The no_modeset variant is meant for igt_display-less testing, e.g.
fbcon.

Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 lib/igt_psr.c                    | 57 +++++++++++++++++++++++++++++++-
 lib/igt_psr.h                    |  4 ++-
 tests/i915/i915_pm_dc.c          |  6 ++--
 tests/kms_fbcon_fbt.c            |  4 +--
 tests/kms_frontbuffer_tracking.c |  2 +-
 tests/kms_psr.c                  |  2 +-
 tests/kms_psr2_su.c              |  5 +--
 7 files changed, 69 insertions(+), 11 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 83ccacdd..3d3ce81b 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -161,13 +161,14 @@ bool psr_disable(int debugfs_fd)
 	return psr_set(debugfs_fd, -1);
 }
 
-bool psr_sink_support(int debugfs_fd, enum psr_mode mode)
+bool psr_sink_support_no_modeset(int debugfs_fd, enum psr_mode mode)
 {
 	char buf[PSR_STATUS_MAX_LEN];
 	int ret;
 
 	ret = igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
 				      sizeof(buf));
+
 	if (ret < 1)
 		return false;
 
@@ -182,6 +183,60 @@ bool psr_sink_support(int debugfs_fd, enum psr_mode mode)
 		return strstr(buf, "Sink support: yes [0x03]");
 }
 
+bool psr_sink_support(igt_display_t *display, int debugfs_fd, enum psr_mode mode)
+{
+	int ret;
+
+	/* we need to have a mode active for this check to make sense */
+	igt_output_t *output;
+	enum pipe pipe;
+	bool found = false;
+	int fb_id;
+	igt_fb_t fb;
+	drmModeModeInfo *drm_mode;
+	igt_plane_t *primary;
+
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		drmModeConnectorPtr c = output->config.connector;
+
+		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
+			continue;
+
+		igt_output_set_pipe(output, pipe);
+		found = true;
+
+		break;
+	}
+
+	if (!found) /* no eDP */
+		return false;
+
+	drm_mode = igt_output_get_mode(output);
+
+	fb_id = igt_create_fb(display->drm_fd,
+			      drm_mode->hdisplay,
+			      drm_mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      LOCAL_DRM_FORMAT_MOD_NONE,
+			      &fb);
+	igt_assert(fb_id);
+
+	primary = igt_output_get_plane_type(output,
+					    DRM_PLANE_TYPE_PRIMARY);
+
+	igt_plane_set_fb(primary, &fb);
+	igt_display_commit(display);
+
+
+	ret = psr_sink_support_no_modeset(debugfs_fd, mode);
+
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_remove_fb(display->drm_fd, &fb);
+
+	return ret;
+}
+
 #define PSR2_SU_BLOCK_STR_LOOKUP "PSR2 SU blocks:\n0\t"
 
 static bool
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index ca385736..cb10a4f0 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -27,6 +27,7 @@
 #include "igt_debugfs.h"
 #include "igt_core.h"
 #include "igt_aux.h"
+#include "igt_kms.h"
 
 #define PSR_STATUS_MAX_LEN 512
 
@@ -40,7 +41,8 @@ bool psr_wait_update(int debugfs_fd, enum psr_mode mode);
 bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode);
 bool psr_enable(int debugfs_fd, enum psr_mode);
 bool psr_disable(int debugfs_fd);
-bool psr_sink_support(int debugfs_fd, enum psr_mode);
+bool psr_sink_support_no_modeset(int debugfs_fd, enum psr_mode mode);
+bool psr_sink_support(igt_display_t *display, int debugfs_fd, enum psr_mode mode);
 bool psr2_wait_su(int debugfs_fd, uint16_t *num_su_blocks);
 
 #endif
diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 2dd6191d..0b6f6a96 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -408,14 +408,14 @@ int main(int argc, char *argv[])
 	igt_describe("In this test we make sure that system enters DC3CO "
 		     "when PSR2 is active and system is in SLEEP state");
 	igt_subtest("dc3co-vpb-simulation") {
-		igt_require(psr_sink_support(data.debugfs_fd, PSR_MODE_2));
+		igt_require(psr_sink_support(&data.display, data.debugfs_fd, PSR_MODE_2));
 		test_dc3co_vpb_simulation(&data);
 	}
 
 	igt_describe("This test validates display engine entry to DC5 state "
 		     "while PSR is active");
 	igt_subtest("dc5-psr") {
-		igt_require(psr_sink_support(data.debugfs_fd, PSR_MODE_1));
+		igt_require(psr_sink_support(&data.display, data.debugfs_fd, PSR_MODE_1));
 		data.op_psr_mode = PSR_MODE_1;
 		psr_enable(data.debugfs_fd, data.op_psr_mode);
 		test_dc_state_psr(&data, CHECK_DC5);
@@ -424,7 +424,7 @@ int main(int argc, char *argv[])
 	igt_describe("This test validates display engine entry to DC6 state "
 		     "while PSR is active");
 	igt_subtest("dc6-psr") {
-		igt_require(psr_sink_support(data.debugfs_fd, PSR_MODE_1));
+		igt_require(psr_sink_support(&data.display, data.debugfs_fd, PSR_MODE_1));
 		data.op_psr_mode = PSR_MODE_1;
 		psr_enable(data.debugfs_fd, data.op_psr_mode);
 		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
diff --git a/tests/kms_fbcon_fbt.c b/tests/kms_fbcon_fbt.c
index ed4cccbe..b8fe42d3 100644
--- a/tests/kms_fbcon_fbt.c
+++ b/tests/kms_fbcon_fbt.c
@@ -207,7 +207,7 @@ static bool psr_wait_until_enabled(int debugfs_fd)
 
 static bool psr_supported_on_chipset(int debugfs_fd)
 {
-	return psr_sink_support(debugfs_fd, PSR_MODE_1);
+	return psr_sink_support_no_modeset(debugfs_fd, PSR_MODE_1);
 }
 
 static bool psr_wait_until_update(int debugfs_fd)
@@ -218,7 +218,7 @@ static bool psr_wait_until_update(int debugfs_fd)
 static void disable_features(int debugfs_fd)
 {
 	igt_set_module_param_int("enable_fbc", 0);
-	if (psr_sink_support(debugfs_fd, PSR_MODE_1))
+	if (psr_sink_support_no_modeset(debugfs_fd, PSR_MODE_1))
 		psr_disable(debugfs_fd);
 }
 
diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tracking.c
index c4b4af43..66ca4295 100644
--- a/tests/kms_frontbuffer_tracking.c
+++ b/tests/kms_frontbuffer_tracking.c
@@ -1411,7 +1411,7 @@ static void setup_psr(void)
 		return;
 	}
 
-	if (!psr_sink_support(drm.debugfs, PSR_MODE_1)) {
+	if (!psr_sink_support(&drm.display, drm.debugfs, PSR_MODE_1)) {
 		igt_info("Can't test PSR: not supported by sink.\n");
 		return;
 	}
diff --git a/tests/kms_psr.c b/tests/kms_psr.c
index 13ed02f4..2fd9976d 100644
--- a/tests/kms_psr.c
+++ b/tests/kms_psr.c
@@ -195,7 +195,7 @@ static void fill_render(data_t *data, uint32_t handle, unsigned char color)
 static bool sink_support(data_t *data, enum psr_mode mode)
 {
 	return data->with_psr_disabled ||
-	       psr_sink_support(data->debugfs_fd, mode);
+	       psr_sink_support(&data->display, data->debugfs_fd, mode);
 }
 
 static bool psr_wait_entry_if_enabled(data_t *data)
diff --git a/tests/kms_psr2_su.c b/tests/kms_psr2_su.c
index 9f40c735..11d464ae 100644
--- a/tests/kms_psr2_su.c
+++ b/tests/kms_psr2_su.c
@@ -243,14 +243,15 @@ igt_main
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
 
-		igt_require_f(psr_sink_support(data.debugfs_fd, PSR_MODE_2),
+		display_init(&data);
+
+		igt_require_f(psr_sink_support(&data.display, data.debugfs_fd, PSR_MODE_2),
 			      "Sink does not support PSR2\n");
 
 		data.bufmgr = drm_intel_bufmgr_gem_init(data.drm_fd, 4096);
 		igt_assert(data.bufmgr);
 		drm_intel_bufmgr_gem_enable_reuse(data.bufmgr);
 
-		display_init(&data);
 
 		/* Test if PSR2 can be enabled */
 		igt_require_f(psr_enable(data.debugfs_fd, PSR_MODE_2),
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
