Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FDDCD5BD1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 05:36:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CAE112DA1;
	Mon,  1 Jun 2026 05:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LfNyirdI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729C9112DA1
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 05:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780292069; x=1811828069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jJkkD7A8vezpoekWBZTzhY7KIV4Oe6QK/XhNpLQFltY=;
 b=LfNyirdIpmidQ25A210I7I/zZubNw2xaE0bgnS6gkjYNFVqZ36Fbtveq
 QydU+6+fjSfBEhqbX21CF9Y+u2wUZ+WSVcbKJHUxbXRMFT1O/pMOHOoPR
 +/lGgj0zu2LJb0g7KkgRI77UcUFHusKSqi2Tftb+c/uvq5bkYYUaaK4yx
 keO84pUeuKH9FMQc8lv+pgiu0gTRqwtcHgRXq8XuEPz/qjL+UmGoc1APE
 OcsabXFzj+jw+KI5ifYob+/PL3hzdg1KcKlhyplW1oXlCVTZloogq1U4E
 tqohq40FiMysFeIgUJK9epxK4KrAR/Au9kERp+4TpKEDSAk+sHgcpc+Rv g==;
X-CSE-ConnectionGUID: /NligeSiTGmTrCwkTBtRvw==
X-CSE-MsgGUID: CwJwWPeLTKyudtrKOROHFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="103712767"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="103712767"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2026 22:34:28 -0700
X-CSE-ConnectionGUID: SlwliHkvSR+HrlXaitAvNA==
X-CSE-MsgGUID: eFQxEbRNRJuX7sXUYpMihA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="243310149"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 22:34:27 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 5/6] lib/igt_kms: Export get_max_pipe_hdisplay as
 intel_get_max_pipe_hdisplay
Date: Mon,  1 Jun 2026 11:25:44 +0530
Message-Id: <20260601055545.1982351-6-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260601055545.1982351-1-kunal1.joshi@intel.com>
References: <20260601055545.1982351-1-kunal1.joshi@intel.com>
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

Rename the static get_max_pipe_hdisplay() to the public
intel_get_max_pipe_hdisplay() and export it from the header. This is
a public function for querying platform capabilities.

Update all call sites to use the new name.

v2: Use intel_ prefix (Jani)

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 lib/igt_kms.c | 13 ++++++++-----
 lib/igt_kms.h |  1 +
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index ef2d92812..ba7b7461d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6920,12 +6920,15 @@ int igt_get_current_cdclk(int fd)
 }
 
 /**
- * get_max_hdisplay:
+ * intel_get_max_pipe_hdisplay:
  * @drm_fd: drm file descriptor
  *
+ * Get the maximum hdisplay (width) supported by a single pipe on the
+ * platform. This is a public function for querying platform capabilities.
+ *
  * Returns: The maximum hdisplay supported per pipe.
  */
-static int get_max_pipe_hdisplay(int drm_fd)
+int intel_get_max_pipe_hdisplay(int drm_fd)
 {
 	int dev_id = intel_get_drm_devid(drm_fd);
 
@@ -6946,7 +6949,7 @@ static int get_max_pipe_hdisplay(int drm_fd)
  */
 bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
 {
-	return (mode->hdisplay > get_max_pipe_hdisplay(drm_fd) ||
+	return (mode->hdisplay > intel_get_max_pipe_hdisplay(drm_fd) ||
 		mode->clock > max_dotclock);
 }
 
@@ -6994,7 +6997,7 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 bool intel_boundary_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
 					  int max_dotclock, drmModeModeInfo *mode)
 {
-	int max_hdisplay = get_max_pipe_hdisplay(drm_fd);
+	int max_hdisplay = intel_get_max_pipe_hdisplay(drm_fd);
 
 	for (int i = 0; i < connector->count_modes; i++) {
 		drmModeModeInfo *current_mode = &connector->modes[i];
@@ -7055,7 +7058,7 @@ bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe)
  */
 bool igt_ultrajoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
 {
-	return (mode->hdisplay > 2 * get_max_pipe_hdisplay(drm_fd) ||
+	return (mode->hdisplay > 2 * intel_get_max_pipe_hdisplay(drm_fd) ||
 		mode->clock > 2 * max_dotclock);
 }
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 01a7b0d4a..72d6f8f0c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1263,6 +1263,7 @@ void igt_sort_connector_modes(drmModeConnector *connector,
 bool igt_max_bpc_constraint(igt_display_t *display, igt_crtc_t *crtc,
 			    igt_output_t *output, int bpc);
 int igt_get_max_dotclock(int fd);
+int intel_get_max_pipe_hdisplay(int drm_fd);
 int igt_get_max_cdclk(int fd);
 int igt_get_current_cdclk(int fd);
 bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock);
-- 
2.25.1

