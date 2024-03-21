Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E36CC54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 15:42:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17B010EDA6;
	Thu, 21 Mar 2024 15:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QILz1Bbi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3609310EE0B
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 15:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711035737; x=1742571737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dwwe8dN3wgIOFJ4BAfhcSqrBCY4i2z+uRCQEZ/xZBo8=;
 b=QILz1BbiA33JkyHZO8/1sItrMIYZTqaAp7+BxEQTK8Tk9LR4k/wp7iYC
 W/xr9X7AWHnh7YyHF2TdoatcEaQAcJZtz6g6VHVavOWV1XTHTivpI5Efj
 WhZTmn9wrCaMuQvFYmC3ZmsfLg3qW2IaBZ9Fz/qteffAXa2ii2TH8bRXK
 F3gqkYooxwCE3B4K+QC7DCOGE7bZ4UhltwIAWyhKi406yQt6tKT+Xm53q
 vJkBd996zrthh0lREDoMFpW+akg1I7+Kndb9KfZ3pWTTHoTUiPLcD9/Bq
 8EussF8ogpVhPdyfqwp0FSbq/9J3REtcv5MJiR72sXALLye5x4gBaEjLg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5867150"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="5867150"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:42:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="14952514"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:42:15 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Himanshu Girotra <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t v5 20/24] tests/intel: Add missing documentation fields
 in i915_selftest
Date: Thu, 21 Mar 2024 15:38:43 +0000
Message-Id: <20240321153847.1787625-21-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
References: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
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

Add subcategories, functionalities for all selftests in i915_selftest.
Change functionality for live@gem - s/command submission/execbuf/.

v2: Make Sub-category/Functionality/Feature unique values. (Kamil)

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Acked-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 tests/intel/i915_selftest.c | 392 ++++++++++++++++++++----------------
 1 file changed, 213 insertions(+), 179 deletions(-)

diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index 2c5f6bce2..dff0a4efd 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -29,190 +29,196 @@
  *
  * SUBTEST: live
  * Feature: gem_core
+ * Sub-category: Selftest
+ * Category: Selftest
+ * Functionality: live selftest
  * Run type: BAT
  *
  * SUBTEST: live@active
  * Category: Selftest
  * Functionality: semaphore
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Test category: i915
+ * Sub-category: Synchronization
  *
  * SUBTEST: live@blt
  * Category: Selftest
  * Description: Blitter validation
  * Functionality: command streamer
- * Sub-category: i915 / HW
- * Test category: GEM_Legacy
+ * Test category: i915 / HW
+ * Sub-category: Blitter
  *
  * SUBTEST: live@client
  * Category: Selftest
  * Description: Internal API over blitter
- * Functionality: API checks
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: blitter api
+ * Test category: i915
+ * Sub-category: uapi
  *
  * SUBTEST: live@coherency
  * Category: Selftest
  * Description: Cache management
- * Functionality: memory management
- * Sub-category: i915 / HW
- * Test category: GEM_Legacy
+ * Functionality: cache
+ * Test category: i915 / HW
+ * Sub-category: Memory management
  *
  * SUBTEST: live@debugger
  * Category: Selftest
  * Functionality: device management
- * Sub-category: debugger
- * Test category: GEM_Legacy
+ * Test category: debugger
+ * Sub-category: Debugging
  *
  * SUBTEST: live@display
  * Category: Selftest
  * Functionality: display sanity
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Test category: i915
+ * Sub-category: Display
  *
  * SUBTEST: live@dmabuf
  * Category: Selftest
  * Functionality: buffer management
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Test category: i915
+ * Sub-category: Memory management
  *
  * SUBTEST: live@evict
  * Category: Selftest
  * Functionality: GTT eviction
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Test category: i915
+ * Sub-category: Memory management
  *
  * SUBTEST: live@execlists
  * Category: Selftest
  * Description: command submission backend
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: execlists
+ * Test category: i915
+ * Sub-category: CMD submission
  *
  * SUBTEST: live@gem
  * Category: Selftest
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: execbuf
+ * Test category: i915
+ * Sub-category: CMD submission
  *
  * SUBTEST: live@gem_contexts
  * Category: Selftest
  * Description: User isolation and execution at the context level
- * Functionality: context management
- * Sub-category: i915 / HW
+ * Functionality: context
+ * Sub-category: CMD submission
  * Test category: GEM_Legacy
+ * Test category: i915 / HW
  *
  * SUBTEST: live@gem_execbuf
  * Category: Selftest
  * Description: command submission support
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: execbuf
+ * Test category: i915
+ * Sub-category: CMD submission
  *
  * SUBTEST: live@gt_ccs_mode
  * Category: Selftest
  * Description: Multi-ccs internal validation
  * Functionality: multii-ccs
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Test category: i915
+ * Sub-category: CMD submission
  *
  * SUBTEST: live@gt_contexts
  * Category: Selftest
  * Description: HW isolation and HW context validation
- * Functionality: context management
- * Sub-category: HW
- * Test category: GEM_Legacy
+ * Functionality: context
+ * Sub-category: CMD submission
+ * Test category: HW
  *
  * SUBTEST: live@gt_engines
  * Category: Selftest
  * Description: command submission topology validation
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: command submission topology
+ * Test category: i915
+ * Sub-category: CMD submission
  *
  * SUBTEST: live@gt_gtt
  * Category: Selftest
  * Description: Validation of virtual address management and execution
- * Functionality: memory management
- * Sub-category: HW
- * Test category: GEM_Legacy
+ * Functionality: gtt
+ * Test category: HW
+ * Sub-category: Memory management
  *
  * SUBTEST: live@gt_heartbeat
  * Category: Selftest
  * Description: Stall detection interface validation
- * Functionality: reset
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: heartbeat
+ * Test category: i915
+ * Sub-category: Reset
  *
  * SUBTEST: live@gt_lrc
  * Category: Selftest
  * Description: HW isolation and HW context validation
- * Functionality: context management
- * Sub-category: HW
- * Test category: GEM_Legacy
+ * Functionality: context
+ * Sub-category: CMD submission
+ * Test category: HW
  *
  * SUBTEST: live@gt_mocs
  * Category: Selftest
  * Description: Verification of mocs registers
- * Functionality: mocs
- * Sub-category: i915 / HW
- * Test category: GEM_Legacy
+ * Functionality: mocs registers
+ * Test category: i915 / HW
+ * Sub-category: Mocs
  *
  * SUBTEST: live@gt_pm
  * Category: Selftest
  * Description: Basic i915 driver module selftests
- * Feature: rps, rc6
- * Test category: rps, rc6
+ * Functionality: rps, rc6
+ * Sub-category: Power management
  *
  * SUBTEST: live@gt_timelines
  * Category: Selftest
  * Description: semaphore tracking
  * Functionality: semaphore
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Test category: i915
+ * Sub-category: Synchronization
  *
  * SUBTEST: live@gt_tlb
  * Category: Selftest
  * Test category: Memory Management
+ * Sub-category: Memory management
+ * Functionality: tlb
  *
  * SUBTEST: live@gtt
  * Category: Selftest
  * Description: Virtual address management interface validation
- * Functionality: memory management
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: virtual address
+ * Test category: i915
+ * Sub-category: Memory management
  *
  * SUBTEST: live@gtt_l4wa
  * Category: Selftest
  * Description: Check the L4WA is enabled when it was required
- * Functionality: workarounds
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: L4WA
+ * Test category: i915
+ * Sub-category: Workarounds
  *
  * SUBTEST: live@guc
  * Category: Selftest
- * Feature: GuC
+ * Feature: firmware feature
  * Sub-category: Firmware
  * Functionality: GUC
  * Test category: GuC
  *
  * SUBTEST: live@guc_doorbells
  * Category: Selftest
- * Feature: GuC
+ * Feature: firmware feature
  * Sub-category: Firmware
  * Functionality: GUC
  * Test category: GuC
  *
  * SUBTEST: live@guc_hang
  * Category: Selftest
- * Feature: GuC
+ * Feature: firmware feature
  * Sub-category: Firmware
  * Functionality: GUC
  * Test category: GuC
  *
  * SUBTEST: live@guc_multi_lrc
  * Category: Selftest
- * Feature: GuC
+ * Feature: firmware feature
  * Sub-category: Firmware
  * Functionality: GUC
  * Test category: GuC
@@ -220,313 +226,341 @@
  * SUBTEST: live@hangcheck
  * Category: Selftest
  * Description: reset handling after stall detection
- * Functionality: reset
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: hangcheck
+ * Test category: i915
+ * Sub-category: Reset
  *
  * SUBTEST: live@hugepages
  * Category: Selftest
  * Description: Large page support validation
- * Functionality: memory management
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: large page
+ * Test category: i915
+ * Sub-category: Memory management
  *
  * SUBTEST: live@late_gt_pm
  * Category: Selftest
- * Feature: rc6
+ * Feature: rc6 feature
  * Functionality: Basic i915 driver module selftests
  * Test category: rc6
+ * Sub-category: Power management
  *
  * SUBTEST: live@lmem
  * Category: Selftest
+ * Feature: local_memory
+ * Description: Basic i915 driver module selftests
+ * Functionality: local memory
+ * Sub-category: Memory management
  *
  * SUBTEST: live@memory_region
  * Category: Selftest
  * Description: memory topology validation and migration checks
- * Functionality: memory management
- * Sub-category: i915 / HW
- * Test category: GEM_Legacy
+ * Functionality: memory topology
+ * Test category: i915 / HW
+ * Sub-category: Memory management
  *
  * SUBTEST: live@memory_region_cross_tile
  * Category: Selftest
- * Functionality: Multi-tile memory topology validation
- * Test category: MultiTile
+ * Description: Multi-tile memory topology validation
+ * Functionality: memory topology
+ * Sub-category: MultiTile
  *
  * SUBTEST: live@mman
  * Category: Selftest
  * Description: memory management validation
- * Functionality: memory management
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: mapping
+ * Test category: i915
+ * Sub-category: Memory management
  *
  * SUBTEST: live@obj_lock
  * Category: Selftest
  * Description: Validation of per-object locking patterns
- * Functionality: per-object lockling
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: per-object locking
+ * Test category: i915
+ * Sub-category: Core
  *
  * SUBTEST: live@objects
  * Category: Selftest
  * Description: User object allocation and isolation checks
  * Functionality: buffer management
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Test category: i915
+ * Sub-category: Core
  *
  * SUBTEST: live@perf
  * Category: Selftest
  * Feature: i915 perf selftests
- * Functionality: Basic i915 module perf unit selftests
- * Test category: Perf
+ * Description: Basic i915 module perf unit selftests
+ * Functionality: perf
+ * Sub-category: Performance
  *
  * SUBTEST: live@remote_tiles
  * Category: Selftest
- * Functionality: Tile meta data validation
- * Test category: MultiTile
+ * Description: Tile meta data validation
+ * Functionality: meta data
+ * Sub-category: MultiTile
  *
  * SUBTEST: live@requests
  * Category: Selftest
  * Description: Validation of internal i915 command submission interface
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: command submission interface
+ * Test category: i915
+ * Sub-category: CMD submission
  *
  * SUBTEST: live@reset
  * Category: Selftest
  * Description: engine/GT resets
- * Functionality: reset
- * Sub-category: HW
- * Test category: GEM_Legacy
+ * Functionality: engine/GT reset
+ * Test category: HW
+ * Sub-category: Reset
  *
  * SUBTEST: live@sanitycheck
  * Category: Selftest
  * Description: Checks the selftest infrastructure itself
- * Functionality: selftests
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: selftest
+ * Test category: i915
+ * Sub-category: Core
  *
  * SUBTEST: live@scheduler
  * Category: Selftest
- * Test category: Cmd Submission
+ * Sub-category: CMD Submission
+ * Functionality: scheduler
  *
  * SUBTEST: live@semaphores
  * Category: Selftest
  * Description: GuC semaphore management
  * Functionality: semaphore
- * Sub-category: HW
- * Test category: GEM_Legacy
+ * Test category: HW
+ * Sub-category: Synchronization
  *
  * SUBTEST: live@slpc
  * Category: Selftest
- * Feature: slpc / pm_rps
- * Functionality: Basic i915 driver module selftests
+ * Feature: slpc feature/ pm_rps
  * Test category: slpc / pm_rps
+ * Description: Basic i915 driver module selftests
+ * Functionality: slpc
+ * Sub-category: Power management
  *
  * SUBTEST: live@uncore
  * Category: Selftest
  * Description: Basic i915 driver module selftests
- * Feature: forcewake
+ * Feature: forcewake feature
  * Test category: forcewake
+ * Functionality: forcewake
+ * Sub-category: Power management
  *
  * SUBTEST: live@vma
  * Category: Selftest
  * Description: Per-object virtual address management
- * Functionality: memory management
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: vma
+ * Test category: i915
+ * Sub-category: Memory management
  *
  * SUBTEST: live@win_blt_copy
  * Category: Selftest
  * Description: Validation of migration interface
  * Functionality: migration interface
- * Sub-category: i915 / HW
- * Test category: GEM_Legacy
+ * Test category: i915 / HW
+ * Sub-category: Blitter
  *
  * SUBTEST: live@workarounds
  * Category: Selftest
  * Description: Check workarounds persist or are reapplied after resets and other power management events
- * Functionality: workarounds
- * Sub-category: HW
- * Test category: GEM_Legacy
+ * Functionality: driver workarounds
+ * Test category: HW
+ * Sub-category: Workarounds
  *
  * SUBTEST: mock
+ * Category: Selftest
  * Feature: gem_core
+ * Sub-category: Selftest
+ * Functionality: mock selftest
  * Run type: FULL
  *
  * SUBTEST: mock@buddy
  * Category: Selftest
  * Description: Buddy allocation
- * Functionality: memory management
- * Sub-category: DRM
- * Test category: GEM_Legacy
+ * Functionality: buddy allocation
+ * Test category: DRM
+ * Sub-category: Memory management
  *
  * SUBTEST: mock@contexts
  * Category: Selftest
  * Description: GEM context internal API checks
- * Functionality: API checks
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: context
+ * Test category: i915
+ * Sub-category: uapi
  *
  * SUBTEST: mock@dmabuf
  * Category: Selftest
  * Description: dma-buf (buffer management) API checks
- * Functionality: API checks
- * Sub-category: DRM
- * Test category: GEM_Legacy
+ * Functionality: buffer management
+ * Test category: DRM
+ * Sub-category: uapi
  *
  * SUBTEST: mock@engine
  * Category: Selftest
  * Description: Engine topology API checks
- * Functionality: API checks
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: engine topology
+ * Test category: i915
+ * Sub-category: uapi
  *
  * SUBTEST: mock@evict
  * Category: Selftest
  * Description: GTT eviction API checks
- * Functionality: API checks
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: gtt eviction
+ * Test category: i915
+ * Sub-category: uapi
  *
  * SUBTEST: mock@fence
  * Category: Selftest
  * Description: semaphore API checks
- * Functionality: API checks
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: semaphore
+ * Test category: i915
+ * Sub-category: uapi
  *
  * SUBTEST: mock@gtt
  * Category: Selftest
  * Description: Virtual address management API checks
- * Functionality: API checks
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: gtt
+ * Test category: i915
+ * Sub-category: uapi
  *
  * SUBTEST: mock@hugepages
  * Category: Selftest
  * Description: Hugepage API checks
- * Functionality: API checks
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: huge page
+ * Test category: i915
+ * Sub-category: uapi
  *
  * SUBTEST: mock@memory_region
  * Category: Selftest
  * Description: Memory region API checks
- * Functionality: API checks
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: memory region
+ * Test category: i915
+ * Sub-category: uapi
  *
  * SUBTEST: mock@objects
  * Category: Selftest
  * Description: Buffer object API checks
- * Functionality: API checks
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: buffer object
+ * Test category: i915
+ * Sub-category: uapi
  *
  * SUBTEST: mock@phys
  * Category: Selftest
  * Description: legacy physical object API checks
- * Functionality: API checks
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: physical object
+ * Test category: i915
+ * Sub-category: uapi
  *
  * SUBTEST: mock@requests
  * Category: Selftest
  * Description: Internal command submission API checks
- * Functionality: API checks
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: requests
+ * Test category: i915
+ * Sub-category: uapi
  *
  * SUBTEST: mock@ring
  * Category: Selftest
  * Description: Ringbuffer management API checks
- * Functionality: API checks
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: ringbuffer
+ * Test category: i915
+ * Sub-category: uapi
  *
  * SUBTEST: mock@sanitycheck
  * Category: Selftest
  * Description: Selftest for the selftest
- * Functionality: selftests
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: selftest
+ * Test category: i915
+ * Sub-category: Core
  *
  * SUBTEST: mock@scatterlist
  * Category: Selftest
  * Description: Scatterlist API checks
- * Functionality: API checks
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: scatterlist
+ * Test category: i915
+ * Sub-category: uapi
  *
  * SUBTEST: mock@shmem
  * Category: Selftest
  * Description: SHM utils API checks
- * Functionality: API checks
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: shm
+ * Test category: i915
+ * Sub-category: uapi
  *
  * SUBTEST: mock@syncmap
  * Category: Selftest
  * Description: API checks for the contracted radixtree
- * Functionality: API checks
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: contracted radixtree
+ * Test category: i915
+ * Sub-category: uapi
  *
  * SUBTEST: mock@timelines
  * Category: Selftest
  * Description: API checks for semaphore tracking
- * Functionality: API checks
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: semaphore
+ * Test category: i915
+ * Sub-category: uapi
  *
  * SUBTEST: mock@tlb
  * Category: Selftest
  * Test category: Memory Management
+ * Sub-category: Memory management
+ * Functionality: tlb
  *
  * SUBTEST: mock@uncore
  * Category: Selftest
  * Description: Basic i915 driver module selftests
- * Feature: forcewake
+ * Feature: forcewake feature
  * Test category: forcewake
+ * Functionality: forcewake
+ * Sub-category: Power management
  *
  * SUBTEST: mock@vma
  * Category: Selftest
  * Description: API checks for virtual address management
- * Functionality: API checks
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Functionality: vma
+ * Test category: i915
+ * Sub-category: uapi
  *
  * SUBTEST: perf
- * Feature: oa
+ * Category: Selftest
+ * Feature: i915 perf selftests
+ * Functionality: oa
+ * Sub-category: Performance
  * Run type: FULL
  *
  * SUBTEST: perf@blt
  * Category: Selftest
  * Feature: i915 perf selftests
- * Functionality: Basic i915 module perf unit selftests
- * Test category: Perf
+ * Description: Basic i915 module perf unit selftests
+ * Functionality: perf
+ * Sub-category: Performance
  *
  * SUBTEST: perf@engine_cs
  * Category: Selftest
  * Feature: i915 perf selftests
- * Functionality: Basic i915 module perf unit selftests
- * Test category: Perf
+ * Description: Basic i915 module perf unit selftests
+ * Functionality: perf
+ * Sub-category: Performance
  *
  * SUBTEST: perf@region
  * Category: Selftest
  * Feature: i915 perf selftests
- * Functionality: Basic i915 module perf unit selftests
- * Test category: Perf
+ * Description: Basic i915 module perf unit selftests
+ * Functionality: perf
+ * Sub-category: Performance
  *
  * SUBTEST: perf@request
  * Category: Selftest
- * Functionality: Basic i915 module perf unit selftests
- * Test category: Perf
+ * Description: Basic i915 module perf unit selftests
+ * Functionality: perf
+ * Sub-category: Performance
  *
  * SUBTEST: perf@scheduler
  * Category: Selftest
- * Functionality: Basic i915 module perf unit selftests
- * Test category: Perf
+ * Description: Basic i915 module perf unit selftests
+ * Functionality: perf
+ * Sub-category: Performance
  */
 
 IGT_TEST_DESCRIPTION("Basic unit tests for i915.ko");
-- 
2.34.1

