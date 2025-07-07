Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DB0C83030
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 21:08:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747C110E562;
	Mon,  7 Jul 2025 21:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lViKR1Tc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D358210E562
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 21:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751922502; x=1783458502;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zRXXLiVVJpTs5jo0HXUFd6iPJ++IAzzMN+U4gVkyTS8=;
 b=lViKR1TcAGijPFeCiuaoJLdt08xLEMhCCuPt96Oa6mvIJhKaWP6PnLSN
 qCm5V/XqNszI89LnAmY3VRCUxuysOttXt6N/tIWYmSxyDqaQfoatIoMtm
 bGwKdX9e3++iqeQPZJ3lZJ7fdut2yNu60fTnSAATftbbpuCkZKJEEFZib
 1OxV+MMvuWDQ5JvmyJMqejynoaQM/xYkR8+1FZgIX3LlfXv/BYoVdVVch
 m2SlXvZtkPpnH9JBYzD3qdXqSx3URiljG8wW4KE2eHi+zpUH3lwO62hRN
 Nugt68NDSYcKhqx+wkqeN8AeWYmD8Kk7ECiKIdZi+BekERduRx1Ki29RX g==;
X-CSE-ConnectionGUID: ZT+LuFpCSOOwQ0gRnw4IQg==
X-CSE-MsgGUID: xIkq45FdQjqkJXtclchY9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54123764"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="54123764"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 14:08:22 -0700
X-CSE-ConnectionGUID: A/ea23i+R6GDjr+jDONdmg==
X-CSE-MsgGUID: k6VB404pRgCFHsd22Bwk9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="155442580"
Received: from jmkrefta-mobl2.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.255.250])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 14:08:19 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, michal.wajdeczko@intel.com,
 karthik.b.s@intel.com
Subject: [PATCH v4 i-g-t 3/6] tests: Add kms_debugfs
Date: Mon,  7 Jul 2025 23:07:22 +0200
Message-ID: <20250707210726.55334-4-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707210726.55334-1-peter.senna@linux.intel.com>
References: <20250707210726.55334-1-peter.senna@linux.intel.com>
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

Introduce kms_debugfs that is expected to work with any GPU, not limited
to i915 and Xe. The test powers off all available displays before
reading debugfs files, and then powers on all displays before reading
the files again.

Cc: lucas.demarchi@intel.com
Cc: rodrigo.vivi@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Cc: zbigniew.kempczynski@intel.com
Cc: michal.wajdeczko@intel.com
Cc: karthik.b.s@intel.com
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
v4:
 - change test name to kms_debugfs
 - use the wrapper function igt_fit_modes_in_bw()
 - use igt_display_require_output() to ensure there is at least one display

v3:
 - renamed the test
 - Removed reference to sysfs from comments  (thanks Kamil)
 - Updated description to match the display part (thanks Kamil)
 - Moved from "display" to "heads". Our CI uses "headless" to refer
   to a DUT without display and it is shorter
 - renamed subtests for shorter names (thanks Kamil)
 - fixed comments style (thanks Kamil)
 - updated CC list
 - changed the order to test first with all heads off then with all heads on
   to prevent the need from powering on the heads at the end of the test
   (thanks Kamil)
 - removed snprintf from test names (thanks Kamil)
 - removed subtest group (thanks Kamil)
 - deleted kms_tests() and moved the code to igt_main (thanks Kamil)

v2:
 - changed style of comparison to NULL
 - moved to a separate patch

 tests/kms_debugfs.c | 157 ++++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build   |   1 +
 2 files changed, 158 insertions(+)
 create mode 100644 tests/kms_debugfs.c

diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
new file mode 100644
index 000000000..7f94d47c6
--- /dev/null
+++ b/tests/kms_debugfs.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "igt.h"
+#include "igt_debugfs.h"
+#include "igt_dir.h"
+
+/**
+ * TEST: kms debugfs test
+ * Description: Read entries from debugfs with all displays on and with
+ *		all displays off.
+ *
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: uapi
+ * Functionality: debugfs
+ * Feature: core
+ * Test category: uapi
+ *
+ * SUBTEST: display-off-read-all
+ * Description: Read all debugfs entries with display off.
+ *
+ * SUBTEST: display-on-read-all
+ * Description: Read all debugfs entries with display on.
+ */
+
+/**
+ * igt_display_all_on: Try to turn on all displays
+ * @display: pointer to the igt_display structure
+ *
+ * Returns: void
+ */
+static void igt_display_all_on(igt_display_t *display)
+{
+	struct igt_fb fb[IGT_MAX_PIPES];
+	enum pipe pipe;
+	int ret;
+
+	/* try to light all pipes */
+retry:
+	for_each_pipe(display, pipe) {
+		igt_output_t *output;
+
+		for_each_valid_output_on_pipe(display, pipe, output) {
+			igt_plane_t *primary;
+			drmModeModeInfo *mode;
+
+			if (output->pending_pipe != PIPE_NONE)
+				continue;
+
+			igt_output_set_pipe(output, pipe);
+			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+			mode = igt_output_get_mode(output);
+			igt_create_pattern_fb(display->drm_fd,
+						mode->hdisplay, mode->vdisplay,
+						DRM_FORMAT_XRGB8888,
+						DRM_FORMAT_MOD_LINEAR, &fb[pipe]);
+
+			/* Set a valid fb as some debugfs like to
+			 * inspect it on a active pipe
+			 */
+			igt_plane_set_fb(primary, &fb[pipe]);
+			break;
+		}
+	}
+
+	if (display->is_atomic) {
+		bool found = igt_fit_modes_in_bw(display);
+
+		ret = found ? 0 : -1;
+		igt_require_f(found, "No valid mode combo found.\n");
+	} else
+		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
+
+	if (ret) {
+		igt_output_t *output;
+
+		for_each_connected_output(display, output)
+			igt_output_set_pipe(output, PIPE_NONE);
+
+		goto retry;
+	}
+
+	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+}
+
+/**
+ * igt_display_all_off: Try to turn off all displays
+ * @display: pointer to the igt_display structure
+ *
+ * Returns: void
+ */
+static void igt_display_all_off(igt_display_t *display)
+{
+	enum pipe pipe;
+	igt_output_t *output;
+	igt_plane_t *plane;
+
+	for_each_connected_output(display, output)
+		igt_output_set_pipe(output, PIPE_NONE);
+
+	for_each_pipe(display, pipe)
+		for_each_plane_on_pipe(display, pipe, plane)
+			igt_plane_set_fb(plane, NULL);
+
+	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+}
+
+IGT_TEST_DESCRIPTION("Read entries from debugfs with display on/off.");
+
+igt_main
+{
+	int debugfs = -1;
+	igt_display_t *display;
+	int fd = -1;
+	igt_dir_t *igt_dir = NULL;
+
+	igt_fixture {
+		fd = drm_open_driver_master(DRIVER_ANY);
+		debugfs = igt_debugfs_dir(fd);
+		igt_require(debugfs >= 0);
+
+		igt_dir = igt_dir_create(debugfs);
+		igt_require(igt_dir);
+
+		kmstest_set_vt_graphics_mode();
+
+		display = calloc(1, sizeof(*display));
+		igt_display_require(display, fd);
+
+		/* Make sure we have at least one output connected */
+		igt_display_require_output(display);
+	}
+
+	igt_subtest("display-off-read-all") {
+		igt_display_all_off(display);
+
+		igt_dir_scan_dirfd(igt_dir, -1);
+		igt_dir_process_files(igt_dir, NULL, NULL);
+	}
+
+	igt_subtest("display-on-read-all") {
+		/* try to light all pipes */
+		igt_display_all_on(display);
+
+		igt_dir_scan_dirfd(igt_dir, -1);
+		igt_dir_process_files(igt_dir, NULL, NULL);
+	}
+
+	igt_fixture {
+		igt_display_fini(display);
+		close(debugfs);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 99d7d95be..1009bef2e 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -29,6 +29,7 @@ test_progs = [
 	'kms_cursor_crc',
 	'kms_cursor_edge_walk',
 	'kms_cursor_legacy',
+	'kms_debugfs',
 	'kms_dither',
 	'kms_display_modes',
 	'kms_dp_aux_dev',
-- 
2.43.0

