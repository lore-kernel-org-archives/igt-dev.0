Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6411BD3C52C
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 11:47:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28C810E1F8;
	Wed, 10 Dec 2025 11:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="StohPQHl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E1010E1F8
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 11:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765367263; x=1796903263;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HmlQOCZlZNz7mFFZHuNwprUKcThCsuyXtVMwQ51kn2E=;
 b=StohPQHld95n10pQUeluqOO44raQ4KFMM5eUHAS//LOqj0NSxuL3nn9L
 CQ/b4ia7mXU4l15X3FpveNCVwOwtZHNZGvwSOjiglc9fwhfLaFTMrJ5UF
 HX3IEJGHBwuh8cMGiC35TW2BjgH+QQclLNg4vl7n0UtTeg7n6A8qR3UNn
 9QdQ+IGuWKY7b9ND7tee1osKQnx2GmkyxFSJJZxsy7dX69z5GjbzBwOLA
 Uda6eA0LDAmfvLqnTVj0TOtlQG24Cr3QuzrsOP+KTGe25Ii9Sdc8nsr5f
 qZ0AHEJ484zRzoa2usStNJZE3oVSQ2Q/LHTGzaUbdYbW+R5Ohp6IY+m2f g==;
X-CSE-ConnectionGUID: vUBW1P6YSimYMUN1Br6MYA==
X-CSE-MsgGUID: sgy86Zu/QPWAn2Kn405ZUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="69923788"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="69923788"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 03:47:42 -0800
X-CSE-ConnectionGUID: UcPU7zUzTm2vh5+3Hhi1SA==
X-CSE-MsgGUID: 68GNqy+CTBK9W34xEs/8iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="195761487"
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.223.55.76])
 by orviesa010.jf.intel.com with ESMTP; 10 Dec 2025 03:47:41 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_warm_boot: Add test to validate warm
 reboot
Date: Wed, 10 Dec 2025 17:13:44 +0530
Message-Id: <20251210114344.1535-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
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

This test validates display subsystem stability across warm reboot by
capturing baseline display parameters (outputs, pipes, connectors, modes)
before reboot and comparing them after reboot.

 1. Run pre-reboot test to save baseline.
 2. Perform manual system reboot.
 3. Run post-reboot test to validate display parameters match baseline

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_warm_boot.c | 200 +++++++++++++++++++++++++++++++++
 tests/meson.build              |   1 +
 2 files changed, 201 insertions(+)
 create mode 100644 tests/intel/kms_pm_warm_boot.c

diff --git a/tests/intel/kms_pm_warm_boot.c b/tests/intel/kms_pm_warm_boot.c
new file mode 100644
index 000000000..6822116e6
--- /dev/null
+++ b/tests/intel/kms_pm_warm_boot.c
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/**
+ * TEST: kms pm warm reboot
+ * Category: Display
+ * Description: This test validates warm reboot.
+ * Driver requirement: xe
+ * Mega feature: Display Power Management
+ */
+
+#include "igt.h"
+#include "igt_kms.h"
+#include <unistd.h>
+#include <string.h>
+#include <errno.h>
+
+#define PARAM_FILE "/var/tmp/igt_warm_reboot_params.txt"
+#define BUF_SIZE 1024
+
+/**
+ * SUBTEST: warm-reboot-before
+ * Description: Save baseline display parameters before warm reboot.
+ *
+ * SUBTEST: warm-reboot-after
+ * Description: Validate display parameters after warm reboot.
+ *
+ */
+
+IGT_TEST_DESCRIPTION("This test validates warm reboot");
+
+typedef struct {
+	int fd;
+	igt_display_t display;
+	igt_output_t *output;
+	drmModeModeInfo *mode;
+	igt_plane_t *primary;
+	struct igt_fb fb_test;
+	enum pipe pipe;
+} device_t;
+
+static void detect_primary_output(device_t *device)
+{
+	igt_display_t *display = &device->display;
+	igt_output_t *output;
+	enum pipe pipe;
+
+	igt_display_reset(display);
+
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		igt_output_set_pipe(output, pipe);
+
+		if (!intel_pipe_output_combo_valid(display))
+			continue;
+
+		device->output = output;
+		device->mode = igt_output_get_mode(output);
+		device->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+		device->pipe = pipe;
+
+		break;
+	}
+
+	igt_require_f(device->output && device->mode,
+		      "No valid connected output found\n");
+}
+
+static void setup_primary(device_t *device)
+{
+	igt_plane_set_fb(device->primary, NULL);
+
+	igt_create_color_fb(device->fd,
+			    device->mode->hdisplay,
+			    device->mode->vdisplay,
+			    DRM_FORMAT_XRGB8888,
+			    DRM_FORMAT_MOD_LINEAR,
+			    0.2, 0.3, 0.4,
+			    &device->fb_test);
+
+	igt_plane_set_fb(device->primary, &device->fb_test);
+	igt_display_commit(&device->display);
+}
+
+static void save_baseline(device_t *device)
+{
+	int conn_type = -1;
+	const char *conn_type_name = "unknown";
+	FILE *fp = fopen(PARAM_FILE, "w");
+
+	igt_require_f(fp, "Unable to open param file for writing\n");
+
+	if (device->output->config.connector) {
+		conn_type = device->output->config.connector->connector_type;
+		conn_type_name = kmstest_connector_type_str(conn_type);
+	}
+
+	fprintf(fp, "n_outputs=%d\n", device->display.n_outputs);
+	fprintf(fp, "pipe=%d conn_id=%u type=%d(%s) mode=%dx%d@%d\n",
+		device->pipe,
+		device->output->config.connector ?
+			device->output->config.connector->connector_id : 0,
+		conn_type, conn_type_name,
+		device->mode->hdisplay, device->mode->vdisplay,
+		device->mode->vrefresh);
+
+	fclose(fp);
+}
+
+static void collect_current(device_t *device, char *buf, size_t sz)
+{
+	int conn_type = -1, ret;
+	const char *conn_type_name = "unknown";
+	uint32_t conn_id = 0;
+
+	if (device->output->config.connector) {
+		conn_type = device->output->config.connector->connector_type;
+		conn_id = device->output->config.connector->connector_id;
+		conn_type_name = kmstest_connector_type_str(conn_type);
+	}
+
+
+	/* Write display basic config details */
+	ret = snprintf(buf, sz,
+		       "n_outputs=%d\n"
+		       "pipe=%d conn_id=%u type=%d(%s) mode=%dx%d@%d\n",
+		       device->display.n_outputs,
+		       device->pipe,
+		       conn_id,
+		       conn_type, conn_type_name,
+		       device->mode->hdisplay,
+		       device->mode->vdisplay,
+		       device->mode->vrefresh);
+
+	if (ret < 0 || (size_t)ret >= sz)
+		igt_warn("%s(): buffer truncated\n", __func__);
+}
+
+static void read_baseline(char *buf, size_t sz)
+{
+	FILE *fp = fopen(PARAM_FILE, "r");
+
+	igt_require_f(fp, "Baseline missing. Run first time to create.\n");
+
+	fread(buf, 1, sz - 1, fp);
+	buf[sz - 1] = '\0';
+	fclose(fp);
+}
+
+static void cleanup(device_t *device)
+{
+	igt_plane_set_fb(device->primary, NULL);
+	igt_display_commit(&device->display);
+	igt_remove_fb(device->fd, &device->fb_test);
+}
+
+igt_main
+{
+	device_t device = {0};
+	char saved[BUF_SIZE] = {0};
+	char current[BUF_SIZE] = {0};
+
+	igt_fixture {
+		device.fd = drm_open_driver_master(DRIVER_ANY);
+		igt_require(device.fd >= 0);
+
+		igt_display_require(&device.display, device.fd);
+	}
+
+	igt_subtest("warm-reboot-before") {
+		detect_primary_output(&device);
+		setup_primary(&device);
+		collect_current(&device, current, sizeof(current));
+
+		if (access(PARAM_FILE, F_OK) == -1)
+			save_baseline(&device);
+
+		cleanup(&device);
+	}
+
+	igt_subtest("warm-reboot-after") {
+		detect_primary_output(&device);
+		setup_primary(&device);
+		collect_current(&device, current, sizeof(current));
+		read_baseline(saved, sizeof(saved));
+
+		igt_assert_f(strcmp(saved, current) == 0, "Display parameters mismatched.\n");
+
+		if (strcmp(saved, current) == 0)
+			remove(PARAM_FILE);
+
+		cleanup(&device);
+	}
+
+	igt_fixture {
+		igt_display_fini(&device.display);
+		drm_close_driver(device.fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index c505ce5cc..1ea43f944 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -269,6 +269,7 @@ intel_kms_progs = [
 	'kms_pm_dc',
 	'kms_pm_lpsp',
 	'kms_pm_rpm',
+	'kms_pm_warm_boot',
 	'kms_psr',
 	'kms_psr2_sf',
 	'kms_psr2_su',
-- 
2.25.1

