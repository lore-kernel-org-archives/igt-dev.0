Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B094ECD98DE
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 05:07:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2855F10EC77;
	Thu, 18 Jun 2026 05:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPV5oOz0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DCC10EC01
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 05:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781759235; x=1813295235;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FkNyNNfEQcz2hRI57dwFAFWoOwK9bs1pdtldxJj2LK4=;
 b=NPV5oOz0MWXJCX39jKAy1MkAMI8ggn4RWU6SFKX/Xa2WsKxZbSKGCG9n
 aQeVPW+pXF2hjyvk4h+HJVqTHlj8/VKTVgecPvlZDmfSJe2rE2Azsta8x
 HOlF2kD3TvpTEIuvnU3Y8e4A1mA0oLNo7BS5sK5R9gFM9+01zlXFOWIXQ
 b2Wt5Foqix2FnoVKQD3dhZ+mU2qUW1FNHdQFo+rCLJ/irlyflQgVoOnko
 d2ffFeC74QyIcHW+58OP3gHKEh2VJWhzooS0TSX4Bn+R1vLdLZEdHGxjA
 jr2mY1g/qp21qJla5BwL0KsSd99uRigDcUdRVL1mSBa/VRfUL/88Qwbhy g==;
X-CSE-ConnectionGUID: YQ0iFaQ/Tr6QBQw/VT2iBg==
X-CSE-MsgGUID: g8JINNwBTGe6TfW4pX4uZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82479293"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="82479293"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 22:07:14 -0700
X-CSE-ConnectionGUID: SokTvd8LS8mPnSx1Kf0qOw==
X-CSE-MsgGUID: tQ6qHVGcTQ+ZqI3Y3ES6gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="248327504"
Received: from vmuppidi-nuc8i7beh.iind.intel.com ([10.223.55.63])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 22:07:12 -0700
From: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: francois.dugast@intel.com, zbigniew.kempczynski@intel.com,
 priyanka.dandamudi@intel.com, niranjana.vishwanathapura@intel.com
Subject: [PATCH i-g-t v7] intel-ci: Add SVM,
 multi_queue tests to Xe fastfeedback
Date: Thu, 18 Jun 2026 10:38:25 +0530
Message-ID: <20260618050825.7775-1-venkateswara.rao.muppidi@intel.com>
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

Add  SVM, render copy,ccs,compute_preempt,exercise_blt,exec_mix_modes,
access_counter, fault_mode,multi_queue tests to fastfeedback list

v2: add eu-fault-2m-range-device-host test (Francois)
v3: corrected s-o-b and From
v4: Refine SVM tests by removing the race test, adding remaining SVM tests,
and organizing all entries in alphabetical order.
v6: Remove twice.* tests and add a new set of SVM tests (Francois)
v7: Remove few-execs-dyn-priority and priority tests for
multi_queue (Niranjana)

Signed-off-by: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 37 ++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index acff025fa..c47db8c43 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -69,7 +69,11 @@ igt@kms_psr@psr-cursor-plane-move
 igt@kms_psr@psr-sprite-plane-onoff
 igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all
 igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1
+igt@xe_ccs@block-copy-compressed
+igt@xe_ccs@ctrl-surf-copy
 igt@xe_compute@compute-square
+igt@xe_compute_preempt@compute-preempt
+igt@xe_compute_preempt@compute-threadgroup-preempt
 igt@xe_create@create-execqueues-noleak
 igt@xe_create@create-execqueues-leak
 igt@xe_create@create-invalid-mbz
@@ -129,11 +133,43 @@ igt@xe_exec_compute_mode@twice-bindexecqueue-userptr
 igt@xe_exec_compute_mode@twice-bindexecqueue-rebind
 igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind
 igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate
+igt@xe_exec_fault_mode@invalid-va
+igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence
+igt@xe_exec_mix_modes@exec-simple-batch-store-lr
+igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence
+igt@xe_exec_mix_modes@exec-spinner-interrupted-lr
+igt@xe_exec_multi_queue@sanity
+igt@xe_exec_multi_queue@exec-sanity
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
+igt@xe_exec_multi_queue@priority
 igt@xe_exec_queue_property@invalid-property
 igt@xe_exec_reset@close-fd-no-exec
 igt@xe_exec_reset@cm-close-fd-no-exec
 igt@xe_exec_reset@virtual-close-fd-no-exec
 igt@xe_exec_store@basic-store
+igt@xe_exec_system_allocator@eu-fault-2m-range-device-host
+igt@xe_exec_system_allocator@fault
+igt@xe_exec_system_allocator@madvise-atomic-inc
+igt@xe_exec_system_allocator@many-execqueues-free
+igt@xe_exec_system_allocator@many-execqueues-malloc
+igt@xe_exec_system_allocator@once-malloc
+igt@xe_exec_system_allocator@once-mmap
+igt@xe_exec_system_allocator@partial-munmap-cpu-fault
+igt@xe_exec_system_allocator@process-many-malloc
+igt@xe_exec_system_allocator@threads-many-malloc
+igt@xe_exec_system_allocator@threads-shared-vm-many-malloc
+igt@xe_exec_system_allocator@twice-free
+igt@xe_exercise_blt@fast-copy
 igt@xe_gpgpu_fill@basic
 igt@xe_gt_freq@freq_basic_api
 igt@xe_gt_freq@freq_fixed_idle
@@ -176,6 +212,7 @@ igt@xe_query@query-topology
 igt@xe_query@query-invalid-extension
 igt@xe_query@query-invalid-query
 igt@xe_query@query-invalid-size
+igt@xe_render_copy@render-square
 igt@xe_spin_batch@spin-basic
 igt@xe_spin_batch@spin-batch
 igt@xe_sriov_flr@flr-vf1-clear
-- 
2.43.0

