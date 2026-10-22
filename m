Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D0760A261C
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 10:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OYFpZyht
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F53110E400;
	Thu, 22 Oct 2026 10:54:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D111410E400
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 10:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792666280; x=1824202280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=srynWpy921R5k7IicVvPGphfmuSQvuaBsz/ZX+qtIWM=;
 b=OYFpZyhtgm+wZI9x7DuEBfJ6mDLyV7q4IOB3lbH5SivkTiLGmEegBnAC
 1s3PKXBg6VqpmR1K2edK5mOf6Vjwc1LoZTChuCtIaY+uUuWagGE+TgEr2
 of7/z3hXJ5WBuXMJPeT0Ch80gVNvevJU7B9utyyBSWFiYtPUBEMNM+LNt
 SEnYIFfS78I0BH6VR4Zc5UUpet+46EFPNtbMq/BsMrc5Tx+RdSYZ9n2/N
 6ZLSxQ0keDLT30Kat/hald+Jy2zuoBPbfabLXGkH7GB5KqjqUhHQL4K7A
 tUOIuQiO+kB0NyJpyEli7M6OYS0OACP+3rcA/GevDn7mQ7WDJNHbBtaUj Q==;
X-CSE-ConnectionGUID: glyA5trOTtikUlxlN927PQ==
X-CSE-MsgGUID: ecBAP3qfQ1C+clI1XCB1Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1502731"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1502731"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 03:51:19 -0700
X-CSE-ConnectionGUID: jyjY8ojCSku+SIKavwB0oA==
X-CSE-MsgGUID: Jk1QAyJaRQaIy5f60VAN2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3400777"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 03:51:18 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 1/3] lib/igt_hdcp: add shared HDCP helper library
Date: Thu, 22 Oct 2026 16:20:56 +0530
Message-ID: <20261022105102.384486-2-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022105102.384486-1-sowmiya.s@intel.com>
References: <20261022105102.384486-1-sowmiya.s@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Introduce lib/igt_hdcp.{c,h} providing shared HDCP helpers (content
protection property get/set, sink/output capability checks,
force-HDCP1.4 debugfs toggling, and DP-MST topology detection)
parametrized over output arrays so single-output and DP-MST callers
can share the same primitives. This is purely additive and not yet
used by any test.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 lib/igt_hdcp.c  | 423 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_hdcp.h  |  67 ++++++++
 lib/meson.build |   1 +
 3 files changed, 491 insertions(+)
 create mode 100644 lib/igt_hdcp.c
 create mode 100644 lib/igt_hdcp.h

diff --git a/lib/igt_hdcp.c b/lib/igt_hdcp.c
new file mode 100644
index 000000000..bbf32cbae
--- /dev/null
+++ b/lib/igt_hdcp.c
@@ -0,0 +1,423 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <inttypes.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "drmtest.h"
+#include "igt_debugfs.h"
+#include "igt_edid.h"
+#include "igt_hdcp.h"
+#include "igt_panel.h"
+#include "igt_sysfs.h"
+
+#define MAX_SINK_HDCP_CAP_BUF_LEN	5000
+
+static void __debugfs_read(int fd, const char *param, char *buf, int len)
+{
+	len = igt_debugfs_simple_read(fd, param, buf, len);
+	igt_require(len != -ENOENT);
+	if (len < 0)
+		igt_assert_eq(len, -ENODEV);
+}
+
+#define debugfs_read(fd, p, arr) __debugfs_read(fd, p, arr, sizeof(arr))
+
+/**
+ * igt_hdcp_set_content_protection_desired:
+ * @output: output to enable content protection on
+ * @content_type: IGT_HDCP_CONTENT_TYPE_0 or IGT_HDCP_CONTENT_TYPE_1
+ * @type_change: when false, also sets the "Content Protection" property
+ * to DESIRED; when true, only updates the HDCP content type (used for
+ * type-change-while-enabled testing).
+ *
+ * Does not commit the display - the caller is responsible for that.
+ */
+void igt_hdcp_set_content_protection_desired(igt_output_t *output,
+					     int content_type,
+					     bool type_change)
+{
+	if (!type_change)
+		igt_output_set_prop_value(output,
+					  IGT_CONNECTOR_CONTENT_PROTECTION,
+					  IGT_HDCP_DESIRED);
+
+	if (output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE])
+		igt_output_set_prop_value(output,
+					  IGT_CONNECTOR_HDCP_CONTENT_TYPE,
+					  content_type);
+}
+
+/**
+ * igt_hdcp_set_content_protection_undesired:
+ * @output: output to disable content protection on
+ *
+ * Does not commit the display - the caller is responsible for that.
+ */
+void igt_hdcp_set_content_protection_undesired(igt_output_t *output)
+{
+	igt_output_set_prop_value(output, IGT_CONNECTOR_CONTENT_PROTECTION,
+				  IGT_HDCP_UNDESIRED);
+}
+
+/**
+ * igt_hdcp_wait_for_prop_value:
+ * @output: output to poll
+ * @expected: expected "Content Protection" property value
+ * @timeout_mSec: timeout, in milliseconds
+ *
+ * Returns: true if @output's "Content Protection" property reached
+ * @expected within @timeout_mSec.
+ */
+bool igt_hdcp_wait_for_prop_value(igt_output_t *output, uint64_t expected,
+				  uint32_t timeout_mSec)
+{
+	uint64_t val;
+	int i;
+
+	for (i = 0; i < timeout_mSec; i++) {
+		val = igt_output_get_prop(output,
+					  IGT_CONNECTOR_CONTENT_PROTECTION);
+		if (val == expected)
+			return true;
+		usleep(1000);
+	}
+
+	igt_info("prop_value mismatch %" PRId64 " != %" PRId64 "\n",
+		 val, expected);
+
+	return false;
+}
+
+/**
+ * igt_hdcp_wait_for_prop_value_multi:
+ * @outputs: array of outputs to poll
+ * @count: number of outputs in @outputs
+ * @expected: expected "Content Protection" property value
+ * @first_timeout_mSec: timeout used while waiting on outputs[0]
+ * @additional_timeout_mSec: timeout used while waiting on outputs[1..count)
+ *
+ * Generalizes igt_hdcp_wait_for_prop_value() to an array of outputs that are
+ * expected to reach @expected together (e.g. a DP-MST topology). Pass
+ * @count == 1 for a single output.
+ *
+ * Returns: true if all outputs reached @expected within their timeout.
+ */
+bool igt_hdcp_wait_for_prop_value_multi(igt_output_t **outputs, int count,
+					uint64_t expected,
+					uint32_t first_timeout_mSec,
+					uint32_t additional_timeout_mSec)
+{
+	bool ret;
+	int i;
+
+	ret = igt_hdcp_wait_for_prop_value(outputs[0], expected,
+					   first_timeout_mSec);
+
+	for (i = 1; i < count; i++)
+		ret &= igt_hdcp_wait_for_prop_value(outputs[i], expected,
+						    additional_timeout_mSec);
+
+	return ret;
+}
+
+/**
+ * igt_hdcp_check_lic:
+ * @outputs: array of outputs that share a Link Integrity Check cycle
+ * @count: number of outputs in @outputs
+ * @first_output: index, within @outputs, of the output to actively wait on
+ * @period_mSec: time to wait for a Link Integrity Check cycle
+ * @retry_once: if true, a single degrade-to-DESIRED is tolerated and a
+ * second @period_mSec window is given for reauthentication before failing.
+ * If false, any transition to DESIRED during @period_mSec is a hard failure.
+ * @failed_index: if non-NULL, set to the index (within @outputs) of the
+ * output that failed the check. Only meaningful when the return value is
+ * false.
+ *
+ * Waits up to @period_mSec for outputs[@first_output]'s "Content Protection"
+ * property to degrade to DESIRED, which signals a Link Integrity Check
+ * failure (the property is expected to stay at ENABLED for the whole
+ * window). Then checks that none of the outputs after it in @outputs also
+ * degraded to DESIRED in the meantime.
+ *
+ * Returns: true if the Link Integrity Check held on all outputs.
+ */
+bool igt_hdcp_check_lic(igt_output_t **outputs, int count, int first_output,
+			uint32_t period_mSec, bool retry_once,
+			int *failed_index)
+{
+	bool became_desired, ret;
+	int i;
+	uint64_t val;
+
+	if (failed_index)
+		*failed_index = first_output;
+
+	/* Wait for period_mSec (min 2 cycles of Link Integrity Check) */
+	became_desired = igt_hdcp_wait_for_prop_value(outputs[first_output],
+						      IGT_HDCP_DESIRED,
+						      period_mSec);
+	if (became_desired && retry_once) {
+		igt_debug("Link Integrity Check failed, waiting for reauthentication\n");
+		became_desired = igt_hdcp_wait_for_prop_value(outputs[first_output],
+							      IGT_HDCP_DESIRED,
+							      period_mSec);
+	}
+
+	ret = !became_desired;
+
+	for (i = first_output + 1; ret && i < count; i++) {
+		val = igt_output_get_prop(outputs[i],
+					  IGT_CONNECTOR_CONTENT_PROTECTION);
+		ret = (val != IGT_HDCP_DESIRED);
+		if (!ret && failed_index)
+			*failed_index = i;
+	}
+
+	return ret;
+}
+
+static bool debugfs_read_sink_capability(int drm_fd, igt_output_t *output,
+					 char *buf, int len)
+{
+	int fd;
+
+	fd = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	if (fd < 0)
+		return false;
+
+	/*
+	 * FIXME: As of now XE's debugfs is using i915 namespace. Once Kernel
+	 * changes got landed, please update this logic to use XE specific
+	 * debugfs.
+	 */
+	if (is_intel_device(drm_fd))
+		__debugfs_read(fd, "i915_hdcp_sink_capability", buf, len);
+	else if (is_mtk_device(drm_fd))
+		__debugfs_read(fd, "mtk_hdcp_sink_capability", buf, len);
+	else
+		__debugfs_read(fd, "hdcp_sink_capability", buf, len);
+
+	close(fd);
+
+	igt_debug("Sink capability: %s\n", buf);
+
+	return true;
+}
+
+/**
+ * igt_hdcp_sink_capable:
+ * @drm_fd: drm file descriptor
+ * @output: output whose sink should be checked
+ * @hdcp_version: 1 for HDCP1.4, 2 for HDCP2.2
+ *
+ * Returns: true if the connected sink advertises support for @hdcp_version.
+ */
+bool igt_hdcp_sink_capable(int drm_fd, igt_output_t *output, int hdcp_version)
+{
+	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
+
+	if (!debugfs_read_sink_capability(drm_fd, output, buf, sizeof(buf)))
+		return false;
+
+	return strstr(buf, hdcp_version == 2 ? "HDCP2.2" : "HDCP1.4");
+}
+
+/**
+ * igt_hdcp_output_capable:
+ * @drm_fd: drm file descriptor
+ * @output: output to check
+ * @content_type: IGT_HDCP_CONTENT_TYPE_0 or IGT_HDCP_CONTENT_TYPE_1
+ *
+ * Returns: true if @output supports the required Content Protection
+ * properties and the connected sink supports the requested @content_type.
+ */
+bool igt_hdcp_output_capable(int drm_fd, igt_output_t *output,
+			     int content_type)
+{
+	if (!output->props[IGT_CONNECTOR_CONTENT_PROTECTION])
+		return false;
+
+	if (!output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE] && content_type)
+		return false;
+
+	if (content_type && !igt_hdcp_sink_capable(drm_fd, output, 2)) {
+		igt_info("\tSkip %s (Sink has no HDCP2.2 support)\n",
+			 output->name);
+		return false;
+	} else if (!igt_hdcp_sink_capable(drm_fd, output, 1)) {
+		igt_info("\tSkip %s (Sink has no HDCP support)\n",
+			 output->name);
+		return false;
+	}
+
+	return true;
+}
+
+/**
+ * igt_hdcp_is_output_test_exempt:
+ * @drm_fd: drm file descriptor
+ * @output: output to check
+ * @blocklist: array of sink names that should be excluded from HDCP testing
+ * @blocklist_size: number of entries in @blocklist
+ *
+ * Returns: true if @output's connected sink is on @blocklist (or doesn't
+ * report a sink name at all).
+ */
+bool igt_hdcp_is_output_test_exempt(int drm_fd, igt_output_t *output,
+				    const char *const blocklist[],
+				    size_t blocklist_size)
+{
+	drmModePropertyBlobPtr edid_blob = NULL;
+	uint64_t edid_blob_id;
+	const struct edid *edid;
+	char edid_vendor[4];
+	char sink_name[20];
+
+	igt_assert(kmstest_get_property(drm_fd,
+					output->config.connector->connector_id,
+					DRM_MODE_OBJECT_CONNECTOR, "EDID", NULL,
+					&edid_blob_id, NULL));
+
+	igt_assert(edid_blob = drmModeGetPropertyBlob(drm_fd, edid_blob_id));
+
+	edid = (const struct edid *)edid_blob->data;
+	edid_get_mfg(edid, edid_vendor);
+	edid_vendor[3] = '\0';
+
+	edid_get_monitor_name(edid, sink_name, ARRAY_SIZE(sink_name));
+
+	drmModeFreePropertyBlob(edid_blob);
+
+	/* Not all monitors have sink names */
+	if (sink_name[0] == '\0') {
+		igt_debug("no sink name\n");
+		return true;
+	}
+
+	return igt_is_panel_blocked(sink_name, blocklist, blocklist_size);
+}
+
+/**
+ * igt_hdcp_get_capable_outputs:
+ * @display: igt_display_t to iterate
+ * @drm_fd: drm file descriptor
+ * @content_type: IGT_HDCP_CONTENT_TYPE_0 or IGT_HDCP_CONTENT_TYPE_1
+ * @blocklist: array of sink names excluded from HDCP testing
+ * @blocklist_size: number of entries in @blocklist
+ * @hdcp_outputs: array to be filled with HDCP-capable, non-exempt outputs
+ * @max_outputs: capacity of @hdcp_outputs
+ *
+ * Returns: the number of outputs written to @hdcp_outputs.
+ */
+int igt_hdcp_get_capable_outputs(igt_display_t *display, int drm_fd,
+				 int content_type,
+				 const char *const blocklist[],
+				 size_t blocklist_size,
+				 igt_output_t **hdcp_outputs,
+				 int max_outputs)
+{
+	igt_output_t *output;
+	int count = 0;
+
+	for_each_connected_output(display, output) {
+		if (!igt_hdcp_output_capable(drm_fd, output, content_type))
+			continue;
+
+		if (igt_hdcp_is_output_test_exempt(drm_fd, output, blocklist,
+						   blocklist_size)) {
+			igt_info("Skipping HDCP test on %s, as the panel is blocklisted\n",
+				 output->name);
+			continue;
+		}
+
+		if (count < max_outputs)
+			hdcp_outputs[count++] = output;
+	}
+
+	return count;
+}
+
+/**
+ * igt_hdcp_force_hdcp14:
+ * @drm_fd: drm file descriptor
+ * @output: output to toggle
+ * @enable: true to force HDCP1.4, false to clear the override
+ *
+ * Toggles the "i915_force_hdcp14" debugfs knob for @output, if present.
+ */
+void igt_hdcp_force_hdcp14(int drm_fd, igt_output_t *output, bool enable)
+{
+	int fd, ret;
+	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
+
+	fd = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	igt_require_f(fd >= 0, "Cannot open %s debugfs\n", output->name);
+
+	if (enable) {
+		ret = igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf,
+					      sizeof(buf));
+		if (ret <= 0) {
+			igt_info("i915_force_hdcp14 not supported\n");
+			close(fd);
+			return;
+		}
+
+		ret = igt_sysfs_write(fd, "i915_force_hdcp14", "1", 2);
+		igt_require_f(ret > 0, "i915_force_hdcp14 is not enabled\n");
+
+		ret = igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf,
+					      sizeof(buf));
+		igt_assert_f(ret > 0 && strstr(buf, "yes"),
+			     "i915_force_hdcp14 is not set to 'yes' on %s debugfs\n",
+			     output->name);
+	} else {
+		ret = igt_sysfs_write(fd, "i915_force_hdcp14", "0", 2);
+		igt_require_f(ret > 0, "i915_force_hdcp14 is not disabled\n");
+
+		ret = igt_debugfs_simple_read(fd, "i915_force_hdcp14", buf,
+					      sizeof(buf));
+		igt_assert_f(ret > 0 && strstr(buf, "no"),
+			     "i915_force_hdcp14 is not set to 'no' on %s debugfs\n",
+			     output->name);
+	}
+
+	close(fd);
+}
+
+/**
+ * igt_hdcp_output_is_dp_mst:
+ * @output: output to check
+ * @index: index of @output within the set of outputs being iterated
+ * @prev_connector_id: in/out connector id of the DP-MST topology being
+ * tracked across calls; the caller owns this state (set to a sentinel like
+ * -1 before iterating). Updated when @index == 0.
+ *
+ * Returns: true if @output is a DP-MST connector belonging to the same
+ * topology as the one seen at @index == 0.
+ */
+bool igt_hdcp_output_is_dp_mst(igt_output_t *output, int index,
+			       int *prev_connector_id)
+{
+	int connector_id;
+
+	connector_id = igt_get_dp_mst_connector_id(output);
+	if (connector_id < 0)
+		return false;
+
+	/*
+	 * Discarding outputs of other DP MST topology.
+	 * Testing only on outputs on the topology we got previously
+	 */
+	if (index == 0)
+		*prev_connector_id = connector_id;
+	else if (connector_id != *prev_connector_id)
+		return false;
+
+	return true;
+}
diff --git a/lib/igt_hdcp.h b/lib/igt_hdcp.h
new file mode 100644
index 000000000..0abaa9904
--- /dev/null
+++ b/lib/igt_hdcp.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef IGT_HDCP_H
+#define IGT_HDCP_H
+
+#include <stdbool.h>
+#include <linux/types.h>
+
+#include "igt_kms.h"
+
+#define IGT_HDCP_UNDESIRED	0
+#define IGT_HDCP_DESIRED	1
+#define IGT_HDCP_ENABLED	2
+
+/*
+ * IGT_HDCP_CONTENT_TYPE_0 can be handled on both HDCP1.4 and HDCP2.2. Where
+ * as IGT_HDCP_CONTENT_TYPE_1 can be handled only through HDCP2.2.
+ */
+#define IGT_HDCP_CONTENT_TYPE_0	0
+#define IGT_HDCP_CONTENT_TYPE_1	1
+
+#define IGT_HDCP_LIC_PERIOD_MSEC			(4 * 1000)
+/* Kernel retry count=3, Max time per authentication allowed = 6Sec */
+#define IGT_HDCP_KERNEL_AUTH_TIME_ALLOWED_MSEC		(3 *  6 * 1000)
+#define IGT_HDCP_KERNEL_AUTH_TIME_ADDITIONAL_MSEC	100
+#define IGT_HDCP_KERNEL_DISABLE_TIME_ALLOWED_MSEC	(1 * 1000)
+
+void igt_hdcp_set_content_protection_desired(igt_output_t *output,
+					     int content_type,
+					     bool type_change);
+void igt_hdcp_set_content_protection_undesired(igt_output_t *output);
+
+bool igt_hdcp_wait_for_prop_value(igt_output_t *output, uint64_t expected,
+				  uint32_t timeout_mSec);
+bool igt_hdcp_wait_for_prop_value_multi(igt_output_t **outputs, int count,
+					uint64_t expected,
+					uint32_t first_timeout_mSec,
+					uint32_t additional_timeout_mSec);
+
+bool igt_hdcp_check_lic(igt_output_t **outputs, int count, int first_output,
+			uint32_t period_mSec, bool retry_once,
+			int *failed_index);
+
+bool igt_hdcp_sink_capable(int drm_fd, igt_output_t *output,
+			   int hdcp_version);
+bool igt_hdcp_output_capable(int drm_fd, igt_output_t *output,
+			     int content_type);
+
+bool igt_hdcp_is_output_test_exempt(int drm_fd, igt_output_t *output,
+				    const char *const blocklist[],
+				    size_t blocklist_size);
+int igt_hdcp_get_capable_outputs(igt_display_t *display, int drm_fd,
+				 int content_type,
+				 const char *const blocklist[],
+				 size_t blocklist_size,
+				 igt_output_t **hdcp_outputs,
+				 int max_outputs);
+
+void igt_hdcp_force_hdcp14(int drm_fd, igt_output_t *output, bool enable);
+
+bool igt_hdcp_output_is_dp_mst(igt_output_t *output, int index,
+			       int *prev_connector_id);
+
+#endif /* IGT_HDCP_H */
diff --git a/lib/meson.build b/lib/meson.build
index 911bf3550..c5e2d7ef6 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -105,6 +105,7 @@ lib_sources = [
 	'igt_list.c',
 	'igt_map.c',
 	'igt_panel.c',
+	'igt_hdcp.c',
 	'igt_pm.c',
 	'igt_dummyload.c',
 	'igt_store.c',
-- 
2.43.0

