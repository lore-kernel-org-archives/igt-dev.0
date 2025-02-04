Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FCEC0219A
	for <igt-dev@archiver.kernel.org>; Tue,  4 Feb 2025 18:12:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E678010E6DE;
	Tue,  4 Feb 2025 18:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G72qkY9l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A65710E6DE
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Feb 2025 18:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738692729; x=1770228729;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GITPbUgo92ZtQXrO+YE9/qeoVs0/ng3RLi1cyzBfbIg=;
 b=G72qkY9lumTTRL9fJ+VARygc15gXxsyhCH8DiAvzg/b3xfe6utFdow5G
 y8TcmANYhyoqSY3QEMe6YjvaaQ1OpOc/5fte2Wa0WZoLS2ZqczxZXxCsn
 C9GSr3zeYdok/cTKuwUZ2R8AzYAWO6+YM30I5bSZpJiH+HAbV0stvKo3Q
 coT/VcP3Jjeq/Q80O8cXh+va4s81mEhX4ocqbpue/W9Gf+dA6/y4OVPVi
 QLDS3fn/REyyDzLo2jzitPBoXk3WmLYGxEYanqxUCXmZZn4Uu1wF6YKke
 0jZgHSipzErmknFn1TYkTrvlLS0S5ldvUcMwEhonUH1TKsYAGL7fvCKKL Q==;
X-CSE-ConnectionGUID: BcOqfMfzT7WG8FDeYWPVxw==
X-CSE-MsgGUID: n/dxRhe6RieU+e3s+eoRaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50652604"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50652604"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:12:09 -0800
X-CSE-ConnectionGUID: CktRlik8QsyZLHLV3iz8BA==
X-CSE-MsgGUID: i1rqqFRjSDS8u2pCYuNH+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="110509557"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 10:12:07 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/3] lib/igt_kms: Add support to check joiner mode limit
Date: Tue,  4 Feb 2025 23:57:33 +0530
Message-Id: <20250204182734.793645-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250204182734.793645-1-jeevan.b@intel.com>
References: <20250204182734.793645-1-jeevan.b@intel.com>
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

Added library changes to find the non-joiner mode by selecting
the top threshold mode for joiner mode. This helps in determining
the maximum resolution or clock frequency that does not require a
big joiner configuration.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_kms.c | 35 +++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 37 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index d4980d2ac..3c73f57fc 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6406,6 +6406,41 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 	return found;
 }
 
+/**
+ * non_joiner_mode_found:
+ * @drm_fd: drm file descriptor
+ * @connector: libdrm connector
+ * @max_dot_clock: max dot clock frequency
+ * @mode: libdrm mode to be filled
+ *
+ * Non-Joiner will come in to the picture when the
+ * resolution > 5K/6K or clock < max-dot-clock.
+ *
+ * Returns: True if big joiner found in connector modes
+ */
+bool non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
+			   int max_dotclock, drmModeModeInfo *mode)
+{
+	bool found = false;
+	int max_hdisplay, dev_id;
+
+	dev_id = intel_get_drm_devid(drm_fd);
+	max_hdisplay = (intel_display_ver(dev_id) >= 30) ? HDISPLAY_6K_PER_PIPE :
+			HDISPLAY_5K_PER_PIPE;
+
+	for (int i = 0; i < connector->count_modes; i++) {
+		drmModeModeInfo *current_mode = &connector->modes[i];
+
+		if ((current_mode->hdisplay == max_hdisplay &&
+		    current_mode->vrefresh == 30) || current_mode->clock < max_dotclock) {
+			*mode = connector->modes[i];
+			found = true;
+			break;
+		}
+	}
+	return found;
+}
+
 /**
  * igt_is_joiner_enabled:
  * @drmfd: A drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 7df53ec9c..069444667 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1250,6 +1250,8 @@ bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
 bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
 bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
+bool non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
+			   int max_dotclock, drmModeModeInfo *mode);
 bool is_joiner_mode(int drm_fd, igt_output_t *output);
 bool igt_check_force_joiner_status(int drmfd, char *connector_name);
 bool igt_check_bigjoiner_support(igt_display_t *display);
-- 
2.25.1

