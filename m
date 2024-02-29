Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4715EC48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 17:59:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C215A10E201;
	Thu, 29 Feb 2024 17:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZwH7lbI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4911A10E025
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 17:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709229593; x=1740765593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5l/+Hhu0q+dR0qQWbpodPV6PRsvYt47Cr+RTFrG/6Xs=;
 b=YZwH7lbIHjlD7h/1RRvWUVBO7XjCmrviAO+VaPE6jYb/Iy7DE1S38vqn
 v3GWcIxW+jmAdos0yrhJw4/MUKJbk2/NeP3IJTAJLGOvc4M2F0PKwrkyq
 D1ADmdbPQKzUjfhUMAtFUX3lbcngFwZVh7d6knvwiNY8zA2F+GSaaiVoP
 6mkTWY6E6Kui6RTWmlNMvCIX/vvvuXltJ24Eq1pigD7JYD27oVMQHwrFE
 Sojpe2XbxchxEvw0F9yolmaUKBWq6qQY7vwv9jJBssGqgEF0qv/WhrZ3r
 /Ook2sjFqhKE6Zt9j209sjM/sRrignRYUACPEBCtZ5bfMNx5kHcYvUyfE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="21264856"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="21264856"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 09:59:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8337996"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 09:59:51 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 2/4] lib/igt_kms: add helpers to enable/disable force
 joiner
Date: Thu, 29 Feb 2024 23:40:19 +0530
Message-Id: <20240229181021.130314-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229181021.130314-1-kunal1.joshi@intel.com>
References: <20240229181021.130314-1-kunal1.joshi@intel.com>
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

add helped to enable/disable force joiner and for
checking current state enabled/disabled

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 50 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 89956b9d5..e6952f56a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6242,6 +6242,54 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 	return true;
 }
 
+/**
+ * Checks if the force big joiner is enabled for a specific connector.
+ *
+ * @param drmfd The file descriptor of the DRM device.
+ * @param connector_name The name of the connector.
+ * Returns:
+ *  1 if the force big joiner is enabled, 0 if disabled, and -1 on error.
+ */
+int igt_check_force_bigjoiner_status(int drmfd, char *connector_name)
+{
+	char buf[512];
+	int debugfs_fd, ret;
+
+	debugfs_fd = igt_debugfs_connector_dir(drmfd, connector_name, O_RDONLY);
+	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable",
+								  buf, sizeof(buf));
+	if (ret < 0) {
+		igt_info("Could not read debugfs %s\n",
+				 strerror(-ret));
+		return -1;
+	}
+	if (strstr(buf, "Bigjoiner enable: 1"))
+		return 1;
+	else if (strstr(buf, "Bigjoiner enable: 0"))
+		return 0;
+	else
+		return -1;
+}
+
+/**
+ * Forces the enable/disable state of big joiner for a specific connector.
+ *
+ * @param drmfd The file descriptor of the DRM device.
+ * @param connector_name The name of the connector.
+ * @param enable The desired state of big joiner (true for enable, false for disable).
+ * Returns:
+ *  >=0 on success, otherwise an error code.
+ */
+int igt_force_bigjoiner_enable(int drmfd, char *connector_name, bool enable)
+{
+	int debugfs_fd, ret;
+
+	debugfs_fd = igt_debugfs_connector_dir(drmfd, connector_name, O_DIRECTORY);
+	ret = igt_sysfs_write(debugfs_fd, "i915_bigjoiner_force_enable", enable ? "1" : "0", 1);
+	close(debugfs_fd);
+	return ret;
+}
+
 /**
  * igt_parse_mode_string:
  * @mode_string: modeline string
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index bab8487d3..b28022db4 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1215,6 +1215,8 @@ bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
 bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock);
 bool igt_check_bigjoiner_support(igt_display_t *display);
+int igt_check_force_bigjoiner_status(int drmfd, char *connector_name);
+int igt_force_bigjoiner_enable(int drmfd, char *connector_name, bool enable);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool intel_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(igt_output_t *output);
-- 
2.25.1

