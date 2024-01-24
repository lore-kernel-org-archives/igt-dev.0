Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0901EC47E49
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 18:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752EE10ED16;
	Wed, 24 Jan 2024 18:08:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1D310EB3B
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 18:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706119701; x=1737655701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rlzIhRhWrNVwYDuYTfI/57L480HStTKEMTbRRAICsY0=;
 b=PGtuC4co4KiBxye9JSRPetvvuIVEdAxb+C6HQDI52OCqO4rQHNGcNVN5
 /FLk16Qzm5GX8fOdZtE/BkbVLngPrx9TrzF19qCwzCjdaod7LXmakTr50
 zeSxu/FgpyK/+hObUREhy65cNKTecacLZfpbEcvF1lHVDJTAMFi/8LaOH
 f2Jr9LP2bHkppZOi8X3bM7WFL58huzxafUV1i+suNqmupDRumxgTqpxK/
 htExCZV0NGkygZ9tDsjWV7vv+x6E7wghu+wog4XNQS8f81KPTirdRHVar
 QkoeF2rwxDLjj9rxgarjl17/e8raGrnCf4O7dDxmstKq1Ip2WjdyGwIjp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="400785222"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="400785222"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 10:08:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909734568"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="909734568"
Received: from gmcfarla-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.15.165])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 10:08:19 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/5] benchmarks/gem_wsim: use xe_bb_size() helper
Date: Wed, 24 Jan 2024 18:07:11 +0000
Message-ID: <20240124180713.268843-3-matthew.auld@intel.com>
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
 benchmarks/gem_wsim.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 955b6799e..257134539 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1743,8 +1743,8 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
 	struct dep_entry *dep;
 	int i;
 
-	w->bb_size = ALIGN(PAGE_SIZE + xe_cs_prefetch_size(fd),
-			   xe_get_default_alignment(fd));
+	w->bb_size = xe_bb_size(fd, PAGE_SIZE);
+
 	w->bb_handle = xe_bo_create(fd, vm->id, w->bb_size,
 				    vram_if_possible(fd, eq->hwe_list[0].gt_id),
 				    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-- 
2.43.0

