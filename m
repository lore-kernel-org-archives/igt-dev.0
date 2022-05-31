Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA3C10F62F
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 12:01:32 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 31 May 2022 17:28:05 +0530
Message-Id: <20220531115805.3941871-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20220531115805.3941871-1-bhanuprakash.modem@intel.com>
References: <20220531115805.3941871-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V4 3/3] tests/kms_color: Skip if current & requested BPC
 doesn't match
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

The "max bpc" property only ensures that the bpc will not go beyond
the value set through this property. It does not guarantee that the
same bpc will be used for the given mode.

If clock/bandwidth constraints permit, the max bpc will be used to
show the mode, otherwise the bpc will be reduced. So, if we really
want a particular bpc set, we can try reducing the resolution, till
we get the bpc that we set in max bpc property.

This patch will skip the test, if there is no valid resolution to get
the same bpc as set by max_bpc property.

V2:
* Refactor the logic
V3:
* Minor changes
V4:
* Set output to pipe (igt_output_set_pipe)

Cc: Swati Sharma <swati2.sharma@intel.com>
CC: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_color.c | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 93957f50..ba06947b 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -635,6 +635,28 @@ static void test_pipe_limited_range_ctm(data_t *data,
 }
 #endif
 
+static bool i915_clock_constraint(data_t *data, enum pipe pipe, int bpc)
+{
+	igt_output_t *output = data->output;
+	drmModeConnector *connector = output->config.connector;
+
+	igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
+
+	for_each_connector_mode(output) {
+		igt_output_override_mode(output, &connector->modes[j__]);
+		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		if (!igt_check_output_bpc_equal(data->drm_fd, pipe,
+						data->output->name, bpc))
+			continue;
+
+		return true;
+	}
+
+	igt_output_override_mode(output, NULL);
+	return false;
+}
+
 static void
 prep_pipe(data_t *data, enum pipe p)
 {
@@ -866,6 +888,9 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	igt_subtest_f("pipe-%s-legacy-gamma-reset", kmstest_pipe_name(p))
 		test_pipe_legacy_gamma_reset(data, primary);
 
+	igt_fixture
+		igt_require(data->display.is_atomic);
+
 	igt_describe("Verify that deep color works correctly");
 	igt_subtest_with_dynamic_f("pipe-%s-deep-color", kmstest_pipe_name(p)) {
 		igt_output_t *output;
@@ -896,12 +921,12 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 			data->drm_format = DRM_FORMAT_XRGB2101010;
 			data->output = output;
 			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
-			igt_display_commit(&data->display);
+			igt_output_set_pipe(output, p);
+			igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
-			if (!igt_check_output_bpc_equal(data->drm_fd, p, output->name, 10)) {
-				igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, max_bpc);
-				igt_fail_on_f(true, "Failed to set max_bpc as: 10\n");
-			}
+			if (is_i915_device(data->drm_fd) &&
+			    !i915_clock_constraint(data, p, 10))
+				continue;
 
 			igt_dynamic_f("gamma-%s", output->name) {
 				ret = test_pipe_gamma(data, primary);
-- 
2.35.1
