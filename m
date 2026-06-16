Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B51CD98E1
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 16:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D00E10E7C8;
	Tue, 16 Jun 2026 16:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SKITXBqV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6708810E7C8
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 16:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781626623; x=1813162623;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b2xQ92qctYuGmfV2gYOLEJDRk/tEq7TxelkJ8TWRJNg=;
 b=SKITXBqV+JzS2YfCXgbuM/bm41t/Z/w2/Ax7b/kvdx0rBrISvYERpTG3
 v0roAy9DZrMvIJZrgABYnpvg5IdIclb3hldZ/9tHPrC6oHepu/H68Q5Fc
 OANQoR6T8SQUxFX4c3guwndtlyp7ccEdmbfU9Tv7M+6JuobTUoG9swrIB
 b0FVdfBXXQ706OB8MAdKYxQIRM9D7m8rMNyFNFUgnhsw2kvziLnhsUcvS
 RwiVTAvwOAqKaOs1h9QOqX3jxBpbpfv2mXOH1Dtc8zKtjjlnl9uHeDUMM
 yATxGHr1fTyFHv9xkX3Oa++7ce/WwgfbkJspMNKdV/lEloes3kAgcUkpm w==;
X-CSE-ConnectionGUID: AwuXiuYyTTiUhkxo2SDFxQ==
X-CSE-MsgGUID: HWhl2DZPS9anFWuwyoUDDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82301131"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82301131"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 09:17:03 -0700
X-CSE-ConnectionGUID: NCiGLys3RTCB8nzOC1rRRg==
X-CSE-MsgGUID: blzmZerPSwOcWU2oKkvkaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="247884380"
Received: from vmuppidi-nuc8i7beh.iind.intel.com ([10.223.55.63])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 09:17:02 -0700
From: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: francois.dugast@intel.com, zbigniew.kempczynski@intel.com,
 priyanka.dandamudi@intel.com, niranjana.vishwanathapura@intel.com
Subject: [PATCH i-g-t v4] intel-ci: Add SVM,
 multi_queue tests to Xe fastfeedback
Date: Tue, 16 Jun 2026 21:48:15 +0530
Message-ID: <20260616161815.3120-1-venkateswara.rao.muppidi@intel.com>
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

Signed-off-by: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 37 ++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index acff025fa..7d74f2ab6 100644
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
@@ -129,11 +133,42 @@ igt@xe_exec_compute_mode@twice-bindexecqueue-userptr
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
 igt@xe_exec_queue_property@invalid-property
 igt@xe_exec_reset@close-fd-no-exec
 igt@xe_exec_reset@cm-close-fd-no-exec
 igt@xe_exec_reset@virtual-close-fd-no-exec
 igt@xe_exec_store@basic-store
+igt@xe_exec_system_allocator@eu-fault-2m-range-device-host
+igt@xe_exec_system_allocator@many-execqueues-free
+igt@xe_exec_system_allocator@twice-free
+igt@xe_exec_system_allocator@twice-malloc-fork-read
+igt@xe_exec_system_allocator@twice-malloc-mlock
+igt@xe_exec_system_allocator@twice-malloc-prefetch
+igt@xe_exec_system_allocator@twice-mmap-new-nomemset
+igt@xe_exec_system_allocator@twice-mmap-remap-dontunmap-eocheck
+igt@xe_exec_system_allocator@twice-mmap-shared-remap-dontunmap-eochec
+igt@xe_exec_system_allocator@twice-mmap-free-madvise
+igt@xe_exec_system_allocator@twice-new-bo-map-nomemset
+igt@xe_exercise_blt@fast-copy
 igt@xe_gpgpu_fill@basic
 igt@xe_gt_freq@freq_basic_api
 igt@xe_gt_freq@freq_fixed_idle
@@ -176,6 +211,7 @@ igt@xe_query@query-topology
 igt@xe_query@query-invalid-extension
 igt@xe_query@query-invalid-query
 igt@xe_query@query-invalid-size
+igt@xe_render_copy@render-square
 igt@xe_spin_batch@spin-basic
 igt@xe_spin_batch@spin-batch
 igt@xe_sriov_flr@flr-vf1-clear
@@ -215,6 +251,7 @@ igt@xe_waitfence@abstime
 igt@xe_waitfence@engine
 igt@xe_waitfence@reltime
 
+
 # All tests that do module unloading and reloading are executed last.
 # They will sometimes reveal issues of earlier tests leaving the
 # driver in a broken state that is not otherwise noticed in that test.
-- 
2.43.0

