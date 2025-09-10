Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BBECA0FED
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 16:06:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CA410E967;
	Wed, 10 Sep 2025 16:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WXAa/3nc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5AE10E965
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 16:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757520362; x=1789056362;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZoGO9edMbPC661/oCDz+ajQ9iSKBWmKWC/J1Ujc9qRo=;
 b=WXAa/3nceAZYQnZEZxVqoZfioNo441xKqQfOrh3Dg2iDivHYRzVRk/YN
 9F2M6O9dvXWSkC2kxz2+za4sVjSJBplKTc6KprOjefvr0aR0sdjqsZ89Z
 7ZRHdgGH0DnQxMiiJ7800p1PjIUSrPvvzk71qhZVNIvMOgUkI6p20/K/N
 SLcUwIkrB4JK5w41T0wz/XE7hyt9P+duv8f/rEhT5vPFSbXfYuVyHLlVm
 dC2irqUQVIABPf2rasJDjJ1l8UQ5A05EcITSfLrQGSFIQtDeuM6BqX43Y
 WX0MDYOUIq+XTgRaNup4ZcdjiPf0/UoagGh1Ob/dWCFpjw1ahYB7uhqNT g==;
X-CSE-ConnectionGUID: KEadgpmmSeSP27dXe2bvyA==
X-CSE-MsgGUID: eW3PPZaKQxGhnDgkqcm40Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59694771"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="59694771"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 09:06:01 -0700
X-CSE-ConnectionGUID: x2f0WaycRyqww7fhaEIT0Q==
X-CSE-MsgGUID: TtFXPZBgRmmyLjBmxxP9Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="173028776"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 09:05:59 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_content_protection: clamp fb size to
 output mode
Date: Wed, 10 Sep 2025 21:34:13 +0530
Message-Id: <20250910160413.254034-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

When multiple outputs are connected, create_fbs() allocates
framebuffers using the largest width and height among
all connected outputs. When performing a modeset on output with
lower resolution, the full fb size is passed as src coordinates
which exceed current output mode dimensions and cause commit failures.
This patch clamps the src width and height to match current output mode.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_content_protection.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 51fc1d3be..d44865468 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -243,12 +243,19 @@ static void modeset_with_fb(const enum pipe pipe, igt_output_t *output,
 	igt_display_t *display = &data.display;
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
+	int fb_w, fb_h, width, height;
 
 	mode = igt_output_get_mode(output);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, &data.red);
-	igt_fb_set_size(&data.red, primary, mode->hdisplay, mode->vdisplay);
+
+	fb_w = data.red.width ? data.red.width : mode->hdisplay;
+	fb_h = data.red.height ? data.red.height : mode->vdisplay;
+	width = mode->hdisplay < fb_w ? mode->hdisplay : fb_w;
+	height = mode->vdisplay < fb_h ? mode->vdisplay : fb_h;
+
+	igt_fb_set_size(&data.red, primary, width, height);
 
 	igt_display_commit2(display, commit_style);
 
-- 
2.34.1

