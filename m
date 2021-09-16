Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06CF6EE1F
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Sep 2021 15:35:23 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu, 16 Sep 2021 18:35:11 +0300
Message-Id: <20210916153515.21369-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20210916153515.21369-1-ville.syrjala@linux.intel.com>
References: <20210916153515.21369-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/6] tests/kms_invalid_mode: Convert the max
 dotclock test into a subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We want to add different subtests to kms_invalud_mode. Convert
the current max dotclock test into a subtest.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/i915/kms_invalid_mode.c | 80 +++++++++++++++++++++++++----------
 1 file changed, 57 insertions(+), 23 deletions(-)

diff --git a/tests/i915/kms_invalid_mode.c b/tests/i915/kms_invalid_mode.c
index dc30e6bb5444..8b24993e40a3 100644
--- a/tests/i915/kms_invalid_mode.c
+++ b/tests/i915/kms_invalid_mode.c
@@ -27,13 +27,16 @@
 
 IGT_TEST_DESCRIPTION("Make sure all modesets are rejected when the requested mode is invalid");
 
-typedef struct {
+typedef struct _data data_t;
+
+struct _data {
 	int drm_fd;
 	igt_display_t display;
 	igt_output_t *output;
 	drmModeResPtr res;
 	int max_dotclock;
-} data_t;
+	bool (*adjust_mode)(data_t *data, drmModeModeInfoPtr mode);
+};
 
 static bool has_scaling_mode_prop(data_t *data)
 {
@@ -63,13 +66,10 @@ can_bigjoiner(data_t *data)
 	return false;
 }
 
-static int
-test_output(data_t *data)
+static bool
+adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode)
 {
-	igt_output_t *output = data->output;
-	drmModeModeInfo mode;
-	struct igt_fb fb;
-	int i;
+	igt_require(data->max_dotclock != 0);
 
 	/*
 	 * FIXME When we have a fixed mode, the kernel will ignore
@@ -80,14 +80,28 @@ test_output(data_t *data)
 	 * test on  any connector with a fixed mode.
 	 */
 	if (has_scaling_mode_prop(data))
-		return 0;
+		return false;
+
+	mode->clock = data->max_dotclock + 1;
+
+	return true;
+}
+
+static int
+test_output(data_t *data)
+{
+	igt_output_t *output = data->output;
+	drmModeModeInfo mode;
+	struct igt_fb fb;
+	int i;
 
 	/*
 	 * FIXME test every mode we have to be more
 	 * sure everything is really getting rejected?
 	 */
 	mode = *igt_output_get_mode(output);
-	mode.clock = data->max_dotclock + 1;
+	if (!data->adjust_mode(data, &mode))
+		return 0;
 
 	/*
 	 * Newer platforms can support modes higher than the maximum dot clock
@@ -154,25 +168,45 @@ static int i915_max_dotclock(data_t *data)
 	return max_dotclock;
 }
 
+static const struct {
+	const char *name;
+	bool (*adjust_mode)(data_t *data, drmModeModeInfoPtr mode);
+} subtests[] = {
+	{ .name = "clock-too-high",
+	  .adjust_mode = adjust_mode_clock_too_high,
+	},
+};
+
 static data_t data;
 
-igt_simple_main
+igt_main
 {
-	data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
-	igt_require_intel(data.drm_fd);
+	igt_fixture {
+		igt_skip_on_simulation();
 
-	kmstest_set_vt_graphics_mode();
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		igt_require_intel(data.drm_fd);
 
-	igt_display_require(&data.display, data.drm_fd);
-	data.res = drmModeGetResources(data.drm_fd);
-	igt_assert(data.res);
+		kmstest_set_vt_graphics_mode();
 
-	data.max_dotclock = i915_max_dotclock(&data);
-	igt_info("Max dotclock: %d kHz\n", data.max_dotclock);
+		igt_display_require(&data.display, data.drm_fd);
+		data.res = drmModeGetResources(data.drm_fd);
+		igt_assert(data.res);
 
-	test(&data);
+		data.max_dotclock = i915_max_dotclock(&data);
+		igt_info("Max dotclock: %d kHz\n", data.max_dotclock);
+	}
 
-	igt_display_fini(&data.display);
-	igt_reset_connectors();
-	drmModeFreeResources(data.res);
+	for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
+		igt_subtest(subtests[i].name) {
+			data.adjust_mode = subtests[i].adjust_mode;
+			test(&data);
+		}
+	}
+
+	igt_fixture {
+		igt_display_fini(&data.display);
+		igt_reset_connectors();
+		drmModeFreeResources(data.res);
+	}
 }
-- 
2.32.0
