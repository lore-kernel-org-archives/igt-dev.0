Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E85BC61DBE
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 20:22:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C275810E2AD;
	Wed, 26 Aug 2026 20:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpq1LO+6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD8F10E2AD
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 20:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787775682; x=1819311682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4tEh9CY+Cehw2vS1NjvosmRCh9sw9V59r9qJV0ahWQQ=;
 b=jpq1LO+6tCUiU6owUwBwHtRETfu7gKR1Nt/08y5/dBH9+bQxp1EtQrr9
 fCX0bGs8fBkWKjfNoOxq34iMbhmEKSTc18WVufCxAwcYdZeSy5VOVngnM
 9feKjtjpwE6VWbLmSqv+ZDYq8xv2EZ2tLOUW3dPE66hX/BITUbueRazVE
 PfyQ3ta7KxOEME5mWI/uI3FizR7ySdW860ogxGQWwm8iFjwBQuZ1tETaC
 9xGwjpeh79D6aKsarsOM/AaL6xci2TZIqyENb3Awkr5/LLqZUkY7VrFqn
 90n7zmQfO23FxuldpOCODmpjTbmPx02/Tk1/yw1QKk7BPaw6HOjdBT1hB A==;
X-CSE-ConnectionGUID: UwH8eHqjT0icUO6VMU1f6Q==
X-CSE-MsgGUID: 0YaG8eriT6eppChhSTTzLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="113800886"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="113800886"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 13:21:22 -0700
X-CSE-ConnectionGUID: Z2AoDKltQ5CSoGgD+o0TJw==
X-CSE-MsgGUID: o7HqfoPFSBqj+HDGsfQRwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="263906357"
Received: from unknown (HELO linux-Lunar-Lake-Client-Platform.iind.intel.com)
 ([10.223.32.42])
 by fmviesa010.fm.intel.com with ESMTP; 26 Aug 2026 13:21:20 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_warm_boot: Add warm reboot test
Date: Thu, 27 Aug 2026 07:21:09 +0530
Message-ID: <20260827015110.2426-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251210114344.1535-1-mohammed.thasleem@intel.com>
References: <20251210114344.1535-1-mohammed.thasleem@intel.com>
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

v2: Replace each_pipe_with_valid_output with for_each_valid_output_on_crtc.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_warm_boot.c | 202 +++++++++++++++++++++++++++++++++
 tests/meson.build              |   1 +
 2 files changed, 203 insertions(+)
 create mode 100644 tests/intel/kms_pm_warm_boot.c

diff --git a/tests/intel/kms_pm_warm_boot.c b/tests/intel/kms_pm_warm_boot.c
new file mode 100644
index 000000000..d50656b91
--- /dev/null
+++ b/tests/intel/kms_pm_warm_boot.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
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
+	igt_output_t *output;
+	igt_crtc_t *crtc;
+	enum pipe pipe;
+
+	for_each_crtc(&device->display, crtc) {
+		pipe = crtc->pipe;
+		for_each_valid_output_on_crtc(&device->display, crtc, output) {
+
+			igt_display_reset(&device->display);
+
+			igt_output_set_crtc(output, igt_crtc_for_pipe(&device->display, pipe));
+			if (!intel_pipe_output_combo_valid(&device->display))
+				continue;
+
+			device->output = output;
+			device->mode = igt_output_get_mode(output);
+			device->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+			device->pipe = pipe;
+
+			break;
+		}
+	}
+
+	igt_require_f(device->output && device->mode, "No valid connected output found\n");
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
+int igt_main(void)
+{
+	device_t device = {0};
+	char saved[BUF_SIZE] = {0};
+	char current[BUF_SIZE] = {0};
+
+	igt_fixture() {
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
+	igt_fixture() {
+		igt_display_fini(&device.display);
+		drm_close_driver(device.fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 1ac89bab7..084280081 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -271,6 +271,7 @@ intel_kms_progs = [
 	'kms_pm_backlight',
 	'kms_pm_dc',
 	'kms_pm_lpsp',
+        'kms_pm_warm_boot',
 	'kms_pm_rpm',
 	'kms_psr',
 	'kms_psr2_sf',
-- 
2.48.1

