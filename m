Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5991ACA0EDC
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 18:50:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA28E10E123;
	Thu, 14 Aug 2025 18:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="luKrjy1a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EAB10E123
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 18:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755197410; x=1786733410;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rW+mt6XdVspy+imUeCrZvFXpHqw3P1C4wy9C0vJrDi4=;
 b=luKrjy1apR2B1Xnm9e3HMBKX5ZbDRDfKx7kEOw7keKUltZWtK3qGwNEL
 TtyUFu2JgK2hiFYbPpy378aRkl/JZXyX0ikZ9iuDr0h63qWt6TXMCFwko
 IOkOnmmlv3ZtISLBLAsfjhwng0fKeu/fXxRyqjwUn1ogcbzfeE7tedr2L
 bV71S6F75WlrsH0E8KvnOyiNMjMLS6+SblZSTqNBcfQE1tTWCB/mQUJhf
 Ukr5c35xOeddf4/wS7Gv5J6GXkKqkWdiRUfrM2nLAYav655jJbct6jmMi
 lVHfEllBMmq/1XV+2RPYJAl7MjiMYY8OZHKeHUFxaWaz203V36DTu9ctl Q==;
X-CSE-ConnectionGUID: kWEFWlr2SB++b43xCevxMQ==
X-CSE-MsgGUID: selrmTvnTpeETypLYgRNLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57669639"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="57669639"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 11:50:09 -0700
X-CSE-ConnectionGUID: uXbu36nNRxCemZr+kHvkWA==
X-CSE-MsgGUID: 4iujvm/XQnKjOhHvgZNVnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="170959473"
Received: from dut4066lnl.fm.intel.com ([10.105.8.63])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 11:50:09 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 matthew.brost@intel.com, zbigniew.kempczynski@intel.com,
 niranjana.vishwanathapura@intel.com
Subject: [PATCH] lib/xe/xe_spin: Add additional MI_ARB_CHECK to preemptable
 spin init
Date: Thu, 14 Aug 2025 18:50:10 +0000
Message-ID: <20250814185009.52614-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add an additional MI_ARB_CHECK to the spin initialization function,
just before the conditional batch buffer end, when preemption is
enabled.  The MI_ARB_CHECK forces a preemption in this case, which can
allow additionally scheduled exec queues to make independent progress
earlier than if we relied on the automatic timeout of the exec queue.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5783
Suggested-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/xe/xe_spin.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 25f7555e27..b3a937fe80 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -30,7 +30,6 @@
 
 enum { START_TS, NOW_TS };
 
-
 uint32_t xe_spin_nsec_to_ticks(int fd, int gt_id, uint64_t nsec)
 {
 	uint32_t ticks = xe_nsec_to_ticks(fd, gt_id, nsec);
@@ -167,6 +166,9 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 				   opts->mem_copy->dst->mocs_index;
 	}
 
+	if (opts->preempt)
+		spin->batch[b++] = MI_ARB_CHECK;
+
 	spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
 	spin->batch[b++] = 0;
 	spin->batch[b++] = end_addr;
-- 
2.43.0

