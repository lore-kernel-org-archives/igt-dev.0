Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30AD10F62F
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 12:01:31 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 31 May 2022 17:28:04 +0530
Message-Id: <20220531115805.3941871-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20220531115805.3941871-1-bhanuprakash.modem@intel.com>
References: <20220531115805.3941871-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V4 2/3] tests/kms_hdr: Skip if current & requested BPC
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
* Drop 4K restriction check

Cc: Swati Sharma <swati2.sharma@intel.com>
CC: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_hdr.c | 51 +++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index fb2e0790..6790f26f 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -144,8 +144,6 @@ static void test_bpc_switch_on_output(data_t *data, enum pipe pipe,
 	igt_fb_t afb;
 	int afb_id, ret;
 
-	prepare_test(data, output, pipe);
-
 	/* 10-bit formats are slow, so limit the size. */
 	afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
 	igt_assert(afb_id);
@@ -206,6 +204,33 @@ static bool has_max_bpc(igt_output_t *output)
 	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
 }
 
+static bool i915_clock_constraint(data_t *data, int bpc)
+{
+	igt_output_t *output = data->output;
+	drmModeConnector *connector = output->config.connector;
+
+	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, bpc);
+	igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
+
+	for_each_connector_mode(output) {
+		igt_output_override_mode(output, &connector->modes[j__]);
+		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		if (!igt_check_output_bpc_equal(data->fd, data->pipe_id,
+						data->output->name, bpc))
+			continue;
+
+		data->mode = igt_output_get_mode(output);
+		data->w = data->mode->hdisplay;
+		data->h = data->mode->vdisplay;
+
+		return true;
+	}
+
+	test_fini(data);
+	return false;
+}
+
 static void test_bpc_switch(data_t *data, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
@@ -217,8 +242,17 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 		if (!has_max_bpc(output))
 			continue;
 
+		if (igt_get_output_max_bpc(data->fd, output->name) < 10)
+			continue;
+
 		for_each_pipe(display, pipe) {
 			if (igt_pipe_connector_valid(pipe, output)) {
+				prepare_test(data, output, pipe);
+
+				if (is_i915_device(data->fd) &&
+				    !i915_clock_constraint(data, 10))
+					break;
+
 				igt_dynamic_f("pipe-%s-%s",
 					      kmstest_pipe_name(pipe), output->name)
 					test_bpc_switch_on_output(data, pipe, output, flags);
@@ -367,8 +401,6 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
 	igt_fb_t afb;
 	int afb_id;
 
-	prepare_test(data, output, pipe);
-
 	/* 10-bit formats are slow, so limit the size. */
 	afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
 	igt_assert(afb_id);
@@ -446,8 +478,6 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output)
 	int afb_id;
 	struct hdr_output_metadata hdr;
 
-	prepare_test(data, output, pipe);
-
 	/* 10-bit formats are slow, so limit the size. */
 	afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
 	igt_assert(afb_id);
@@ -532,8 +562,17 @@ static void test_hdr(data_t *data, uint32_t flags)
 		if (!is_panel_hdr(data, output))
 			continue;
 
+		if (igt_get_output_max_bpc(data->fd, output->name) < 10)
+			continue;
+
 		for_each_pipe(display, pipe) {
 			if (igt_pipe_connector_valid(pipe, output)) {
+				prepare_test(data, output, pipe);
+
+				if (is_i915_device(data->fd) &&
+				    !i915_clock_constraint(data, 10))
+					break;
+
 				igt_dynamic_f("pipe-%s-%s",
 					      kmstest_pipe_name(pipe), output->name) {
 					if (flags & TEST_NONE || flags & TEST_DPMS || flags & TEST_SUSPEND)
-- 
2.35.1
