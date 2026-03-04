Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAF7EC1425
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 08:07:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33E710E962;
	Wed,  4 Mar 2026 08:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="go700L/P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36F410E962
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 08:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772611628; x=1804147628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JyUH0JJQX8NPiqeWjncOGkrhGVAwxc3SFPtB4IVhgFQ=;
 b=go700L/PQH0VO9RXNKQm/n4LHp2bUL8kHltdHiZOaOfdNMRQENqn+Pl6
 toEt/WGNa5ryFm3QWtv4D9Ab8UeYJAp6ZNwmhfL2We5Iq3u4wN+1XuMZ0
 DC7EVt+igtQ9VVkQGmPBz78NxzH7OXDdY4X1C3L8Lwg0JUgrgAKaQQY1j
 tlUurUTW1UboYmrDk/eq0D2dItJZfPnHRHUO7wSTZbpiIjzyynxUUFgxS
 fV5tAM+sJo7x1BUyHdYxQdmBtIfKWhunb5x7rP+lbkTJVOvAu8n524mVg
 f/ZJh4w3MMLhHyPu+u9U/0PeOu77+8c8vuZVuZvSzfedPeEtl4LIsc7UP Q==;
X-CSE-ConnectionGUID: WeO/o4PgRF2lvInnK5C19Q==
X-CSE-MsgGUID: D+PMbhnBQVWFnf1WHJN2FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73539078"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="73539078"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 00:07:07 -0800
X-CSE-ConnectionGUID: GtLakEpEQnGXpxUjg0LpFg==
X-CSE-MsgGUID: 5Kme5ctnQUy20g9pLXmC7A==
X-ExtLoop1: 1
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa003.fm.intel.com with ESMTP; 04 Mar 2026 00:07:06 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 1/2] lib/igt_kms: Add helper to get non-joiner mode
Date: Wed,  4 Mar 2026 13:47:45 +0530
Message-Id: <20260304081746.2083480-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304081746.2083480-1-pranay.samala@intel.com>
References: <20260304081746.2083480-1-pranay.samala@intel.com>
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

Add igt_get_non_joiner_mode() helper function to find a suitable
display mode from an output that does not require Big Joiner or
Ultra Joiner support. This is useful for tests that want to avoid
joiner modes and use a single pipe configuration.

The function returns a pointer to the mode if found, or NULL if
all modes require joiner support.

v2:
- Rebase

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_kms.c | 31 +++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 6087de365..e4a7e1ffa 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6994,6 +6994,37 @@ bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
 	return found;
 }
 
+/**
+ * igt_get_non_joiner_mode:
+ * @drm_fd: drm file descriptor
+ * @output: pointer to the output structure
+ *
+ * Finds the display mode from the output that does not require
+ * Big Joiner or Ultra Joiner.
+ *
+ * Returns: Pointer to non-joiner mode, or NULL if not found.
+ */
+drmModeModeInfo *igt_get_non_joiner_mode(int drm_fd, igt_output_t *output)
+{
+	drmModeConnector *connector;
+	int max_dotclock;
+
+	connector = output->config.connector;
+	max_dotclock = igt_get_max_dotclock(drm_fd);
+
+	for (int i = 0; i < connector->count_modes; i++) {
+		drmModeModeInfo *current_mode = &connector->modes[i];
+
+		/* Check if mode requires joiner */
+		if (!igt_bigjoiner_possible(drm_fd, current_mode, max_dotclock) &&
+		    !igt_ultrajoiner_possible(drm_fd, current_mode, max_dotclock)) {
+			return current_mode;
+		}
+	}
+
+	return NULL;
+}
+
 /**
  * is_joiner_mode:
  * @drm_fd: drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 1e1f3ead5..f39042cd5 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1262,6 +1262,7 @@ bool igt_ultrajoiner_possible(int drmfd, drmModeModeInfo *mode, int max_dotclock
 bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
 bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
+drmModeModeInfo *igt_get_non_joiner_mode(int drm_fd, igt_output_t *output);
 bool is_joiner_mode(int drm_fd, igt_output_t *output);
 bool igt_check_force_joiner_status(int drmfd, char *connector_name);
 bool igt_check_bigjoiner_support(igt_display_t *display);
-- 
2.34.1

