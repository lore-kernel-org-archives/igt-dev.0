Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E55DC2BA1A
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 08:31:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0793C10E5E6;
	Tue, 18 Jun 2024 08:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jD/tsQI4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30FA10E5E2
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 08:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718699459; x=1750235459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NvHnTiyMWTenlU4SPK+Sc3CinQInNWhhYyZRSqKYvkI=;
 b=jD/tsQI489tb2yVajvBKlKYBeC6ny7tbDSWxxXXl0bVxc559yfZmqk+j
 cwcYxResL3wzjeup8/EeNN0KNqwXPXEuiHJakVCI9f/6qYLWpNzt+M2gn
 4wmQvgWOMD5gU9R9YCA+bHXeGoZAK0hWoDL8Gh59dIcsnPQoEheNCsC5S
 LPvLd9BezOQzXop3nQ4d3MPUEmquPfQOJHTbPG9ND7MvXVr+gWa0bkMg8
 hL2wVso1qkaHyMW3wgSGSrH4ewNj1JRKcdMQvSaeKUw0I7RfZZhaVPy/G
 tKkroNk1I4qCWT8JXzUCuaXmYZOsBrpOpqSuigGyPcY5mzR1A/6qvUj49 w==;
X-CSE-ConnectionGUID: rudUJ/yeSvWDsAuLbtWukA==
X-CSE-MsgGUID: sxRp9MsgSACIEfWeV/svjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="38082173"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="38082173"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 01:30:58 -0700
X-CSE-ConnectionGUID: eLLeUR6xR0O7iv/R5NGN2w==
X-CSE-MsgGUID: Z1DhabcvTSyOTaqzvkdnqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="64699555"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 01:30:56 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	jeevan.b@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [i-g-t V6 3/8] lib/igt_kms: New helper to check force joiner status
Date: Tue, 18 Jun 2024 13:52:43 +0530
Message-ID: <20240618082248.4070611-4-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
References: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
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
index c0aa92eb5..9fdfadde1 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6359,6 +6359,40 @@ bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name)
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

