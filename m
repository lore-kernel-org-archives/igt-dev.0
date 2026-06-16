Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2791FCD98DA
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 09:35:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE88110E750;
	Tue, 16 Jun 2026 09:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pe/rS+mL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D3310E750
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 09:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781602477; x=1813138477;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QQHNu3OoX/S/C2aMkMIx6xa+ZVVg30tYHTd3tC3AmXE=;
 b=Pe/rS+mLSKXMZYkDpe8/3JyORDT1A8x8ky4k2VVJljaKOIf0j884L9Yt
 YBLRbF9UFWoioWMAcmGPJPFuEB9I+Nhq8Aal/ZQcoVx8RJ09HU5hxEeEY
 Wv9Ni53bVrmpw+gsaxXvdMfkqR3ghfKqagstNzjs1mScPBJxdre0R6EmW
 h/8iG7mNSk/DQJeaOqWoXVeGEH+i0gIrteNstkRoZq1RO4Yt5/VJq2ANf
 LOl6z09wEMTFcNdqT8t415u9AXbkccdSf4LqbrRvNyLGsvBvThbvVHiBI
 Uu7AEV0H9iRVQUD2WaFK3nj4xzN8w9T5jbsQsrfOXtJdazLWIBiDS9NVa g==;
X-CSE-ConnectionGUID: lrxo8ng1ShS2NyKAFeD8XA==
X-CSE-MsgGUID: VeRgyGpTSwO3bbD5XCnJrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="92923798"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="92923798"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 02:34:37 -0700
X-CSE-ConnectionGUID: zO4he5vLRlSAtKsajUIa9w==
X-CSE-MsgGUID: OnS47uZJTl6c+pyI4eJJRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="245349209"
Received: from vmuppidi-nuc8i7beh.iind.intel.com ([10.223.55.63])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 02:34:29 -0700
From: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: francois.dugast@intel.com, zbigniew.kempczynski@intel.com,
 priyanka.dandamudi@intel.com, niranjana.vishwanathapura@intel.com
Subject: [PATCH i-g-t v3] intel-ci: Add SVM,
 multi_queue tests to Xe fastfeedback
Date: Tue, 16 Jun 2026 15:05:42 +0530
Message-ID: <20260616093542.2510-1-venkateswara.rao.muppidi@intel.com>
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

V2: add eu-fault-2m-range-device-host test (Francois)
v3: corrected s-o-b and From

Signed-off-by: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 35 ++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index acff025fa..e3b3f21cc 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -215,6 +215,41 @@ igt@xe_waitfence@abstime
 igt@xe_waitfence@engine
 igt@xe_waitfence@reltime
 
+igt@xe_exec_system_allocator@eu-fault-2m-range-device-host
+igt@xe_exec_system_allocator@many-execqueues-free
+igt@xe_exec_system_allocator@many-execqueues-free-race
+igt@xe_exec_system_allocator@once-free-race
+igt@xe_exec_system_allocator@process-many-execqueues-free-race
+igt@xe_exec_system_allocator@twice-free
+igt@xe_exec_system_allocator@twice-free-race
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
+igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr-invalidate
+igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd
+igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic
+igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate
+
+
 # All tests that do module unloading and reloading are executed last.
 # They will sometimes reveal issues of earlier tests leaving the
 # driver in a broken state that is not otherwise noticed in that test.
-- 
2.43.0

