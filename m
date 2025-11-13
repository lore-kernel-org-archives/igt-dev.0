Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C3BCD4F50
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 08:18:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04E610E09A;
	Thu, 13 Nov 2025 08:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P78RWV8+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B77C10E09A
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 08:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763021901; x=1794557901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2mRWFy6DUE+mZp4DdeEx5yrpJEcwP/vJsfvOeMD9R9Y=;
 b=P78RWV8+5nqIJYPxS1RdLE5Imaw66yp3GjoBlp84bh4Sv6C1zq0pqlx0
 izB42N0kwLS28D9VWQE1FT5Q1iJxd4uwDBk6+k1rIulU86cAXc1sAqb8K
 A+y3UTl01BLfdJvHHiB+REBIRm2ep9AVXhkvKTBi9VOqjm8fPLDXAFAhf
 Dyv0UAnY5XI5RuQLP9UbQx8dNQSoAPqr8YtO5KFJbA0dsY/l1ElTVCgOe
 3k2qyttlKejRTNqDZbmYBC5BUSOS2UES48oqi5e2+59qLU+TQcATzkvj6
 SSYIucQ4EUVeATTmTtUw/1jMpAqkrqpqzWQ3DJGUz2Q8Qe/PFMQq10zfS w==;
X-CSE-ConnectionGUID: UrcCyKhuT3KgQ/SFumm3xA==
X-CSE-MsgGUID: WKrkKdOMQhi4EQSvw/uuFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65000533"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="65000533"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:18:21 -0800
X-CSE-ConnectionGUID: qCdGj/8oSeS/ADHr36ndKQ==
X-CSE-MsgGUID: Rq8PSSWbTBm9MrRq+vEeGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="212822382"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:18:20 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 6/9] tests/kms_writeback: Add utility function for
 shared logic
Date: Thu, 13 Nov 2025 14:05:52 +0530
Message-ID: <20251113083555.3088873-7-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113083555.3088873-1-sowmiya.s@intel.com>
References: <20251103103842.3025204-1-sowmiya.s@intel.com>
 <20251113083555.3088873-1-sowmiya.s@intel.com>
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

