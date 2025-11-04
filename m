Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0238CCFA00
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 09:02:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B7E10E566;
	Tue,  4 Nov 2025 09:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PX2nRCZj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A819A10E58B
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 09:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762246937; x=1793782937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Fl8hl0+ceTXa45RkoyZBzIqwchG5pm2YoLqdlm/TE8=;
 b=PX2nRCZjybE+JgYng3kPh3i/FryJQ6j7kUMTZl5folDO+fBNi/1C05Zf
 yWtmgDDbauZDqmAGrJeSEBwUQeeRd8PVn68BN3L3ivwvUmqPpRRd+CEwv
 NBjaUFN5DUsQaXDm6vYvYuTfXe+kYm/QmP5PaMS7TpN9Q5C1tc+1xOx1m
 onhkQWJbLaqVibCbRyh9ggC581IUVwLUyqlwnjfFZuqFnQVLbeUdH7LJc
 7ZnXx4NupGNxTya7BvyNQGCZQjFq5ikIZlwPhTme66ZZhZsz8FXH/EYkN
 W3eelumELRxjA+XIyN9Q/GMwJdmuJ53x/17ubPOXAqRlABY9u/busr9Tx Q==;
X-CSE-ConnectionGUID: glAtEMtqQQaSVaH2Hg74Aw==
X-CSE-MsgGUID: XEVFczFSSI6mxpy7Z/auzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64032940"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="64032940"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 01:02:17 -0800
X-CSE-ConnectionGUID: xBRvfJ1LSCijUzAgE3Zmgw==
X-CSE-MsgGUID: ThkYy2kWSy6GcML86lahRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="224354223"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 01:02:14 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, anshuman.gupta@intel.com, matthew.auld@intel.com,
 kamil.konieczny@intel.com, nidhi1.gupta@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v16 3/3] lib/igt_fb: Apply NEEDS_VISIBLE_VRAM in missing
 igt_fb
Date: Tue,  4 Nov 2025 14:26:40 +0530
Message-Id: <20251104085640.795121-4-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104085640.795121-1-santhosh.reddy.guddati@intel.com>
References: <20251104085640.795121-1-santhosh.reddy.guddati@intel.com>
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

Extend the fix from commit b9a5a4d03955 ("tests/intel/xe_*: Use
NEEDS_VISIBLE_VRAM flag where it's missing")

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_fb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 60853b0af..92883a618 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -3029,7 +3029,8 @@ static void setup_context_and_memory_region(const struct igt_fb *fb, uint32_t *c
 						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
 
 		*bb_size = xe_bb_size(fb->fd, *bb_size);
-		*bb = xe_bo_create(fb->fd, 0, *bb_size, *mem_region, 0);
+		*bb = xe_bo_create(fb->fd, 0, *bb_size, *mem_region,
+				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	}
 }
 
-- 
2.34.1

