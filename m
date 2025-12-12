Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A6BD4415D
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 09:31:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3555210E564;
	Fri, 12 Dec 2025 09:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="blLMQ9wh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCBF10E5A6
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 09:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765531894; x=1797067894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iX2mLhAcYbnsEmkKPL9dTmCyqnEJvbE48kizbSqmnqY=;
 b=blLMQ9whHJdcv4jgAcUF3rWr2095dOozeBewt4kbtOolK8L0Rh+llbEM
 RDmBbqTdXGftEJfqFDe3G7/+OjxbtpXCsIi+XugIXfdBeQKcc0X6HZSte
 4DcW3x6yvg0AMUjj4UL65TQRRINlU/76qMG24gR8gPvQfeLT+08vXG2GU
 WDt/iniVepucqJ3N0Mw/w9ASrTDTnwlhxjSgI4iw2rvucvxF5EkhT97hE
 GKSlPmravdwz1dAeQ1UNXkHy5MRh8DumG6NIsCwNGk+bL5xmUoTpkjYnq
 HIBOqcRVpj3ktGyHP5fpmqaHKq2gn8Fix03Ax4k09V2aCztPz1GMJIXlW A==;
X-CSE-ConnectionGUID: RXeDvLU2Q6yG9o65um6/cQ==
X-CSE-MsgGUID: kQ5ZMUapRV+8vr5bxvpqcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="84932435"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="84932435"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:31:34 -0800
X-CSE-ConnectionGUID: QdcYlnlMSqa59gHpajh/HA==
X-CSE-MsgGUID: LkyoPdT+RK6zc2zyq8CF8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="197301261"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:31:32 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, jeevan.b@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2 3/4] tests/kms_hdr: Use lib function to paint fb
Date: Fri, 12 Dec 2025 15:01:45 +0530
Message-ID: <20251212093146.2881962-4-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212093146.2881962-1-karthik.b.s@intel.com>
References: <20251212093146.2881962-1-karthik.b.s@intel.com>
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
Reviewed-by: Jeevan B <jeevan.b@intel.com>
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

