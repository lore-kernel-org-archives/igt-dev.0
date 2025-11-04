Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322CCCCFA04
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 14:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF6110E62D;
	Tue,  4 Nov 2025 14:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cCXMPfpV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE20110E613
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 14:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762266590; x=1793802590;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+t1C7ezukYbPfZvw6e7PV6qlaEr/8ZZYZwnBQqivaR0=;
 b=cCXMPfpVu8vl5I4IJ7GRot6fOkctl4g6JeNA33OvU0t2fxk4QC+s4mXj
 S/hWcoGFFrQXd4jTb/gKk5HoSUIwS9pT6KbYAPjAswFGtEsdXoic+oFtx
 c7YMcb5kHhum4KWmYoU+u/RaDjQ56hySjpAOhgnHljIi2Puf+7dF32e1C
 n0724OmPvUL1k9i2VBidrnGB11emDUV7KGils89/UiDvIhq8gsyEhn61D
 ehnq9J007heQ8nLYkIea2AnRWDS13w7n/EhoiNH3uUehF9QzS+BJT2c3v
 yENdQgamoNXWaMImm+mB41ha4ckiKVrwngPi3O3YIxPqviS5abseUbxy1 g==;
X-CSE-ConnectionGUID: K2SsRuhbSfu9XA5fXTCKhQ==
X-CSE-MsgGUID: QxXUNHDAS4KG12DPUbc0yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74966172"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="74966172"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 06:29:50 -0800
X-CSE-ConnectionGUID: htcLjt77SEOG08PywSj5SQ==
X-CSE-MsgGUID: t911ogt5QRW7TM9vimzzIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="192339842"
Received: from dut2943pvc.iind.intel.com ([10.190.215.39])
 by orviesa005.jf.intel.com with ESMTP; 04 Nov 2025 06:29:48 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v1 0/7] Madvise feature in Multi-GPU
Date: Tue,  4 Nov 2025 14:29:37 +0000
Message-ID: <20251104142947.51744-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

This patch series adds comprehensive SVM multi-GPU IGT test coverage
for madvise and prefetch functionality. The following tests are introduced
in tests/intel/xe_multi-gpusvm.c:-

1. Cross-GPU Memory Access Test: Allocates a shared SVM buffer,
   writes data from one GPU, and verifies correct access from another GPU and the CPU.
2. Atomic Operations Test: Performs atomic increment operation on a shared SVM buffer
   from both GPUs and the CPU, verifying correctness and ordering.
3. Coherency Test: Validates memory coherency by writing data from one GPU and reading
   from another GPU and the CPU without explicit synchronization.
4. Performance Test: Measures latency and bandwidth for buffer access from each GPU and the CPU
   comparing local versus remote access in SVM.
5. Fault Handling Test: Intentionally triggers page faults by accessing non prefetch SVM regions from both GPUs
   verifying that faults are detected and resolved correctly.
6. Simultaneous Access Test: Launches compute or copy workloads on both GPUs accessing the same SVM buffer
   using synchronization primitives to coordinate access and verify data integrity.
7. Conflicting Madvise Test: Applies conflicting madvise operations across GPUs, ensuring the driver
   detects and reports conflicts or errors when preferred locations differ.

Nishit Sharma (7):
  tests/intel/xe_multi-gpusvm.c: Add SVM multi-GPU cross-GPU memory
    access test
  tests/intel/xe_multi-gpusvm.c: Add SVM multi-GPU atomic operations
  tests/intel/xe_multi-gpusvm.c: Add SVM multi-GPU coherency test
  tests/intel/xe_multi-gpusvm.c: Add SVM multi-GPU performance test
  tests/intel/xe_multi-gpusvm.c: Add SVM multi-GPU fault handling test
  tests/intel/xe_multi-gpusvm.c: Add SVM multi-GPU simultaneous access
    test
  tests/intel/xe_multi-gpusvm.c: Add SVM multi-GPU conflicting madvise
    test

 lib/xe/xe_ioctl.c             |     40 +
 lib/xe/xe_ioctl.h             |      5 +
 tags                          | 263672 +++++++++++++++++++++++++++++++
 tests/intel/xe_multi_gpusvm.c |   1379 +
 tests/intel/xe_multisvm.c     |     41 +-
 tests/meson.build             |      1 +
 6 files changed, 265100 insertions(+), 38 deletions(-)
 create mode 100644 tags
 create mode 100644 tests/intel/xe_multi_gpusvm.c

-- 
2.48.1

