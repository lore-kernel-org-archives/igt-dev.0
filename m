Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B9ED116FC
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 09:02:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFB310E34B;
	Mon,  1 Dec 2025 09:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kHqj7qmT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E8610E10D
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 09:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764579721; x=1796115721;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ptZUjSllnQ8mOFw6nkVZFEeM6MXj5HcI1DGT1b/wfOw=;
 b=kHqj7qmTsh/+W6phCgGRl1wwfADmvh8KDbuniqwKuYzNouteKUJO0CF1
 ePRhGVM3gk4Vw9h1mndJ9N6VF3hEDjnltB4RFLZ1cJEn+2OYN2kBwmZor
 OxkUxk80LDKytPejVMv2CUJ+69t90a9o6FrnfL4zAqo1An4F9dr+leOkJ
 fRQ2JNWkGPdRG/vg6+STjH14QNPTaV6SXOabmFy1LbxKQMr9Z6C8PTc1+
 TVtjpNzikiU+Hak0T+iO/+L2xH1ffK46sg+jAW0Tz8ouqYts9av79MRtF
 0tolqASD68z89bhvGNb2onVNKaZP8C6d+vkpRUu1t7KI4gWIRFLtvf9go w==;
X-CSE-ConnectionGUID: Y2utnafBRZKVG5e13lu29Q==
X-CSE-MsgGUID: i76bUjpRQVKeUiGGQVdXYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77199388"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="77199388"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:02:01 -0800
X-CSE-ConnectionGUID: 5zSlgd1TQpaBeIuaa7ClZg==
X-CSE-MsgGUID: iniuvvvPTqKRHabPYAlZdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="198501508"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..)
 ([10.1.40.114])
 by orviesa004.jf.intel.com with ESMTP; 01 Dec 2025 01:02:01 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 thomas.hellstrom@intel.com, pravalika.gurram@intel.com
Subject: [PATCH i-g-t v9 00/10] Madvise feature in SVM for Multi-GPU configs
Date: Mon,  1 Dec 2025 09:01:51 +0000
Message-ID: <20251201090201.326595-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251121162537.77551-1-nishit.sharma@intel.com>
References: <20251121162537.77551-1-nishit.sharma@intel.com>
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

This patch series adds comprehensive SVM multi-GPU IGT test coverage for
madvise and prefetch functionality.

ver2:
- Test name changed in commits
- In patchwork v1 patch is missing due to last patch was not sent

ver3:
- In patch-7 tags were added and it was not sent on patchwork

ver4:
- In patch file was added which is not available in source which caused
  CI build failure.

ver5:
- Added subtest function wrappers
- Subtests executing for all GPUs enumerated

ver7:
- Optimized function calling which are frequenctly called
- Incorporated review comments (Thomas Hellstrom)

ver8:
- Incorporated review comments (Thomas Hellstrom)
- Seperated madvise and lr_sync patches
- merged added 0 as instance parameter in xe_vm_madvise() call in
  xe_exec_system_allocator with xe_vm_madvise lib changes
- Subtests declared in const struct section[] and optimized
- All subtests executed with and without prefetch

ver9:
- Incorporated review comments (Pravalika, Thomas)
- Optimized code. Multiple same function called put in single function
- Added READ_ONCE/WRITE_once instead dereferecing.

Nishit Sharma (10):
  lib/xe: Add instance parameter to xe_vm_madvise
  lib/xe: Add synchronous helpers for VM bind/unbind operations
  tests/intel/xe_multi_gpusvm: Add SVM multi-GPU xGPU memory access test
  tests/intel/xe_multi_gpusvm: Add SVM multi-GPU atomic operations
  tests/intel/xe_multi_gpusvm: Add SVM multi-GPU coherency test
  tests/intel/xe_multi_gpusvm: Add SVM multi-GPU performance test
  tests/intel/xe_multi_gpusvm: Add SVM multi-GPU fault handling test
  tests/intel/xe_multi_gpusvm: Add SVM multi-GPU simultaneous access
    test
  tests/intel/xe_multi_gpusvm: Add SVM multi-GPU conflicting madvise
    test
  tests/intel/xe_multi-gpusvm: Add SVM multi-GPU migration test

 include/drm-uapi/xe_drm.h              |    4 +-
 lib/xe/xe_ioctl.c                      |   52 +-
 lib/xe/xe_ioctl.h                      |    9 +-
 tests/intel/xe_exec_system_allocator.c |    8 +-
 tests/intel/xe_multi_gpusvm.c          | 1664 ++++++++++++++++++++++++
 tests/meson.build                      |    1 +
 6 files changed, 1726 insertions(+), 12 deletions(-)
 create mode 100644 tests/intel/xe_multi_gpusvm.c

-- 
2.48.1

