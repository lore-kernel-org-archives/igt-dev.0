Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0CBC47DDB
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jan 2024 15:16:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E5210F35A;
	Mon, 22 Jan 2024 15:16:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3957110F380
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jan 2024 15:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705936608; x=1737472608;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OcPp3RkfpYwrgW/EpFBBcqtNXsku0kXemOqGDu8jowU=;
 b=I6VUGKRbIwvlIRMd23XE6nw2fA+PRMG5OHwliiBKxGlmNu6vTWxiokpQ
 2N8oRavIwwE+jGJ0+74ufNbR2ZFZI0KKUmcMs656ue2s1FthHyOzm9nC0
 cE/o+W8BSVA69gzSPEsF639alklZUZrycJ5pi6jNmWUPqB2tvQICznzht
 js4l9oXBbFXktLec964LrskoXWeBqcfAVHM5slHMvnAQbTOq0cma6GvFa
 Xa9C3VUxMB/ve5rNqclGnZYe1Is1ToJZj6Nl90IyLF/7JrRmzoy92Qi3L
 v+ximgN0uY/enbf+a9G7Wt6k70V5SLY238Sujy2xr/eVq7twBLd5ahIwk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8605131"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="8605131"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 07:16:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="20008752"
Received: from dniestep-mobl5.ger.corp.intel.com (HELO localhost)
 ([10.246.17.55])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 07:16:45 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3] lib/intel_batchbuffer: Implicitly increase requested
 bb size for xe
Date: Mon, 22 Jan 2024 16:16:41 +0100
Message-Id: <20240122151641.330759-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Due to batch prefetching on xe driver lets add implicitly additional size
to user requested batch size. Such should protect the user from being
affected by CAT errors when hw will touch offsets after user requested
batch size.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
v2: use xe_cs_prefetch_size() instead explicit 4K (Matt)
v3: drop 'if' conditional and increase size unconditionally for all
    xe devices (Matt)
---
 lib/intel_batchbuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 85023f9e6f..61ab42df72 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -959,7 +959,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 			alignment = xe_get_default_alignment(fd);
 
 		ibb->alignment = alignment;
-		size = ALIGN(size, ibb->alignment);
+		size = ALIGN(size + xe_cs_prefetch_size(fd), ibb->alignment);
 		ibb->handle = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0),
 					   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
-- 
2.34.1

