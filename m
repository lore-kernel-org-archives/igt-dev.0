Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A15C77B7C
	for <igt-dev@archiver.kernel.org>; Mon, 23 Jun 2025 19:13:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7DB10E40D;
	Mon, 23 Jun 2025 19:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fMjhduW7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9040A10E40D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jun 2025 19:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750705992; x=1782241992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=veJQN5E3NnwfR1TtOarRdJ6478tey+qCaLvGYgjs11o=;
 b=fMjhduW7OpMdwGUJWBa1eCTIwfjBbV3PZysBiVU62tVCL9klh+sRGbiM
 v6JXI9ZXhsmqpFcAfpdAhhdStszEkXoCbma0F94Ih31AFj6bwvOez91ov
 IMUaAA/XKn7O8/rrC8Ga6HO05SEOjDNRg2O+Nou/+j0qFwvziwumgceBB
 ify22oKtasaWqDaYgeTjSTiVWj5cRFXhnaMmRYyqM4ZzZLZk+Kgln+gbl
 Pna2WyWSA8NnaHxR9qws/7ndkOYPYlxTxsfRdDio7bjpuA7YYcf9zzm/L
 Ij+tyxgYM4OtTlXpkR8bsu3oZs2UIA4cPluk0zFJM3UMY02oULFJif99e w==;
X-CSE-ConnectionGUID: Cae95uHwRiKAIFII+VhjLg==
X-CSE-MsgGUID: bwfpyGuOTq+CjjDP+Xgwbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52043593"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="52043593"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 12:13:12 -0700
X-CSE-ConnectionGUID: mkKoYO7ZQiuxixJLxe4NxQ==
X-CSE-MsgGUID: 5Behxn7lR4K9LpcVU43/DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="151168936"
Received: from unknown (HELO
 dg2adlp-Alder-Lake-Client-Platform.iind.intel.com) ([10.223.55.70])
 by orviesa006.jf.intel.com with ESMTP; 23 Jun 2025 12:13:11 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [RFC] [PATCH v1 1/2] tests/intel/kms_pm_vrsr: Add test to check
 primary panel
Date: Tue, 24 Jun 2025 00:42:29 +0530
Message-Id: <20250623191230.66611-2-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250623191230.66611-1-mohammed.thasleem@intel.com>
References: <20250623191230.66611-1-mohammed.thasleem@intel.com>
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

This test detect primary connected panel and does the flip on it.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_vrsr.c | 132 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 2 files changed, 133 insertions(+)
 create mode 100644 tests/intel/kms_pm_vrsr.c

diff --git a/tests/intel/kms_pm_vrsr.c b/tests/intel/kms_pm_vrsr.c
new file mode 100644
index 000000000..671621a66
--- /dev/null
+++ b/tests/intel/kms_pm_vrsr.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/**
+ * TEST: kms pm vrsr
+ * Category: Display
+ * Description: Tests to validate vram self refresh along with display flips.
+ * Driver requirement: xe
+ * Mega feature: Display Power Management
+ */
+
+#include <fcntl.h>
+
+#include "igt.h"
+#include "igt_sysfs.h"
+
+/**
+ * SUBTEST: vram-self-refresh
+ * Description: This test validates display flips with vram self refresh
+ *
+ */
+
+IGT_TEST_DESCRIPTION("This test validates display flips with vram self refresh.");
+
+bool kms_poll_saved_state;
+
+typedef struct {
+	int fd_xe;
+	int debugfs_fd;
+	uint32_t devid;
+	char *debugfs_dump;
+	igt_display_t display;
+	struct igt_fb fb_white;
+	drmModeModeInfo *mode;
+	igt_output_t *output;
+} device_t;
+
+static void vram_self_refresh(device_t *device);
+
+static void display_fini(device_t *device)
+{
+	igt_display_fini(&device->display);
+}
+
+static void setup_primary(device_t *device)
+{
+	igt_plane_t *primary;
+
+	primary = igt_output_get_plane_type(device->output,
+					    DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, NULL);
+	igt_create_color_fb(device->fd_xe,
+			    device->mode->hdisplay, device->mode->vdisplay,
+			    DRM_FORMAT_XRGB8888,
+			    DRM_FORMAT_MOD_LINEAR,
+			    1.0, 1.0, 1.0,
+			    &device->fb_white);
+	igt_plane_set_fb(primary, &device->fb_white);
+	igt_display_commit(&device->display);
+}
+
+static void detect_primary_output(device_t *device)
+{
+	igt_display_t *display = &device->display;
+	igt_output_t *output;
+	enum pipe pipe;
+
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		drmModeConnectorPtr c = output->config.connector;
+
+		if (c->connection != DRM_MODE_CONNECTED)
+			continue;
+
+		igt_display_reset(display);
+		igt_output_set_pipe(output, pipe);
+
+		if (!intel_pipe_output_combo_valid(display))
+			continue;
+
+		device->output = output;
+		device->mode = igt_output_get_mode(output);
+
+		break;
+	}
+}
+static void cleanup(device_t *device)
+{
+	igt_plane_t *primary;
+
+	primary = igt_output_get_plane_type(device->output,
+					    DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, NULL);
+	igt_display_commit(&device->display);
+	igt_remove_fb(device->fd_xe, &device->fb_white);
+}
+
+
+static void vram_self_refresh(device_t *device)
+{
+	detect_primary_output(device);
+	setup_primary(device);
+	cleanup(device);
+}
+
+igt_main
+{
+	device_t device = {};
+
+	igt_fixture {
+		device.fd_xe = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
+		device.debugfs_fd = igt_debugfs_dir(device.fd_xe);
+		igt_require(device.debugfs_fd != -1);
+		kmstest_set_vt_graphics_mode();
+		device.devid = intel_get_drm_devid(device.fd_xe);
+		igt_display_require(&device.display, device.fd_xe);
+	}
+
+	igt_describe("This test validates display flips with vram self refresh");
+	igt_subtest("vram-self-refresh") {
+		vram_self_refresh(&device);
+	}
+
+	igt_fixture {
+		close(device.debugfs_fd);
+		display_fini(&device);
+		drm_close_driver(device.fd_xe);
+	}
+
+	igt_exit();
+}
diff --git a/tests/meson.build b/tests/meson.build
index 55bcf57ec..3b8edfe89 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -265,6 +265,7 @@ intel_kms_progs = [
 	'kms_pm_dc',
 	'kms_pm_lpsp',
 	'kms_pm_rpm',
+        'kms_pm_vrsr',
 	'kms_psr',
 	'kms_psr2_sf',
 	'kms_psr2_su',
-- 
2.25.1

