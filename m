Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782F8C3DA5D
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 12:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA5C10E7E9;
	Thu, 25 Jul 2024 12:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YUUgegiF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4730310E7E9
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 12:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721910394; x=1753446394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K23Ifp6iLghMNQPFou2QjcIkMDVyD14V8Zg3foL+i24=;
 b=YUUgegiF/dBGEqwXc73d9OP8zPQE9WEx72EbPd3pEoluqqR7bvh13KHJ
 HSsfZaxT0HxxXj8mZeHa1y9eFy5OP9MR5+bGRM0+4tAPYBBI1+TNgeWuT
 gLnSCtHa0JN8CIh7hT0CDlemwgXdykt5z2Lka6vFHA84tsnfGFmwCYUwQ
 r1ixuGtapOg7s54IbbIYqajC3vdsMrTiMML+95PaVyBg1F3WTgBI04S/p
 a1cliCD/2IZnlVbL4/RVkAiwc5GijDc9vnO6SBuZpzlInOc443gImFgw2
 aRxNl5HqpXfCZvtri3sLj3GU7TZherOCX07xmro6v9vtytjSKFuNjRXBx A==;
X-CSE-ConnectionGUID: oeDFxPIYSN6+LMQ0udRbTw==
X-CSE-MsgGUID: xJfnMRPBROW0zunYF4rsTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="23504900"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="23504900"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 05:26:34 -0700
X-CSE-ConnectionGUID: T+JvoqjKSYyHd+iAlXEGYg==
X-CSE-MsgGUID: +o+vhEAwTmCqz0TsK0L2dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="57709765"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.0.122])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 05:26:32 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: tursulin@igalia.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, lukasz.laguna@intel.com
Subject: [PATCH v3 i-g-t 2/2] benchmarks/gem_wsim: Fix mmap for discrete
 graphics cards
Date: Thu, 25 Jul 2024 14:26:12 +0200
Message-Id: <20240725122612.1290090-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240725122612.1290090-1-marcin.bernatowicz@linux.intel.com>
References: <20240725122612.1290090-1-marcin.bernatowicz@linux.intel.com>
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

It appears that 'gem_mmap__wc' doesn't work for discrete graphics cards
and 'I915_MMAP_OFFSET_FIXED' is needed instead.
Adopt the mapping approach from 'lib/igt_dummyload'.

v2: Correct brace balance (Kamil)
    Remove redundant 'ptr' variable

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 benchmarks/gem_wsim.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index cd1a01a67..af30a22b3 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1494,7 +1494,7 @@ static unsigned int create_bb(struct w_step *w, int self)
 #define TIMESTAMP (base + 0x3a8)
 	const int use_64b = gen >= 8;
 	enum { START_TS, NOW_TS };
-	uint32_t *ptr, *cs, *jmp;
+	uint32_t *cs, *jmp;
 	unsigned int r = 0;
 
 	/* Loop until CTX_TIMESTAMP - initial > target ns */
@@ -1502,7 +1502,16 @@ static unsigned int create_bb(struct w_step *w, int self)
 	gem_set_domain(fd, w->bb_handle,
 		       I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
 
-	cs = ptr = gem_mmap__wc(fd, w->bb_handle, 0, w->bb_size, PROT_WRITE);
+	if (__gem_set_caching(fd, w->bb_handle, I915_CACHING_CACHED) == 0) {
+		cs = gem_mmap__cpu(fd, w->bb_handle,
+				   0, w->bb_size,
+				   PROT_READ | PROT_WRITE);
+	} else {
+		cs = gem_mmap__device_coherent(fd,
+					       w->bb_handle,
+					       0, w->bb_size,
+					       PROT_READ | PROT_WRITE);
+	}
 
 	/* Store initial 64b timestamp: start */
 	*cs++ = MI_LOAD_REGISTER_IMM(1) | MI_CS_MMIO_DST;
-- 
2.31.1

