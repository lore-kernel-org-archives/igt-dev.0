Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD516C5320E
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 09:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02B410E226;
	Mon, 19 Aug 2024 09:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VdFiDiwu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7764610E226
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 09:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724058865; x=1755594865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8ycEg7BL71RrdSntedpCZSA3wgflYxNCrSdFHUadFp4=;
 b=VdFiDiwujh+5ItoQC8oWxNKIGFyFuKV3h2T5ZUJLoYfpzlBIuTQYc8wD
 om7YMNoPnODWKKGJC3TXEL90KtzmcFpXyaPrECdZNCN6gtBZGHTwEs7yi
 OfmsXvze+lt8iXvxDIqVR21218F9Z2/vyOWP7Q5V3hKizqh3jA04Zh0OW
 s3PYeAxYRHjY0gyJfCNIspigMdqseumWOTi7R9eq2fCgXmeYFUHcOzPgb
 YIQmCuvPNKwwI9zQPchbWgaPJ11QL9nZ1Msrd9KN29rKevjdqghvApJOh
 Z5NYaeNmeXO9XNvH053EPg8/TPyKQWpRbjcQ1v4J1NWs5WDeo0sJL0RQI Q==;
X-CSE-ConnectionGUID: 13EpkrSoT4STdlXT6LV7ww==
X-CSE-MsgGUID: SbhFhm7gRuuXwV620CGQuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="44816310"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="44816310"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 02:14:25 -0700
X-CSE-ConnectionGUID: ayb+aQN8S0q/q/guDdepxA==
X-CSE-MsgGUID: NbUiRGELQZy+Mt5L2EKtAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="60884166"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 02:14:22 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 04/12] lib/igt_kms: add function to force link retrain
Date: Mon, 19 Aug 2024 14:56:07 +0530
Message-Id: <20240819092615.3669803-5-kunal1.joshi@intel.com>
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

add two helper one allows to set and restore to
specified default value on exit, while the second
only allows forcing link retrain without any restoration

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 70 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1115a0b93..05e115d9c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6772,6 +6772,51 @@ bool kmstest_force_connector_link_rate(int drm_fd, drmModeConnector *connector,
 	return true;
 }
 
+static bool force_connector_retrain(int drm_fd,
+					  drmModeConnector *connector,
+					  const char *value)
+{
+	return connector_attr_set_debugfs(drm_fd, connector,
+					  "i915_dp_force_link_retrain",
+					  value, "1");
+}
+
+/**
+ * kmstest_force_connector_force_retrain:
+ * @fd: drm file descriptor
+ * @connector: connector
+ * @retrain_count: number of time to retrain
+ *
+ * Force retraining on the specified connector
+ * and install exit handler for resetting
+ *
+ * Returns: True on success
+ */
+bool kmstest_force_connector_retrain(int drm_fd, drmModeConnector *connector, int retrain_count)
+{
+	char value[2];
+	drmModeConnector *temp;
+
+	if (!is_intel_device(drm_fd))
+		return false;
+
+	snprintf(value, sizeof(value), "%d", retrain_count);
+	if (!force_connector_retrain(drm_fd, connector, value))
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
 /**
  * igt_get_dp_link_rate_set_for_output:
  * @drm_fd: A drm file descriptor
@@ -6887,3 +6932,25 @@ enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output)
 
 	return max_lane_count;
 }
+
+/**
+ * igt_force_link_retrain:
+ * @drm_fd: A drm file descriptor
+ * @output: Target output
+ * @retrain_count: number of retraining required
+ *
+ * Force retrain the link on given output
+ */
+void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count)
+{
+	int dir;
+	char value[2];
+
+	snprintf(value, sizeof(value), "%d", retrain_count);
+	igt_require_f(output->name, "Invalid output");
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	igt_assert_f(dir >= 0, "Failed to open debugfs dir for connector %s\n",
+			       igt_output_name(output));
+	igt_sysfs_write(dir, "i915_dp_force_link_retrain", value, sizeof(value));
+	close(dir);
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b65c478c9..4a90b5398 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -292,6 +292,8 @@ bool kmstest_force_connector_lane_count(int drm_fd, drmModeConnector *connector,
 					const char *lane);
 bool kmstest_force_connector_link_rate(int drm_fd, drmModeConnector *connector,
 				       const char *link);
+bool kmstest_force_connector_retrain(int drm_fd, drmModeConnector *connector,
+				     int retrain_count);
 
 bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
 					drmModeModeInfo *mode);
@@ -1255,5 +1257,6 @@ enum dp_link_rate igt_get_dp_link_rate_set_for_output(int drm_fd, igt_output_t *
 enum dp_lane_count igt_get_dp_lane_count_set_for_output(int drm_fd, igt_output_t *output);
 enum dp_link_rate igt_get_dp_max_link_rate(int drm_fd, igt_output_t *output);
 enum dp_lane_count igt_get_dp_max_lane_count(int drm_fd, igt_output_t *output);
+void igt_force_link_retrain(int drm_fd, igt_output_t *output, int retrain_count);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

