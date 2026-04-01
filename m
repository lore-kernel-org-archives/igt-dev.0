Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC92910F6FD6
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 15:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B36F10EDF3;
	Wed,  1 Apr 2026 15:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n4vz5dx1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE6C10E5BD
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 15:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775058315; x=1806594315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zPR7gHKG+TrIWrEOrNIzRn6W7kDYsZKgjgyjtxoRGFs=;
 b=n4vz5dx14tGsqDX7B1vzZ8U4d+6v1cvsOiFqiOAQAy80ZWZfVgfrEZNi
 JRRyWld7091djrNpdgooqexMhuflcq6Kcr/JQgY8nMKYhsuPq3d2vs+Dz
 OVxlO/giND7B8k2asn4dVEHzcuQptmr+6IVlClXaQ57PsHu9ovfWkiQup
 K9dWvNyIyJTocP9ly7j14KqlFi3WLGijIOHjyAt/8LOOEAonTkhU/clmC
 zSyTDHhRsOi8t0yf8e0RypS95zGw6ZZTRxXuiVrMG/0GaqKQMiLw1vqb0
 eKc/U8K+J33Dzswv1PC0yv/CksYeO2ljXuABeXPWuJfQpwJGZ8Xf2NeAy Q==;
X-CSE-ConnectionGUID: 9K4pIr4TQoKPHA4ZD3vOOw==
X-CSE-MsgGUID: hbvD1ekVRNi2pg5lRw8Ffw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79988972"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="79988972"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 08:45:14 -0700
X-CSE-ConnectionGUID: cL21GIO8TgqS0pg4xVgGMg==
X-CSE-MsgGUID: KWCBepwuQHGdixexHVoeeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="226960103"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 08:45:13 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 4/7] lib/igt_kms: Export get_max_pipe_hdisplay as
 intel_get_max_pipe_hdisplay
Date: Wed,  1 Apr 2026 21:36:24 +0530
Message-Id: <20260401160627.1338526-5-kunal1.joshi@intel.com>
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

Rename the static get_max_pipe_hdisplay() to the public
intel_get_max_pipe_hdisplay() and export it from the header.

v2: Use intel_ prefix (Jani)

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 8 ++++----
 lib/igt_kms.h | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index dbd419a9b..323446780 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6907,12 +6907,12 @@ int igt_get_current_cdclk(int fd)
 }
 
 /**
- * get_max_hdisplay:
+ * intel_get_max_pipe_hdisplay:
  * @drm_fd: drm file descriptor
  *
  * Returns: The maximum hdisplay supported per pipe.
  */
-static int get_max_pipe_hdisplay(int drm_fd)
+int intel_get_max_pipe_hdisplay(int drm_fd)
 {
 	int dev_id = intel_get_drm_devid(drm_fd);
 
@@ -6933,7 +6933,7 @@ static int get_max_pipe_hdisplay(int drm_fd)
  */
 bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
 {
-	return (mode->hdisplay > get_max_pipe_hdisplay(drm_fd) ||
+	return (mode->hdisplay > intel_get_max_pipe_hdisplay(drm_fd) ||
 		mode->clock > max_dotclock);
 }
 
@@ -7047,7 +7047,7 @@ bool igt_is_joiner_enabled_for_pipe(int drmfd, enum pipe pipe)
  */
 bool igt_ultrajoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
 {
-	return (mode->hdisplay > 2 * get_max_pipe_hdisplay(drm_fd) ||
+	return (mode->hdisplay > 2 * intel_get_max_pipe_hdisplay(drm_fd) ||
 		mode->clock > 2 * max_dotclock);
 }
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index f994d91d3..a9f02a10a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1236,6 +1236,7 @@ void igt_sort_connector_modes(drmModeConnector *connector,
 bool igt_max_bpc_constraint(igt_display_t *display, igt_crtc_t *crtc,
 			    igt_output_t *output, int bpc);
 int igt_get_max_dotclock(int fd);
+int intel_get_max_pipe_hdisplay(int drm_fd);
 int igt_get_max_cdclk(int fd);
 int igt_get_current_cdclk(int fd);
 bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock);
-- 
2.25.1

