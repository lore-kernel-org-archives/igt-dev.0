Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D45C46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 18:08:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC4E10EF1B;
	Wed, 24 Jan 2024 18:08:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB7210ED16
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 18:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706119702; x=1737655702;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1sSXeVfvkkNZRzd3jPRcRKhne9GHMn/w6Sx/3qgHnSs=;
 b=aCfcbXMA4q4Hrxy/9aANEaGPFVr1tssFXgllEJCxtG7mcxsfvKO4AaBr
 cWvi2XNFJsuqYi/3RsZm3exna8WJ5iXpDk6qivrs5ey/MNL+oZh/q/+hb
 Zon9RvWM15wnd93FBrhqsu+2dt0Vc1w9DWcdmulZDyCM69pv5TBHnZxD1
 Ju0g65NLjhlqA0bJC2wMbVd/tE1Scvpu5kk/1/sLHgfD/1rXE3MpHV5v6
 3HxqQ5Yr39pzmdOtuDTSzaAi64LOKlWkESKYAFYPU7sqeW0SCuxKdRSL+
 Qocvtx9MVAcO7vqiIx2HehB8mlR3q04AR2EkbFG/m+Iw3VsCU/hCzdTaH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="400785225"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="400785225"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 10:08:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909734579"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="909734579"
Received: from gmcfarla-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.15.165])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 10:08:20 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 4/5] lib/igt_fb: use xe_bb_size() helper
Date: Wed, 24 Jan 2024 18:07:12 +0000
Message-ID: <20240124180713.268843-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124180713.268843-1-matthew.auld@intel.com>
References: <20240124180713.268843-1-matthew.auld@intel.com>
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

