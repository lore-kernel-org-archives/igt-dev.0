Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8A1C54E4A
	for <igt-dev@archiver.kernel.org>; Sun,  3 Mar 2024 17:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C8D10F10C;
	Sun,  3 Mar 2024 17:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hqd5K6c1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DFD10F10C
 for <igt-dev@lists.freedesktop.org>; Sun,  3 Mar 2024 17:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709485908; x=1741021908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5l/+Hhu0q+dR0qQWbpodPV6PRsvYt47Cr+RTFrG/6Xs=;
 b=hqd5K6c1EzX39DCf+/2ZJQuanOytVRZ8sXFS8RF8m0a5XMrQ86hXoRNn
 TW/KI3/Vzx+NzGN8rqcg2ypHFXrM7TlYaPit1eVIDE8wZ/smsbgRV7J2f
 mlGHH4phHxk2AJpPjh1KbxmnOKCyJLAZIFZrrjMLleR3MY/irSVkI/Ecr
 1kvARIXBa3s3PNNdNRx4d+WP5ooezfPVFMeqrHEDgCswSQuBzgARFAElq
 Mdgbji1Oq69LdH5rkHgMkNeNYpytOTTYxN/gDYx7lBVwmZVAjOrbtdk0m
 CS+qW1Fsi6eyhrzPGYNYSB8F+mqM4uYaMdNIjz7gU0ko1fPx1Oyy/DmiR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="3833271"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="3833271"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2024 09:11:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; d="scan'208";a="13303461"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 09:11:45 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 2/4] lib/igt_kms: add helpers to enable/disable force
 joiner
Date: Sun,  3 Mar 2024 22:52:14 +0530
Message-Id: <20240303172216.254535-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240303172216.254535-1-kunal1.joshi@intel.com>
References: <20240303172216.254535-1-kunal1.joshi@intel.com>
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

