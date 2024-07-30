Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD18C52D1D
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 21:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3186010E305;
	Tue, 30 Jul 2024 21:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJCMfK+w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD2410E1D1
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 21:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722375346; x=1753911346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xR9fDVTiUNmlM/vTsiK8kng60QuqwqMJEXQHVcvjMoA=;
 b=iJCMfK+w37svJS8RGQeu64yMPy2auoGMGOADg+KKwqvahF6je1kg+PA6
 2nhhzZY9EiaHAHIr8NoleF45cyv6lZZjsvmr7YFfesJJRrNVYOl9XCZEE
 iFZTlZfQlkEPnRDao73W3nrLUNP7oztxL9x3NDpQNRTV5EpEameTkRzrV
 z+kh/9vufjtBB8VlUtgGhVdMB3zMfRnQMQcwJ+8CvYfjGcXYhS6pIkWH8
 +jNJ5ZFYOkAdaWKgL20u8MjuMJ/whUIJT9MmkO3iFfe2f+jhDSfFaeixx
 0EMn9G4TQIvgJWfn4Ua/Sn3vAtmuEG+iSeCOhwHd7Q4SxApwPG3Bti0db w==;
X-CSE-ConnectionGUID: 24d6CP/SQHC4KNs6YI9pNw==
X-CSE-MsgGUID: glQrtJxfTjeGiqmDmQRhaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="37694590"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="37694590"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 14:35:45 -0700
X-CSE-ConnectionGUID: Yi8OBsWmQS6BZk2KezoG0A==
X-CSE-MsgGUID: Y/iAqCQrR9Gs4nZ4L23jOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="59321716"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.190.219.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 14:35:45 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 02/10] lib/igt_kms: add function to force/read a target
 link rate/lane count
Date: Wed, 31 Jul 2024 02:43:33 +0530
Message-ID: <20240730211343.58703-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730211343.58703-1-kunal1.joshi@intel.com>
References: <20240730211343.58703-1-kunal1.joshi@intel.com>
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

[1] allows to force/read link rate/lane count for a particular
connector. add functions to retrieve and write data to newly
exposed interface

[1] https://patchwork.freedesktop.org/patch/594770/?series=133624&rev=3
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 176 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |   7 ++
 2 files changed, 183 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 64318ef7f..a21ab0bc8 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6662,3 +6662,179 @@ int get_num_scalers(int drm_fd, enum pipe pipe)
 
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
+	res = igt_debugfs_simple_read(dir, "i915_dp_force_link_rate",
+				      buf, sizeof(buf));
+	close(dir);
+	igt_require_f(res > 0, "Couldn't read i915_dp_force_link_rate");
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
+					  "i915_dp_force_lane_count",
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
+					  "i915_dp_force_link_rate",
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
+	res = igt_debugfs_simple_read(dir, "i915_dp_force_link_rate", buf, sizeof(buf));
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
+	res = igt_debugfs_simple_read(dir, "i915_dp_force_lane_count", buf, sizeof(buf));
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
index b44d13bcb..cbec2c1ab 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -288,6 +288,10 @@ bool kmstest_force_connector(int fd, drmModeConnector *connector,
 bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector *connector);
 void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
 			const struct edid *edid);
+bool kmstest_force_connector_lane_count(int drm_fd, drmModeConnector *connector,
+					int lane_count);
+bool kmstest_force_connector_link_rate(int drm_fd, drmModeConnector *connector,
+				       int link_rate);
 
 bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
 					drmModeModeInfo *mode);
@@ -1246,5 +1250,8 @@ bool intel_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
 int get_num_scalers(int drm_fd, enum pipe pipe);
+void read_link_rates(int drm_fd, uint64_t *link_rates, int *num_rates, igt_output_t *output);
+enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd, igt_output_t *output);
+enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

