Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16CED3C526
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 03:23:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C7510E656;
	Wed, 10 Dec 2025 03:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVlzhn3g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E0610E656
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 03:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765337010; x=1796873010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F4OOFTf11Wy5JzHK2/m3bFjcLbS2qqE+XEulgtwHboI=;
 b=dVlzhn3gqzNwQraFwAUVZ3NDnNtJFPpHt70+28IgiYpEQ4py3+28Xdfn
 dU/cQ8D7tsXx2vsm5zALupKpdhxBO1SaiYgiQwVEl8MoZGDJFIxPS64i5
 TZo06tZhZjKw8TD0FofrZJVjtaKEa4+pfJx/m2Q9hu2jYkbIbA1vtRvcY
 gJDNPimpwlB7xpIiK3DMP4eKaHhzKbSfDhFhGoGrgHbbchnnmjPqxmTlI
 XscCjBSOO8K0Y7YoUK4/Krs7yRevC+AM8XXnElZEN8M9i/fI666tyWn5e
 MmrhfG9Q4FAMgj3jAlh2bJqBw66MY6QcMrPT4hsk667Uxc42o7d4sOP4s Q==;
X-CSE-ConnectionGUID: NBNMisdNSV6m4B7FH4zCig==
X-CSE-MsgGUID: LrluvY81SpSe89KZrZWa1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="66481258"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="66481258"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 19:23:30 -0800
X-CSE-ConnectionGUID: +twPb84rSeaqf2gctjcFxg==
X-CSE-MsgGUID: bbGV2tlCTsqy4mWZgY3D/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="200822742"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 19:23:29 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 3/4] tests/kms_hdr: Use lib function to paint fb
Date: Wed, 10 Dec 2025 08:53:48 +0530
Message-ID: <20251210032349.2781106-4-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210032349.2781106-1-karthik.b.s@intel.com>
References: <20251210032349.2781106-1-karthik.b.s@intel.com>
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

Use the lib function igt_paint_test_pattern_color_fb to paint the fb
instead of doing it locally in the test binary.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_hdr.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index ab0ec47cb..a5912501a 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -146,12 +146,7 @@ static void test_cycle_flags(data_t *data, uint32_t test_flags)
 /* Fills the FB with a test HDR pattern. */
 static void draw_hdr_pattern(igt_fb_t *fb)
 {
-	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
-
-	igt_paint_color(cr, 0, 0, fb->width, fb->height, 1.0, 1.0, 1.0);
-	igt_paint_test_pattern(cr, fb->width, fb->height);
-
-	igt_put_cairo_ctx(cr);
+	igt_paint_test_pattern_color_fb(fb->fd, fb, 1.0, 1.0, 1.0);
 }
 
 /* Converts a double to 861-G spec FP format. */
-- 
2.43.0

