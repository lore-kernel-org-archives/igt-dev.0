Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C096DCD11DF
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 09:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D9D10E414;
	Tue, 26 Mar 2024 09:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KVM434jp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D019B10E414
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 09:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711445358; x=1742981358;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PcpnOiuV8jtBERMKqWWd2LhbE1GMhtq3YtOlcQnxYmU=;
 b=KVM434jpZDbsAMjr5D5HEeiQ4i6R+CM67HI8n6L9WvTf+MK+AV3gy90s
 agk2tWfRgCQXI3UzcJjRUOrOAlPHbigPzhUTndgejICXin3VUd7Am8a6Y
 ZCo3Sr/9ap77SbnCoXN+tqu3bPjXylqQUQ49GliwCFB1mcj106W9H9tSG
 1vXhvg7WyhUdem8KIZD5RUFnjEI6ohzZoBPVdoxyBLPDbUx/s8Qhj3yjX
 6ndyswQeVEGSrLb+aBmc8mPOl8tngajyd5jv+DM34jQNpNPlbwdNXbzga
 VSvps+t0NAKcJOsixjr0h9jUm1cMXUkReK/znrnByxnkpP+l2toJ1lAi+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6378495"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6378495"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="15964860"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:29:15 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t v2 00/13] Align Xe test documentation to recent i915
 changes
Date: Tue, 26 Mar 2024 09:28:54 +0000
Message-Id: <20240326092907.1979345-1-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
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

After i915 documentation was updated and cleaned up there is a need to align
already documented Xe tests to new Sub-categories/Functionalities.
Some changes are small name alignment, some are putting tests into newly
introduces Sub-categories/Functionalities.

v2: Small fixes after Kamil's review.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>

Katarzyna Piecielska (13):
  tests/intel: Unify Blitter subcategory for i915 and Xe
  tests/intel: Introduce CMD submission Sub-category for XE
  tests/intel: Fix inconsitency in Sub-category/Functionality names
  tests/intel: Adjust Xe Sub-category/Functionality to i915 test docs
  tests/intel: Let's have Firmware subcategory in Xe tests as well
  tests/intel: Move drm_fdinfo to driver subcategory
  tests/intel: Add xe_prime_self_import to DRM subcategory
  tests/intel: Move xe_mmap to Memory management Sub-category
  tests/intel: Add xe_spin_batch to IGT Lib Sub-category
  tests/intel: Move xe_exec_queue_property to Sub-category uapi
  tests/intel: Move xe_waitfence test to Synchronization sub-category
  tests/intel: Unify functionality for compute tests
  tests/intel: Move xe_exec_reset.c to Reset Sub-category

 tests/device_reset.c                 | 1 -
 tests/intel/drm_fdinfo.c             | 4 ++--
 tests/intel/gem_eio.c                | 2 +-
 tests/intel/gem_reset_stats.c        | 2 +-
 tests/intel/xe_ccs.c                 | 2 +-
 tests/intel/xe_compute.c             | 8 ++++----
 tests/intel/xe_compute_preempt.c     | 8 ++++----
 tests/intel/xe_copy_basic.c          | 4 ++--
 tests/intel/xe_create.c              | 2 +-
 tests/intel/xe_evict.c               | 2 +-
 tests/intel/xe_evict_ccs.c           | 2 +-
 tests/intel/xe_exec_balancer.c       | 2 +-
 tests/intel/xe_exec_basic.c          | 2 +-
 tests/intel/xe_exec_compute_mode.c   | 4 ++--
 tests/intel/xe_exec_fault_mode.c     | 2 +-
 tests/intel/xe_exec_queue_property.c | 2 +-
 tests/intel/xe_exec_reset.c          | 4 ++--
 tests/intel/xe_exec_store.c          | 2 +-
 tests/intel/xe_exec_threads.c        | 2 +-
 tests/intel/xe_gpgpu_fill.c          | 4 ++--
 tests/intel/xe_gt_freq.c             | 2 +-
 tests/intel/xe_huc_copy.c            | 4 ++--
 tests/intel/xe_media_fill.c          | 4 ++--
 tests/intel/xe_mmap.c                | 2 +-
 tests/intel/xe_noexec_ping_pong.c    | 4 ++--
 tests/intel/xe_pm.c                  | 2 +-
 tests/intel/xe_pm_residency.c        | 2 +-
 tests/intel/xe_prime_self_import.c   | 2 +-
 tests/intel/xe_spin_batch.c          | 2 +-
 tests/intel/xe_sysfs_defaults.c      | 2 +-
 tests/intel/xe_sysfs_scheduler.c     | 2 +-
 tests/intel/xe_waitfence.c           | 3 +--
 32 files changed, 45 insertions(+), 47 deletions(-)

-- 
2.34.1

