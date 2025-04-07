Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D3DC3601E
	for <igt-dev@archiver.kernel.org>; Mon,  7 Apr 2025 14:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103F910E4C1;
	Mon,  7 Apr 2025 14:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J+tyqGzT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D28B10E4C1
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Apr 2025 14:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744037639; x=1775573639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tRroTD2jHKz+A/coYQim5WIyrCOWgp9+xKo2r9WlDWo=;
 b=J+tyqGzThfabauDNtJx/e94TjagLJdUoY7m1bEMt5RaXKjDo3dBFLwba
 0VbP6+tUcCN+dA1SYw1y/5LyaJEpdF2VcnFEquIzhMRE6KP9mArWPSreg
 d62fO179f8Y4WQq+Acc2m4+NCaiTj5N+QWx2k5u/EuTLS+vnVJfPh5ETk
 FlEx1j4y89A3tJtlRtFH2hSwMv+606ODzrpRufEz+pl5og35/ZcnE705c
 njtTRHJeu30TKwrfF+kAM2o401q+aFRYWud0TTPrUbt0T5ulCOAxGuBnT
 UA6H4Z2g6cQYWblIS3SbKvsri2i/TPHhODoG2TbDk0Wx2pchStE79F2xi g==;
X-CSE-ConnectionGUID: LxaXummARqCtXa1PzmzrTw==
X-CSE-MsgGUID: qRucI0kwQaSU/+sfWgAalg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45318583"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="45318583"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 07:53:59 -0700
X-CSE-ConnectionGUID: PClDcqokTrifrK/tucpzMg==
X-CSE-MsgGUID: EaB0aIWaQ/i59bW+5znRmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="127729499"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 07:53:58 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Subject: [PATCH i-g-t 1/2] tests/kms_plane_cursor: check for display before
 cursor size
Date: Mon,  7 Apr 2025 14:45:03 +0000
Message-Id: <20250407144504.2907700-2-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407144504.2907700-1-jakub1.kolakowski@intel.com>
References: <20250407144504.2907700-1-jakub1.kolakowski@intel.com>
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

Currently igt_display_require() and igt_display_require_output() is
called after trying to get cursor width and height which leads to
fails on configurations that do not have display enabled.
Move igt_display_require() and igt_display_require_output() before
getting cursor width and height so instead test will skip on
configurations without display.

Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 tests/kms_plane_cursor.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index fd9e00085..1b72515f7 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -307,17 +307,17 @@ igt_main
 
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
+		igt_display_require(&data.display, data.drm_fd);
+		igt_require(data.display.is_atomic);
+		igt_display_require_output(&data.display);
+		display = &data.display;
+
 		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_WIDTH, &data.max_curw);
 		igt_assert(ret == 0 || errno == EINVAL);
 		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_HEIGHT, &data.max_curh);
 		igt_assert(ret == 0 || errno == EINVAL);
 
 		kmstest_set_vt_graphics_mode();
-
-		igt_display_require(&data.display, data.drm_fd);
-		igt_require(data.display.is_atomic);
-		igt_display_require_output(&data.display);
-		display = &data.display;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
-- 
2.34.1

