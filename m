Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A96C47DAF
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 16:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8D010E880;
	Thu, 18 Jan 2024 16:19:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAB210E880
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 16:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705594751; x=1737130751;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3Tqh9xlNXQqOfJdo9QZFbZ3KsHH6MQA+hMedrbfkAVg=;
 b=BS7sotJNiNBosPsOInV26pXXiUUVTpk2t+HD/JckvZzCjZ3sOfEU1eof
 l2+2c2DK5iPCUVoL7sE+WlXc4u9qRvSMhYFo8dzCfzpTh3bZP0fA4WVQz
 dRKVM1Bg2j8+lCvfjl+TIS3Q/DCghoWaNUaomYuPAbPH2kLeaqmw/OjIi
 +lMogme5e5tR+MtaCC5nlQ1JJ09QEFd1ro/Cc655idJGyB7vEAAQy8gN+
 9awesl6PKK1HMBHs093gglHBbE64OAMgNT+roV+Y4kc6ScKPZFisi/7hz
 3cRE2hcAxiemvPg7j9y/M7+pbf4pzlHgogrs/Ta7d75CUPWQS7aGwwzOk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="13845440"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="13845440"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 08:19:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="33147706"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 08:19:09 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] Add a new test to validate the deep sleep state during
 extended vblank
Date: Thu, 18 Jan 2024 21:51:00 +0530
Message-Id: <20240118162100.797712-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: suraj.kandpal@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add a new test to validate deep sleep states during extended vblank
scenarios, where two frames are committed simultaneously for a give
time with reduced refresh rate.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 262 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 262 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 0d5824e67..da5d0e819 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -74,6 +74,10 @@
  * Description: This test validates display engine entry to DC6 state while PSR is active
  * Functionality: pm_dc, psr1
  *
+ * SUBTEST: deep-pkgc
+ * Description: This test validates display engine entry to Deep PKGC state for extended vblank
+ * Functionality: pm_dc
+ *
  * SUBTEST: dc9-dpms
  * Description: This test validates display engine entry to DC9 state
  */
@@ -89,6 +93,14 @@
 #define PACKAGE_CSTATE_PATH  "pmc_core/package_cstate_show"
 #define KMS_POLL_DISABLE 0
 #define DC9_RESETS_DC_COUNTERS(devid) (!(IS_DG1(devid) || IS_DG2(devid) || AT_LEAST_DISPLAY(devid, 14)))
+#define DRM_MODE_FMT    "\"%s\": %d %d %d %d %d %d %d %d %d %d 0x%x 0x%x"
+#define NSECS_PER_SEC (1000000000ull)
+#define TEST_DURATION_NS (5000000000ull)
+#define DRM_MODE_ARG(m) \
+                (m)->name, (m)->vrefresh, (m)->clock, \
+                (m)->hdisplay, (m)->hsync_start, (m)->hsync_end, (m)->htotal, \
+                (m)->vdisplay, (m)->vsync_start, (m)->vsync_end, (m)->vtotal, \
+                (m)->type, (m)->flags
 
 IGT_TEST_DESCRIPTION("Tests to validate display power DC states.");
 
@@ -98,6 +110,11 @@ typedef struct {
 	double r, g, b;
 } color_t;
 
+typedef struct range {
+        unsigned int min;
+        unsigned int max;
+} range_t;
+
 typedef struct {
 	int drm_fd;
 	int msr_fd;
@@ -110,12 +127,32 @@ typedef struct {
 	enum psr_mode op_psr_mode;
 	drmModeModeInfo *mode;
 	igt_output_t *output;
+	range_t range;
 	bool runtime_suspend_disabled;
+	igt_plane_t *primary;
 } data_t;
 
+typedef struct vtest_ns {
+        uint64_t min;
+        uint64_t mid;
+        uint64_t max;
+} vtest_ns_t;
+
 static bool dc_state_wait_entry(int drm_fd, int dc_flag, int prev_dc_count);
 static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
 
+/* Returns true if driver supports VRR. */
+static bool has_vrr(igt_output_t *output)
+{
+        return igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE);
+}
+
+/* Returns true if an output supports VRR. */
+static bool vrr_capable(igt_output_t *output)
+{
+        return igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE);
+}
+
 static void setup_output(data_t *data)
 {
 	igt_display_t *display = &data->display;
@@ -136,6 +173,53 @@ static void setup_output(data_t *data)
 	}
 }
 
+/* Read min and max vrr range from the connector debugfs. */
+static range_t
+get_vrr_range(data_t *data, igt_output_t *output)
+{
+        char buf[256];
+        char *start_loc;
+        int fd, res;
+        range_t range;
+
+        fd = igt_debugfs_connector_dir(data->drm_fd, output->name, O_RDONLY);
+        igt_assert(fd >= 0);
+
+        res = igt_debugfs_simple_read(fd, "vrr_range", buf, sizeof(buf));
+        igt_require(res > 0);
+
+        close(fd);
+
+        igt_assert(start_loc = strstr(buf, "Min: "));
+        igt_assert_eq(sscanf(start_loc, "Min: %u", &range.min), 1);
+
+        igt_assert(start_loc = strstr(buf, "Max: "));
+        igt_assert_eq(sscanf(start_loc, "Max: %u", &range.max), 1);
+
+        return range;
+}
+
+/* Instead of running on default mode, loop through the connector modes
+ * and find the mode with max refresh rate to exercise full vrr range.
+ */
+static drmModeModeInfo
+output_mode_with_maxrate(igt_output_t *output, unsigned int vrr_max)
+{
+        int i;
+        drmModeConnectorPtr connector = output->config.connector;
+        drmModeModeInfo mode = *igt_output_get_mode(output);
+
+        igt_debug("Default Mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(&mode));
+
+        for (i = 0; i < connector->count_modes; i++)
+                if (connector->modes[i].vrefresh > mode.vrefresh &&
+                    connector->modes[i].vrefresh <= vrr_max)
+                        mode = connector->modes[i];
+        igt_debug("Override Mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(&mode));
+
+        return mode;
+}
+
 static void display_fini(data_t *data)
 {
 	igt_display_fini(&data->display);
@@ -582,6 +666,173 @@ static unsigned int read_pkgc_counter(int debugfs_root_fd)
 	return get_dc_counter(str);
 }
 
+/* Converts a timespec structure to nanoseconds. */
+static uint64_t timespec_to_ns(struct timespec *ts)
+{
+        return ts->tv_sec * NSECS_PER_SEC + ts->tv_nsec;
+}
+
+/*
+ * Returns the current CLOCK_MONOTONIC time in nanoseconds.
+ * The regular IGT helpers can't be used since they default to
+ * CLOCK_MONOTONIC_RAW - which isn't what the kernel uses for its timestamps.
+ */
+static uint64_t get_time_ns(void)
+{
+        struct timespec ts;
+        memset(&ts, 0, sizeof(ts));
+        errno = 0;
+
+        if (!clock_gettime(CLOCK_MONOTONIC, &ts))
+                return timespec_to_ns(&ts);
+
+        igt_warn("Could not read monotonic time: %s\n", strerror(errno));
+        igt_fail(-errno);
+
+        return 0;
+}
+
+/*
+ * Gets an event from DRM and returns its timestamp in nanoseconds.
+ * Asserts if the event from DRM is not matched with requested one.
+ *
+ * This blocks until the event is received.
+ */
+static uint64_t get_kernel_event_ns(data_t *data, uint32_t event)
+{
+        struct drm_event_vblank ev;
+
+        igt_set_timeout(1, "Waiting for an event\n");
+        igt_assert_eq(read(data->drm_fd, &ev, sizeof(ev)), sizeof(ev));
+        igt_assert_eq(ev.base.type, event);
+        igt_reset_timeout();
+
+        return ev.tv_sec * NSECS_PER_SEC + ev.tv_usec * 1000ull;
+}
+
+/* Performs an atomic non-blocking page-flip on a pipe. */
+static void
+do_flip(data_t *data, igt_fb_t *fb)
+{
+        int ret;
+
+        igt_set_timeout(1, "Scheduling page flip\n");
+
+        igt_plane_set_fb(data->primary, fb);
+
+        do {
+                ret = igt_display_try_commit_atomic(&data->display,
+                                  DRM_MODE_ATOMIC_NONBLOCK |
+                                  DRM_MODE_PAGE_FLIP_EVENT,
+                                  data);
+        } while (ret == -EBUSY);
+
+        igt_assert_eq(ret, 0);
+        igt_reset_timeout();
+}
+
+/* Prepare the display for testing on the given pipe. */
+static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
+{
+        drmModeModeInfo mode;
+        cairo_t *cr;
+
+        mode = *igt_output_get_mode(output);
+
+        /* Prepare resources */
+        igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
+                            DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+                            0.50, 0.50, 0.50, &data->fb_rgb);
+
+        igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
+                            DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+                            0.50, 0.50, 0.50, &data->fb_rgr);
+
+        cr = igt_get_cairo_ctx(data->drm_fd, &data->fb_rgb);
+
+        igt_paint_color(cr, 0, 0, mode.hdisplay / 10, mode.vdisplay / 10,
+                        1.00, 0.00, 0.00);
+
+        igt_put_cairo_ctx(cr);
+
+        /* Take care of any required modesetting before the test begins. */
+        data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+        igt_plane_set_fb(data->primary, &data->fb_rgb);
+
+        /* Clear vrr_enabled state before enabling it, because
+         * it might be left enabled if the previous test fails.
+         */
+        igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, 0);
+
+        igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
+static void test_deep_pkgc_state(data_t *data)
+{
+        unsigned int pre_val = 0, cur_val = 0;
+        bool flag, front = false, pkgc_flag = false;
+        uint64_t start_ns, target_ns, event_ns;
+        drmModeModeInfo mode;
+        enum pipe pipe;
+        igt_display_t *display = &data->display;
+        igt_output_t *output;
+
+	pre_val = read_pkgc_counter(data->debugfs_root_fd);
+        psr_dpms(data, DRM_MODE_DPMS_OFF);
+
+	for_each_pipe_with_valid_output(display, pipe, output) {
+                igt_display_reset(display);
+                igt_output_set_pipe(output, pipe);
+                data->output = output;
+                data->mode = igt_output_get_mode(output);
+                igt_require(has_vrr(data->output));
+                if (!vrr_capable(data->output)) {
+                        flag = false;
+			continue;
+                }
+
+                /* Capture VRR range */
+                data->range = get_vrr_range(data, data->output);
+                /* Override mode with max vrefresh.
+                 *   - vrr_min range should be less than the override mode vrefresh.
+                 *   - Limit the vrr_max range with the override mode vrefresh.
+                 */
+                mode = output_mode_with_maxrate(data->output, data->range.max);
+                igt_require(mode.vrefresh > data->range.min);
+                data->range.max = mode.vrefresh;
+                igt_output_override_mode(data->output, &mode);
+                prepare_test(data, output, pipe);
+                data->primary = igt_output_get_plane_type(data->output,
+                                            DRM_PLANE_TYPE_PRIMARY);
+		target_ns = NSECS_PER_SEC / (data->range.max - 10);
+		do_flip(data, &data->fb_rgb);
+		start_ns = get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
+
+		while(event_ns - start_ns > TEST_DURATION_NS) {
+			front = !front;
+			do_flip(data, front ? &data->fb_rgb : &data->fb_rgr);
+			event_ns = get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
+
+			cur_val = read_pkgc_counter(data->debugfs_root_fd);
+			if (cur_val > pre_val) {
+				pkgc_flag = true;
+			}
+
+			if ( pkgc_flag == true)
+				break;
+			while (get_time_ns() < target_ns);
+		}
+
+                psr_dpms(data, DRM_MODE_DPMS_ON);
+                cleanup_dc3co_fbs(data);
+        }
+
+        if (flag)
+                igt_skip("No connector with VRR found\n");
+	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");
+
+}
+
 static void test_pkgc_state_dpms(data_t *data)
 {
 	unsigned int timeout_sec = 6;
@@ -669,6 +920,17 @@ igt_main
 		test_dc_state_psr(&data, CHECK_DC5);
 	}
 
+	igt_describe("This test validates display engine entry to DC8 state "
+		     "while extended vblank");
+	igt_subtest("deep-pkgc") {
+		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
+			      "PC8+ residencies not supported\n");
+		if (intel_display_ver(data.devid) >= 20)
+			test_deep_pkgc_state(&data);
+		else
+			igt_skip("Deep PKGC not supported on this platform");
+	}
+
 	igt_describe("This test validates display engine entry to DC6 state "
 		     "while PSR is active");
 	igt_subtest("dc6-psr") {
-- 
2.25.1

