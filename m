Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63223C0219B
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 18:20:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEA810E5E6;
	Mon, 10 Feb 2025 18:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cF3ya4Wn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B621310E5E6
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 18:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739211640; x=1770747640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GNUYUr7S/N3MJG+GaDiKBLcOK133UT4/BWrN8qNkBBY=;
 b=cF3ya4WnUL7EXMo2qjawW1jEdnLN4wIQKjnq86H1nnH9E0HpuZ4xkFBZ
 dgJIKdnukTUDqjOIaBXCVJm6XUjXxaQDxKTJE5wWizr6WP4S/4O1Vq8Yx
 rnbc0Eewh959SdjCZScRN5KPN1RGqAsq8QYKtSnt0ZPoXsb8kUaons/ia
 TjaaW4zLHpgIbE3xK0X+/v5VTmkgl98yt4uUbSJZd0uEBcCgzNzRgui+J
 5sNzCxuXUrGipzllDsp+rg3rqjS6GWYSdiBMynjfJvmRa1vMJJYVdhaw1
 4mu8fiMUkMqT7LOPeVZXRznjeBcAAN2GQUro7B1cyZTQIg2kcpxT0fAUq g==;
X-CSE-ConnectionGUID: vgZOdYxcT1KjPkivrjFeCg==
X-CSE-MsgGUID: c4ahg1O8R16JRtvw1u3tcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51236284"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51236284"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 10:20:40 -0800
X-CSE-ConnectionGUID: 44BjBzvOQl6E69WwPLJ8OQ==
X-CSE-MsgGUID: DXUT6VPfQgSJDziP2x4hxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="117288675"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 10:20:40 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/3] lib/igt_kms: Add support to check joiner mode limit
Date: Tue, 11 Feb 2025 00:06:10 +0530
Message-Id: <20250210183611.1326980-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250210183611.1326980-1-jeevan.b@intel.com>
References: <20250210183611.1326980-1-jeevan.b@intel.com>
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

Added library changes to find the highest non-joiner mode.
This helps to get the mode that does not require a big joiner.

v2: Update commit message, create a new library function
    to get max hdisplay and fix condtion for selecting mode.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_kms.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 47 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 99d939fc5..d5993fc83 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6406,6 +6406,51 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 	return found;
 }
 
+/**
+ * get_max_hdisplay:
+ * @drm_fd: drm file descriptor
+ *
+ * Returns: The maximum hdisplay supported per pipe.
+ */
+static int get_max_hdisplay(int drm_fd)
+{
+	int dev_id = intel_get_drm_devid(drm_fd);
+
+	return (intel_display_ver(dev_id) >= 30) ? HDISPLAY_6K_PER_PIPE :
+						   HDISPLAY_5K_PER_PIPE;
+}
+
+/**
+ * non_joiner_mode_found:
+ * @drm_fd: drm file descriptor
+ * @connector: libdrm connector
+ * @max_dot_clock: max dot clock frequency
+ * @mode: libdrm mode to be filled
+ *
+ * Finds the highest possible display mode that does
+ * not require a big joiner.
+ *
+ * Returns: True if a valid non-joiner mode is found,
+ * false otherwise.
+ */
+bool non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
+			   int max_dotclock, drmModeModeInfo *mode)
+{
+	int max_hdisplay = get_max_hdisplay(drm_fd);
+
+	for (int i = 0; i < connector->count_modes; i++) {
+		drmModeModeInfo *current_mode = &connector->modes[i];
+
+		if (current_mode->hdisplay == max_hdisplay &&
+		    current_mode->clock < max_dotclock) {
+			*mode = *current_mode;
+			return true;
+		}
+	}
+
+	return false;
+}
+
 /**
  * igt_is_joiner_enabled_for_pipe:
  * @drmfd: A drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 1cfacf87d..bfb89b76a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1245,6 +1245,8 @@ int igt_get_max_dotclock(int fd);
 bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock);
 bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
+bool non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
+			   int max_dotclock, drmModeModeInfo *mode);
 bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe);
 bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
 bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
-- 
2.25.1

