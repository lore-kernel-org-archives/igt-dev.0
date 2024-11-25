Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B1ED58D64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 16:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8C510E6A4;
	Mon, 25 Nov 2024 16:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJ/RZOc4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E58610E6A4
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 16:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732551573; x=1764087573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bx8RjRHM+svfCTyJJdlgvBy+5r3QUr+ZJgDU19dbLXU=;
 b=IJ/RZOc4Ug5hO9pbHIbdIZJIW6la5b3bX3biJe4baLuo0FZpLSB+OTqO
 q6CWI8jFwWJQ1dlK/bvszLX06NnJ46hZirEGm5XVMOC18ee8qAqrutM4u
 KBaqUIcKiohhfjZ59IahTL7wtzV2rskExNmMstc+mrSx+dyJWEg6QgRwV
 X5DSebrmvmQhMY9UWxhva7vB3S25PqJGIBGxa24Kb0ihluAGuRpqNEfB1
 3eMjBQCKmcR1sbIrdXh8B2RHgBEUGZuOcivgRoVDV/7/zO8XWANTxJHzg
 Hco2NbV2FQJzyurPAeNEh03yzJ/shyX8zMjiTSAMHaMn18wy9o0y60bRK w==;
X-CSE-ConnectionGUID: qrqj1H8SR+6m1dFMEfQo6Q==
X-CSE-MsgGUID: vbUqb83WTiSDUwRjjUopUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="55171125"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="55171125"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 08:19:33 -0800
X-CSE-ConnectionGUID: gojAKb8CRtOBzn6gj0Mkew==
X-CSE-MsgGUID: W1EkAc7VTYKYgbpzoiYDSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="91768476"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 08:19:30 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Jeevan B <jeevan.b@intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH 1/3] lib/igt_kms: Add is_joiner_mode function
Date: Mon, 25 Nov 2024 22:04:24 +0530
Message-Id: <20241125163426.382975-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241125163426.382975-1-jeevan.b@intel.com>
References: <20241125163426.382975-1-jeevan.b@intel.com>
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
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
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

