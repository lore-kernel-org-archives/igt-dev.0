Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C340CC71135
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 07:43:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD8210E2D5;
	Mon, 16 Jun 2025 07:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gXs476xG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D3310E2D5
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 07:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750059823; x=1781595823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Msxw1YDGisp4h/26g/SXzpG/x47uyV7RRdjxFCEO+iI=;
 b=gXs476xGoLehaRA6zkgt4XAybM6vFI7VzDg+nvnWCmAxSSvClhVg8g0G
 0VlRxDFDdOs/GI/woD8qwBANpAroHSDJc24LFHZoAjpdKzNxeXltH4ly+
 fX50lrTHIL0SWQdBO2mIByC3EiCM9EmINGgU6cGa85Q28shMx/3zeC/yp
 0ysXHVBKE0uLaz5YW03Zlo2UKMsCQw5hBKfw2UYzWzjqQAvgvGUmOmmGp
 aWyGxwACt9ZqwdCwN3+YNLN+7SmwHB61ws5j52zKNX3mkfTjqbbTbpe3I
 vIWPtRmafxG3CIeX0cH4mkRljeV4eZAwl96XlH4kLeApcs4/Q/FQmhJsT w==;
X-CSE-ConnectionGUID: t5JHV+HBQtCy+6krHagfFg==
X-CSE-MsgGUID: p2TRZkk+SmyM/cCKuiTzzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="77589892"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="77589892"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:43:42 -0700
X-CSE-ConnectionGUID: bCBHrF+8Sd6qgkqJpjY1uw==
X-CSE-MsgGUID: tSKUVBYwQEuy1V4cuNCkyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="153360439"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:43:40 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, michal.wajdeczko@intel.com,
 marcin.bernatowicz@intel.com, kamil.konieczny@linux.intel.com,
 katarzyna.piecielska@intel.com, zbigniew.kempczynski@intel.com,
 ewelina.musial@intel.com
Subject: [PATCH v3 resend i-g-t 3/6] tests: Add core_debugfs_heads_power
Date: Mon, 16 Jun 2025 09:42:35 +0200
Message-ID: <20250616074240.45818-4-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616074240.45818-1-peter.senna@linux.intel.com>
References: <20250616074240.45818-1-peter.senna@linux.intel.com>
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

Introduce core_debugfs_heads_power that is expected to work with any
GPU, not limited to i915 and Xe. The test powers off all available
heads before reading debugfs files, and then powers on all heads
before reading the files again.

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: michal.wajdeczko@intel.com
Cc: marcin.bernatowicz@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Cc: zbigniew.kempczynski@intel.com
Cc: ewelina.musial@intel.com
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
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

 tests/core_debugfs_heads_power.c | 156 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 157 insertions(+)
 create mode 100644 tests/core_debugfs_heads_power.c

diff --git a/tests/core_debugfs_heads_power.c b/tests/core_debugfs_heads_power.c
new file mode 100644
index 000000000..1813986d8
--- /dev/null
+++ b/tests/core_debugfs_heads_power.c
@@ -0,0 +1,156 @@
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
+ * TEST: debugfs heads power test
+ * Description: Read entries from debugfs with all heads on and with all heads
+ *		off.
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: uapi
+ * Functionality: debugfs
+ * Feature: core
+ * Test category: uapi
+ *
+ * SUBTEST: off-read-all
+ * Description: Read all debugfs entries with heads off.
+ *
+ * SUBTEST: on-read-all
+ * Description: Read all debugfs entries with heads on.
+ */
+
+/**
+ * bool igt_kms_all_displays_on: Try to turn on all heads
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
+/**
+ * bool igt_kms_all_displays_off: Try to turn off all heads
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
+	}
+
+	igt_subtest("off-read-all") {
+		igt_display_all_off(display);
+
+		igt_dir_scan_dirfd(igt_dir, -1);
+		igt_dir_process_files(igt_dir, NULL, NULL);
+	}
+
+	igt_subtest("on-read-all") {
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
index fa62cbeb9..99dbd4feb 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -1,6 +1,7 @@
 test_progs = [
 	'core_auth',
 	'core_debugfs',
+	'core_debugfs_heads_power',
 	'core_getclient',
 	'core_getstats',
 	'core_getversion',
-- 
2.43.0

