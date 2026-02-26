Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEBBFC5910
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 09:44:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014D510E004;
	Thu, 26 Feb 2026 09:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y9lRVnje";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355FD10E004
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 09:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772099089; x=1803635089;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LHwhfrbEInIbvNh4kInimfF+pkmY6ZRu2WcYIVnsOF4=;
 b=Y9lRVnjeEcaq9cMDRpUX4Ux6YwzVcU39+9gGD4EghkzVl+2/lmxMPIRR
 q0CCE69N8H8gFwRSD5rSCwkxJ1h/IVWYxWAaDAQ1I6e5BUKn+HIhlImaE
 RsPvUBVQW0bl4AG/rFx0m5/C63QCJcDDC4/rs/5fxUYt34vHfZPaMvxbM
 xmDBjMQ3Z4nYzRGUDpbcCffHbDeMxio6rF+BXllafCsZ/JV9CT/iZTu55
 vKtOQwckkP/CuCUTDQv2O3KHT7mmLGj1j1FxeSkqkynfVJP1qBSTgtHIP
 zZmgz7jvmnngbcu0jP5oHgHr3Gd8F+Onxbavty8+Dy7Q2AhNuyYW2EWYc Q==;
X-CSE-ConnectionGUID: 6RjFf+vxTGSwbvsQALlGEw==
X-CSE-MsgGUID: i4w86QZZTJ+4PxCTLQfe9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73130638"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="73130638"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 01:44:48 -0800
X-CSE-ConnectionGUID: CdfcuRutQV2oLZ46IOWWuA==
X-CSE-MsgGUID: PpTFicsESjWD9bbNBwqIsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="214514292"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa010.fm.intel.com with ESMTP; 26 Feb 2026 01:44:45 -0800
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: carlos.santa@intel.com, karthik.b.s@intel.com, krzysztof.karas@intel.com,
 kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v5] tests/kms_explict_fence: Add Test for Explicit
 Fencing
Date: Thu, 26 Feb 2026 15:01:27 +0530
Message-Id: <20260226093127.2882485-1-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add a new test to validate explicit fencing.
This test handles multiple planes in a single atomic commit.
This test addresses a critical scenario where drivers must correctly
synchronize planes with mixed fence states.

Test Scenario:
- Creates three planes: one primary, two overlay
- Attaches fences with different states:
   - Primary plane:   signaled fence (simulating completed GPU work)
   - Overlay-1 plane: signaled fence (simulating completed GPU work)
   - Overlay-2 plane: unsignaled fence (simulating long-running GPU job)
- Submits all planes in a single atomic commit with IN_FENCE_FD set
- Validates that display waits for ALL fences before updating ANY plane

Bug Detection:
This test catches driver bugs where:
 - Planes with signaled fences update prematurely before unsignaled
   fences complete, breaking atomic commit semantics
 - Fence states are mismanaged across multiple planes causing visual
   glitches or corruption
 - The driver fails to wait on all IN_FENCE_FDs atomically

The test uses sw_sync timelines to create controllable fence states,
allowing precise validation of fence synchronization behavior. An
OUT_FENCE_PTR is requested to monitor when the display update actually
completes, enabling detection of premature updates.

Implementation Details:
- Uses sw_sync for creating fences with controlled signaling
- Monitors OUT_FENCE to detect premature display updates
- Validates atomic commit integrity across multiple planes

Background:
- A bug regressed for Xe driver on PTL (Android) display handling
  of explicit fences when provided two or more buffers at once,
  with 1+ already-signaled fences and 1+ not-yet-signaled fences.
  https://patchwork.freedesktop.org/patch/662982/
- Adding this test so that IGT contains sufficient testing for the
  use of explicit fencing in the KMS Atomic Modesetting APIs.

Changes:
-v5
  - Make overlay plane validation scalable with
    overlay count.
  - Modify commit message.
-v4
  - Fix build errors as per latest API name
-v3
  - Add crc check on display update
  - Adding proper License entry
  - Reduce test description
-v2
  - Add crc check instead of visual inspection
  - Reduce debug logging which are not needed
  - Add a function for initial modset
  - Make test not specific to Intel drivers alone
  - Sort the included libs in alphabetical order
  - Modify set_output func as we want only one
    output per pipe

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 tests/kms_explicit_fence.c | 348 +++++++++++++++++++++++++++++++++++++
 tests/meson.build          |   1 +
 2 files changed, 349 insertions(+)
 create mode 100644 tests/kms_explicit_fence.c

diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c
new file mode 100644
index 000000000..3d96e0de5
--- /dev/null
+++ b/tests/kms_explicit_fence.c
@@ -0,0 +1,348 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: kms explicit fence multiplane
+ * Category: Display
+ * Description: Test explicit fencing with multiple planes and mixed fence states
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
+ *
+ * This test validates correct handling of explicit fences when multiple planes
+ * are updated in a single atomic commit with different fence states. This is
+ * critical for catching fence synchronization bugs where the driver might:
+ * 1. Prematurely display buffers with signaled fences before unsignaled fences complete
+ * 2. Mismanage fence states across multiple planes causing visual glitches
+ * 3. Fail to wait on all fences atomically before updating the display
+ */
+
+#include <errno.h>
+#include <poll.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/eventfd.h>
+
+#include "igt.h"
+#include "igt_aux.h"
+#include "sw_sync.h"
+
+/**
+ * SUBTEST: multiplane-atomic-fence-wait
+ * Description: Test 3 planes (1 primary, 2 overlay) with mixed fence states:
+ *              2 planes with signaled fences and 1 plane with unsignaled fence.
+ *              Validates that display waits for all fences before updating any plane.
+ */
+
+/* Test configuration macros */
+#define NUM_PLANES 3
+#define PLANE_PRIMARY_IDX 0
+#define PLANE_OVERLAY1_IDX 1
+#define PLANE_OVERLAY2_IDX 2
+#define OVERLAY_COUNT (NUM_PLANES - 1)
+
+#define FENCE_TIMEOUT_MS 2000
+
+#define OVERLAY_SIZE_DIVISOR 3
+#define OVERLAY1_POS_X 100
+#define OVERLAY1_POS_Y 100
+#define OVERLAY2_OFFSET 100
+
+typedef struct {
+	int drm_fd;
+	igt_display_t display;
+	igt_output_t *output;
+	enum pipe pipe;
+	igt_plane_t *primary;
+	igt_plane_t *overlay1;
+	igt_plane_t *overlay2;
+	struct igt_fb primary_fb;
+	struct igt_fb overlay1_fb;
+	struct igt_fb overlay2_fb;
+	drmModeModeInfo *mode;
+	int width, height;
+	igt_pipe_crc_t *pipe_crc;
+} data_t;
+
+static void setup_output(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc;
+	igt_output_t *output;
+
+	for_each_crtc_with_single_output(display, crtc, output) {
+		int overlay_count = 0;
+
+		data->primary = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
+
+		/* Count available overlays - we need at least OVERLAY_COUNT */
+		for (int i = 0; i < OVERLAY_COUNT; i++) {
+			if (igt_crtc_get_plane_type_index(crtc, DRM_PLANE_TYPE_OVERLAY, i))
+				overlay_count++;
+		}
+
+		if (overlay_count >= OVERLAY_COUNT) {
+			data->overlay1 = igt_crtc_get_plane_type_index(crtc,
+									DRM_PLANE_TYPE_OVERLAY,
+									0);
+			data->overlay2 = igt_crtc_get_plane_type_index(crtc,
+									DRM_PLANE_TYPE_OVERLAY,
+									1);
+			data->output = output;
+			data->pipe = crtc->pipe;
+			data->mode = igt_output_get_mode(output);
+			data->width = data->mode->hdisplay;
+			data->height = data->mode->vdisplay;
+			return;
+		}
+	}
+
+	igt_skip("Need at least %d overlay planes for this test\n", OVERLAY_COUNT);
+}
+
+static void cleanup_crtc(data_t *data)
+{
+	igt_display_reset(&data->display);
+
+	igt_remove_fb(data->drm_fd, &data->primary_fb);
+	igt_remove_fb(data->drm_fd, &data->overlay1_fb);
+	igt_remove_fb(data->drm_fd, &data->overlay2_fb);
+}
+
+static void create_fbs(data_t *data)
+{
+	int overlay_width = data->width / OVERLAY_SIZE_DIVISOR;
+	int overlay_height = data->height / OVERLAY_SIZE_DIVISOR;
+
+	/* Primary plane - Blue background */
+	igt_create_color_fb(data->drm_fd, data->width, data->height,
+			    DRM_FORMAT_XRGB8888,
+			    DRM_FORMAT_MOD_LINEAR,
+			    0.0, 0.0, 1.0, /* Blue */
+			    &data->primary_fb);
+
+	/* Overlay 1 - Red square */
+	igt_create_color_fb(data->drm_fd, overlay_width, overlay_height,
+			    DRM_FORMAT_XRGB8888,
+			    DRM_FORMAT_MOD_LINEAR,
+			    1.0, 0.0, 0.0, /* Red */
+			    &data->overlay1_fb);
+
+	/* Overlay 2 - Green square */
+	igt_create_color_fb(data->drm_fd, overlay_width, overlay_height,
+			    DRM_FORMAT_XRGB8888,
+			    DRM_FORMAT_MOD_LINEAR,
+			    0.0, 1.0, 0.0, /* Green */
+			    &data->overlay2_fb);
+}
+
+static void setup_initial_modeset(data_t *data)
+{
+	/* Initial modeset to establish baseline (no fences) */
+	igt_output_set_crtc(data->output, igt_crtc_for_pipe(&data->display, data->pipe));
+	igt_plane_set_fb(data->primary, &data->primary_fb);
+	igt_plane_set_fb(data->overlay1, &data->overlay1_fb);
+	igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS_Y);
+	igt_plane_set_fb(data->overlay2, &data->overlay2_fb);
+	igt_plane_set_position(data->overlay2, data->width - OVERLAY2_OFFSET -
+				data->overlay2_fb.width, OVERLAY1_POS_Y);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
+/**
+ * multiplane_atomic_fence_wait - Test atomic commit with mixed fence states
+ *
+ * This test reproduces the critical scenario where multiple planes are updated
+ * in a single atomic commit with different fence states. The key validation is
+ * that the display does NOT update any plane until ALL fences are signaled.
+ *
+ * Test setup:
+ * - Primary plane: buffer with a signaled fence (already retired)
+ * - Overlay 1 plane: buffer with a signaled fence (already retired)
+ * - Overlay 2 plane: buffer with an UNSIGNALED fence (long-running operation)
+ *
+ * Expected behavior:
+ * - Atomic commit succeeds immediately (non-blocking)
+ * - Display waits internally for ALL fences before updating
+ * - No plane shows its new buffer until the unsignaled fence completes
+ * - After signaling the last fence, all planes update atomically
+ *
+ * Bug detection:
+ * If the driver has a bug, it will either:
+ * 1. Show the primary and overlay1 buffers prematurely (before overlay2's fence signals)
+ * 2. Cause visual glitches from fence mismanagement
+ * 3. Fail the atomic commit
+ */
+static void multiplane_atomic_fence_wait(data_t *data)
+{
+	int timelines[NUM_PLANES];
+	int fences[NUM_PLANES];
+	int ret;
+	int out_fence;
+	igt_plane_t *planes[NUM_PLANES];
+	bool should_signal[NUM_PLANES] = { true, true, false };
+	igt_crc_t crc_before, crc_after, crc_final;
+
+	igt_require_sw_sync();
+
+	setup_initial_modeset(data);
+
+	/* Setup arrays for loop-based processing */
+	planes[PLANE_PRIMARY_IDX] = data->primary;
+	planes[PLANE_OVERLAY1_IDX] = data->overlay1;
+	planes[PLANE_OVERLAY2_IDX] = data->overlay2;
+
+	/* Start CRC capture to verify no premature display updates */
+	igt_pipe_crc_start(data->pipe_crc);
+	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc_before);
+
+	/* Create timelines and fences for all planes */
+	for (int i = 0; i < NUM_PLANES; i++) {
+		/* Create timeline */
+		timelines[i] = sw_sync_timeline_create();
+		igt_assert(timelines[i] >= 0);
+
+		/* Create fence at sequence 1 */
+		fences[i] = sw_sync_timeline_create_fence(timelines[i], 1);
+		igt_assert(fences[i] >= 0);
+
+		/* Signal fence (first 2 planes) */
+		if (should_signal[i]) {
+			sw_sync_timeline_inc(timelines[i], 1);
+			igt_assert_eq(sync_fence_status(fences[i]), 1);
+		} else {
+			/* Do not signal this fence yet, 3rd plane */
+			igt_assert_eq(sync_fence_status(fences[i]), 0);
+		}
+
+		/* Attach IN_FENCE_FD to plane */
+		igt_plane_set_fence_fd(planes[i], fences[i]);
+	}
+
+	/* Swap overlay colors to detect scanout changes via CRC */
+	igt_plane_set_fb(data->overlay1, &data->overlay2_fb);
+	igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS_Y);
+	igt_plane_set_fb(data->overlay2, &data->overlay1_fb);
+	igt_plane_set_position(data->overlay2, data->width - OVERLAY2_OFFSET -
+				data->overlay1_fb.width, OVERLAY1_POS_Y);
+
+	/* Request OUT_FENCE to track when display update completes */
+	igt_crtc_request_out_fence(igt_crtc_for_pipe(&data->display, data->pipe));
+
+	/*
+	 * The atomic commit should succeed immediately (NONBLOCK mode),
+	 * but the display should NOT update any plane until ALL fences
+	 * (including the unsignaled overlay2 fence) are signaled.
+	 *
+	 * A buggy driver might:
+	 * - Show primary and overlay1 immediately
+	 * - Cause visual corruption
+	 * - Fail the commit
+	 */
+	ret = igt_display_try_commit_atomic(&data->display,
+					    DRM_MODE_ATOMIC_NONBLOCK,
+					    NULL);
+	igt_assert_eq(ret, 0);
+
+	/* Get the out fence to monitor completion */
+	out_fence = igt_crtc_for_pipe(&data->display, data->pipe)->out_fence_fd;
+	igt_assert(out_fence >= 0);
+
+	/* Verify overlay2 fence (last one) is still unsignaled */
+	igt_assert_eq(sync_fence_status(fences[PLANE_OVERLAY2_IDX]), 0);
+
+	/* Verify out fence is also unsignaled (display hasn't updated yet) */
+	ret = sync_fence_status(out_fence);
+	igt_assert_f(ret != 1,
+		     "OUT_FENCE already signaled while overlay2 fence is unsignaled - "
+		     "driver did not wait for all IN_FENCEs!");
+
+	/*
+	 * Wait briefly and verify display hasn't updated via CRC check.
+	 * In a buggy implementation, the display might update prematurely.
+	 */
+	usleep(100000); /* 100ms */
+
+	/* Check if out fence signaled prematurely */
+	ret = sync_fence_status(out_fence);
+	igt_assert_f(ret != 1,
+		     "OUT_FENCE signaled before overlay2 fence - "
+		     "driver updated display without waiting for all fences");
+
+	/* CRC verify - check if display has not updated prematurely */
+	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc_after);
+	igt_assert_crc_equal(&crc_before, &crc_after);
+
+	/* Now signal the blocking fence (overlay2) */
+	sw_sync_timeline_inc(timelines[PLANE_OVERLAY2_IDX], 1);
+
+	/* Wait for overlay2 fence to be signaled */
+	ret = sync_fence_wait(fences[PLANE_OVERLAY2_IDX], FENCE_TIMEOUT_MS);
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(sync_fence_status(fences[PLANE_OVERLAY2_IDX]), 1);
+
+	/* Now wait for the display update to complete (out fence signals) */
+	ret = sync_fence_wait(out_fence, FENCE_TIMEOUT_MS);
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(sync_fence_status(out_fence), 1);
+
+	/* Verify display has now updated (CRC should differ from baseline) */
+	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc_final);
+	igt_assert_f(!igt_check_crc_equal(&crc_before, &crc_final),
+		     "Display did not update after all fences signaled");
+
+	igt_pipe_crc_stop(data->pipe_crc);
+
+	/* Cleanup */
+	for (int i = 0; i < NUM_PLANES; i++) {
+		close(fences[i]);
+		close(timelines[i]);
+		igt_plane_set_fence_fd(planes[i], -1);
+	}
+	close(out_fence);
+	igt_crtc_for_pipe(&data->display, data->pipe)->out_fence_fd = -1;
+}
+
+static void reset_display_state(data_t *data)
+{
+	igt_plane_set_fb(data->primary, NULL);
+	igt_plane_set_fb(data->overlay1, NULL);
+	igt_plane_set_fb(data->overlay2, NULL);
+	igt_output_set_crtc(data->output, NULL);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
+int igt_main()
+{
+	data_t data = {};
+
+	igt_fixture() {
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		kmstest_set_vt_graphics_mode();
+		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
+
+		setup_output(&data);
+		create_fbs(&data);
+
+		data.pipe_crc = igt_pipe_crc_new(data.drm_fd, data.pipe,
+						 IGT_PIPE_CRC_SOURCE_AUTO);
+	}
+
+	igt_describe("Test atomic commit with 3 planes (1 primary, 2 overlay) "
+		     "where 2 planes have signaled fences and 1 plane has an "
+		     "unsignaled fence. Validates that display does not update "
+		     "any plane until all fences are signaled");
+	igt_subtest("multiplane-atomic-fence-wait")
+		multiplane_atomic_fence_wait(&data);
+
+	igt_fixture() {
+		reset_display_state(&data);
+		igt_pipe_crc_free(data.pipe_crc);
+		cleanup_crtc(&data);
+		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 7f356de9b..eb7c8b13b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -36,6 +36,7 @@ test_progs = [
 	'kms_dither',
 	'kms_display_modes',
 	'kms_dp_aux_dev',
+	'kms_explicit_fence',
 	'kms_feature_discovery',
 	'kms_flip',
 	'kms_flip_event_leak',
-- 
2.43.0

