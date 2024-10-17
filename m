Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91645D2127D
	for <igt-dev@archiver.kernel.org>; Thu, 17 Oct 2024 11:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E34910E7ED;
	Thu, 17 Oct 2024 11:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yz5TDXmc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079CA10E319
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 11:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729164036; x=1760700036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=49t1NzKDD3gb6ecKkf8wcfVH8BpqtFrEfawg+Zkty/k=;
 b=Yz5TDXmcys85v4jm85x32DdQMrkatvMk0QUAmAAZ7qF1gWxoQZGDCcoB
 6PF3MRrQ3iN/JMjeZeTLoil/89VZZeFiN7UgB57JGEyJl/aQHfoFGAIua
 9lQbdzWoEEiaNvZZ1FwPMzmn4D9DHAh0aZmIqobHGdH6PYw2UedaeLJj/
 +7tKPkGkmPQeFSuPCpZ67i3HEGliF6ZvfCUHxQwtDSlreT3Zk5ACwcLvY
 sFz2s//EuNMGIOU24t0DXcQzNRQzoVYWtfaGHX44K/MP55833KYlo13dt
 uPIp4i+Rfj3i/w+CqlZ+5OM8PWatxT83cJ6unUUL6Z4un56Yf/Tm5+c/1 w==;
X-CSE-ConnectionGUID: s8BcbWjGTu+ZtVEKV7jPZg==
X-CSE-MsgGUID: yMqeRCiVTaehxzb14Rr5cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="28736085"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="28736085"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 04:20:36 -0700
X-CSE-ConnectionGUID: vRnsQjfsQne91CTDedWbzw==
X-CSE-MsgGUID: rbAwYS3mRmaPDtzSteFwsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="78953179"
Received: from lnl-rocket-lake-client-platform.iind.intel.com
 ([10.145.169.162])
 by orviesa007.jf.intel.com with ESMTP; 17 Oct 2024 04:20:34 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Adarsh G M <adarsh.g.m@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t v3] tests/kms_histogram: Added IGT support to validate
 global histogram
Date: Thu, 17 Oct 2024 16:50:09 +0530
Message-Id: <20241017112009.140989-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240924122533.494165-1-mohammed.thasleem@intel.com>
References: <20240924122533.494165-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

The IGT changes included tests for enabling/disabling histogram.
Validating the histogram event generation and if any One such library
Global Histogram Enhancement(GHE) present, will feed the histogram to
the library, get the enhanced LUT data and feed it back to the KMD.
For histogram generation, black/white and color images are flipped.

   Display histogram is a hardware functionality where a statistics for 'x'
number of frames is generated to form a histogram data. This is notified
to the user via histogram event. Compositor then upon sensing the histogram
event will read the histogram data from KMD via crtc property.

A library can be developed to take this generated histogram as an input and
apply some algorithm to generate an Image Enhancement(IET).

This is further fed back to the KMD via crtc property. KMD will feed this
bask to the hardware. Hardware will use this as a multiplicand factor to
multiply with the incoming pixels at the end of the pipe which is then
pushed onto the display.

One such library Global Histogram Enhancement(GHE) will take the histogram
as input and applied the algorithm to enhance the density and then return
the enhanced factor.
"This library can be located https://github.com/intel/ghe"
"KMD changes at https://patchwork.freedesktop.org/series/135793/"

TODO: Extend the tests for different formats/modifiers.

v2: Remove eDP restriction. (Vandita)
    Update crtc property name. (Arun)
v3: Update discription and test names. (Kamil)
    Remove warning message from meson build. (Kamil)

Signed-off-by: Adarsh G M <adarsh.g.m@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c         |  23 +++
 lib/igt_kms.h         |   5 +
 meson.build           |   5 +
 tests/kms_histogram.c | 349 ++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build     |   2 +
 5 files changed, 384 insertions(+)
 create mode 100644 tests/kms_histogram.c

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index bb35d4b82..76d2612d0 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -702,6 +702,9 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
 	[IGT_CRTC_OUT_FENCE_PTR] = "OUT_FENCE_PTR",
 	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
 	[IGT_CRTC_SCALING_FILTER] = "SCALING_FILTER",
+	[IGT_CRTC_HISTOGRAM] = "Histogram_Enable",
+	[IGT_CRTC_GLOBAL_HISTOGRAM] = "Global Histogram",
+	[IGT_CRTC_GLOBAL_HIST_PIXEL_FACTOR] = "Global IET",
 };
 
 const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
@@ -2587,6 +2590,9 @@ static void igt_pipe_reset(igt_pipe_t *pipe)
 	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_SCALING_FILTER))
 		igt_pipe_obj_set_prop_enum(pipe, IGT_CRTC_SCALING_FILTER, "Default");
 
+	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_HISTOGRAM))
+		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_HISTOGRAM, 0);
+
 	pipe->out_fence_fd = -1;
 }
 
@@ -5615,6 +5621,23 @@ bool igt_lease_change_detected(struct udev_monitor *mon, int timeout_secs)
 			      ARRAY_SIZE(props));
 }
 
+/**
+ * igt_global_histogram_event_detected:
+ * @mon: A udev monitor initialized with #igt_watch_uevents
+ * @timeout_secs: How long to wait for a lease change event to occur.
+ *
+ * Detect if a global Histogram event was received since we last checked the monitor.
+ *
+ * Returns: true if a sysfs global Histogram event was received, false if we timed out
+ */
+bool igt_global_histogram_event_detected(struct udev_monitor *mon, int timeout_secs)
+{
+	const char *props[1] = {"HISTOGRAM"};
+	int expected_val = 1;
+
+	return event_detected(mon, timeout_secs, props, &expected_val, ARRAY_SIZE(props));
+}
+
 /**
  * igt_flush_uevents:
  * @mon: A udev monitor initialized with #igt_watch_uevents
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 2b26d2bbf..dfebd64b1 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -163,6 +163,9 @@ enum igt_atomic_crtc_properties {
        IGT_CRTC_OUT_FENCE_PTR,
        IGT_CRTC_VRR_ENABLED,
        IGT_CRTC_SCALING_FILTER,
+       IGT_CRTC_HISTOGRAM,
+       IGT_CRTC_GLOBAL_HISTOGRAM,
+       IGT_CRTC_GLOBAL_HIST_PIXEL_FACTOR,
        IGT_NUM_CRTC_PROPS
 };
 
@@ -1126,6 +1129,8 @@ void igt_cleanup_uevents(struct udev_monitor *mon);
 bool igt_display_has_format_mod(igt_display_t *display, uint32_t format, uint64_t modifier);
 bool igt_plane_has_format_mod(igt_plane_t *plane, uint32_t format, uint64_t modifier);
 
+bool igt_global_histogram_event_detected(struct udev_monitor *mon, int timeout_secs);
+
 /**
  * igt_vblank_after_eq:
  * @a: First vblank sequence number.
diff --git a/meson.build b/meson.build
index 64f57f232..cd8d35145 100644
--- a/meson.build
+++ b/meson.build
@@ -195,6 +195,11 @@ else
 	chamelium = disabler()
 endif
 
+libghe = dependency('libghe', required : false)
+if libghe.found()
+      config.set('HAVE_LIBGHE', 1)
+endif
+
 build_info += 'Build Chamelium test: @0@'.format(chamelium.found())
 
 pthreads = dependency('threads')
diff --git a/tests/kms_histogram.c b/tests/kms_histogram.c
new file mode 100644
index 000000000..14df56690
--- /dev/null
+++ b/tests/kms_histogram.c
@@ -0,0 +1,349 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+/**
+ * TEST: kms histogram
+ * Category: Display
+ * Description: Test to verify histogram features.
+ * Driver requirement: i915, xe
+ * Functionality: histogram
+ * Mega feature: Display
+ * Test category: functionality test
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <string.h>
+
+#include "igt.h"
+#include "igt_vec.h"
+#ifdef HAVE_LIBGHE
+#include "ghe.h"
+#endif
+
+#define GLOBAL_HIST_DISABLE		0
+#define GLOBAL_HIST_ENABLE		1
+#define GLOBAL_HIST_DELAY		2
+#define FLIP_COUNT			20
+
+/**
+ * SUBTEST: global-basic
+ * Description: Test to enable histogram, flip monochrome fbs, wait for
+ *		histogram event and then read the histogram data
+ *
+ * SUBTEST: global-color
+ * Description: Test to enable histogram, flip color fbs, wait for
+ *		histogram event and then read the histogram data
+ *
+ * SUBTEST: algo-basic
+ * Description: Test to enable histogram, flip monochrome fbs, wait for
+ *		histogram event and then read the histogram data and enhance pixels by
+ *		multiplying by a pixel factor using algo
+ *
+ * SUBTEST: algo-color
+ * Description: Test to enable histogram, flip color fbs, wait for histogram event
+ *		and then read the histogram data and enhance pixels by multiplying
+ *		by a pixel factor using algo
+ */
+
+IGT_TEST_DESCRIPTION("This test will verify the display histogram.");
+
+typedef struct data {
+	igt_display_t display;
+	int drm_fd;
+	igt_fb_t fb[5];
+} data_t;
+
+typedef void (*test_t)(data_t*, enum pipe, igt_output_t*, drmModePropertyBlobRes*);
+void set_pixel_factor(igt_pipe_t *pipe, uint32_t *dietfactor, size_t size);
+
+static void enable_and_verify_global_histogram(data_t *data, enum pipe pipe)
+{
+	uint32_t global_hist_value;
+
+	/* Enable global_hist */
+	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_HISTOGRAM, GLOBAL_HIST_ENABLE);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	/* Verify if global_hist is enabled */
+	global_hist_value = igt_pipe_obj_get_prop(&data->display.pipes[pipe], IGT_CRTC_HISTOGRAM);
+	igt_assert_f(global_hist_value == GLOBAL_HIST_ENABLE, "Failed to enable global_hist\n");
+}
+
+static void disable_and_verify_global_histogram(data_t *data, enum pipe pipe)
+{
+	uint32_t global_hist_value;
+
+	/* Disable global_hist */
+	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_HISTOGRAM, GLOBAL_HIST_DISABLE);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	/* Verify if global_hist is disabled */
+	global_hist_value = igt_pipe_obj_get_prop(&data->display.pipes[pipe], IGT_CRTC_HISTOGRAM);
+	igt_assert_f(global_hist_value == GLOBAL_HIST_DISABLE, "Failed to disable global_hist\n");
+}
+
+static void cleanup_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
+{
+	igt_plane_t *plane;
+
+	disable_and_verify_global_histogram(data, pipe);
+
+	for_each_plane_on_pipe(&data->display, pipe, plane)
+		igt_plane_set_fb(plane, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	igt_remove_fb(data->display.drm_fd, &data->fb[0]);
+	igt_remove_fb(data->display.drm_fd, &data->fb[1]);
+	igt_remove_fb(data->display.drm_fd, &data->fb[2]);
+	igt_remove_fb(data->display.drm_fd, &data->fb[3]);
+	igt_remove_fb(data->display.drm_fd, &data->fb[4]);
+}
+
+static drmModePropertyBlobRes *get_global_histogram_data(data_t *data, enum pipe pipe)
+{
+	uint64_t blob_id;
+
+	blob_id = igt_pipe_obj_get_prop(&data->display.pipes[pipe],
+					IGT_CRTC_GLOBAL_HISTOGRAM);
+	if (blob_id == 0)
+		return NULL;
+
+	return drmModeGetPropertyBlob(data->drm_fd, blob_id);
+}
+
+static void read_global_histogram(data_t *data, enum pipe pipe,
+			     drmModePropertyBlobRes **hist_blob_ptr)
+{
+	uint32_t *histogram_ptr;
+	drmModePropertyBlobRes *global_hist_blob = NULL;
+
+	igt_set_timeout(GLOBAL_HIST_DELAY, "Waiting to read global histogram blob.\n");
+	do {
+		global_hist_blob = get_global_histogram_data(data, pipe);
+	} while (global_hist_blob == NULL);
+	igt_reset_timeout();
+
+	*hist_blob_ptr = global_hist_blob;
+	histogram_ptr = (uint32_t *) global_hist_blob->data;
+	for (int i = 0; i < global_hist_blob->length / sizeof(*histogram_ptr); i++)
+		igt_debug("Histogram[%d] = %d\n", i, *(histogram_ptr++));
+}
+
+void set_pixel_factor(igt_pipe_t *pipe, uint32_t *dietfactor, size_t size)
+{
+	uint32_t i;
+
+	for (i = 0; i < size; i++) {
+		/* Displaying IET LUT */
+		igt_debug("Pixel Factor[%d] = %d\n", i, *(dietfactor + i));
+	}
+	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_GLOBAL_HIST_PIXEL_FACTOR,
+				       dietfactor, size);
+}
+
+#ifdef HAVE_LIBGHE
+static struct globalhist_args *algo_get_pixel_factor(drmModePropertyBlobRes *global_hist_blob,
+						    igt_output_t *output)
+{
+	struct globalhist_args *argsPtr =
+		(struct globalhist_args *)malloc(sizeof(struct globalhist_args));
+
+	drmModeModeInfo *mode;
+
+	mode = igt_output_get_mode(output);
+
+	memcpy(argsPtr->histogram, global_hist_blob->data, global_hist_blob->length);
+	argsPtr->resolution_x = mode->hdisplay;
+	argsPtr->resolution_y = mode->vdisplay;
+
+	igt_debug("Making call to global histogram algorithm.\n");
+	set_histogram_data_bin(argsPtr);
+
+	return argsPtr;
+}
+
+static void algo_image_enhancement_factor(data_t *data, enum pipe pipe,
+					 igt_output_t *output,
+					 drmModePropertyBlobRes *global_hist_blob)
+{
+	struct globalhist_args *args = algo_get_pixel_factor(global_hist_blob, output);
+
+	igt_assert(args);
+	igt_debug("Writing pixel factor blob.\n");
+
+	set_pixel_factor(&data->display.pipes[pipe], args->dietfactor,
+			 ARRAY_SIZE(args->dietfactor));
+	free(args);
+
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+#endif
+
+static void create_monochrome_fbs(data_t *data, drmModeModeInfo *mode)
+{
+	/* TODO: Extend the tests for different formats/modifiers. */
+	/* These frame buffers used to flip monochrome fbs to get histogram event. */
+	igt_assert(igt_create_color_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+					       DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+					       0, 0, 0, &data->fb[0]));
+
+	igt_assert(igt_create_color_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+					       DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+					       1, 1, 1, &data->fb[1]));
+}
+
+static void create_color_fbs(data_t *data, drmModeModeInfo *mode)
+{
+	/* TODO: Extend the tests for different formats/modifiers. */
+	/* These frame buffers used to flip color fbs to get histogram event. */
+	igt_assert(igt_create_color_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+					       DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+					       0.5, 0, 0.5, &data->fb[0]));
+
+	igt_assert(igt_create_color_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+					       DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+					       1, 0, 0, &data->fb[1]));
+
+	igt_assert(igt_create_color_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+					       DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+					       0, 1, 0, &data->fb[2]));
+
+	igt_assert(igt_create_color_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+					       DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+					       0, 0, 1, &data->fb[3]));
+
+	igt_assert(igt_create_color_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+					       DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+					       1, 0, 1, &data->fb[4]));
+}
+
+static void flip_fb(data_t *data, enum pipe pipe, igt_output_t *output, struct igt_fb *fb)
+{
+	igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY), fb);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
+static void prepare_pipe(data_t *data, enum pipe pipe, igt_output_t *output, bool color_fb)
+{
+	int i;
+	struct udev_monitor *mon = igt_watch_uevents();
+	drmModeModeInfo *mode = igt_output_get_mode(output);
+	bool event_detected = false;
+	int fb_count = color_fb ? 5 : 2;
+
+	if (color_fb)
+		create_color_fbs(data, mode);
+	else
+		create_monochrome_fbs(data, mode);
+
+	flip_fb(data, pipe, output, &data->fb[0]);
+	enable_and_verify_global_histogram(data, pipe);
+
+	igt_flush_uevents(mon);
+	for (i = 1; i <= FLIP_COUNT; i++) {
+		flip_fb(data, pipe, output, &data->fb[i % fb_count]);
+
+		/* Check for histogram event on every flip and break the loop if detected. */
+		if (igt_global_histogram_event_detected(mon, 0)) {
+			event_detected = true;
+			break;
+		}
+	}
+
+	igt_cleanup_uevents(mon);
+	igt_assert_f(event_detected, "Histogram event not generated.\n");
+}
+
+static void run_global_histogram_pipeline(data_t *data, enum pipe pipe, igt_output_t *output,
+				     bool color_fb, test_t test_pixel_factor)
+{
+	drmModePropertyBlobRes *global_hist_blob = NULL;
+
+	prepare_pipe(data, pipe, output, color_fb);
+
+	read_global_histogram(data, pipe, &global_hist_blob);
+
+	if (test_pixel_factor)
+		test_pixel_factor(data, pipe, output, global_hist_blob);
+
+	drmModeFreePropertyBlob(global_hist_blob);
+	cleanup_pipe(data, pipe, output);
+}
+
+static void run_tests_for_global_histogram(data_t *data, bool color_fb,
+					   test_t test_pixel_factor)
+{
+	enum pipe pipe;
+	igt_output_t *output;
+
+	for_each_connected_output(&data->display, output) {
+		for_each_pipe(&data->display, pipe) {
+			if (!igt_pipe_obj_has_prop(&data->display.pipes[pipe], IGT_CRTC_HISTOGRAM))
+				continue;
+
+			igt_display_reset(&data->display);
+
+			igt_output_set_pipe(output, pipe);
+			if (!intel_pipe_output_combo_valid(&data->display))
+				continue;
+
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
+				run_global_histogram_pipeline(data, pipe, output, color_fb, test_pixel_factor);
+		}
+	}
+}
+
+static void run_algo_test(data_t *data, bool color_fb)
+{
+#ifdef HAVE_LIBGHE
+	run_tests_for_global_histogram(data, color_fb, algo_image_enhancement_factor);
+#else
+	igt_skip("Histogram algorithm library not found.\n");
+#endif
+}
+
+igt_main
+{
+	data_t data = {};
+
+	igt_fixture {
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		kmstest_set_vt_graphics_mode();
+		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
+		igt_require(data.display.is_atomic);
+	}
+
+	igt_describe("Test to enable histogram, flip monochrome fbs, wait for histogram "
+		     "event and then read the histogram data.");
+	igt_subtest_with_dynamic("global-basic")
+		run_tests_for_global_histogram(&data, false, NULL);
+
+	igt_describe("Test to enable histogram, flip color fbs, wait for histogram event "
+		     "and then read the histogram data.");
+	igt_subtest_with_dynamic("global-color")
+		run_tests_for_global_histogram(&data, true, NULL);
+
+	igt_describe("Test to enable histogram, flip monochrome fbs, wait for histogram "
+		     "event and then read the histogram data and enhance pixels by multiplying "
+		     "by a pixel factor using algo.");
+	igt_subtest_with_dynamic("algo-basic")
+		run_algo_test(&data, false);
+
+	igt_describe("Test to enable histogram, flip color fbs, wait for histogram event "
+		     "and then read the histogram data and enhance pixels by multiplying "
+		     "by a pixel factor using algo.");
+	igt_subtest_with_dynamic("algo-color")
+		run_algo_test(&data, true);
+
+	igt_fixture {
+		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 34b87b125..91044de84 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -35,6 +35,7 @@ test_progs = [
 	'kms_flip_event_leak',
 	'kms_force_connector_basic',
 	'kms_getfb',
+	'kms_histogram',
 	'kms_hdmi_inject',
 	'kms_hdr',
 	'kms_invalid_mode',
@@ -379,6 +380,7 @@ extra_dependencies = {
 	'gem_eio': [ realtime ],
 	'gem_exec_balancer': [ lib_igt_perf ],
 	'gem_mmap_offset': [ libatomic ],
+	'kms_histogram': [ libghe ],
 	'i915_pm_freq_mult': [ lib_igt_perf ],
 	'i915_pm_rc6_residency': [ lib_igt_perf ],
 	'perf': [ lib_igt_i915_perf ],
-- 
2.34.1

