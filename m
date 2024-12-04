Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38269E7716D
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 10:02:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF3E10E198;
	Wed,  4 Dec 2024 10:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lufYqjLw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3CB10E198
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 10:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733306531; x=1764842531;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mTmoZMcUpY+aovssq+f1tQfGl81nhLGAgEdrhFdtzLE=;
 b=lufYqjLwcGV3o4Ourazq5o+3q1Osa8LlQSIJ8WUamTVANlclKjN+Wjwq
 uS8gwmljljGo+haz4AgWgLDqVetoMix4ZrqbFd6Z5uor04n2GPolKjiSR
 Yzfw1L5GsBbhNIWPOMoKHb4KpjB0uVTAA3jTrsiS7ZLRJfngCSUeTKMfH
 G5SgcS2BYVLX38D7TG99CzqZM6sLhA9ymivhjaVd8nd7w+apRyDp2QnW3
 RBStg6vzN4KAXn46lsQjQdkGhDkzFMmfLBGmjfwdeDgzbDCvt9PeL5rf4
 DDxsmWITmOnfvszAlPwUYFtbVSyV1GdCnuDsnOWbJDfS5pKmOJo15iSa0 Q==;
X-CSE-ConnectionGUID: wJu8WW9ZRcaJq+/4w22Y3A==
X-CSE-MsgGUID: t0Y/pFvvSye42hB3I7FlEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44227938"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="44227938"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 02:02:10 -0800
X-CSE-ConnectionGUID: yUpDtYvxTj+aCVqLsZPAMQ==
X-CSE-MsgGUID: EZBUZdiQRVq2P4IakcO21Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="94145729"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 02:02:08 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 mohammed.thasleem@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tools/intel_hdcp: Introduce intel_hdcp tool
Date: Wed,  4 Dec 2024 15:26:54 +0530
Message-Id: <20241204095654.3185959-1-santhosh.reddy.guddati@intel.com>
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

Add a new HDCP tool for self-testing and easy deployment
to client machines. This tool helps diagnose issues,
determining whether the problem lies in the driver or user space.

The current changes include tool skeleton and get hdcp info
on the connected outputs.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 203 +++++++++++++++++++++++++++++++++++++++++++++
 tools/meson.build  |   1 +
 2 files changed, 204 insertions(+)
 create mode 100644 tools/intel_hdcp.c

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
new file mode 100644
index 000000000..8c0258092
--- /dev/null
+++ b/tools/intel_hdcp.c
@@ -0,0 +1,203 @@
+/*
+ * Copyright © 2024 Intel Corporation
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
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * This tool designed to mimic an HDCP video player, capable of performing
+ * self-tests and easily deployable to client machines. This tool helps identify
+ * whether issues are rooted in the driver or user space.
+ *
+ */
+
+#include <stdio.h>
+#include "igt.h"
+#include <fcntl.h>
+
+#define MAX_HDCP_BUF_LEN	5000
+
+typedef struct data {
+	int fd;
+	igt_display_t display;
+	struct igt_fb red, green;
+	int height, width;
+} data_t;
+
+
+/* TODO: Implement the actual HDCP enabling logic here
+ * Steps:
+ * 1. Open the appropriate debugfs file for the connector.
+ * 2. Enable HDCP on the output using connector properties
+ *    IGT_CONNECTOR_CONTENT_PROTECTION and IGT_CONNECTOR_HDCP_CONTENT_TYPE.
+ * 3. Check the status to ensure HDCP is enabled.
+ */
+static void enable_hdcp(void)
+{
+	igt_debug("TODO: Enable HDCP\n");
+}
+
+/* TODO: Implement the actual HDCP disabling logic here */
+static void disable_hdcp(void)
+{
+	igt_debug("TODO: Disable HDCP\n");
+}
+
+static bool sink_hdcp2_capable(data_t *data, igt_output_t *output)
+{
+	char buf[MAX_HDCP_BUF_LEN];
+	int fd;
+
+	fd = igt_debugfs_connector_dir(data->fd, output->name, O_RDONLY);
+	if (fd < 0)
+		return false;
+
+	if (is_intel_device(data->fd))
+		igt_debugfs_simple_read(fd, "i915_hdcp_sink_capability", buf, sizeof(buf));
+	else
+		igt_debugfs_simple_read(fd, "hdcp_sink_capability", buf, sizeof(buf));
+
+	close(fd);
+
+	igt_debug("Sink capability: %s\n", buf);
+	return strstr(buf, "HDCP2.2");
+}
+
+static bool sink_hdcp_capable(data_t *data, igt_output_t *output)
+{
+	char buf[MAX_HDCP_BUF_LEN];
+	int fd;
+
+	fd = igt_debugfs_connector_dir(data->fd, output->name, O_RDONLY);
+	if (fd < 0)
+		return false;
+
+	if (is_intel_device(data->fd))
+		igt_debugfs_simple_read(fd, "i915_hdcp_sink_capability", buf, sizeof(buf));
+	else
+		igt_debugfs_simple_read(fd, "hdcp_sink_capability", buf, sizeof(buf));
+
+	close(fd);
+
+	igt_debug("Sink capability: %s\n", buf);
+	return strstr(buf, "HDCP1.4");
+}
+
+static const char *get_hdcp_version(igt_output_t *output, data_t *data)
+{
+	if (sink_hdcp2_capable(data, output))
+		return "HDCP 2.2";
+	else if (sink_hdcp_capable(data, output))
+		return "HDCP 1.4";
+	else
+		return "No HDCP support";
+}
+
+static void get_hdcp_info(data_t *data)
+{
+	igt_output_t *output;
+	igt_display_t *display = &data->display;
+
+	igt_info("\nHDCP Sink Information\n");
+	for_each_connected_output(display, output) {
+		igt_info("Output: %s\tHDCP Supported Version: %s\n",
+			  igt_output_name(output), get_hdcp_version(output, data));
+	}
+}
+
+static void print_usage(void)
+{
+	igt_info("Usage: intel_hdcp [OPTIONS]\n");
+	igt_info("Options:\n");
+	igt_info("-i,	--info		Get HDCP Information\n");
+	igt_info("-e,	--enable	Enable HDCP on the output\n");
+	igt_info("-d,	--disable	Disable HDCP on the specific output\n");
+	igt_info("-h,	--help		Display this help message\n");
+}
+
+static void create_frame_buffers(int fd, data_t *data)
+{
+	igt_output_t *output;
+	drmModeModeInfo *mode;
+	uint16_t width, height;
+	igt_display_t *display = &data->display;
+
+	for_each_connected_output(display, output) {
+		mode = igt_output_get_mode(output);
+		igt_assert(mode);
+
+		width = mode->hdisplay;
+		height = mode->vdisplay;
+	}
+
+	data->width = width;
+	data->height = height;
+
+	igt_create_color_fb(data->fd, width, height,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    1.f, 0.f, 0.f, &data->red);
+	igt_create_color_fb(data->fd, width, height,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    0.f, 1.f, 0.f, &data->green);
+}
+
+static void hdcp_init(data_t *data)
+{
+	data->fd = drm_open_driver_master(DRIVER_ANY);
+	if (data->fd < 0) {
+		fprintf(stderr, "Failed to open DRM driver\n");
+		exit(EXIT_FAILURE);
+	}
+	igt_display_require(&data->display, data->fd);
+	igt_display_require_output(&data->display);
+	create_frame_buffers(data->fd, data);
+}
+
+int main(int argc, char **argv)
+{
+	data_t data;
+	int option;
+	static const char optstr[] = "hied";
+	struct option long_opts[] = {
+		{"help",	no_argument,	NULL, 'h'},
+		{"info",	no_argument,	NULL, 'i'},
+		{"enable",	no_argument,	NULL, 'e'},
+		{"disable",	no_argument,	NULL, 'd'},
+		{NULL,		0,		NULL,  0 }
+	};
+
+	hdcp_init(&data);
+
+	while ((option = getopt_long(argc, argv, optstr, long_opts, NULL)) != -1) {
+		switch (option) {
+		case 'i':
+			get_hdcp_info(&data);
+			break;
+		case 'e':
+			enable_hdcp();
+			break;
+		case 'd':
+			disable_hdcp();
+			break;
+		case 'h':
+		default:
+			print_usage();
+			break;
+		}
+	}
+}
diff --git a/tools/meson.build b/tools/meson.build
index 48c9a4b50..8e24005eb 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -27,6 +27,7 @@ tools_progs = [
 	'intel_gpu_time',
 	'intel_gtt',
 	'intel_guc_logger',
+	'intel_hdcp',
 	'intel_infoframes',
 	'intel_lid',
 	'intel_opregion_decode',
-- 
2.34.1

