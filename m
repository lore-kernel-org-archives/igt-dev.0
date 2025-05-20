Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D74C54E71
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 19:30:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0E210E575;
	Tue, 20 May 2025 19:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZpBUgHEm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DB210E575
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 19:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747769441; x=1779305441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lKOZRacit51pL/6PAc/2WpIK1qE60WupN2RnJFicEOg=;
 b=ZpBUgHEm3qJYRjveKP9K2B8BH5uFJLqUObspHGiff/WjQ0I/ngrSyf7j
 wzpJmzu6VwRLo16P4XK1N7lG6RhFWGLlRV4QLRYJbalDNEqjD/mJDUgmv
 lZKkNhVjCjesTipeTju3UWIQGavCU8kgwzeZwmAHPWnU2SfyMtPY7ip2b
 V3hPsXxd1Yk6WUORMCqvu6QN449gmU7biLoj1zGcqrjNs56oFJ5h0W4zP
 SC2htY+OG7ScfhsFiGwXHAqrWPQa6W4/gpBE5s5HXVR1u6iOBgqsYzj5Y
 /wfbClMlTnCmG3LuI1ty8tx4HZeuxds+t0pZpS4ZTwgjKq5tVQfQIJ34W A==;
X-CSE-ConnectionGUID: t9zFL6CJRIiZpK+zPm7Jeg==
X-CSE-MsgGUID: o/SnYVK9RPCMMNE+JjO7ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="53386097"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="53386097"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 12:30:41 -0700
X-CSE-ConnectionGUID: w85b8PTIRxqTMWo4i1EHcw==
X-CSE-MsgGUID: VNkdMcd0SRyJxpAPO8ftsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="140840300"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 12:30:37 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 marcin.bernatowicz@intel.com, himanshu.girotra@intel.com,
 aditya.chauhan@intel.com, pravalika.gurram@intel.com,
 sai.gowtham.ch@intel.com, ramadevi.gandi@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com
Subject: [RFC v2 i-g-t 3/5] Add tests: core_debugfs and
 core_debugfs_display_on_off
Date: Tue, 20 May 2025 21:29:47 +0200
Message-ID: <20250520192951.411614-4-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520192951.411614-1-peter.senna@linux.intel.com>
References: <20250514175140.115033-1-peter.senna@linux.intel.com>
 <20250520192951.411614-1-peter.senna@linux.intel.com>
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

Introduces two GPU-agnostic tests, core_debugfs and
core_debugfs_display_on_off. These tests are designed to function with
any GPU, not limited to i915 and Xe.

core_debugfs: Attempts to open every file in debugfs associated with the
GPU.

core_debugfs_display_on_off: Powers on all available displays before
reading debugfs files, and then powers off all displays before reading
the files again.

Cc: marcin.bernatowicz@intel.com
Cc: himanshu.girotra@intel.com
Cc: aditya.chauhan@intel.com
Cc: pravalika.gurram@intel.com
Cc: sai.gowtham.ch@intel.com
Cc: ramadevi.gandi@intel.com
Cc: lucas.demarchi@intel.com
Cc: rodrigo.vivi@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Cc: zbigniew.kempczynski@intel.com
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 tests/core_debugfs.c                |  54 +++++++++
 tests/core_debugfs_display_on_off.c | 171 ++++++++++++++++++++++++++++
 tests/meson.build                   |   2 +
 3 files changed, 227 insertions(+)
 create mode 100644 tests/core_debugfs.c
 create mode 100644 tests/core_debugfs_display_on_off.c

diff --git a/tests/core_debugfs.c b/tests/core_debugfs.c
new file mode 100644
index 000000000..a2f9a8dac
--- /dev/null
+++ b/tests/core_debugfs.c
@@ -0,0 +1,54 @@
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
+ * TEST: debugfs test
+ * Description: Read entries from debugfs
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: uapi
+ * Functionality: debugfs
+ * Feature: core
+ * Test category: uapi
+ *
+ * SUBTEST: debugfs-read-all-entries
+ * Description: Read all entries from debugfs path validating debugfs entries
+ */
+
+IGT_TEST_DESCRIPTION("Read entries from debugfs");
+
+igt_main
+{
+	int debugfs = -1;
+	int fd = -1;
+	igt_dir_t *igt_dir = NULL;
+
+	igt_fixture {
+		fd = drm_open_driver_master(DRIVER_ANY);
+		debugfs = igt_debugfs_dir(fd);
+		igt_require(debugfs >= 0);
+
+		igt_dir = igt_dir_create(debugfs);
+		igt_require(igt_dir != NULL);
+
+		kmstest_set_vt_graphics_mode();
+	}
+
+	igt_describe("Read all entries from debugfs path.");
+	igt_subtest("debugfs-read-all-entries") {
+		igt_dir_scan_dirfd(igt_dir, -1);
+		igt_dir_process_files(igt_dir, NULL, NULL);
+	}
+
+	igt_fixture {
+		igt_dir_destroy(igt_dir);
+		close(debugfs);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/core_debugfs_display_on_off.c b/tests/core_debugfs_display_on_off.c
new file mode 100644
index 000000000..7f2ebc66a
--- /dev/null
+++ b/tests/core_debugfs_display_on_off.c
@@ -0,0 +1,171 @@
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
+ * TEST: debugfs display on/off test
+ * Description: Read entries from debugfs, and sysfs paths.
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: uapi
+ * Functionality: debugfs
+ * Feature: core
+ * Test category: uapi
+ *
+ * SUBTEST: debugfs-read-all-entries-display-off
+ * Description: Read all debugfs entries with display off.
+ *
+ * SUBTEST: debugfs-read-all-entries-display-on
+ * Description: Read all debugfs entries with display on.
+ */
+
+/** bool igt_kms_all_displays_on: Try to turn on all displays
+ * @fd: file descriptor for the drm device
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
+	if (display->is_atomic)
+		ret = igt_display_try_commit_atomic(display,
+				DRM_MODE_ATOMIC_TEST_ONLY |
+				DRM_MODE_ATOMIC_ALLOW_MODESET,
+				NULL);
+	else
+		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
+
+	if (ret) {
+		igt_output_t *output;
+		bool found = igt_override_all_active_output_modes_to_fit_bw(display);
+
+		igt_require_f(found, "No valid mode combo found.\n");
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
+/** bool igt_kms_all_displays_off: Try to turn off all displays
+ * @fd: file descriptor for the drm device
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
+static void kms_tests(int fd, igt_dir_t *igt_dir)
+{
+	igt_display_t *display;
+	char test_name[64];
+
+	display = calloc(1, sizeof(*display));
+
+	igt_fixture
+		igt_display_require(display, fd);
+
+	snprintf(test_name, sizeof(test_name),
+		 "debugfs-read-all-entries-display-on");
+
+	igt_subtest(test_name) {
+		/* try to light all pipes */
+		igt_display_all_on(display);
+
+		igt_dir_scan_dirfd(igt_dir, -1);
+		igt_dir_process_files(igt_dir, NULL, NULL);
+	}
+
+	snprintf(test_name, sizeof(test_name),
+		 "debugfs-read-all-entries-display-off");
+
+	igt_subtest(test_name) {
+		igt_display_all_off(display);
+
+		igt_dir_scan_dirfd(igt_dir, -1);
+		igt_dir_process_files(igt_dir, NULL, NULL);
+	}
+
+	igt_fixture
+		igt_display_fini(display);
+}
+
+IGT_TEST_DESCRIPTION("Read entries from debugfs with display on/off.");
+
+igt_main
+{
+	int debugfs = -1;
+	int fd = -1;
+	igt_dir_t *igt_dir = NULL;
+
+	igt_fixture {
+		fd = drm_open_driver_master(DRIVER_ANY);
+		debugfs = igt_debugfs_dir(fd);
+		igt_require(debugfs >= 0);
+
+		igt_dir = igt_dir_create(debugfs);
+		igt_require(igt_dir != NULL);
+
+		kmstest_set_vt_graphics_mode();
+	}
+
+	igt_subtest_group
+		kms_tests(fd, igt_dir);
+
+	igt_fixture {
+		close(debugfs);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 335d82e9d..c7a689ab3 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -1,5 +1,7 @@
 test_progs = [
 	'core_auth',
+	'core_debugfs',
+	'core_debugfs_display_on_off',
 	'core_getclient',
 	'core_getstats',
 	'core_getversion',
-- 
2.43.0

