Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79933CAC587
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 21:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF4710EB8D;
	Thu, 11 Sep 2025 21:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPuiguMj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD53010EB8D
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 21:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757624780; x=1789160780;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DCbO3AjpSCBQhelZ0tvku9VVGfa1DplivpxuDhR8okg=;
 b=OPuiguMjTmX1I/7EjvAOsZNsTnwT/8jvQz5YWRDJZPkDfkBrl+yEFEm2
 1siVXvpFga/VoQJ44Cx7VfDjUjjmVDjtykkSVZdBJucrqqxCAgJyy+vb2
 eXrN99rq2alP6LpNsBWIYowipIdsKTqhM1UHtuDtkIyCnwheW4lVFwMBv
 pwz+MQ2Pm+XwC1UyqP5n0fE/hfi7VlBVQvlgQFAiDfaAHP1fC8KB1Rz2y
 K9Y1UI/lpt3ZkY5AagBOXCdPFDoRSBvcpERDqVlOw5Hbb/8SEY4B1wKVu
 ReHlD79rDN4KKc/c4aH/lPbHdcEhkYd7REik65IeB7ePCPBj1bY5EivfO Q==;
X-CSE-ConnectionGUID: VmNZUUGsSvSxudIhwWm6pQ==
X-CSE-MsgGUID: L1+X/0FfSF6MM53n3GInBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60030385"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60030385"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 14:06:19 -0700
X-CSE-ConnectionGUID: a4NGArkVSEO61uPubpum3Q==
X-CSE-MsgGUID: b7/aIu5hRfW3XlB/a2l/SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; d="scan'208";a="173697888"
Received: from dut4412lnl.fm.intel.com ([10.105.8.90])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 14:06:19 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com,
	saurabhg.gupta@intel.com,
	alex.zuo@intel.com
Subject: [PATCH] lib/xe/xe_spin: Write to start only once
Date: Thu, 11 Sep 2025 21:06:19 +0000
Message-ID: <20250911210618.298333-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

Part of the loop initialized by xe_spin_init writes to the location of
spin->start.  This is done to track that the spinner has started
execution, and thus only needs to be performed once.  Remove this write
from the loop section.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 lib/xe/xe_spin.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 25f7555e27..72b13ef424 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -69,13 +69,13 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 		spin->batch[b++] = CS_GPR(START_TS);
 	}
 
-	loop_addr = opts->addr + b * sizeof(uint32_t);
-
 	spin->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
 	spin->batch[b++] = start_addr;
 	spin->batch[b++] = start_addr >> 32;
 	spin->batch[b++] = 0xc0ffee;
 
+	loop_addr = opts->addr + b * sizeof(uint32_t);
+
 	if (opts->preempt)
 		spin->batch[b++] = MI_ARB_CHECK;
 
-- 
2.43.0

