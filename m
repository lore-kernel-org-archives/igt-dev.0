Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC65CD98CE
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 14:29:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A39B10F54F;
	Fri, 12 Jun 2026 14:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TqS6U4j9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E77610E929
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 13:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781269550; x=1812805550;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eJP380szm16sQCQEjyjb+vqSjpYwwFfqotoe/FaGWv0=;
 b=TqS6U4j9gHz6PclW/lm9vlP15YYWtdmgrAM3LDNFK6iS/Kmxq/Kzis1z
 RcA7Ne12i3oWHTWcGteRqlwN+5OPo8dkL3iiEbtRFfNjp/XKhCWPu8LlY
 RJii6lrji+ih780HtOTiBH1w9/ktkjzm/w8SXY7t0I8QfYXDtU28Qxg2X
 eDW245r4vyUgrMuUZF+11gjO/cGnnBZ208nkcJap5U+NkSrmjjIi2ZaD9
 0F3zEPemtrXMnTLEWu+skJPlSukddiU49eBosmD0yNp7pg7+1a3/gSoQm
 jOk5yLr0QUvOREg1t7OfbW27LfVIHLTWpvaz6NCQJ370JF3JzUKg7prO7 w==;
X-CSE-ConnectionGUID: IS2aMX37RLOP/FgzVZwX3A==
X-CSE-MsgGUID: psORe9QDQZSKlztuGYK7MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="69645048"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="69645048"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 06:05:49 -0700
X-CSE-ConnectionGUID: mAHYQ/aDSLuSWGDNcZmdCg==
X-CSE-MsgGUID: p9Oqk4Q1RXS7LaidBLJPIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="284924533"
Received: from vmuppidi-nuc8i7beh.iind.intel.com ([10.223.55.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 06:05:47 -0700
From: "Muppidi, Venkateswara Rao" <venkateswara.rao.muppidi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: francois.dugast@intel.com, zbigniew.kempczynski@intel.com,
 priyanka.dandamudi@intel.com, niranjana.vishwanathapura@intel.com
Subject: [PATCH i-g-t] intel-ci: Add SVM,
 multi_queue tests to xe.fastfeedback.testlist.
Date: Fri, 12 Jun 2026 18:36:59 +0530
Message-ID: <20260612130659.5129-1-venkateswara.rao.muppidi@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 12 Jun 2026 14:28:48 +0000
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

Add SVM,render copy,ccs,compute_preempt,exercise_blt,exec_mix_modes,
access_counter,fault_mode,multi_queue tests to xe.fastfeedback.testlist

Signed-off-by: Muppidi, Venkateswara Rao <venkateswara.rao.muppidi@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 36 ++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index acff025fa..de71cacef 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -215,6 +215,42 @@ igt@xe_waitfence@abstime
 igt@xe_waitfence@engine
 igt@xe_waitfence@reltime
 
+igt@xe_exec_system_allocator@twice-free
+igt@xe_exec_system_allocator@twice-malloc-fork-read
+igt@xe_exec_system_allocator@twice-malloc-mlock
+igt@xe_exec_system_allocator@twice-malloc-prefetch
+igt@xe_exec_system_allocator@twice-mmap-new-nomemset
+igt@xe_exec_system_allocator@twice-mmap-remap-dontunmap-eocheck
+igt@xe_exec_system_allocator@twice-mmap-shared-remap-dontunmap-eocheck
+igt@xe_exec_system_allocator@twice-mmap-free-madvise
+igt@xe_exec_system_allocator@twice-new-bo-map-nomemset
+igt@xe_exec_system_allocator@many-execqueues-free
+igt@xe_render_copy@render-square
+igt@xe_ccs@block-copy-compressed
+igt@xe_ccs@ctrl-surf-copy
+igt@xe_compute_preempt@compute-preempt
+igt@xe_compute_preempt@compute-threadgroup-preempt
+igt@xe_exercise_blt@fast-copy
+igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence
+igt@xe_exec_mix_modes@exec-simple-batch-store-lr
+igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence
+igt@xe_exec_mix_modes@exec-spinner-interrupted-lr
+igt@xe_exec_fault_mode@invalid-va
+igt@xe_exec_multi_queue@sanity
+igt@xe_exec_multi_queue@exec-sanity
+igt@xe_exec_multi_queue@few-execs-dyn-priority
+igt@xe_exec_multi_queue@many-queues-basic
+igt@xe_exec_multi_queue@many-queues-basic-smem
+igt@xe_exec_multi_queue@many-queues-userptr
+igt@xe_exec_multi_queue@many-queues-userptr-invalidate
+igt@xe_exec_multi_queue@many-queues-priority
+igt@xe_exec_multi_queue@many-queues-close-fd
+igt@xe_exec_multi_queue@many-queues-preempt-mode-basic
+igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr
+igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd
+igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic
+igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate
+
 # All tests that do module unloading and reloading are executed last.
 # They will sometimes reveal issues of earlier tests leaving the
 # driver in a broken state that is not otherwise noticed in that test.
-- 
2.43.0

