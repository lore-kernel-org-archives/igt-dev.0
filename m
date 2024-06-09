Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27086C27C55
	for <igt-dev@archiver.kernel.org>; Sun,  9 Jun 2024 21:13:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C3110E2C2;
	Sun,  9 Jun 2024 21:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XKzWVTm3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A7510E2B9
 for <igt-dev@lists.freedesktop.org>; Sun,  9 Jun 2024 21:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717967624; x=1749503624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hfVYHlUkhjwePvsHK3A4+nOYhd3xrQlNQ/oijsUgHL0=;
 b=XKzWVTm3EbTTdxaMAEIhklljyuGOg8o/pOIxfmotJ0KDQgMJOd//7AVi
 AAsTMHvdYpkP+Xzl4D6wx7oXvnFgTEGW7jsMxKY40naNUJK/r3bZ+mRK/
 cHSImYkj6aHlxEQ6XAAO0a85RsFzxPUCEO4an+XYPGHoaiNl/PiYSFX8L
 X+bdOFjh4WXLXk4h0TyW7HvKRA3tFBz9ogj3nNKsKxW9zwCFy9IlDpFvs
 dA4eMZKldmTjFo6l3cOUAo3ElRBtqu65MR6+z69MswXPbdkfbH3PcF0Sy
 5tg/M5DmY7ag08m748dwXRRO1wNY+GIpyliO4AxFrYbEk9CFV5GAOA3mt Q==;
X-CSE-ConnectionGUID: r0Prpr3xQ4OIe7bRL1jaYg==
X-CSE-MsgGUID: WEdk2qxZTiumvCUMEelJGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="26037479"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="26037479"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 14:13:43 -0700
X-CSE-ConnectionGUID: qbfyw/T+TECf0A4R94bZPw==
X-CSE-MsgGUID: YVwzPIauRiK5OVUoizFTPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="38991014"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 14:13:42 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 2/9] lib/igt_kms: add function to get/set a target link
 rate/lane count
Date: Mon, 10 Jun 2024 02:55:28 +0530
Message-Id: <20240609212535.868832-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240609212535.868832-1-kunal1.joshi@intel.com>
References: <20240609212535.868832-1-kunal1.joshi@intel.com>
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

[1] allows to set/get link rate/lane count for a particular
connector. add functions to retrieve and write data to newly
exposed interface

[1] https://patchwork.freedesktop.org/patch/594770/?series=133624&rev=3
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 176 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |   7 ++
 2 files changed, 183 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index af63d13b1..54e982c81 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6581,3 +6581,179 @@ int get_num_scalers(int drm_fd, enum pipe pipe)
 
 	return num_scalers;
 }
+
+void read_link_rates(int drm_fd, uint64_t *link_rates, int *num_rates, igt_output_t *output)
+{
+	char buf[1024];
+	const char *delimiters = " []*";
+	int count = 0;
+	int dir, res, rate;
+	char *token;
+
+	igt_require_f(output->name, "Invalid output");
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_DIRECTORY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+			       igt_output_name(output));
+	res = igt_debugfs_simple_read(dir, "i915_dp_set_link_rate",
+				      buf, sizeof(buf));
+	close(dir);
+	igt_require_f(res > 0, "Couldn't read i915_dp_set_link_rate");
+	buf[strcspn(buf, "\n")] = 0;
+	token = strtok(buf, delimiters);
+
+	while (token != NULL && count < DP_MAX_LINK_RATE_COUNT) {
+		rate = atoi(token);
+		if (rate != 0)
+			link_rates[count++] = rate;
+		token = strtok(NULL, delimiters);
+	}
+	*num_rates = count;
+}
+
+static bool force_connector_lane_count(int drm_fd,
+					  drmModeConnector *connector,
+					  const char *value)
+{
+	return connector_attr_set_debugfs(drm_fd, connector,
+					  "i915_dp_set_lane_count",
+					  value, "auto");
+}
+
+/**
+ * kmstest_force_connector_lane_count:
+ * @fd: drm file descriptor
+ * @connector: connector
+ * @lane_count: lane count
+ *
+ * Force lane count on the specified connector
+ * and install exit handler for resetting
+ *
+ * Returns: True on success
+ */
+bool kmstest_force_connector_lane_count(int drm_fd, drmModeConnector *connector, int lane_count)
+{
+	char value[2];
+	drmModeConnector *temp;
+
+	if (!is_intel_device(drm_fd))
+		return false;
+
+	snprintf(value, sizeof(value), "%d", lane_count);
+	if (!force_connector_lane_count(drm_fd, connector, value))
+		return false;
+
+	dump_connector_attrs();
+	igt_install_exit_handler(reset_connectors_at_exit);
+
+	/*
+	 * To allow callers to always use GetConnectorCurrent we need to force a
+	 * redetection here.
+	 */
+	temp = drmModeGetConnector(drm_fd, connector->connector_id);
+	drmModeFreeConnector(temp);
+
+	return true;
+}
+
+static bool force_connector_link_rate(int drm_fd,
+				      drmModeConnector *connector,
+				      const char *value)
+{
+	return connector_attr_set_debugfs(drm_fd, connector,
+					  "i915_dp_set_link_rate",
+					  value, "auto");
+}
+
+/**
+ * kmstest_force_connector_link_rate:
+ * @fd: drm file descriptor
+ * @connector: connector
+ * @link_rate: link rate
+ *
+ * Force link rate on the specified connector
+ * and install exit handler for resetting
+ *
+ * Returns: True on success
+ */
+bool kmstest_force_connector_link_rate(int drm_fd, drmModeConnector *connector, int link_rate)
+{
+	char value[8];
+	drmModeConnector *temp;
+
+	if (!is_intel_device(drm_fd))
+		return false;
+
+	snprintf(value, sizeof(value), "%d", link_rate);
+	if (!force_connector_link_rate(drm_fd, connector, value))
+		return false;
+
+	dump_connector_attrs();
+	igt_install_exit_handler(reset_connectors_at_exit);
+
+	/*
+	 * To allow callers to always use GetConnectorCurrent we need to force a
+	 * redetection here.
+	 */
+	temp = drmModeGetConnector(drm_fd, connector->connector_id);
+	drmModeFreeConnector(temp);
+
+	return true;
+}
+
+/**
+ * igt_get_dp_link_rate_set_for_output:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: Link rate set for the output.
+ */
+enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int dir, res;
+	int link_rate = DP_LINK_RATE_2000000;
+
+	igt_require_f(output->name, "Invalid output");
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+				 igt_output_name(output));
+	res = igt_debugfs_simple_read(dir, "i915_dp_set_link_rate", buf, sizeof(buf));
+	close(dir);
+	igt_require(res > 0);
+
+	if (strstr(buf, "[auto]"))
+		igt_assert(sscanf(strstr(buf, "*") - 6, "%d", &link_rate) == 1);
+	else
+		igt_assert(sscanf(strstr(buf, "[") + 1, "%d", &link_rate) == 1);
+
+	return link_rate;
+}
+
+/**
+ * igt_get_dp_lane_count_set_for_output:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ *
+ * Returns: Lane count set for the output.
+ */
+enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t *output)
+{
+	char buf[512];
+	int dir, res;
+	int lane_count = DP_LANE_COUNT_4;
+
+	igt_require_f(output->name, "Invalid output");
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+				 igt_output_name(output));
+	res = igt_debugfs_simple_read(dir, "i915_dp_set_lane_count", buf, sizeof(buf));
+	close(dir);
+	igt_require(res > 0);
+
+	if (strstr(buf, "[auto]"))
+		igt_assert(sscanf(strstr(buf, "*") - 2, "%d", &lane_count) == 1);
+	else
+		igt_assert(sscanf(strstr(buf, "[") + 1, "%d", &lane_count) == 1);
+
+	return lane_count;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 12649eca9..43bc238ae 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -296,6 +296,10 @@ bool kmstest_force_connector(int fd, drmModeConnector *connector,
 bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector *connector);
 void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
 			const struct edid *edid);
+bool kmstest_force_connector_lane_count(int drm_fd, drmModeConnector *connector,
+					int lane_count);
+bool kmstest_force_connector_link_rate(int drm_fd, drmModeConnector *connector,
+				       int link_rate);
 
 bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
 					drmModeModeInfo *mode);
@@ -1253,5 +1257,8 @@ bool intel_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
 int get_num_scalers(int drm_fd, enum pipe pipe);
+void read_link_rates(int drm_fd, uint64_t *link_rates, int *num_rates, igt_output_t *output);
+enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd, igt_output_t *output);
+enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

