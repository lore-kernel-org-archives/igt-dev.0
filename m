Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABC7C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 29 Apr 2024 09:16:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359F810FE2E;
	Mon, 29 Apr 2024 09:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I2s0PkJz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB11710FE2E
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Apr 2024 09:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714382166; x=1745918166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z25hxSBKyKHBCKTP5uULWBABAkBX4xoV/3d/+KRJQB8=;
 b=I2s0PkJzE+VWINcEnkk+7/eouA5oWQKXXmCkbMaD3r8+oyJz5K4Pzj0V
 X01RR6vdc9ePqtkMQIL0lw+GvX7NNQEjLXgdjUjVPhKLdaoELdOoeg/Gq
 Kvf/vSqfpD/ObJa1AT7/5im+apvHniE3oR7dB7+z8l2rghyyK7VTSxIMg
 QgO4cF12Iym9iU0Iap6/tVZKW/WOjQJ/iSC4xTxYc/+IS66BEulcIYO+0
 Q6CT4Zil7B8wrBnERvt42vEStGRPU+tTEyQCb7Cte6GsKwzucnSRVOe+a
 SQua8MyyDO4DrMA3YVbyF/wjQUFTctQGEH4lqKBWYGe9D5Uy8t5QDXPF6 A==;
X-CSE-ConnectionGUID: pxZQsLW8SDWKM2/c+jqsHg==
X-CSE-MsgGUID: 28zMsoshSy6pOBNljnevWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="35428320"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="35428320"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 02:16:05 -0700
X-CSE-ConnectionGUID: 7Y3i6nHuQnSLZxJ3zGKJew==
X-CSE-MsgGUID: oroTZTS/R5S1Bmw6FHd9Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26059858"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 02:16:04 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [i-g-t V5 3/8] lib/igt_kms: New helper to check force joiner status
Date: Mon, 29 Apr 2024 14:39:25 +0530
Message-ID: <20240429090930.1905110-4-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240429090930.1905110-1-bhanuprakash.modem@intel.com>
References: <20240429090930.1905110-1-bhanuprakash.modem@intel.com>
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

Add a new function to check the force joiner status
on selected connecter, so that it would be helpful to
check the force joiner status from other places too.

V2: - Add few debug prints
V3: - Rebase

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 34 ++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 35 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 743650321..ed5a3db74 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6340,6 +6340,40 @@ bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name)
 	return ret >= 0;
 }
 
+/**
+ * igt_check_force_joiner_status
+ * @drmfd: file descriptor of the DRM device.
+ * @connector_name: connector to check.
+ *
+ * Checks if the force big joiner is enabled.
+ *
+ * Returns: True if the force big joiner is enabled, False otherwise.
+ */
+bool igt_check_force_joiner_status(int drmfd, char *connector_name)
+{
+	char buf[512];
+	int debugfs_fd, ret;
+
+	if (!connector_name)
+		return false;
+
+	debugfs_fd = igt_debugfs_connector_dir(drmfd, connector_name, O_RDONLY);
+	if (debugfs_fd < 0) {
+		igt_debug("Could not open debugfs for connector: %s\n", connector_name);
+		return false;
+	}
+
+	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
+	close(debugfs_fd);
+
+	if (ret < 0) {
+		igt_debug("Could not read i915_bigjoiner_force_enable for connector: %s\n", connector_name);
+		return false;
+	}
+
+	return strstr(buf, "Y");
+}
+
 /**
  * igt_check_bigjoiner_support:
  * @display: a pointer to an #igt_display_t structure
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 979cf1300..501d48763 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1216,6 +1216,7 @@ bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
 bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
 bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
+bool igt_check_force_joiner_status(int drmfd, char *connector_name);
 bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool intel_pipe_output_combo_valid(igt_display_t *display);
-- 
2.43.2

