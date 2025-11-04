Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22EFCCFA04
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 14:22:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC2C10E61D;
	Tue,  4 Nov 2025 14:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngLHUEYm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACBC8994A
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 14:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762266145; x=1793802145;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+t1C7ezukYbPfZvw6e7PV6qlaEr/8ZZYZwnBQqivaR0=;
 b=ngLHUEYmHcFOXZrGkwarEzlrqmZYZtkM4K6yP1x0/fpCYPga79j9agXT
 iNvwBWV0B4/xGPff6uB0M3VV7CL6om01YP+gcwA9NO3prPpYlx/pwLU0A
 8RitwACwYDTfb1pqKeCkG0/Gp5XDgHs5Z++Glq6l8cJPVBl04lWEsBP1n
 0dO39HackH1cUWa1WPpcuN3mohVRAk619zn+RGn9Aj/Q0Tec7qwVr7AVv
 5E+0g5lnZ6ZvDdYZQttn9r0MGRAlnJSInbDQpQrmHp/UaHMNW910UziqR
 xqrdNYEB9MjWpXWouINReCvJI2LUPIisZv1r47fxjGIjOB4HRZKPPe5zw w==;
X-CSE-ConnectionGUID: kC06+qViR+6GbA6n0D1z+w==
X-CSE-MsgGUID: pQPu/CE/S+qgesUyjuRhvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="51931020"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="51931020"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 06:22:24 -0800
X-CSE-ConnectionGUID: /lkf7voAT9SwL65tFy4VtA==
X-CSE-MsgGUID: ugu3QXJlTqe4masEJ055fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="186856616"
Received: from dut2943pvc.iind.intel.com ([10.190.215.39])
 by orviesa009.jf.intel.com with ESMTP; 04 Nov 2025 06:22:23 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH v1 0/7] Madvise feature in Multi-GPU
Date: Tue,  4 Nov 2025 14:22:12 +0000
Message-ID: <20251104142221.51625-1-nishit.sharma@intel.com>
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

