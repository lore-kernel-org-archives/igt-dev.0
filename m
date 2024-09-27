Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77A9CDD1B2
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 13:50:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F12E10E0CC;
	Fri, 27 Sep 2024 13:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dTXFUXoy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F6410E0CC
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 13:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727445026; x=1758981026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+AtMpcH3eiRivS7rqxIWyRVq6/ZGnRJy+H1qPM28UEM=;
 b=dTXFUXoy3DfgwwGfYCp6EWiLo6ER1j3f8jTPbywd8KqutLeS7L7JCOly
 5AiV0+9nWmwUH8NSmkxu9u7iymak1KFoekge8MslPwxv/eLo+GKQfgKHH
 kJ5CXo0GO6+qXB4e2CR8ZwGeswKENK+w4FA1r1OMPnMB4wlpy1LtfMeb+
 lyabxrvVWMqjpmI/QMt60N6v3PukNako5rZ9oyK6Wm2jYUcJXz9d+0UrR
 sbzAvw06qEPGTy74fxuM/cselygsd38uHhqKvVn9Scj94rI3bmoDuRIl4
 GKYL+9BW7FVhVywbNIQ1+QABOBu1i/uhf7kbYUMH4peuFX3xSEtsuHBL7 w==;
X-CSE-ConnectionGUID: 8TImWi4uQfiQWmksUl+/Bw==
X-CSE-MsgGUID: NlLJfCwrSfiwT24fKWjSfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="49115999"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="49115999"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 06:50:25 -0700
X-CSE-ConnectionGUID: XyXKtno0SvOiOfjXkDxYhg==
X-CSE-MsgGUID: N6JbnmIVT9ibn0icBkkUfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="72850014"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 06:50:23 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
	Imre Deak <imre.deak@intel.com>
Subject: [PATCH i-g-t 1/6] lib/igt_kms: add DP link management helper functions
Date: Fri, 27 Sep 2024 19:32:17 +0530
Message-Id: <20240927140222.1688565-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927140222.1688565-1-kunal1.joshi@intel.com>
References: <20240927140222.1688565-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
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

Added helper functions for below
- read current/max link_rate/lane_count
- forcing link retraining
- forcing link training failures
- read pending retrain
- read pending link training failures
- checking output supports forcing lt failures
- force link_rate/lane_count

v2: combine all link training debugfs in one patch (Imre)
    remove unwanted valid output check (Imre)
    return link_rate/lane_count marked with '*' or an error (Imre)
v3: add debugfs_connector_read/write helpers (Imre)
v4: use strlen (Imre)
    rename star_ptr -> marked_ptr (Imre)
    use O_RDONLY (Imre)

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_kms.c | 307 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  10 ++
 2 files changed, 317 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b40470c02..571f78eb9 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -47,6 +47,7 @@
 #include <poll.h>
 #include <errno.h>
 #include <time.h>
+#include <ctype.h>
 
 #include <i915_drm.h>
 
@@ -6713,3 +6714,309 @@ int get_num_scalers(igt_display_t *display, enum pipe pipe)
 
 	return num_scalers;
 }
+
+/**
+ * igt_parse_marked_value:
+ * @buf: Buffer containing the content to parse
+ * @marked_char: The character marking the value to parse
+ * @result: Pointer to store the parsed value
+ *
+ * Finds the integer value in the buffer that is marked by the given character.
+ *
+ * Returns: 0 on success, -1 on failure
+ */
+static int igt_parse_marked_value(const char *buf, char marked_char, int *result)
+{
+	char *marked_ptr, *val_ptr;
+
+	/*
+	 * Look for the marked character
+	 */
+	marked_ptr = strchr(buf, marked_char);
+
+	if (marked_ptr) {
+		val_ptr = marked_ptr - 1;
+		while (val_ptr > buf && isdigit(*val_ptr))
+			val_ptr--;
+		val_ptr++;
+		if (sscanf(val_ptr, "%d", result) == 1)
+			return 0;
+	}
+	return -1;
+}
+
+/**
+ * igt_debugfs_read_connector_file:
+ * @drm_fd: A drm file descriptor
+ * @conn_name: Name of the output connector
+ * @filename: The file to read from in the connector's directory
+ * @buf: Buffer to store the read content
+ * @buf_size: Size of the buffer
+ *
+ * Reads from a specific file in the connector's debugfs directory.
+ *
+ * Returns: 0 on success, -1 on failure.
+ */
+static int igt_debugfs_read_connector_file(int drm_fd, char *conn_name,
+				    const char *filename, char *buf,
+				    size_t buf_size)
+{
+	int dir, res;
+
+	dir = igt_debugfs_connector_dir(drm_fd, conn_name, O_RDONLY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n", conn_name);
+
+	res = igt_debugfs_simple_read(dir, filename, buf, buf_size);
+	close(dir);
+
+	if (res < 0)
+		return -1;
+
+	return 0;
+}
+
+/**
+ * igt_debugfs_write_connector_file:
+ * @drm_fd: A drm file descriptor
+ * @conn_name: Name of the output connector
+ * @filename: The file to write to in the connector's directory
+ * @data: Data to write to the file
+ * @data_size: Size of the data to write
+ *
+ * Writes to a specific file in the connector's debugfs directory.
+ *
+ * Returns: 0 on success, -1 on failure.
+ */
+static int igt_debugfs_write_connector_file(int drm_fd, char *conn_name,
+				     const char *filename, const char *data,
+				     size_t data_size)
+{
+	int dir, res;
+
+	dir = igt_debugfs_connector_dir(drm_fd, conn_name, O_RDONLY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+		     conn_name);
+
+	res = igt_sysfs_write(dir, filename, data, data_size);
+	close(dir);
+
+	if (res < 0)
+		return -1;
+
+	return 0;
+}
+
+/**
+ * igt_get_current_link_rate:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: link_rate if set for output else -1
+ */
+int igt_get_current_link_rate(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int res, ret;
+
+	res = igt_debugfs_read_connector_file(drm_fd, output->name,
+					       "i915_dp_force_link_rate",
+					       buf, sizeof(buf));
+	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_rate\n",
+			       output->name);
+	res = igt_parse_marked_value(buf, '*', &ret);
+	igt_assert_f(res == 0, "Output %s not enabled\n", output->name);
+	return ret;
+}
+
+/**
+ * igt_get_current_lane_count:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: lane_count if set for output else -1
+ */
+int igt_get_current_lane_count(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int res, ret;
+
+	res = igt_debugfs_read_connector_file(drm_fd, output->name,
+					      "i915_dp_force_lane_count",
+					      buf, sizeof(buf));
+	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_lane_count\n",
+			       output->name);
+	res = igt_parse_marked_value(buf, '*', &ret);
+	igt_assert_f(res == 0, "Output %s not enabled\n", output->name);
+	return ret;
+}
+
+/**
+ * igt_get_max_link_rate:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: max_link_rate
+ */
+int igt_get_max_link_rate(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int res, ret;
+
+	res = igt_debugfs_read_connector_file(drm_fd, output->name,
+					       "i915_dp_max_link_rate",
+					       buf, sizeof(buf));
+	igt_assert_f(res == 0, "Unable to read %s/i915_dp_max_link_rate\n",
+		     output->name);
+
+	sscanf(buf, "%d", &ret);
+	return ret;
+}
+
+/**
+ * igt_get_max_link_rate:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: max_link_rate
+ */
+int igt_get_max_lane_count(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int res, ret;
+
+	res = igt_debugfs_read_connector_file(drm_fd, output->name,
+					       "i915_dp_max_lane_count",
+					       buf, sizeof(buf));
+	igt_assert_f(res == 0, "Unable to read %s/i915_dp_max_lane_count\n",
+		     output->name);
+
+	sscanf(buf, "%d", &ret);
+	return ret;
+}
+
+/**
+ * igt_force_link_retrain:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ * @retrain_count: number of retraining required
+ *
+ * Force link retrain on the output.
+ */
+void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count)
+{
+	char value[2];
+	int res;
+
+	snprintf(value, sizeof(value), "%d", retrain_count);
+	res = igt_debugfs_write_connector_file(drm_fd, output->name,
+					       "i915_dp_force_link_retrain",
+					       value, strlen(value));
+	igt_assert_f(res == 0, "Unable to write to %s/i915_dp_force_link_retrain\n",
+			  output->name);
+}
+
+/**
+ * igt_force_lt_failure:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ * @failure_count: 1 for same link param and
+ *		   2 for reduced link params
+ *
+ * Force link training failure on the output.
+ * @failure_count: 1 for retraining with same link params
+ *		   2 for retraining with reduced link params
+ */
+void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count)
+{
+	char value[2];
+	int res;
+
+	snprintf(value, sizeof(value), "%d", failure_count);
+	res = igt_debugfs_write_connector_file(drm_fd, output->name,
+					       "i915_dp_force_link_training_failure",
+					       value, strlen(value));
+	igt_assert_f(res == 0, "Unable to write to %s/i915_dp_force_link_training_failure\n",
+			  output->name);
+}
+
+/**
+ * igt_get_dp_link_retrain_disabled:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: True if link retrain disabled, false otherwise
+ */
+bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int res;
+
+	res = igt_debugfs_read_connector_file(drm_fd, output->name,
+					      "i915_dp_link_retrain_disabled",
+					      buf, sizeof(buf));
+	igt_assert_f(res == 0, "Unable to read %s/i915_dp_link_retrain_disabled\n",
+			       output->name);
+	return strstr(buf, "yes");
+}
+
+/**
+ * Checks if the force link training failure debugfs
+ * is available for a specific output.
+ *
+ * @drmfd: file descriptor of the DRM device.
+ * @output: output to check.
+ * Returns:
+ *  true if the debugfs is available, false otherwise.
+ */
+bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output)
+{
+	char buf[512];
+	int res;
+
+	res = igt_debugfs_read_connector_file(drmfd, output->name,
+					      "i915_dp_link_retrain_disabled",
+					      buf, sizeof(buf));
+	return res == 0;
+}
+
+/**
+ * igt_get_dp_pending_lt_failures:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: Number of pending link training failures.
+ */
+int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int res, ret;
+
+	res = igt_debugfs_read_connector_file(drm_fd, output->name,
+					      "i915_dp_force_link_training_failure",
+					      buf, sizeof(buf));
+	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_training_failure\n",
+			       output->name);
+	sscanf(buf, "%d", &ret);
+	return ret;
+}
+
+/**
+ * igt_dp_pending_retrain:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: Number of pending link retrains.
+ */
+int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int res, ret;
+
+	res = igt_debugfs_read_connector_file(drm_fd, output->name,
+					      "i915_dp_force_link_retrain",
+					      buf, sizeof(buf));
+	igt_assert_f(res == 0, "Unable to read %s/i915_dp_force_link_retrain\n",
+			       output->name);
+	sscanf(buf, "%d", &ret);
+	return ret;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 25ba50916..7d9c28d81 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1224,5 +1224,15 @@ bool intel_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
 int get_num_scalers(igt_display_t *display, enum pipe pipe);
+int igt_get_current_lane_count(int drm_fd, igt_output_t *output);
+int igt_get_current_link_rate(int drm_fd, igt_output_t *output);
+int igt_get_max_link_rate(int drm_fd, igt_output_t *output);
+int igt_get_max_lane_count(int drm_fd, igt_output_t *output);
+void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count);
+void igt_force_lt_failure(int drm_fd, igt_output_t *output, int failure_count);
+bool igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output);
+bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output);
+int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
+int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.40.1

