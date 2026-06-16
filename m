Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C60FCD98D2
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 04:58:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45DB10E579;
	Tue, 16 Jun 2026 04:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E9QSkhlu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F2210E579
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 04:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781585894; x=1813121894;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eJP380szm16sQCQEjyjb+vqSjpYwwFfqotoe/FaGWv0=;
 b=E9QSkhluNxHf6vRLxAkdZMNi0cbS6rHgU9Q+ww6PHrKbjA5sZ4ORD46n
 fcbQXgi6h/J7Ixtsh4WyLuOtlYwwWAb0O5VxGLvr2z0U4aKoQ2YXkObvz
 p1knZl8laiArAlqRwfSxP7zt1peez9XFGzWbwouc6bniZp6hVTSKeKccg
 sYI7LBP1AOHuXYkRpiiOiLaWsjKMLAdtqaaYtmxF6JMHVTZLWhs7uHDkm
 /URDiq3cvUHzh0+FIkMeZxU67Na+zEMZBpUpvHwLvttIyJj595sHpbAKw
 NRxTS5ZymMB7F710Os2vUFkdn/3gekGafzfRy7a1uvvGvCktM83/32it9 Q==;
X-CSE-ConnectionGUID: 9RueW/CyQwWwpR/IJpcA8A==
X-CSE-MsgGUID: zWoj+usaSC2hDkeCMM7URw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="85973623"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="85973623"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 21:58:13 -0700
X-CSE-ConnectionGUID: lnVhKCGBTECWZqYzchuZaQ==
X-CSE-MsgGUID: 6HWOeov8SEGBH8LJw4KKXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="252787513"
Received: from vmuppidi-nuc8i7beh.iind.intel.com ([10.223.55.63])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 21:58:11 -0700
From: "Muppidi, Venkateswara Rao" <venkateswara.rao.muppidi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: francois.dugast@intel.com, zbigniew.kempczynski@intel.com,
 priyanka.dandamudi@intel.com, niranjana.vishwanathapura@intel.com
Subject: [PATCH i-g-t] intel-ci: Add SVM, multi_queue tests to Xe fastfeedback
Date: Tue, 16 Jun 2026 10:29:25 +0530
Message-ID: <20260616045925.2714-1-venkateswara.rao.muppidi@intel.com>
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

