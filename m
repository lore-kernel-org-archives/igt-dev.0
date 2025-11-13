Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B8DCD4F50
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 08:40:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A9410E64E;
	Thu, 13 Nov 2025 08:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J8In0IoE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7D110E7BA
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 08:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763023219; x=1794559219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2mRWFy6DUE+mZp4DdeEx5yrpJEcwP/vJsfvOeMD9R9Y=;
 b=J8In0IoE1jNZgy4IlAk0TD2BumKQ3NV6v1KalIhRmKF/gFCyOOJP8+fd
 TGOnZNkpEs7hIdT7rSu4Z+d4I/lyhvQOkDUp+/gc0r0NtOsUTUQiqamK3
 hx7FMgeh2sbgHYbGNhCxvr9fMu4+nD7wXjf7WsggY1EvrO+RBy3V2DlJY
 ejQA71linSJ43sXalLvfCHFFjLowNHXw1hFNkG3R8RJ5cat/6N5JLticx
 tW8LpJmWC5hb/cfBnSVwbUTiIyNEOYOg+cpg2qpDg+Rh6QokpoPrNqyw3
 9cCg5v0GAsRV+4hnc7hlg4aKtXImbwJeDuAwla+/ypofnhGx+JiQFoXm3 Q==;
X-CSE-ConnectionGUID: mPjFWK5fRn+SfXXS6uRrJQ==
X-CSE-MsgGUID: 26yVKrsXQXa6dk5ri9Gj7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="67696695"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="67696695"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:40:15 -0800
X-CSE-ConnectionGUID: 2eTyUnT3SrqnVnHtnEbTjA==
X-CSE-MsgGUID: mE3MocekR7eTnt4ZvbNQbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="194434759"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:40:13 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 6/9] tests/kms_writeback: Add utility function for
 shared logic
Date: Thu, 13 Nov 2025 14:27:58 +0530
Message-ID: <20251113085801.3088957-7-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113085801.3088957-1-sowmiya.s@intel.com>
References: <20251113085801.3088957-1-sowmiya.s@intel.com>
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

Extracted framebuffer creation logic into a separate
function to enable reuse across multiple subtests

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 46fada8b8..d031a9f54 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -508,6 +508,25 @@ static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt
 	igt_remove_fb(display->drm_fd, &output_fb);
 }
 
+static void create_fbs(igt_display_t *display, igt_fb_t *input_fb, igt_fb_t *output_fb,
+		       uint32_t format, drmModeModeInfo *mode)
+{
+	int fb_id;
+
+	fb_id = igt_create_fb(display->drm_fd, mode->hdisplay,
+			      mode->vdisplay,
+			      format,
+			      DRM_FORMAT_MOD_LINEAR,
+			      input_fb);
+	igt_assert(fb_id >= 0);
+
+	fb_id = igt_create_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
+			      format,
+			      DRM_FORMAT_MOD_LINEAR,
+			      output_fb);
+	igt_assert(fb_id >= 0);
+}
+
 static igt_output_t *list_writeback_modes(igt_display_t *display)
 {
 	for (int i = 0; i < display->n_outputs; i++) {
-- 
2.43.0

