Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE4BCD6E7D
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 15:13:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2336510E859;
	Thu, 13 Nov 2025 15:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFYp0v2h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C6410E859
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 15:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763046784; x=1794582784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fNBK3oT2sia5N6nPFCHXo57KSJTrTukciE0rD+ny6Ac=;
 b=bFYp0v2h2tnbamupEm1ZMqvtsO6L5XD/ii+Gl/gUt2TGMsPhoqRVVFd3
 4ZrPLS6djXTZs3a8Pc4VaQiymsFioCTzZ/XSCIwCB+H9M2zFmOOiEhRvE
 JHmTzN2kcTz+bF+OkC+ggy+3mQRSPnhgI4y0FvzzV5/DI3pIA6mD9rS3P
 EmzJ4VKJlNc+Tf+vnjedyvBI9TekbLGb+6veLl4eTS54Qpo7wIseTqEkd
 arF9DAmgxyyDsDGuxij7khR67l0kyVgG73tlkAD9D35AwYslNP/ADk6GL
 PPe1xKzu6e8Cazp+xSBKrFH5vYyC9uQl1+lKjXcgwzodoGvtUiEfl/bfP Q==;
X-CSE-ConnectionGUID: hKSNn1Z6S/2qY+vC1UYlxA==
X-CSE-MsgGUID: rrH4EJtNRgCMIhRSAdzjsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="82759900"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="82759900"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 07:13:04 -0800
X-CSE-ConnectionGUID: Sa/X9bqoT16+Dj8JJH90cQ==
X-CSE-MsgGUID: +YvoTddESFi9xemUffBY9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189167421"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 07:13:01 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, anshuman.gupta@intel.com, matthew.auld@intel.com,
 kamil.konieczny@intel.com, nidhi1.gupta@intel.com, kunal1.joshi@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v17 3/3] lib/igt_fb: Apply NEEDS_VISIBLE_VRAM in missing
 igt_fb
Date: Thu, 13 Nov 2025 20:36:46 +0530
Message-Id: <20251113150646.945848-4-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113150646.945848-1-santhosh.reddy.guddati@intel.com>
References: <20251113150646.945848-1-santhosh.reddy.guddati@intel.com>
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
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
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

