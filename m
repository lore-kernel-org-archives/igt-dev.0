Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63A0C021A9
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 15:18:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A35A10E25F;
	Mon, 17 Feb 2025 15:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cIBYcPA1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9ED10E25F
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 15:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739805522; x=1771341522;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/fAKIQiU4ogc3wzSd0CtaXbIRvn8+pFqL1ta5SQ/zg4=;
 b=cIBYcPA1b26X0mAWEarvWhisd5PcnGL5BmCB6H+eERhOlsc3aQHX7nsk
 C4DcXKzfi+wiZPGHLaJtg9i4HWfwKo0cuMV63HEN4EeAo7dcmOFE+SQdT
 sUU6TFSFXf9ZVu3PG4AUi8eCh4CzLDjq9VHra6lgdc7bcUVZNxocsakHL
 T3kb2ocXxST8iAyVagMy2tLa6TkjGyb+OKaJINBIJIXwS70mCcS862WOE
 cwGsyzPMf8MoJbj2gRsU9fcAamx5YRaagyZ+vqgmGo4HFl124gluuSC03
 LIyPRNnV9MDD+kPARA77N5JkpjqdJ+ZfjeUshW28E/YjRHzMFiCwY+NG3 w==;
X-CSE-ConnectionGUID: h53oFOeyTsWYvCrmyAIduw==
X-CSE-MsgGUID: FF/QGjChTGeCHSLNUdh/4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40355523"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="40355523"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 07:18:42 -0800
X-CSE-ConnectionGUID: 3JgIaVxpSgiB/8j4JV9cOA==
X-CSE-MsgGUID: qo5jQTUHSu2SsdpXD0+geg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="119256801"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa004.fm.intel.com with ESMTP; 17 Feb 2025 07:18:40 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_odd_pan: Add test to validate odd
 panning
Date: Mon, 17 Feb 2025 20:44:44 +0530
Message-Id: <20250217151444.2019299-1-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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

Add a new test to check whether odd pan is supported or not.

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 tests/intel/kms_odd_pan.c | 155 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 2 files changed, 156 insertions(+)
 create mode 100644 tests/intel/kms_odd_pan.c

diff --git a/tests/intel/kms_odd_pan.c b/tests/intel/kms_odd_pan.c
new file mode 100644
index 000000000..46f9c8fe2
--- /dev/null
+++ b/tests/intel/kms_odd_pan.c
@@ -0,0 +1,155 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/**
+ * TEST: kms odd pan
+ * Category: Display
+ * Description: Test to validate odd panning for planar format
+ * Driver requirement: xe
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ * Functionality: panning
+ */
+
+#include "igt.h"
+#include "igt_vec.h"
+#include <errno.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <string.h>
+#include "xe/xe_query.h"
+
+/**
+ * SUBTEST: odd-panning
+ * Description: Verify that odd panning in horizontal direction for planar format
+ * Driver requirement: i915, xe
+ * Functionality: kms_odd_pan
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
+IGT_TEST_DESCRIPTION("Test to validate odd panning for planar format");
+
+typedef struct {
+	int drm_fd;
+	igt_display_t display;
+	igt_output_t *output;
+	igt_plane_t **plane;
+	struct igt_fb *fb;
+} data_t;
+
+#define PLANE_WIDTH 810
+#define PLANE_HEIGHT 590
+
+static void
+prepare_planes(igt_display_t *display, const enum pipe pipe_id,
+	       igt_output_t *output)
+{
+	igt_plane_t *primary;
+	struct igt_fb primary_fb_1, primary_fb_2;
+	unsigned int fb_id_1, fb_id_2;
+	int j = 0, ret;
+
+	igt_output_set_pipe(output, pipe_id);
+
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+	fb_id_1 = igt_create_pattern_fb(display->drm_fd,
+					800, 590,
+					DRM_FORMAT_NV12,
+					DRM_FORMAT_MOD_LINEAR,
+					&primary_fb_1);
+
+	fb_id_2 = igt_create_pattern_fb(display->drm_fd,
+					800, 590,
+					DRM_FORMAT_NV12,
+					DRM_FORMAT_MOD_LINEAR,
+					&primary_fb_2);
+
+	igt_assert(fb_id_1);
+	igt_assert(fb_id_2);
+
+	igt_plane_set_fb(primary, &primary_fb_1);
+
+	igt_plane_set_size(primary, PLANE_WIDTH, PLANE_HEIGHT);
+	igt_plane_set_position(primary, -501, 200);
+
+	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+	do {
+		if (j % 2 == 0) {
+			igt_plane_set_fb(primary, &primary_fb_1);
+			igt_plane_set_size(primary, PLANE_WIDTH - j, PLANE_HEIGHT);
+			ret = igt_display_try_commit_atomic(display, 0, NULL);
+		} else {
+			igt_plane_set_fb(primary, &primary_fb_2);
+			igt_plane_set_size(primary, PLANE_WIDTH - j, PLANE_HEIGHT);
+			ret = igt_display_try_commit_atomic(display, 0, NULL);
+		}
+		j++;
+	} while (j < 20);
+
+	igt_assert_eq(ret, -22);
+
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_try_commit2(display, COMMIT_ATOMIC);
+
+	igt_remove_fb(display->drm_fd, &primary_fb_1);
+	igt_remove_fb(display->drm_fd, &primary_fb_2);
+}
+
+static void run_test_pan(igt_display_t *display, const enum pipe pipe_id,
+			 igt_output_t *output)
+{
+	prepare_planes(display, pipe_id, output);
+}
+
+static void run_test_odd_pan(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	enum pipe pipe;
+	igt_output_t *output;
+
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		igt_display_reset(display);
+
+		igt_output_set_pipe(output, pipe);
+		if (!intel_pipe_output_combo_valid(display))
+			continue;
+
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
+			run_test_pan(display, pipe, output);
+
+		if (pipe == 0)
+			break;
+	}
+}
+
+igt_main
+{
+	data_t data = {};
+
+	igt_fixture {
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		igt_require(data.drm_fd >= 0);
+
+		kmstest_set_vt_graphics_mode();
+
+		igt_display_require(&data.display, data.drm_fd);
+		igt_require(data.display.is_atomic);
+
+		igt_display_require_output(&data.display);
+	}
+
+	igt_describe("Tests odd  panning");
+	igt_subtest_with_dynamic("odd-panning")
+		run_test_odd_pan(&data);
+
+	igt_fixture {
+		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index f8a0ab836..97effb290 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -257,6 +257,7 @@ intel_kms_progs = [
 	'kms_joiner',
 	'kms_legacy_colorkey',
 	'kms_mmap_write_crc',
+	'kms_odd_pan',
 	'kms_pipe_b_c_ivb',
 	'kms_pipe_stress',
 	'kms_pm_backlight',
-- 
2.25.1

