Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FACC71153
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 10:52:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B7E10E996;
	Fri, 13 Jun 2025 10:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G05bVAue";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D9610E996
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jun 2025 10:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749811932; x=1781347932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7Kihr9Fnq3obH/r/FYagaci+JT83rcIlU+ELtPoF4zw=;
 b=G05bVAuewWFtoXrfuu/MzRNsbshr21smeR/SOgseVQ6QhoPTTl0j5sX3
 u0tQmPQIDEX03ZP4aroFElpiOko8vxoF2YMDPdU2A+DDyZpaJF3NcnrUr
 fq9Rn1Yvy+0ALs6HHDoE64hLgvTUMAxMbmLQEZeTiWfcEkrLxE2epWzyy
 i6+ufW5vkhoGaB7RVktuHXoZAoxXLG9eE/0F60y9TKI4Guritj5yJfL1W
 FvmubeYEU8E80YSeyYl187rmGWmVP4147GAchwtC+NU6fre2bXdabAv0W
 xVoF0tAYuz99xd9kMbDGOsiowSL9Mw67P39F0nOlp9XukMdJOH/AM648x w==;
X-CSE-ConnectionGUID: Kvkayo6IQPm5ZmKeWLTIpw==
X-CSE-MsgGUID: R6L9apu6QBWcGwScngO+AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69467215"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="69467215"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 03:52:11 -0700
X-CSE-ConnectionGUID: VhYidZb/RiyU3u75JxLR9Q==
X-CSE-MsgGUID: irLWLjwiSMOK9E96jUqzvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="178772212"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 03:52:08 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 marcin.bernatowicz@intel.com, kamil.konieczny@linux.intel.com,
 katarzyna.piecielska@intel.com, zbigniew.kempczynski@intel.com,
 ewelina.musial@intel.com
Subject: [PATCH v2 i-g-t 3/6] tests: Add core_debugfs_display_on_off
Date: Fri, 13 Jun 2025 12:51:42 +0200
Message-ID: <20250613105146.106581-4-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613105146.106581-1-peter.senna@linux.intel.com>
References: <20250613105146.106581-1-peter.senna@linux.intel.com>
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

Introduce core_debugfs_display_on_off that is expected to work with any
GPU, not limited to i915 and Xe. The test powers on all available
displays before reading debugfs files, and then powers off all displays
before reading the files again.

Cc: marcin.bernatowicz@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Cc: zbigniew.kempczynski@intel.com
Cc: ewelina.musial@intel.com
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
v2:
 - changed style of comparison to NULL
 - moved to a separate patch

 tests/core_debugfs_display_on_off.c | 171 ++++++++++++++++++++++++++++
 tests/meson.build                   |   1 +
 2 files changed, 172 insertions(+)
 create mode 100644 tests/core_debugfs_display_on_off.c

diff --git a/tests/core_debugfs_display_on_off.c b/tests/core_debugfs_display_on_off.c
new file mode 100644
index 000000000..b7dd96208
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
+		igt_require(igt_dir);
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
index fa62cbeb9..c05c023ef 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -1,6 +1,7 @@
 test_progs = [
 	'core_auth',
 	'core_debugfs',
+	'core_debugfs_display_on_off',
 	'core_getclient',
 	'core_getstats',
 	'core_getversion',
-- 
2.43.0

