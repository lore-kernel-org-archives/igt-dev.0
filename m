Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F47D31A25
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 08:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCAF10E5DE;
	Wed, 14 Jan 2026 08:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uswyb5XX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9169E10E5D8
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 08:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768379459; x=1799915459;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M9Wahf/PLKI+0ACmQdt+HYbgPkVySyOiMVobYYSXXvk=;
 b=Uswyb5XXNhES7//qDp0jBixUB9TBfifMauOeAuEB0N9mK5dll+H3fQKw
 sQZW0Gh/QCH+fNgF3KHRWaPqFXBsu59+cbgnv71Dw5SVJLYKAy2JUS1r8
 pmVG7exBGEwnxTiqChnER/2tDJugOO/ACtceg1987vhv1NJVZdzvzF3vu
 SihDFCh+5ggS0ChsWoXIJO4uSeFyoCPJrYVB5iKuTBpAoLGJSBxu+bJp+
 LKWBDT76keByZ2Ri98/289rfr3SfpoMS3liqkB5hztXFCCapat8HGzf1u
 LU3pwzQlQh1D8m8M4MHQJljBnZTRxH0PkujNFUpowlEFqPUdAH+bTDNzX Q==;
X-CSE-ConnectionGUID: h7mLodU8TvKgHAN2fqbT3Q==
X-CSE-MsgGUID: n+q6lCVeSe+KlfC28oCXxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73528969"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="73528969"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 00:30:58 -0800
X-CSE-ConnectionGUID: N+5mZkyeQbq8EwjGVCot9Q==
X-CSE-MsgGUID: ObXUeDFsRuSF3ZfjLCLGPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="204249747"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa007.fm.intel.com with ESMTP; 14 Jan 2026 00:30:55 -0800
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: carlos.santa@intel.com, jeevaka.badrappan@intel.com,
 krzysztof.karas@intel.com, kamil.konieczny@intel.com,
 zbigniew.kempczynski@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t] tests/kms_explict_fence: Add Test for Explicit Fencing
Date: Wed, 14 Jan 2026 13:53:23 +0530
Message-Id: <20260114082323.2534785-1-s.sebinraj@intel.com>
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
- A bug regressed for Xe driver on PTL (Android) i915/display handling
  of explicit fences when provided two or more buffers at once,
  with 1+ already-signaled fences and 1+ not-yet-signaled fences.
  https://patchwork.freedesktop.org/patch/662982/
- Adding this test so that IGT contains sufficient testing for the
  use of explicit fencing in the KMS Atomic Modesetting APIs.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 tests/kms_explicit_fence.c | 372 +++++++++++++++++++++++++++++++++++++
 tests/meson.build          |   1 +
 2 files changed, 373 insertions(+)
 create mode 100644 tests/kms_explicit_fence.c

diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c
new file mode 100644
index 000000000..d3cad5904
--- /dev/null
+++ b/tests/kms_explicit_fence.c
@@ -0,0 +1,372 @@
+/*
+ * Copyright © 2026 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
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
+#include "igt.h"
+#include "igt_aux.h"
+#include "sw_sync.h"
+#include <errno.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/eventfd.h>
+#include <poll.h>
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
+#define OVERLAY_COUNT 2
+
+#define FENCE_TIMEOUT_MS 2000
+#define VISUAL_DELAY_US 500000  /* 500ms for visual observation */
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
+} data_t;
+
+static void setup_output(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	enum pipe pipe;
+
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		data->output = output;
+		data->pipe = pipe;
+		data->mode = igt_output_get_mode(output);
+
+		/* Get planes */
+		data->primary = igt_pipe_get_plane_type(
+			igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_PRIMARY);
+		data->overlay1 = igt_pipe_get_plane_type_index(
+			igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_OVERLAY, 0);
+		data->overlay2 = igt_pipe_get_plane_type_index(
+			igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_OVERLAY, 1);
+
+		data->width = data->mode->hdisplay;
+		data->height = data->mode->vdisplay;
+
+		/* We need at least OVERLAY_COUNT overlay planes for this test */
+		if (data->overlay1 && data->overlay2)
+			return;
+	}
+
+	igt_skip("Need at least %d overlay planes for this test\n", OVERLAY_COUNT);
+}
+
+static void cleanup_crtc(data_t *data)
+{
+	igt_display_reset(&data->display);
+
+	if (data->primary_fb.fb_id)
+		igt_remove_fb(data->drm_fd, &data->primary_fb);
+	if (data->overlay1_fb.fb_id)
+		igt_remove_fb(data->drm_fd, &data->overlay1_fb);
+	if (data->overlay2_fb.fb_id)
+		igt_remove_fb(data->drm_fd, &data->overlay2_fb);
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
+	const char *plane_names[NUM_PLANES] = { "Primary", "Overlay1", "Overlay2" };
+	bool should_signal[NUM_PLANES] = { true, true, false };
+
+	igt_debug("Starting multiplane atomic fence wait test\n");
+
+	igt_require_sw_sync();
+
+	/* Initial modeset to establish baseline (no fences) */
+	igt_debug("Setting up initial display configuration...\n");
+	igt_output_set_crtc(data->output, igt_crtc_for_pipe(&data->display, data->pipe));
+	igt_plane_set_fb(data->primary, &data->primary_fb);
+	igt_plane_set_fb(data->overlay1, &data->overlay1_fb);
+	igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS_Y);
+	igt_plane_set_fb(data->overlay2, &data->overlay2_fb);
+	igt_plane_set_position(data->overlay2, data->width - OVERLAY2_OFFSET -
+				data->overlay2_fb.width, OVERLAY1_POS_Y);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	igt_debug("Initial display setup complete\n");
+
+	/* Setup arrays for loop-based processing */
+	planes[PLANE_PRIMARY_IDX] = data->primary;
+	planes[PLANE_OVERLAY1_IDX] = data->overlay1;
+	planes[PLANE_OVERLAY2_IDX] = data->overlay2;
+
+	/* Create timelines and fences for all planes */
+	igt_debug("Creating timelines and fences for %d planes...\n", NUM_PLANES);
+	for (int i = 0; i < NUM_PLANES; i++) {
+		/* Create timeline */
+		timelines[i] = sw_sync_timeline_create();
+		igt_assert(timelines[i] >= 0);
+
+		/* Create fence at sequence 1 */
+		fences[i] = sw_sync_timeline_create_fence(timelines[i], 1);
+		igt_assert(fences[i] >= 0);
+
+		/* Signal fence if needed (first 2 planes) */
+		if (should_signal[i]) {
+			sw_sync_timeline_inc(timelines[i], 1);
+			igt_assert_eq(sync_fence_status(fences[i]), 1);
+			igt_debug("  %s: fence SIGNALED (fd=%d)\n",
+				  plane_names[i], fences[i]);
+		} else {
+			igt_assert_eq(sync_fence_status(fences[i]), 0);
+			igt_debug("  %s: fence UNSIGNALED (fd=%d) - blocks commit\n",
+				  plane_names[i], fences[i]);
+		}
+
+		/* Attach IN_FENCE_FD to plane */
+		igt_plane_set_fence_fd(planes[i], fences[i]);
+	}
+
+	/* swap overlay colors to see visible change from the previous scanout*/
+	igt_plane_set_fb(data->overlay1, &data->overlay2_fb);
+	igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS_Y);
+	igt_plane_set_fb(data->overlay2, &data->overlay1_fb);
+	igt_plane_set_position(data->overlay2, data->width - OVERLAY2_OFFSET -
+				data->overlay1_fb.width, OVERLAY1_POS_Y);
+
+	/* Request OUT_FENCE to track when display update completes */
+	igt_pipe_request_out_fence(igt_crtc_for_pipe(&data->display, data->pipe));
+
+	/*
+	 * The atomic commit should succeed immediately (NONBLOCK mode),
+	 * but the display should NOT update any plane until ALL fences
+	 * (including the unsignaled overlay2 fence) are signaled.
+	 *
+	 * A buggy driver might:
+	 * - Show primary and overlay1 immediately (wrong!)
+	 * - Cause visual corruption
+	 * - Fail the commit
+	 */
+	ret = igt_display_try_commit_atomic(&data->display,
+					    DRM_MODE_ATOMIC_NONBLOCK,
+					    NULL);
+	igt_assert_eq(ret, 0);
+	igt_debug("Atomic commit SUCCEEDED (non-blocking)\n");
+
+	/* Get the out fence to monitor completion */
+	out_fence = igt_crtc_for_pipe(&data->display, data->pipe)->out_fence_fd;
+	igt_assert(out_fence >= 0);
+	igt_debug("Got OUT_FENCE_FD=%d to monitor display update\n", out_fence);
+
+	/* Verify overlay2 fence (last one) is still unsignaled */
+	igt_assert_eq(sync_fence_status(fences[PLANE_OVERLAY2_IDX]), 0);
+	igt_debug("Overlay2 fence still UNSIGNALED - display should be waiting\n");
+
+	/* Verify out fence is also unsignaled (display hasn't updated yet) */
+	ret = sync_fence_status(out_fence);
+	if (ret == 1) {
+		igt_warn("OUT_FENCE already signaled - this may indicate the "
+			 "driver is not waiting for all IN_FENCEs correctly!\n");
+	} else {
+		igt_debug("OUT_FENCE still unsignaled - display correctly "
+			  "waiting for fences\n");
+	}
+
+	/*
+	 * Wait a moment to ensure the display really is waiting.
+	 * In a buggy implementation, the primary and overlay1 planes might
+	 * show up prematurely during this delay.
+	 */
+	igt_debug("Waiting %dms to verify display doesn't update "
+		  "prematurely\n", VISUAL_DELAY_US / 1000);
+	usleep(VISUAL_DELAY_US);
+
+	/* Check if out fence signaled prematurely */
+	ret = sync_fence_status(out_fence);
+	if (ret == 1) {
+		igt_critical("BUG DETECTED: OUT_FENCE signaled before "
+			     "overlay2 fence was signaled\n");
+		igt_critical("This indicates the driver updated the display "
+			     "without waiting for all fences\n");
+		igt_assert_f(0, "Display updated prematurely before all fences signaled");
+	}
+	igt_debug("Display has not updated yet (waiting for overlay2 fence)\n");
+
+	/* Now signal the blocking fence (overlay2) */
+	igt_debug("Signaling the blocking overlay2 fence");
+	sw_sync_timeline_inc(timelines[PLANE_OVERLAY2_IDX], 1);
+
+	/* Wait for overlay2 fence to be signaled */
+	ret = sync_fence_wait(fences[PLANE_OVERLAY2_IDX], FENCE_TIMEOUT_MS);
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(sync_fence_status(fences[PLANE_OVERLAY2_IDX]), 1);
+	igt_debug("Overlay2 fence now SIGNALED\n");
+
+	/* Now wait for the display update to complete (out fence signals) */
+	igt_debug("Waiting for display update to complete (OUT_FENCE)\n");
+	ret = sync_fence_wait(out_fence, FENCE_TIMEOUT_MS);
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(sync_fence_status(out_fence), 1);
+	igt_debug("OUT_FENCE signaled - all planes updated atomically\n");
+
+	igt_debug("TEST PASSED\n");
+
+	usleep(VISUAL_DELAY_US);
+
+	/* Cleanup: close test-specific resources (fences and timelines) */
+	for (int i = 0; i < NUM_PLANES; i++) {
+		close(fences[i]);
+		close(timelines[i]);
+		igt_plane_set_fence_fd(planes[i], -1);
+	}
+	close(out_fence);
+	igt_crtc_for_pipe(&data->display, data->pipe)->out_fence_fd = -1;
+}
+
+static void test_fini(data_t *data)
+{
+	/* Reset display state */
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
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
+		kmstest_set_vt_graphics_mode();
+		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
+
+		setup_output(&data);
+		create_fbs(&data);
+	}
+
+	igt_describe("Test atomic commit with 3 planes (1 primary, 2 overlay) "
+		     "where 2 planes have signaled fences and 1 plane has an "
+		     "unsignaled fence. Validates that display does not update "
+		     "any plane until all fences are signaled, catching bugs "
+		     "where drivers might prematurely display buffers or "
+		     "mismanage fence synchronization across multiple planes.");
+	igt_subtest("multiplane-atomic-fence-wait")
+		multiplane_atomic_fence_wait(&data);
+
+	igt_fixture() {
+		test_fini(&data);
+		cleanup_crtc(&data);
+		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 0ad728b87..a61395332 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -35,6 +35,7 @@ test_progs = [
 	'kms_debugfs',
 	'kms_dither',
 	'kms_display_modes',
+	'kms_explicit_fence',
 	'kms_dp_aux_dev',
 	'kms_feature_discovery',
 	'kms_flip',
-- 
2.43.0

