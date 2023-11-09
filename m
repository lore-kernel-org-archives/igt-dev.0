Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E2210E1B1
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 03:29:45 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 09:07:01 +0530
Message-Id: <20231109033706.1344465-3-kunal1.joshi@intel.com>
In-Reply-To: <20231109033706.1344465-1-kunal1.joshi@intel.com>
References: <20231109033706.1344465-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/7] lib/igt_psr: modified psr_sink_support
 for pr compatability
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

New debugfs directory for all DP connectors will be added
with below patch series https://patchwork.freedesktop.org/series/94470/

For DP Connectors
	/sys/kernel/debug/dri/0/DP-x/i915_psr_status

For eDP Connectors
	/sys/kernel/debug/dri/0/i915_edp_psr_status
			or
	/sys/kernel/debug/dri/0/eDP-x/i915_psr_status

v2: reuse psr_sink_support (Jouni)
v3: maintain backward compatability (Jouni)

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_psr.c                          | 56 ++++++++++++++++++--------
 lib/igt_psr.h                          |  3 +-
 tests/intel/kms_dirtyfb.c              |  2 +-
 tests/intel/kms_fbcon_fbt.c            |  4 +-
 tests/intel/kms_frontbuffer_tracking.c |  2 +-
 tests/intel/kms_pm_dc.c                |  9 +++--
 tests/intel/kms_psr.c                  |  2 +-
 tests/intel/kms_psr2_sf.c              |  3 +-
 tests/intel/kms_psr2_su.c              |  3 +-
 tests/intel/kms_psr_stress_test.c      |  2 +-
 tests/kms_feature_discovery.c          |  4 +-
 11 files changed, 59 insertions(+), 31 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 13f7c567d..054622d79 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -192,31 +192,53 @@ bool psr_disable(int device, int debugfs_fd)
 	return psr_set(device, debugfs_fd, -1);
 }
 
-bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode)
+bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 {
+	char *line;
+	char debugfs_file[128] = {0};
 	char buf[PSR_STATUS_MAX_LEN];
 	int ret;
 
-	ret = igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
+	if (output)
+		sprintf(debugfs_file, "%s/i915_psr_status", output->name);
+	else
+		sprintf(debugfs_file, "%s", "i915_edp_psr_status");
+
+	ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
 				      sizeof(buf));
 	if (ret < 1)
 		return false;
 
-	if (mode == PSR_MODE_1)
-		return strstr(buf, "Sink_Support: yes\n") ||
-		       strstr(buf, "Sink support: yes");
-	else
-		/*
-		 * i915 requires PSR version 0x03 that is PSR2 + SU with
-		 * Y-coordinate to support PSR2
-		 *
-		 * or
-		 *
-		 * PSR version 0x4 that is PSR2 + SU w/ Y-coordinate and SU
-		 * Region Early Transport to support PSR2 (eDP 1.5)
-		 */
-		return strstr(buf, "Sink support: yes [0x03]") ||
-		       strstr(buf, "Sink support: yes [0x04]");
+	line = strstr(buf, "Sink support: ");
+	if (!line)
+		return false;
+
+	switch (mode) {
+		case PSR_MODE_1:
+			return strstr(line, "PSR = yes") ||
+			       strstr(buf, "Sink_Support: yes\n") ||
+			       strstr(buf, "Sink support: yes");
+		case PSR_MODE_2:
+		case PSR_MODE_2_SEL_FETCH:
+			/*
+			 * i915 requires PSR version 0x03 that is PSR2 + SU with
+			 * Y-coordinate to support PSR2
+			 * or
+			 *
+			 * PSR version 0x4 that is PSR2 + SU w/ Y-coordinate and SU
+			 * Region Early Transport to support PSR2 (eDP 1.5)
+			 */
+			return strstr(line, "PSR = yes") &&
+			       (strstr(line, "[0x03]") || strstr(line, "[0x04]"));
+		case PR_MODE:
+			return strstr(line, "Panel Replay = yes");
+		case PR_MODE_SEL_FETCH:
+			return strstr(line, "Panel Replay = yes") &&
+			       strstr(buf, "PSR2 selective fetch: enabled");
+		default:
+			igt_assert_f(false, "Invalid psr mode\n");
+			return false;
+	}
 }
 
 #define PSR2_SU_BLOCK_STR_LOOKUP "PSR2 SU blocks:\n0\t"
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index 243154897..e213b05e9 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -27,6 +27,7 @@
 #include "igt_debugfs.h"
 #include "igt_core.h"
 #include "igt_aux.h"
+#include "igt_kms.h"
 
 #define PSR_STATUS_MAX_LEN 512
 
@@ -46,7 +47,7 @@ bool psr_wait_update(int debugfs_fd, enum psr_mode mode);
 bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode);
 bool psr_enable(int device, int debugfs_fd, enum psr_mode);
 bool psr_disable(int device, int debugfs_fd);
-bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode);
+bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr2_wait_su(int debugfs_fd, uint16_t *num_su_blocks);
 void psr_print_debugfs(int debugfs_fd);
 enum psr_mode psr_get_mode(int debugfs_fd);
diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index cc9529178..f7ff1ac0b 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -92,7 +92,7 @@ static bool check_support(data_t *data)
 		    DRM_MODE_CONNECTOR_eDP)
 			return false;
 		return psr_sink_support(data->drm_fd, data->debugfs_fd,
-					PSR_MODE_1);
+					PSR_MODE_1, NULL);
 	case FEATURE_DRRS:
 		return intel_is_drrs_supported(data->drm_fd, data->pipe) &&
 			intel_output_has_drrs(data->drm_fd, data->output);
diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index 8d6bb3cb6..a7f24e669 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -269,7 +269,7 @@ static bool psr_is_disabled(int debugfs_fd)
 
 static bool psr_supported_on_chipset(int device, int debugfs_fd)
 {
-	return psr_sink_support(device, debugfs_fd, PSR_MODE_1);
+	return psr_sink_support(device, debugfs_fd, PSR_MODE_1, NULL);
 }
 
 static bool psr_wait_until_update(struct drm_info *drm)
@@ -280,7 +280,7 @@ static bool psr_wait_until_update(struct drm_info *drm)
 static void disable_features(int device, int debugfs_fd)
 {
 	igt_set_module_param_int(device, "enable_fbc", 0);
-	if (psr_sink_support(device, debugfs_fd, PSR_MODE_1))
+	if (psr_sink_support(device, debugfs_fd, PSR_MODE_1, NULL))
 		psr_disable(device, debugfs_fd);
 }
 
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index be340a997..3cfa22bbf 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1383,7 +1383,7 @@ static void setup_psr(void)
 		return;
 	}
 
-	if (!psr_sink_support(drm.fd, drm.debugfs, PSR_MODE_1)) {
+	if (!psr_sink_support(drm.fd, drm.debugfs, PSR_MODE_1, NULL)) {
 		igt_info("Can't test PSR: not supported by sink.\n");
 		return;
 	}
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 1e9ca5d6c..e5daacb84 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -673,14 +673,16 @@ igt_main
 	igt_describe("In this test we make sure that system enters DC3CO "
 		     "when PSR2 is active and system is in SLEEP state");
 	igt_subtest("dc3co-vpb-simulation") {
-		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd, PSR_MODE_2));
+		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+					     PSR_MODE_2, NULL));
 		test_dc3co_vpb_simulation(&data);
 	}
 
 	igt_describe("This test validates display engine entry to DC5 state "
 		     "while PSR is active");
 	igt_subtest("dc5-psr") {
-		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd, PSR_MODE_1));
+		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+					     PSR_MODE_1, NULL));
 		data.op_psr_mode = PSR_MODE_1;
 		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode);
 		test_dc_state_psr(&data, CHECK_DC5);
@@ -689,7 +691,8 @@ igt_main
 	igt_describe("This test validates display engine entry to DC6 state "
 		     "while PSR is active");
 	igt_subtest("dc6-psr") {
-		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd, PSR_MODE_1));
+		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+					     PSR_MODE_1, NULL));
 		data.op_psr_mode = PSR_MODE_1;
 		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode);
 		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index ffecc5222..260095aec 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -433,7 +433,7 @@ static void fill_render(data_t *data, const struct igt_fb *fb,
 static bool sink_support(data_t *data, enum psr_mode mode)
 {
 	return data->with_psr_disabled ||
-	       psr_sink_support(data->drm_fd, data->debugfs_fd, mode);
+	       psr_sink_support(data->drm_fd, data->debugfs_fd, mode, NULL);
 }
 
 static bool psr_wait_entry_if_enabled(data_t *data)
diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index d7a746211..2d05f1110 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -980,7 +980,8 @@ igt_main
 		kmstest_set_vt_graphics_mode();
 
 		igt_require_f(psr_sink_support(data.drm_fd,
-					       data.debugfs_fd, PSR_MODE_2),
+					       data.debugfs_fd, PSR_MODE_2,
+					       NULL),
 			      "Sink does not support PSR2\n");
 
 		display_init(&data);
diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
index 834fec1ec..2f89de435 100644
--- a/tests/intel/kms_psr2_su.c
+++ b/tests/intel/kms_psr2_su.c
@@ -327,7 +327,8 @@ igt_main
 		kmstest_set_vt_graphics_mode();
 
 		igt_require_f(psr_sink_support(data.drm_fd,
-					       data.debugfs_fd, PSR_MODE_2),
+					       data.debugfs_fd,
+					       PSR_MODE_2, NULL),
 			      "Sink does not support PSR2\n");
 
 		igt_require_f(intel_display_ver(intel_get_drm_devid(data.drm_fd)) < 13,
diff --git a/tests/intel/kms_psr_stress_test.c b/tests/intel/kms_psr_stress_test.c
index b6759eece..beded3b94 100644
--- a/tests/intel/kms_psr_stress_test.c
+++ b/tests/intel/kms_psr_stress_test.c
@@ -357,7 +357,7 @@ igt_main
 		kmstest_set_vt_graphics_mode();
 
 		igt_require_f(psr_sink_support(data.drm_fd, data.debugfs_fd,
-					       PSR_MODE_1),
+					       PSR_MODE_1, NULL),
 			      "Sink does not support PSR\n");
 
 		setup_output(&data);
diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index 3a1f6d21d..428f97ffe 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -159,12 +159,12 @@ igt_main {
 
 		igt_describe("Make sure that we have eDP panel with PSR1 support.");
 		igt_subtest("psr1") {
-			igt_require(psr_sink_support(fd, debugfs_fd, PSR_MODE_1));
+			igt_require(psr_sink_support(fd, debugfs_fd, PSR_MODE_1, NULL));
 		}
 
 		igt_describe("Make sure that we have eDP panel with PSR2 support.");
 		igt_subtest("psr2") {
-			igt_require(psr_sink_support(fd, debugfs_fd, PSR_MODE_2));
+			igt_require(psr_sink_support(fd, debugfs_fd, PSR_MODE_2, NULL));
 		}
 
 		igt_describe("Make sure that we have DP-MST configuration.");
-- 
2.25.1
