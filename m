Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C42D711CD
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 17:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B46610E2D8;
	Wed, 20 Nov 2024 17:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GcEmpZKF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C1C10E2D8
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 17:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732123761; x=1763659761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z2CJek9nF0WliU0p04Ii0MOvwtBzQJ28hfwP/67Xygo=;
 b=GcEmpZKFZfm+Ea1IOOSb/BU8XKRNqFUplwsnn6lPOFrirlo1u2p5FXpa
 eUf37OdbQNAGR3tI2ux8i2Zk3+iIhwCgqS9h9UhoxG7rq05I44tfv/jb2
 uX5i/hO9RgELo5yfLJScE6zmXbT8AD+d+H5aNFGpxFAxMe6cd60iduOO8
 3i1/Gz91CeEjrCbekA8HFEwp6OApkuS//Z8xfcj9ZKM4cvnxs4TbFu0Tb
 1MsKSsl+VmCg4jG7BS+pbkM+/mpWKMTFVE3WPj+NNQMXbBsUd4FBY1PYm
 l9OCugxZS5Hvh9byLnYBCgJZLGS6xc0abnAtM6sqOLW8yUaevBdDrkvpf g==;
X-CSE-ConnectionGUID: /Nfy8avrSOy3gOHvdbp+BA==
X-CSE-MsgGUID: j3BzzQHZSI68wxvRaIvj3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32307841"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="32307841"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 09:29:21 -0800
X-CSE-ConnectionGUID: N4GyP4bGQFCsQNg2MndxxQ==
X-CSE-MsgGUID: MQ9T3t2zTdy3vwNe+TWpMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="113254889"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 09:29:19 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/3] lib/igt_kms: Add is_joiner_mode function
Date: Wed, 20 Nov 2024 23:13:43 +0530
Message-Id: <20241120174345.1970095-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241120174345.1970095-1-jeevan.b@intel.com>
References: <20241120174345.1970095-1-jeevan.b@intel.com>
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

Introduce a utility to check if bigjoiner or ultrajoiner
mode is required based on requirement.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_kms.c | 31 +++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 76f32e1e0..6fb5822ee 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6441,6 +6441,37 @@ bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
 	return found;
 }
 
+/**
+ * is_joiner_mode:
+ * @drm_fd: drm file descriptor
+ * @output: pointer to the output structure
+ *
+ * Checks if the current configuration requires Big Joiner or Ultra Joiner mode
+ * based on the maximum dot clock and connector settings.
+ *
+ * Returns: True if joiner mode is required, otherwise False.
+ */
+bool is_joiner_mode(int drm_fd, igt_output_t *output)
+{
+	bool is_joiner = false;
+	bool is_ultra_joiner = false;
+	int max_dotclock;
+	drmModeModeInfo mode;
+
+	max_dotclock = igt_get_max_dotclock(drm_fd);
+	is_joiner = bigjoiner_mode_found(drm_fd,
+					 output->config.connector,
+					 max_dotclock, &mode);
+	is_ultra_joiner = ultrajoiner_mode_found(drm_fd,
+						 output->config.connector,
+						 max_dotclock, &mode);
+
+	if (is_joiner || is_ultra_joiner)
+		return true;
+
+	return false;
+}
+
 /**
  * igt_has_force_joiner_debugfs
  * @drmfd: A drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 301f370df..c2fbbb5b0 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1248,6 +1248,7 @@ bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
 bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
 bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
+bool is_joiner_mode(int drm_fd, igt_output_t *output);
 bool igt_check_force_joiner_status(int drmfd, char *connector_name);
 bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
-- 
2.25.1

