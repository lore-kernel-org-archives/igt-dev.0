Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E423610E5AE
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 12:36:20 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Mar 2023 15:36:17 +0300
Message-Id: <20230327123617.24000-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_psr: Try all modes on the
 connector
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Certain panels have a preferred mode with a vblank that is
too short for the PSR setup time, but also expose an alternate
lower refresh rate mode where PSR is actually possible.
Go through all the modes until one is found where PSR works.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/i915/kms_psr.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/tests/i915/kms_psr.c b/tests/i915/kms_psr.c
index c92902343ea3..3efe1faec8e7 100644
--- a/tests/i915/kms_psr.c
+++ b/tests/i915/kms_psr.c
@@ -109,7 +109,6 @@ static void setup_output(data_t *data)
 
 		data->crtc_id = output->config.crtc->crtc_id;
 		data->output = output;
-		data->mode = igt_output_get_mode(output);
 
 		return;
 	}
@@ -369,6 +368,8 @@ static void test_cleanup(data_t *data)
 {
 	igt_plane_t *primary;
 
+	igt_output_override_mode(data->output, NULL);
+
 	primary = igt_output_get_plane_type(data->output,
 					    DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
@@ -440,17 +441,33 @@ static void setup_test_plane(data_t *data, int test_plane)
 
 static void test_setup(data_t *data)
 {
+	drmModeConnectorPtr connector;
+	bool psr_entered = false;
+
 	igt_require_f(data->output,
 		      "No available output found\n");
-	igt_require_f(data->mode,
-		      "No available mode found on %s\n",
-		      data->output->name);
-	if (data->op_psr_mode == PSR_MODE_2)
-		igt_require(data->supports_psr2);
-
-	psr_enable_if_enabled(data);
-	setup_test_plane(data, data->test_plane_id);
-	igt_assert(psr_wait_entry_if_enabled(data));
+
+	connector = data->output->config.connector;
+
+	for (int i = 0; i < connector->count_modes; i++) {
+		data->mode = &connector->modes[i];
+		igt_info("Testing mode:\n");
+		kmstest_dump_mode(data->mode);
+
+		igt_output_override_mode(data->output, data->mode);
+
+		if (data->op_psr_mode == PSR_MODE_2)
+			igt_require(data->supports_psr2);
+
+		psr_enable_if_enabled(data);
+		setup_test_plane(data, data->test_plane_id);
+		if (psr_wait_entry_if_enabled(data)) {
+			psr_entered = true;
+			break;
+		}
+	}
+
+	igt_assert(psr_entered);
 }
 
 static void dpms_off_on(data_t *data)
-- 
2.39.2
