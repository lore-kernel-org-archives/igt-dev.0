Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3276EC5321D
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 09:14:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7D910E223;
	Mon, 19 Aug 2024 09:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2eIuvxh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3AF10E223
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 09:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724058861; x=1755594861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K7jsJhU78Lu3vLzKE8l+BYix2kdC9dFYb0mlDsZoJos=;
 b=H2eIuvxhS++T12+391YNBqdSi7derZrmz2EdG9iUMzA35LU5Jr1OANlZ
 D3mAdixUUPZCvDcCYTMAliP8suSWoSygm2l1bbixTVXNOSeF93jv0dZ1A
 lVGuup9jtZafa5eLexn4DGFX+9JUE/DxBB0cFHc6n7QWpn830RBZfzixl
 03T2JUyIE1SadjaCAEZf2DbVMoeNUpnB8VfgbPZj5DyiXo1Xf9xDqclDm
 4rmgQ3+D3F7ncqIqCfhe+ff3uO5oBdv5638qLzRcXccnb9JVW/xzDOx7O
 MhP9mHwYAVgoDWm9yEViaCuMBgZvusl3YuCIavf71clEHuw51Oo0uK5w+ g==;
X-CSE-ConnectionGUID: SN+ecp3rQS2AMHchOcvGDQ==
X-CSE-MsgGUID: 74h7KcxwQ9WX67dMww8zdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="44816299"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="44816299"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 02:14:21 -0700
X-CSE-ConnectionGUID: mHifOZiiT4WedMRmYvebqQ==
X-CSE-MsgGUID: l8x6gGJNS7uAuw/tmY53rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="60884157"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 02:14:20 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 02/12] lib/igt_kms: add function to force/read a target
 link rate/lane count
Date: Mon, 19 Aug 2024 14:56:05 +0530
Message-Id: <20240819092615.3669803-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240819092615.3669803-1-kunal1.joshi@intel.com>
References: <20240819092615.3669803-1-kunal1.joshi@intel.com>
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
 lib/igt_kms.c | 144 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |   6 +++
 2 files changed, 150 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e030b35a6..183cb134a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6685,3 +6685,147 @@ int get_num_scalers(int drm_fd, enum pipe pipe)
 
 	return num_scalers;
 }
+
+static bool force_connector_lane_count(int drm_fd,
+					  drmModeConnector *connector,
+					  const char *value)
+{
+	return connector_attr_set_debugfs(drm_fd, connector,
+					  "i915_dp_force_lane_count",
+					  "auto", value);
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
+bool kmstest_force_connector_lane_count(int drm_fd, drmModeConnector *connector, const char *lane)
+{
+	drmModeConnector *temp;
+
+	if (!is_intel_device(drm_fd))
+		return false;
+
+	if (!force_connector_lane_count(drm_fd, connector, lane))
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
+					  "auto", value);
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
+bool kmstest_force_connector_link_rate(int drm_fd, drmModeConnector *connector, const char *link)
+{
+	drmModeConnector *temp;
+
+	if (!is_intel_device(drm_fd))
+		return false;
+
+	if (!force_connector_link_rate(drm_fd, connector, link))
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
index 11d4acf4e..2dd8c1bff 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -288,6 +288,10 @@ bool kmstest_force_connector(int fd, drmModeConnector *connector,
 bool kmstest_force_connector_bigjoiner(int drm_fd, drmModeConnector *connector);
 void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
 			const struct edid *edid);
+bool kmstest_force_connector_lane_count(int drm_fd, drmModeConnector *connector,
+					const char *lane);
+bool kmstest_force_connector_link_rate(int drm_fd, drmModeConnector *connector,
+				       const char *link);
 
 bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
 					drmModeModeInfo *mode);
@@ -1247,5 +1251,7 @@ bool intel_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
 int get_num_scalers(int drm_fd, enum pipe pipe);
+enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd, igt_output_t *output);
+enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t *output);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

