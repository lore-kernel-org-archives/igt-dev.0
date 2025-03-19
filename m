Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06D4C35FF1
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 06:12:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6329610E27F;
	Wed, 19 Mar 2025 06:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XUXDsd++";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB01C10E27F
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 06:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742364724; x=1773900724;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YIOl2nKJ03Y0tTlXh5ZFX1ZO9ADh2jCBzTwPiAH7z40=;
 b=XUXDsd++GTaSq/c9E1i94/6NBik1JwNVy4tm2N/CM971wyoKrGf/Ez0j
 rbKu4EAFaXF1H+HhlkgpGF56yURVNnTZoE/pjS18nFHn/B1RiLvQAXitq
 8uScASsZMCSXof8On+vorRsAFY74UASEn3wCMZvSV2IlrC0eGnpSRv/DB
 Z2lwP7SkWR0wiMZl0im3S8EJThFwwPKh7r1gwDmk9M1fiWbEFaAKlob9D
 Khfn5hx7vPzbTqVwYu1SS3DbIIV+D/as7VlOFUBAwhDVTD5HO4CX91xcn
 oUBpS+RWQkcAE2S9zawC//zusBz+wz1h2q8U4FMx+dF3tSAg26ZDavkx9 A==;
X-CSE-ConnectionGUID: 9A7dLtXnRUqmLIAdsUTOwQ==
X-CSE-MsgGUID: i6+VYMrdQbCfN5XyvPgE7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="53750924"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="53750924"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 23:12:01 -0700
X-CSE-ConnectionGUID: 1Vf6+5dlR06+Zr/u+tsdIA==
X-CSE-MsgGUID: ORIKR+7IQpSIcRKMH7YBQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="127302119"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 23:12:00 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, jeevan.b@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] lib/igt_kms: Use get_max_pipe_hdisplay in
 joiner_possible fucntions
Date: Wed, 19 Mar 2025 11:42:44 +0530
Message-ID: <20250319061244.769947-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
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

Update 'joiner_possible' helper functions to use the existing
get_max_pipe_hdisplay helper.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 lib/igt_kms.c | 45 ++++++++++++++++++++-------------------------
 lib/igt_kms.h |  2 +-
 2 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index cc3bb3ae7..99c8707c7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6428,6 +6428,20 @@ int igt_get_current_cdclk(int fd)
 	return read_and_parse_cdclk_debugfs(fd, "Current CD clock frequency:");
 }
 
+/**
+ * get_max_hdisplay:
+ * @drm_fd: drm file descriptor
+ *
+ * Returns: The maximum hdisplay supported per pipe.
+ */
+static int get_max_pipe_hdisplay(int drm_fd)
+{
+	int dev_id = intel_get_drm_devid(drm_fd);
+
+	return (intel_display_ver(dev_id) >= 30) ? HDISPLAY_6K_PER_PIPE :
+						   HDISPLAY_5K_PER_PIPE;
+}
+
 /**
  * igt_bigjoiner_possible:
  * @drm_fd: drm file descriptor
@@ -6441,13 +6455,8 @@ int igt_get_current_cdclk(int fd)
  */
 bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
 {
-	int max_hdisplay, dev_id;
-
-	dev_id = intel_get_drm_devid(drm_fd);
-	max_hdisplay = (intel_display_ver(dev_id) >= 30) ? HDISPLAY_6K_PER_PIPE :
-			HDISPLAY_5K_PER_PIPE;
-
-	return (mode->hdisplay > max_hdisplay || mode->clock > max_dotclock);
+	return (mode->hdisplay > get_max_pipe_hdisplay(drm_fd) ||
+		mode->clock > max_dotclock);
 }
 
 /**
@@ -6469,7 +6478,7 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 
 	for (int i=0; i< connector->count_modes; i++) {
 		if (igt_bigjoiner_possible(drm_fd, &connector->modes[i], max_dotclock) &&
-		    !igt_ultrajoiner_possible(&connector->modes[i], max_dotclock)) {
+		    !igt_ultrajoiner_possible(drm_fd, &connector->modes[i], max_dotclock)) {
 			*mode = connector->modes[i];
 			found = true;
 			break;
@@ -6478,20 +6487,6 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 	return found;
 }
 
-/**
- * get_max_hdisplay:
- * @drm_fd: drm file descriptor
- *
- * Returns: The maximum hdisplay supported per pipe.
- */
-static int get_max_pipe_hdisplay(int drm_fd)
-{
-	int dev_id = intel_get_drm_devid(drm_fd);
-
-	return (intel_display_ver(dev_id) >= 30) ? HDISPLAY_6K_PER_PIPE :
-						   HDISPLAY_5K_PER_PIPE;
-}
-
 /**
  * max_non_joiner_mode_found:
  * @drm_fd: drm file descriptor
@@ -6567,9 +6562,9 @@ bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe)
  *
  * Returns: True if mode requires Ultrajoiner, else False.
  */
-bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock)
+bool igt_ultrajoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
 {
-	return (mode->hdisplay > 2 * HDISPLAY_5K_PER_PIPE ||
+	return (mode->hdisplay > 2 * get_max_pipe_hdisplay(drm_fd) ||
 		mode->clock > 2 * max_dotclock);
 }
 
@@ -6591,7 +6586,7 @@ bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
 	bool found = false;
 
 	for (int i = 0; i < connector->count_modes; i++) {
-		if (igt_ultrajoiner_possible(&connector->modes[i], max_dotclock)) {
+		if (igt_ultrajoiner_possible(drm_fd, &connector->modes[i], max_dotclock)) {
 			*mode = connector->modes[i];
 			found = true;
 			break;
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 27b545f52..0381c82ad 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1252,7 +1252,7 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 bool max_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
 			       int max_dotclock, drmModeModeInfo *mode);
 bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe);
-bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
+bool igt_ultrajoiner_possible(int drmfd, drmModeModeInfo *mode, int max_dotclock);
 bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
 bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
-- 
2.43.0

