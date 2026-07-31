Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72551C54F54
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 14:19:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDFE10E20D;
	Fri, 31 Jul 2026 14:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fWB7eDVn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F36310E20D
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 14:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785507507; x=1817043507;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FaELYVY+eAluYIfVzBCQ76r2+Kya95sOKWIw/UUflu4=;
 b=fWB7eDVn9sR4jz7jsAnF8vdxbuMe+Gv0U0+pFQvFSMlMbiN64qpn/CGy
 Jfo/vFvb8DU9TimZTEFxEkmROJrlpMlhH3+WSE+s3cQl4wxEVbGE3wTZ9
 4pSpxeStj0NCW9mIMLRocIpRMeqi6HsAMbzQOpW79NB0X3fjY7/QV7zss
 3M1B5Gl6aW3usrHY1IiW2IFMLfVMrsmhD1WqKZLUwHVv/exi1HrKgf2TZ
 xHjNRNynyImiYpSy+bpE0XHAxzlj/fYP/Ax11ujjUt31I8G7QcNZ90C/C
 15ZMpYpeQEu+5DmzcfmYC1v2tnBtLLS7SeR8VSSVmiu00BXwEusYyUbxM g==;
X-CSE-ConnectionGUID: DbY4oTsET2S60hrB+bCunQ==
X-CSE-MsgGUID: 7ZqdIKKFQ36hUGvtJj+zkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="89945045"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="89945045"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 07:18:27 -0700
X-CSE-ConnectionGUID: YkOiMIVYRb2c3QiJjA3ZEw==
X-CSE-MsgGUID: wuBy2jfUQW2uHkMarm3ceg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="254283815"
Received: from unknown (HELO localhost) ([10.94.249.102])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 07:18:26 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, kamil.konieczny@linux.intel.com,
 lukasz.laguna@intel.com, zbigniew.kempczynski@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 1/3] lib/xe/xe_spin: fix premature batch exit on BO
 resubmission
Date: Fri, 31 Jul 2026 16:18:04 +0200
Message-ID: <20260731141806.890207-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731141806.890207-1-marcin.bernatowicz@linux.intel.com>
References: <20260731141806.890207-1-marcin.bernatowicz@linux.intel.com>
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

COND_BBE reads ticks_delta from memory. When the same BO is resubmitted,
COND_BBE can read the value left by the previous batch(elapsed >= ctx_ticks
at that batch's exit), satisfying the exit condition on the very first loop
iteration before any new elapsed time is stored.

Write sentinel 0 to ticks_delta at batch start and use
MI_SEMAPHORE_WAIT to poll until it is visible in memory before entering
the loop. This guarantees COND_BBE cannot read the stale value from the
previous batch.

Also switch from inverted ticks_delta logic (STOREINV + ~ctx_ticks) to
direct elapsed ticks (STORE + MAD_LT_IDD + ctx_ticks) for readability.
The pad loop between SRM and COND_BBE is removed as it does not help.

Suggested-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_spin.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 874310789..2863d2163 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -52,7 +52,6 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 	uint64_t start_addr = opts->addr + offsetof(struct xe_spin, start);
 	uint64_t end_addr = opts->addr + offsetof(struct xe_spin, end);
 	uint64_t ticks_delta_addr = opts->addr + offsetof(struct xe_spin, ticks_delta);
-	uint64_t pad_addr = opts->addr + offsetof(struct xe_spin, pad);
 	uint64_t timestamp_addr = opts->addr + offsetof(struct xe_spin, timestamp);
 	int b = 0;
 	uint32_t devid;
@@ -77,6 +76,18 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 	spin->batch[b++] = start_addr >> 32;
 	spin->batch[b++] = 0xc0ffee;
 
+	if (opts->ctx_ticks) {
+		/* Write sentinel and wait until it is visible in memory before loop. */
+		spin->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+		spin->batch[b++] = ticks_delta_addr;
+		spin->batch[b++] = ticks_delta_addr >> 32;
+		spin->batch[b++] = 0;
+		spin->batch[b++] = MI_SEMAPHORE_WAIT | MI_SEMAPHORE_POLL | MI_SEMAPHORE_SAD_EQ_SDD;
+		spin->batch[b++] = 0;
+		spin->batch[b++] = ticks_delta_addr;
+		spin->batch[b++] = ticks_delta_addr >> 32;
+	}
+
 	loop_addr = opts->addr + b * sizeof(uint32_t);
 
 	if (opts->preempt)
@@ -101,12 +112,12 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 		spin->batch[b++] = opts->use_queue_timestamp ? QUEUE_TIMESTAMP : CTX_TIMESTAMP;
 		spin->batch[b++] = CS_GPR(NOW_TS);
 
-		/* delta = now - start; inverted to match COND_BBE */
+		/* delta = now - start */
 		spin->batch[b++] = MI_MATH(4);
 		spin->batch[b++] = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(NOW_TS));
 		spin->batch[b++] = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(START_TS));
 		spin->batch[b++] = MI_MATH_SUB;
-		spin->batch[b++] = MI_MATH_STOREINV(MI_MATH_REG(NOW_TS), MI_MATH_REG_ACCU);
+		spin->batch[b++] = MI_MATH_STORE(MI_MATH_REG(NOW_TS), MI_MATH_REG_ACCU);
 
 		/* Save delta for reading by COND_BBE */
 		spin->batch[b++] = MI_STORE_REGISTER_MEM_GEN8 | MI_SRM_CS_MMIO;
@@ -114,17 +125,9 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 		spin->batch[b++] = ticks_delta_addr;
 		spin->batch[b++] = ticks_delta_addr >> 32;
 
-		/* Delay between SRM and COND_BBE to post the writes */
-		for (int n = 0; n < 8; n++) {
-			spin->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
-			spin->batch[b++] = pad_addr;
-			spin->batch[b++] = pad_addr >> 32;
-			spin->batch[b++] = 0xc0ffee;
-		}
-
-		/* Break if delta [time elapsed] > ns */
-		spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
-		spin->batch[b++] = ~(opts->ctx_ticks);
+		/* Break if delta [time elapsed] >= ns */
+		spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | MAD_LT_IDD | 2;
+		spin->batch[b++] = opts->ctx_ticks;
 		spin->batch[b++] = ticks_delta_addr;
 		spin->batch[b++] = ticks_delta_addr >> 32;
 	}
-- 
2.43.0

