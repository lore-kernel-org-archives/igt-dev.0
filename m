Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F122C5DF7D
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 10:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43D910EABF;
	Tue, 18 Aug 2026 10:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Njj4yb2Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385AF10EABF
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 10:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787049889; x=1818585889;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QKLotqmntMWLiUwCSiZqRZy+XRvq8ay5jC6K0HBg8AM=;
 b=Njj4yb2ZNSgR8lLJXZZ99Mcfxz75ukwyFP0uq5IoPwO+b0MFuaFDMJwG
 HGenvTCPFWQlL92dzg4B8oQrG5nyHmd97nDHLzUH59gEPLhRZrkeLwn/n
 Gxu8JPSJhqPE0d9lidMK2lEb9rghuEVovLWgX5HSO/TrnXYNm9GoarXF7
 trit3A5vXARIHWrBkETJAnjWtW5GB4VlakkFEVv52/LlQwU81VOA8qRzO
 ImlFaX9botf6gkhHl+xSo6+BBRc7S5T9KHfSV0xuQLi5/Fj0ugV+2fzXt
 MGfgN4jsyRnMEdGkOmXERZz0g/1mPy/WnXIc4LbZUSGscztJBUxFKYvre g==;
X-CSE-ConnectionGUID: phJEaqC9T7CHoqCgQWYiDg==
X-CSE-MsgGUID: 5tMlRtAkQ+KPx4oUV7L94g==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87415075"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="87415075"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 03:44:49 -0700
X-CSE-ConnectionGUID: cLgc4AVOQASNoFIqWSyFvQ==
X-CSE-MsgGUID: KUj22+KqTHOenQK2iDffXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="263861624"
Received: from cml-cometlake-client-platform.iind.intel.com ([10.223.55.11])
 by orviesa010.jf.intel.com with ESMTP; 18 Aug 2026 03:44:46 -0700
From: aditya.chauhan@intel.com
To: igt-dev@lists.freedesktop.org
Cc: ramadevi.gandi@intel.com, himanshu.girotra@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH v2 i-g-t] intel-ci: Update Core Blocklists for LNL, PTL & NVL
Date: Tue, 18 Aug 2026 16:14:46 +0530
Message-Id: <20260818104446.1759201-1-aditya.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Aditya Chauhan <aditya.chauhan@intel.com>

Update core blocklists for NVL,PTL,LNL by including vram dependent tests,
d3cold tests, s3 tests, mgpu tests

v2: - Rectify the typo in the commit Title(Himanshu)
    - Arrange the entries alphabetically(Kamil)
    - Refine the regex used to include more test cases
      like igt@.*multigpu.* and igt@.*survivability.* instead of using
      multiple entries for the similar test cases(Kamil)
    - drop the duplicate igt@xe_compute@ccs-mode-basic from PTL, it is
      already listed in the "more than one CCS engine" section

Cc: Himanshu Girotra <himanshu.girotra@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
---
 tests/intel-ci/xe.lnl.core.blocklist.txt | 20 ++++++++++---
 tests/intel-ci/xe.nvl.core.blocklist.txt | 38 +++++++++++++++++-------
 tests/intel-ci/xe.ptl.core.blocklist.txt | 29 +++++++++++-------
 3 files changed, 61 insertions(+), 26 deletions(-)

diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
index f921ca3a4..c830ac3c8 100644
--- a/tests/intel-ci/xe.lnl.core.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
@@ -17,17 +17,25 @@ igt@xe_cw_post_sync@walker-post-sync
 ##################################################################
 # Expected skip as platform has no vram support
 ##################################################################
+igt@xe_compute_preempt@compute-preempt-many-vram.*
 igt@xe_create@create-big-vram
-igt@xe_evict@.*
-igt@xe_evict_ccs@.*
+igt@xe_evict.*
+igt@xe_madvise@atomic.*
 igt@xe_mmap@small-bar
 igt@xe_mmap@vram$
 igt@xe_noexec_ping_pong@.*
 igt@xe_pm@d3-mmap-vram
 igt@xe_pm@d3hot-mmap-vram
+igt@xe_pm_residency@aspm_link_residency
 igt@xe_sysfs_tile@physical_vram_size_bytes
 igt@xe_vm@out-of-memory
-igt@xe_compute_preempt@compute-preempt-many-vram.*
+igt@xe_vm@overcommit.*
+##################################################################
+# Valid skip as VM_BIND decompression and the compressed PAT
+# index variants (wt / uc-comp) require device-local memory
+##################################################################
+igt@xe_ccs@vm-bind.*
+igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-(wt|uc-comp)-(single|multi)-vma
 ##################################################################
 # No d3cold support for LNL
 ##################################################################
@@ -43,6 +51,10 @@ igt@xe_pm_residency@cpg-basic
 ##################################################################
 igt@intel_hwmon@.*
 ##################################################################
+# Survivability mode is a discrete-only feature
+##################################################################
+igt@.*survivability.*
+##################################################################
 # Expected Skip for xe2+ paltforms
 ##################################################################
 igt@xe_media_fill@media-fill
@@ -56,7 +68,7 @@ igt@xe_pat@pat-index-xe3p-xpc
 ##################################################################
 # Expected skip on integrated platforms
 ##################################################################
-igt@.*@.*multigpu.*
+igt@.*multigpu.*
 igt@xe_peer2peer@.*
 #######################################################
 # Expected behavior - CCS mode enabled only for platforms
diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
index b36921519..7de332352 100644
--- a/tests/intel-ci/xe.nvl.core.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
@@ -11,16 +11,24 @@ igt@fbdev@.*
 # dedicated VRAM. Tests requiring device-local memory (VRAM),
 # small-BAR configurations, or VRAM eviction are not applicable.
 ##################################################################
-igt@xe_mmap@vram$
-igt@xe_mmap@small-bar
-igt@xe_noexec_ping_pong
+igt@xe_compute_preempt@.*vram.*
 igt@xe_create@create-big-vram
+igt@xe_eudebug_online@writes-caching-(?!sram-bb-sram-target-sram).*
 igt@xe_evict.*
+igt@xe_madvise@atomic.*
+igt@xe_mmap@small-bar
+igt@xe_mmap@vram$
+igt@xe_noexec_ping_pong
 igt@xe_pm@d3hot-mmap-vram
-igt@xe_eudebug_online@writes-caching-(?!sram-bb-sram-target-sram).*
-igt@xe_compute_preempt@.*vram.*
 igt@xe_sriov_vram@.*
 igt@xe_vm@out-of-memory
+igt@xe_vm@overcommit.*
+##################################################################
+# Expected skip as VM_BIND decompression and the compressed PAT
+# index variants (wt / uc-comp) require device-local memory
+##################################################################
+igt@xe_ccs@vm-bind.*
+igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-(wt|uc-comp)-(single|multi)-vma
 ##################################################################
 # Valid skip: PAT index tests targeting older/different platforms
 # These PAT (Page Attribute Table) index subtests validate
@@ -30,10 +38,10 @@ igt@xe_vm@out-of-memory
 # NVL uses its own PAT encoding; running these tests would
 # produce incorrect results or false failures.
 ##################################################################
+igt@xe_media_fill@media-fill
 igt@xe_pat@pat-index-xehpc
 igt@xe_pat@pat-index-xelp
 igt@xe_pat@pat-index-xelpg
-igt@xe_media_fill@media-fill
 igt@xe_pat@pat-index-xe2
 ##################################################################
 # Valid skip as test is applicable for Xe3p xpc and later platforms
@@ -59,8 +67,9 @@ igt@xe_compute@eu-busy-10s
 #     requires a TEE (Trusted Execution Environment) and
 #     associated firmware, which NVL does not support.
 ##################################################################
-igt@xe_huc_copy@huc_copy
 igt@xe_exec_balancer@.*
+igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
+igt@xe_huc_copy@huc_copy
 igt@xe_oa@oa-tlb-invalidate
 igt@xe_pxp@.*
 ##################################################################
@@ -70,16 +79,23 @@ igt@xe_pm@d3hot-i2c
 ##################################################################
 # Valid skip: multigpu/multitile tests are not supported on NVL
 ##################################################################
-igt@.*@.*multigpu.*
-igt@xe_peer2peer@.*
 igt@.*@.*tiles
+igt@.*multigpu.*
+igt@xe_peer2peer@.*
 ##################################################################
 # Valid skip: Not Applicable for iGPUs
 ##################################################################
+igt@.*survivability.*
 igt@intel_hwmon@.*
 igt@xe_mmap@pci-membarrier.*
-igt@xe_configfs@survivability-mode
-igt@xe_survivability@.*
+igt@xe_pm@.*d3cold.*
+igt@xe_pm_residency@aspm_link_residency
+##################################################################
+# Valid skip: S3 (deep) suspend is not supported on NVL
+##################################################################
+igt@xe_gt_freq@freq_suspend
+igt@xe_pm@s3.*
+igt@xe_pm_residency@cpg-basic
 ##################################################################
 # Valid skip: EU debugger and SIP (System Interrupt Protocol)
 # support is not yet available in the kernel for NVL. These tests
diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-ci/xe.ptl.core.blocklist.txt
index dc094e7e8..362711406 100644
--- a/tests/intel-ci/xe.ptl.core.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
@@ -13,15 +13,24 @@ igt@xe_cw_post_sync@walker-post-sync
 ##################################################################
 # Expected skip as iGPU has no vram
 ##################################################################
-igt@xe_mmap@vram$
+igt@xe_compute_preempt@.*vram.*
+igt@xe_create@create-big-vram
+igt@xe_evict.*
+igt@xe_madvise@atomic.*
 igt@xe_mmap@small-bar
-igt@xe_sysfs_tile@physical_vram_size_bytes
+igt@xe_mmap@vram$
 igt@xe_noexec_ping_pong@.*
-igt@xe_create@create-big-vram
 igt@xe_pm@d3hot-mmap-vram
-igt@xe_compute_preempt@.*vram.*
+igt@xe_pm_residency@aspm_link_residency
+igt@xe_sysfs_tile@physical_vram_size_bytes
 igt@xe_vm@out-of-memory
-igt@xe_evict.*
+igt@xe_vm@overcommit.*
+##################################################################
+# Expected skip as VM_BIND decompression and the compressed PAT
+# index variants (wt / uc-comp) require device-local memory
+##################################################################
+igt@xe_ccs@vm-bind.*
+igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-(wt|uc-comp)-(single|multi)-vma
 ##################################################################
 # No d3cold support for HW as of now
 ##################################################################
@@ -36,20 +45,18 @@ igt@xe_pm_residency@cpg-basic
 # Expected skips as the tests are only expected to run on older
 # platforms
 ##################################################################
+igt@xe_media_fill@media-fill
 igt@xe_pat@pat-index-xe3p-xpc
 igt@xe_pat@pat-index-xehpc
 igt@xe_pat@pat-index-xelp
 igt@xe_pat@pat-index-xelpg
-igt@xe_media_fill@media-fill
-igt@xe_compute@ccs-mode-basic
-igt@xe_configfs@survivability-mode
 ##################################################################
 # Features not supported for integrated platforms
 ##################################################################
+igt@.*multigpu.*
 igt@intel_hwmon@.*
-igt@.*@.*multigpu.*
-igt@xe_peer2peer@.*
 igt@xe_mmap@pci-membarrier.*
+igt@xe_peer2peer@.*
 igt@xe_pm@d3hot-i2c
 ##################################################################
 # Expected skip for the platform as the tests need more than
@@ -82,5 +89,5 @@ igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
 ##################################################################
 # survivability feature not applicable for PTL
 ##################################################################
-igt@xe_survivability@.*
+igt@.*survivability.*
 #################################################################
-- 
2.34.1

