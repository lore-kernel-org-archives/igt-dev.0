Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12A5C47DB3
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 16:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CB910E83C;
	Thu, 18 Jan 2024 16:09:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6E710E83C
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 16:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705594158; x=1737130158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZToJ+MeR1pxZkLifdWPCryBnzrxXKLn5k2kWkenTclk=;
 b=cAzj9EnrjmVY51zbtG+Lb3jAdVTEiSippy0EBPITZoJxgcZOChpX0y3n
 heiqueulh30utv+3lOmq/FtF5GGf0Cm9C0zZsi+fqj8lIuO21b1QbuzvA
 uSGP3GJkGPuukrXhSVFv158BScX0nhjklPplTvyJ8n1FXXcOPTY+sP0l9
 NI82XlucVpYWDzS13v2BopQXMJ3OO19eHbYPhje6MO3ugSLN3TMH6gN2Q
 fol8bgR+XYA15MKXIc8pf7SHXEkxuWQVW8Ac4j8l358PfKi+g+OEQWRkx
 9GaZb3doUwN8KytDFqZZGgbkpheEpYlZqgYP3TJFDzzeJjWDM6EYS7dfJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="382038"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="382038"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 08:09:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="33145330"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 08:09:16 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] lib/igt_kms: add support to force big joiner
Date: Thu, 18 Jan 2024 21:48:46 +0530
Message-Id: <20240118161847.1001234-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240118161847.1001234-1-kunal1.joshi@intel.com>
References: <20240118161847.1001234-1-kunal1.joshi@intel.com>
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

add helpers to enable/disable force joiner on a given connector
and check status for a given connector

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 56 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e4dea1a60..ad815d1b7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6217,6 +6217,60 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
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
+	char file_name[128] = {0};
+	char buf[512];
+	int ret;
+	int debugfs_fd = igt_debugfs_dir(drmfd);
+
+	sprintf(file_name, "%s/i915_bigjoiner_force_enable", connector_name);
+	ret = igt_debugfs_simple_read(debugfs_fd, file_name, buf, sizeof(buf));
+        if (ret < 0) {
+                igt_info("Could not read %s: %s\n",
+                         file_name, strerror(-ret));
+                return -1;
+        }
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
+ * This function allows the user to force the enable/disable state of
+ * big joiner for a specific connector.
+ *
+ * @param drmfd The file descriptor of the DRM device.
+ * @param connector_name The name of the connector.
+ * @param enable The desired state of big joiner (true for enable, false for disable).
+ * Returns:
+ *  >=0 on success, otherwise an error code.
+ */
+int igt_force_bigjoiner_enable(int drmfd, char *connector_name, bool enable)
+{
+	int debugfs_fd = igt_debugfs_dir(drmfd);
+	int len = enable ? 1 : 0;
+	int ret;
+	char file_path[128] = {0};
+
+	sprintf(file_path, "%s/i915_bigjoiner_force_enable", connector_name);
+	ret = igt_sysfs_write(debugfs_fd, file_path, enable ? "1" : "0", len);
+	close(debugfs_fd);
+	return ret;
+}
+
 /**
  * igt_parse_mode_string:
  * @mode_string: modeline string
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b3882808b..5f2fd5fbf 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1213,6 +1213,8 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
 int igt_get_max_dotclock(int fd);
 bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
 bool igt_check_bigjoiner_support(igt_display_t *display);
+int igt_check_force_bigjoiner_status(int drmfd, char *connector_name);
+int igt_force_bigjoiner_enable(int drmfd, char *connector_name, bool enable);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool intel_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(igt_output_t *output);
-- 
2.25.1

