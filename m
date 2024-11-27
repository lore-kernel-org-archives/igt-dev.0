Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA0DD609A7
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 07:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED27210EA00;
	Wed, 27 Nov 2024 07:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Omv1SUDr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9AE410EA00
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 07:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732694376; x=1764230376;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bx8RjRHM+svfCTyJJdlgvBy+5r3QUr+ZJgDU19dbLXU=;
 b=Omv1SUDrbJlOcsFaBZ9vimtOy/VUxOTcgTFOo0NylCe8IPE/zg6NiYCa
 ikAceFpjCDL83nk8qL0I3g9VL2pRp/riSN4K4oh6u/4a0wTcsFnofovIJ
 Po/IcExz59zwAY0u5ZMB0NMXvv7KwEsrrh8u1GJItW4uz5ipAcXK+8QsX
 imyB2W40PLrZx4yj9RO/VoIaTZJqEHOQQbU4R81NB8s1bfFpWco7oFGWR
 yZ9GCMRwA4A3LmGw9Rf9FS0gDjstHJ5FJh3IVtkBVvUYf8JgGyv5Y8wVy
 wOG6X2WYZ1SMHeIghcctPguEE7jvffVhnHeklbq0t3TIbp6YsLX2pBHUq A==;
X-CSE-ConnectionGUID: gEXh41O9QIm0Ny7UiAB58Q==
X-CSE-MsgGUID: OcydO9yNSmSZBMVB7e/gMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32628678"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="32628678"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 23:58:57 -0800
X-CSE-ConnectionGUID: z4PGVPehSXaISYLFgMea/w==
X-CSE-MsgGUID: puthk5fZTj2XowP5Tdp5dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="92008401"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 23:58:54 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Jeevan B <jeevan.b@intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t 1/4] lib/igt_kms: Add is_joiner_mode function
Date: Wed, 27 Nov 2024 13:43:54 +0530
Message-Id: <20241127081357.569876-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241127081357.569876-1-jeevan.b@intel.com>
References: <20241127081357.569876-1-jeevan.b@intel.com>
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

