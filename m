Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EA4C4828A
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 10:57:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC5B10F89F;
	Thu, 25 Jan 2024 10:57:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEB210E870
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 10:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706180234; x=1737716234;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mngm23lLEmLNB6KGfn79b0n2ob4GOoWO5OG9ojVAqyc=;
 b=nl//zMAOAsk8C/3dNZ+lHYXRCzRTUFxUBro7HhGf97nfWYItkyzGIhBJ
 DiMZjRuqlQtz0IxMb+61jYgqCb1jXLdqsz8Atrbqw0C1LX45NPtkD6Ew3
 tVdRxt5O7ntD+oGBE3j6Hib5bOgkZKA7iV29zJXsE9ShS0IHDiXuZ6vN0
 8OfzQpd9g3anIJ/EVqlnNeRA1E2VEu1Z1JI9KPg/qlOlFus0RlpNBKeLn
 Zot+/dxSy2vJA1jMGOM40Y5KqOgHLN+GK6O/PJja9U0oOL0j12Q1j3BdB
 1m+170sQM70Yym/kDJvzDadjUtnLS5rpcehLAOTlkdae3DBHLDaOnR7XB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="433283710"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="433283710"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 02:57:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2365566"
Received: from cdeburca-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.15.173])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 02:57:13 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 5/7] lib/igt_fb: use xe_bb_size() helper
Date: Thu, 25 Jan 2024 10:56:43 +0000
Message-ID: <20240125105646.313561-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125105646.313561-1-matthew.auld@intel.com>
References: <20240125105646.313561-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

No need to open code this anymore.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_fb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 2cf94013e..71c220a08 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2906,8 +2906,7 @@ static void blitcopy(const struct igt_fb *dst_fb,
 						 INTEL_ALLOCATOR_SIMPLE,
 						 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
 
-		bb_size = ALIGN(bb_size + xe_cs_prefetch_size(dst_fb->fd),
-				xe_get_default_alignment(dst_fb->fd));
+		bb_size = xe_bb_size(dst_fb->fd, bb_size);
 		xe_bb = xe_bo_create(dst_fb->fd, 0, bb_size, mem_region, 0);
 	}
 
-- 
2.43.0

