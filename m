Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4D7C28B30
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 11:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E429B8981D;
	Thu, 20 Mar 2025 11:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YmHcsEtU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D5710E601
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 11:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742470432; x=1774006432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c7SNF80+FklbRuw5L2kiFm+kOEA8jc8c9CXr+x++Lww=;
 b=YmHcsEtUPS15pBkgkLT3l1hFFUgZiO8EswfT3GTQoHRsbYT0yV16SOW0
 ZgTEiobu5gcRRNh6g9IKBdFmyUPld422kxbzNAFoSdBVui8Qv0uZoZbO2
 MtuiCwdofixtWiA1nmMsmHzZp8E3HHCFM930jiSKNuShrGitD0DAdB+Jj
 oO7YtHW1Ko46u5M8Pe39eCF5hOimT+Vuo05ugEBsQyoP46fH7Jn+LdxaL
 Awe9M5V26wQWYYW0CZu3Ak+mb8M2q2cbR/YEB1gz9BowM/PmoCrKQErrF
 IBvIB0PzSWdZbSsEQ12g5Xkxt+h0VNgLTOhyNCtaFOJGY1JbOfZldW88E Q==;
X-CSE-ConnectionGUID: xe3pBABERIeR3xvvLGzaTw==
X-CSE-MsgGUID: ni9IcTAHTgulk9yryLY1Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43828700"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="43828700"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 04:33:52 -0700
X-CSE-ConnectionGUID: xqCKF7M+R12pRhIqJeLUdA==
X-CSE-MsgGUID: 508lMDXXTAKJgcCaME/r0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="122788852"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 04:33:50 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, suraj.kandpal@intel.com,
 kamil.konieczny@intel.com, jani.nikula@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 1/1] tools/intel_hdcp: Introduce intel_hdcp tool
Date: Thu, 20 Mar 2025 16:58:35 +0530
Message-Id: <20250320112835.2652365-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320112835.2652365-1-santhosh.reddy.guddati@intel.com>
References: <20250320112835.2652365-1-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=a
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

V2:
 - Update copyright to use SPDX (Jani Nikula).
 - Replace use of igt_* with fprintf and minimise usage of igt wrappers
   wherever possible (Kamil).
 - Consolidate HDCP version info and connector dump , remove redundant
   code and comments (Santhosh).

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 153 +++++++++++++++++++++++++++++++++++++++++++++
 tools/meson.build  |   1 +
 2 files changed, 154 insertions(+)
 create mode 100644 tools/intel_hdcp.c

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
new file mode 100644
index 000000000..91d32ebf4
--- /dev/null
+++ b/tools/intel_hdcp.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <fcntl.h>
+#include <stdio.h>
+
+#include "igt.h"
+
+#define MAX_HDCP_BUF_LEN	5000
+typedef struct data {
+	int fd;
+	igt_display_t display;
+	struct igt_fb red, green;
+	int height, width;
+} data_t;
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
+	fprintf(stderr, "TODO: Enable HDCP\n");
+}
+
+/* TODO: Implement the actual HDCP disabling logic here */
+static void disable_hdcp(void)
+{
+	fprintf(stderr, "TODO: Disable HDCP\n");
+}
+
+static const char *get_hdcp_version(int fd, char *connector_name)
+{
+	char buf[MAX_HDCP_BUF_LEN];
+	int ret;
+
+	ret = igt_debugfs_connector_dir(fd, connector_name, O_RDONLY);
+	if (ret < 0) {
+		fprintf(stderr, "Failed to open connector directory\n");
+		return NULL;
+	}
+
+	if (is_intel_device(fd))
+		igt_debugfs_simple_read(ret, "i915_hdcp_sink_capability", buf, sizeof(buf));
+	else
+		igt_debugfs_simple_read(ret, "hdcp_sink_capability", buf, sizeof(buf));
+
+	close(ret);
+	if (strstr(buf, "HDCP1.4") && strstr(buf, "HDCP2.2"))
+		return "HDCP1.4 and HDCP2.2";
+	else if (strstr(buf, "HDCP1.4"))
+		return "HDCP1.4";
+	else if (strstr(buf, "HDCP2.2"))
+		return "HDCP2.2";
+	else
+		return "No HDCP support";
+}
+
+static void get_hdcp_info(data_t *data)
+{
+	char *output_name;
+	drmModeRes *res = drmModeGetResources(data->fd);
+
+	if (!res) {
+		fprintf(stderr, "Failed to get DRM resources\n");
+		return;
+	}
+
+	fprintf(stderr, "Connectors:\n");
+	fprintf(stderr, "id\tencoder\tstatus\t\ttype\tHDCP\n");
+	for (int i = 0; i < res->count_connectors; i++) {
+		drmModeConnector *c;
+
+		c = drmModeGetConnectorCurrent(data->fd, res->connectors[i]);
+
+		if (!c)
+			continue;
+
+		asprintf(&output_name, "%s-%d",
+					kmstest_connector_type_str(c->connector_type),
+					c->connector_type_id);
+
+		fprintf(stderr, "%d\t%d\t%s\t%s\t%s\n",
+				 c->connector_id, c->encoder_id,
+				 kmstest_connector_status_str(c->connection),
+				 kmstest_connector_type_str(c->connector_type),
+				 get_hdcp_version(data->fd, output_name));
+
+		drmModeFreeConnector(c);
+	}
+
+	drmModeFreeResources(res);
+}
+
+static void print_usage(void)
+{
+	fprintf(stderr, "Usage: intel_hdcp [OPTIONS]\n");
+	fprintf(stderr, "Options:\n");
+	fprintf(stderr, "-i,	--info		Get HDCP Information\n");
+	fprintf(stderr, "-e,	--enable	Enable HDCP on the output\n");
+	fprintf(stderr, "-d,	--disable	Disable HDCP on the specific output\n");
+	fprintf(stderr, "-h,	--help		Display this help message\n");
+}
+
+static void test_init(data_t *data)
+{
+	data->fd = __drm_open_driver(DRIVER_ANY);
+	if (data->fd < 0) {
+		fprintf(stderr, "Failed to open DRM driver\n");
+		exit(EXIT_FAILURE);
+	}
+	igt_display_require(&data->display, data->fd);
+	igt_display_require_output(&data->display);
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
+	test_init(&data);
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
index de866c392..8185ba160 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -30,6 +30,7 @@ tools_progs = [
 	'intel_gpu_time',
 	'intel_gtt',
 	'intel_guc_logger',
+	'intel_hdcp',
 	'intel_infoframes',
 	'intel_lid',
 	'intel_opregion_decode',
-- 
2.34.1

