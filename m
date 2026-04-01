Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDB110F6FD6
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 15:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4042710E5BD;
	Wed,  1 Apr 2026 15:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Km43Ie3e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107D010EE17
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 15:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775058316; x=1806594316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JEYOcTV/0Igi54L4U12Xx39rxz2vnLPRytcW/XxDPBc=;
 b=Km43Ie3e92SJBCts6BKbHYbFWes+zNx5/vydj0+XL6aHIy7lOFA8VD2F
 2hSaNjusD0rFUycVpRLNywWlE+TTw4PZPIhe8sJhqcBPsQ7kV6/zJ9cF9
 vAE/wFs0uRioRD+O7GBhAFz77UFntX8DNFJzxydLakUhgRlU6DSVg3Rbu
 eaX3BebjI8SgQuU2WtNSHjKDGtqq61Xa6ikh7aNeXl5Zd2d5Pw9gGe0gQ
 IjnNndRv+JfOvVIZ0Yo8xwWA0lBjtbiNUt/rPE9IqmKv6kfDRIQOPK+sN
 zRExojSOSf7LgZwrIojdSbsIuvIOmQXwVpCs34aL6aDGCfAW2LdJc8cR7 Q==;
X-CSE-ConnectionGUID: n7azumtISKquzBtBusrMYA==
X-CSE-MsgGUID: 7Lla1F4UScyUbMbQO2pyWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79988974"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="79988974"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 08:45:16 -0700
X-CSE-ConnectionGUID: Ad7wgLOvR5etVyJijrQCBw==
X-CSE-MsgGUID: AWWoS9eKSsOdxlhXg6980Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="226960116"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 08:45:15 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 5/7] tests/intel/kms_joiner_helper: Move
 max_non_joiner_mode_found
Date: Wed,  1 Apr 2026 21:36:25 +0530
Message-Id: <20260401160627.1338526-6-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260401160627.1338526-1-kunal1.joshi@intel.com>
References: <20260401160627.1338526-1-kunal1.joshi@intel.com>
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

max_non_joiner_mode_found() is Intel-specific since it relies on
igt_bigjoiner_possible() which checks Intel platform pipe limits.
Move it out of the generic lib/igt_kms.[ch] into the Intel-specific
tests/intel/kms_joiner_helper.[ch] where it belongs.

v2: Move the function out from lib/igt_kms.[ch] (Jani)

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c                   | 36 ---------------------------------
 lib/igt_kms.h                   |  2 --
 tests/intel/kms_joiner_helper.c | 36 +++++++++++++++++++++++++++++++++
 tests/intel/kms_joiner_helper.h |  2 ++
 4 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 323446780..afea8598b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6965,42 +6965,6 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 	return found;
 }
 
-/**
- * max_non_joiner_mode_found:
- * @drm_fd: drm file descriptor
- * @connector: libdrm connector
- * @max_dot_clock: max dot clock frequency
- * @mode: libdrm mode to be filled
- *
- * Finds the highest possible display mode that does
- * not require a big joiner.
- *
- * Returns: True if a valid non-joiner mode is found,
- * false otherwise.
- */
-bool max_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
-			       int max_dotclock, drmModeModeInfo *mode)
-{
-	bool found = false;
-
-	for (int i = 0; i < connector->count_modes; i++) {
-		drmModeModeInfo *current_mode = &connector->modes[i];
-
-		if (igt_bigjoiner_possible(drm_fd, current_mode, max_dotclock))
-			continue;
-
-		if (!found ||
-		    current_mode->hdisplay > mode->hdisplay ||
-		    (current_mode->hdisplay == mode->hdisplay &&
-		     current_mode->clock > mode->clock)) {
-			*mode = *current_mode;
-			found = true;
-		}
-	}
-
-	return found;
-}
-
 /* TODO: Move these lib functions to the joiner-specific library file
  *	 once those patches are merged.
  */
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index a9f02a10a..2ada64fc8 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1242,8 +1242,6 @@ int igt_get_current_cdclk(int fd);
 bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock);
 bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
-bool max_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
-			       int max_dotclock, drmModeModeInfo *mode);
 bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe);
 bool igt_ultrajoiner_possible(int drmfd, drmModeModeInfo *mode, int max_dotclock);
 bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
index e24d7ce94..ac1bef2e3 100644
--- a/tests/intel/kms_joiner_helper.c
+++ b/tests/intel/kms_joiner_helper.c
@@ -183,3 +183,39 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
 	}
 	return true;
 }
+
+/**
+ * max_non_joiner_mode_found:
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
+bool max_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
+			       int max_dotclock, drmModeModeInfo *mode)
+{
+	bool found = false;
+
+	for (int i = 0; i < connector->count_modes; i++) {
+		drmModeModeInfo *current_mode = &connector->modes[i];
+
+		if (igt_bigjoiner_possible(drm_fd, current_mode, max_dotclock))
+			continue;
+
+		if (!found ||
+		    current_mode->hdisplay > mode->hdisplay ||
+		    (current_mode->hdisplay == mode->hdisplay &&
+		     current_mode->clock > mode->clock)) {
+			*mode = *current_mode;
+			found = true;
+		}
+	}
+
+	return found;
+}
diff --git a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_helper.h
index 6d21e7eb0..3fef18f67 100644
--- a/tests/intel/kms_joiner_helper.h
+++ b/tests/intel/kms_joiner_helper.h
@@ -17,6 +17,8 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
 				  uint32_t *used_pipes_mask,
 				  uint32_t master_pipes_mask,
 				  uint32_t valid_pipes_mask);
+bool max_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
+			       int max_dotclock, drmModeModeInfo *mode);
 
 enum force_joiner_mode {
 	FORCE_JOINER_ENABLE = 0,
-- 
2.25.1

