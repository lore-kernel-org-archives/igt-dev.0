Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C569C27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 14:27:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81B010E6BA;
	Tue, 18 Jun 2024 14:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fUlR7HBB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB0D10E6B8
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 14:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718720860; x=1750256860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=29OG83r11woIzZO1xNi6IAMagLnOSVZ5XPp9ddMdbzs=;
 b=fUlR7HBBMnDyOATTe6TPGTaDcHJihiUqC2QxK3R6Ov/MUxVIwlTQyPZ9
 kHuC6IjuHOmN3JDwuChkCDMtr5ceVajhaBudXf0HDwR32R2tdlkt9cNEX
 uQTo2YZgqjukKvmG7DuHwqzQl5HG//i0mKKkcXmYWq8Sjdq3InfowSo3C
 1PvVa/0aHeuKmNCOyoHrxmBycNOMmK+8sPShjrTv/5Ggdkxlkpn+HcDA6
 yUSmqRDxHbyfhSF+ZKLEibYS66fHVBEeT9qYdY99EDEVAr4fwBYyGP+Ux
 fbislQ9h2uVrTRMpbnB4/3gruWYMHrnwccwJqj3wbCCMdJzI0ZE03/Zky g==;
X-CSE-ConnectionGUID: kfpOZKucSBODjhtt0mYzOQ==
X-CSE-MsgGUID: J24y/88hTX+sW8+laAWssQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15747883"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15747883"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 07:27:39 -0700
X-CSE-ConnectionGUID: DgrrUQjoSzGqYxfqUeNinQ==
X-CSE-MsgGUID: JhgOOzjySiSYU1k6vMz2Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="46543672"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 07:27:37 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <me@petersenna.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t 4/4] tests/intel: Remove redundant 'Test category'
 entries for tests
Date: Tue, 18 Jun 2024 14:26:50 +0000
Message-Id: <20240618142650.1991834-5-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618142650.1991834-1-katarzyna.piecielska@intel.com>
References: <20240618142650.1991834-1-katarzyna.piecielska@intel.com>
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

There is no point in repeating 'Test category' in all documented cases if it
is given for whole test binary and there is no need to add different
test category for particular testcase.
So let's remove redundant entries.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Peter Senna Tschudin <me@petersenna.com>
Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
---
 tests/intel/gem_exec_fence.c  |  7 -----
 tests/intel/gem_sync.c        |  3 --
 tests/intel/gem_workarounds.c |  2 --
 tests/intel/i915_selftest.c   | 59 -----------------------------------
 tests/intel/xe_query.c        | 20 ------------
 5 files changed, 91 deletions(-)

diff --git a/tests/intel/gem_exec_fence.c b/tests/intel/gem_exec_fence.c
index 4332da05f..dc7f02906 100644
--- a/tests/intel/gem_exec_fence.c
+++ b/tests/intel/gem_exec_fence.c
@@ -51,23 +51,19 @@
  *
  * SUBTEST: basic-await
  * Description: Basic check for explicit fence with async wait on each engine.
- * Test category: MultiTile
  *
  * SUBTEST: basic-busy
  * Description: Basic check for explicit fence on each busy engine.
  * Feature: cmd_submission, multitile, synchronization feature
- * Test category: MultiTile
  *
  * SUBTEST: basic-busy-all
  * Description: Basic check for composite fence on all busy engines.
  * Feature: cmd_submission, multitile, synchronization feature
- * Test category: MultiTile
  *
  * SUBTEST: basic-wait
  * Description: Basic check for explicit fence with additional wait time on
  *		each busy engine.
  * Feature: cmd_submission, multitile, synchronization feature
- * Test category: MultiTile
  *
  * SUBTEST: basic-wait-all
  * Description: Basic check for composite fence with additional wait on all
@@ -75,7 +71,6 @@
  *		that the composite fence across all engines completes only
  *		after the batch is completed on every engine.
  * Feature: cmd_submission, multitile, synchronization feature
- * Test category: MultiTile
  *
  * SUBTEST: busy-hang
  * Description: Check for explicit fence on each busy engine with a pending
@@ -111,7 +106,6 @@
  * SUBTEST: nb-await
  * Description: Check for explicit fence with non-blocking wait on each engine.
  * Feature: cmd_submission, multitile, synchronization feature
- * Test category: MultiTile
  *
  * SUBTEST: nb-await-hang
  * Description: Check for explicit fence with non-blocking async wait on each
@@ -122,7 +116,6 @@
  * Description: Check for EXEC_FENCE_SUBMIT in parallel execution scenarios
  *		on each engine.
  * Feature: cmd_submission, multitile, synchronization feature
- * Test category: MultiTile
  *
  * SUBTEST: submit
  * Description: Check timeslicing on submit-fence.
diff --git a/tests/intel/gem_sync.c b/tests/intel/gem_sync.c
index ec9da63a0..c489d0875 100644
--- a/tests/intel/gem_sync.c
+++ b/tests/intel/gem_sync.c
@@ -64,14 +64,12 @@
  *   Check synchronisation of ring.
  *   Exercise all physical engine selection and legacy rings
  * Feature: multitile, synchronization feature
- * Test category: MultiTile
  *
  * SUBTEST: basic-many-each
  * Description:
  *   Create race condition and see if we can catch interrupts.
  *   Basic check of ring to ring write synchronisation
  * Feature: multitile, synchronization feature
- * Test category: MultiTile
  *
  * SUBTEST: basic-store-all
  * Description: Basic version of store synchronisation test.
@@ -81,7 +79,6 @@
  *   Check that store synchronisation works.
  *   Basic check of ring to ring write, store synchronisation
  * Feature: multitile, synchronization feature
- * Test category: MultiTile
  *
  * SUBTEST: default
  * Description: Check synchronisation of rings on each engine.
diff --git a/tests/intel/gem_workarounds.c b/tests/intel/gem_workarounds.c
index 76c7e2479..f30dd3e1c 100644
--- a/tests/intel/gem_workarounds.c
+++ b/tests/intel/gem_workarounds.c
@@ -63,12 +63,10 @@
  * SUBTEST: suspend-resume-context
  * Description: Test to verify gem WA registers during suspend-resume
  * Feature: suspend, workaround
- * Test category: suspend
  *
  * SUBTEST: suspend-resume-fd
  * Description: Test to verify gem WA registers during suspend-resume
  * Feature: suspend, workaround
- * Test category: suspend
  */
 
 #define PAGE_SIZE 4096
diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index 49271a672..89b0331f3 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -47,7 +47,6 @@
  * Mega feature: General Core features
  * Sub-category: Blitter tests
  * Functionality: command streamer
- * Test category: i915 / HW
  *
  * SUBTEST: live@client
  * Description: Internal API over blitter
@@ -55,7 +54,6 @@
  * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: blitter api
- * Test category: i915
  *
  * SUBTEST: live@coherency
  * Description: Cache management
@@ -63,35 +61,30 @@
  * Mega feature: General Core features
  * Sub-category: Memory management tests
  * Functionality: cache
- * Test category: i915 / HW
  *
  * SUBTEST: live@debugger
  * Category: Core
  * Mega feature: General Core features
  * Sub-category: Debugging
  * Functionality: device management
- * Test category: debugger
  *
  * SUBTEST: live@display
  * Category: Core
  * Mega feature: General Display Features
  * Sub-category: Display tests
  * Functionality: display sanity
- * Test category: i915
  *
  * SUBTEST: live@dmabuf
  * Category: Core
  * Mega feature: General Core features
  * Sub-category: Memory management tests
  * Functionality: dmabuf test
- * Test category: i915
  *
  * SUBTEST: live@evict
  * Category: Core
  * Mega feature: General Core features
  * Sub-category: Memory management tests
  * Functionality: GTT eviction
- * Test category: i915
  *
  * SUBTEST: live@execlists
  * Description: command submission backend
@@ -99,14 +92,12 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: execlists
- * Test category: i915
  *
  * SUBTEST: live@gem
  * Category: Core
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: execbuf
- * Test category: i915
  *
  * SUBTEST: live@gem_contexts
  * Description: User isolation and execution at the context level
@@ -114,7 +105,6 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: context
- * Test category: GEM_Legacy
  *
  * SUBTEST: live@gem_execbuf
  * Description: command submission support
@@ -122,7 +112,6 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: execbuf
- * Test category: i915
  *
  * SUBTEST: live@gt_ccs_mode
  * Description: Multi-ccs internal validation
@@ -130,7 +119,6 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: multii-ccs
- * Test category: i915
  *
  * SUBTEST: live@gt_contexts
  * Description: HW isolation and HW context validation
@@ -138,7 +126,6 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: context
- * Test category: HW
  *
  * SUBTEST: live@gt_engines
  * Description: command submission topology validation
@@ -146,7 +133,6 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: command submission topology
- * Test category: i915
  *
  * SUBTEST: live@gt_gtt
  * Description: Validation of virtual address management and execution
@@ -154,7 +140,6 @@
  * Mega feature: General Core features
  * Sub-category: Memory management tests
  * Functionality: gtt
- * Test category: HW
  *
  * SUBTEST: live@gt_heartbeat
  * Description: Stall detection interface validation
@@ -162,7 +147,6 @@
  * Mega feature: General Core features
  * Sub-category: Reset tests
  * Functionality: heartbeat
- * Test category: i915
  *
  * SUBTEST: live@gt_lrc
  * Description: HW isolation and HW context validation
@@ -170,7 +154,6 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: context
- * Test category: HW
  *
  * SUBTEST: live@gt_mocs
  * Description: Verification of mocs registers
@@ -178,7 +161,6 @@
  * Mega feature: General Core features
  * Sub-category: Mocs
  * Functionality: mocs registers
- * Test category: i915 / HW
  *
  * SUBTEST: live@gt_pm
  * Description: Basic i915 driver module selftests
@@ -193,14 +175,12 @@
  * Mega feature: General Core features
  * Sub-category: Synchronization
  * Functionality: semaphore
- * Test category: i915
  *
  * SUBTEST: live@gt_tlb
  * Category: Core
  * Mega feature: General Core features
  * Sub-category: Memory management tests
  * Functionality: tlb
- * Test category: Memory Management
  *
  * SUBTEST: live@gtt
  * Description: Virtual address management interface validation
@@ -208,7 +188,6 @@
  * Mega feature: General Core features
  * Sub-category: Memory management tests
  * Functionality: virtual address
- * Test category: i915
  *
  * SUBTEST: live@gtt_l4wa
  * Description: Check the L4WA is enabled when it was required
@@ -216,7 +195,6 @@
  * Mega feature: General Core features
  * Sub-category: Workarounds
  * Functionality: L4WA
- * Test category: i915
  *
  * SUBTEST: live@guc
  * Category: Core
@@ -224,7 +202,6 @@
  * Sub-category: Firmware tests
  * Functionality: GUC
  * Feature: GuC
- * Test category: GuC
  *
  * SUBTEST: live@guc_doorbells
  * Category: Core
@@ -232,7 +209,6 @@
  * Sub-category: Firmware tests
  * Functionality: GUC
  * Feature: GuC
- * Test category: GuC
  *
  * SUBTEST: live@guc_hang
  * Category: Core
@@ -240,7 +216,6 @@
  * Sub-category: Firmware tests
  * Functionality: GUC
  * Feature: GuC
- * Test category: GuC
  *
  * SUBTEST: live@guc_multi_lrc
  * Category: Core
@@ -248,14 +223,12 @@
  * Sub-category: Firmware tests
  * Functionality: GUC
  * Feature: GuC
- * Test category: GuC
  *
  * SUBTEST: live@hangcheck
  * Description: reset handling after stall detection
  * Category: Core
  * Mega feature: General Core features
  * Functionality: hangcheck
- * Test category: i915
  * Sub-category: Reset tests
  *
  * SUBTEST: live@hugepages
@@ -264,7 +237,6 @@
  * Mega feature: General Core features
  * Sub-category: Memory management tests
  * Functionality: large page
- * Test category: i915
  *
  * SUBTEST: live@late_gt_pm
  * Description: Basic i915 driver module selftests
@@ -288,7 +260,6 @@
  * Mega feature: General Core features
  * Sub-category: Memory management tests
  * Functionality: memory topology
- * Test category: i915 / HW
  *
  * SUBTEST: live@memory_region_cross_tile
  * Category: Core
@@ -304,7 +275,6 @@
  * Mega feature: General Core features
  * Sub-category: Memory management tests
  * Functionality: mapping
- * Test category: i915
  *
  * SUBTEST: live@obj_lock
  * Description: Validation of per-object locking patterns
@@ -312,7 +282,6 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: per-object locking
- * Test category: i915
  *
  * SUBTEST: live@objects
  * Description: User object allocation and isolation checks
@@ -320,7 +289,6 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: objects
- * Test category: i915
  *
  * SUBTEST: live@perf
  * Description: Basic i915 module perf unit selftests
@@ -343,7 +311,6 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: command submission interface
- * Test category: i915
  *
  * SUBTEST: live@reset
  * Description: engine/GT resets
@@ -351,7 +318,6 @@
  * Mega feature: General Core features
  * Sub-category: Reset tests
  * Functionality: engine/GT reset
- * Test category: HW
  *
  * SUBTEST: live@sanitycheck
  * Description: Checks the selftest infrastructure itself
@@ -359,7 +325,6 @@
  * Mega feature: General Core features
  * Sub-category: driver
  * Functionality: sanitycheck
- * Test category: i915
  *
  * SUBTEST: live@scheduler
  * Category: Core
@@ -373,7 +338,6 @@
  * Mega feature: General Core features
  * Sub-category: Synchronization
  * Functionality: semaphore
- * Test category: HW
  *
  * SUBTEST: live@slpc
  * Description: Basic i915 driver module selftests
@@ -397,7 +361,6 @@
  * Mega feature: General Core features
  * Sub-category: Memory management tests
  * Functionality: virtual address
- * Test category: i915
  *
  * SUBTEST: live@win_blt_copy
  * Description: Validation of migration interface
@@ -405,7 +368,6 @@
  * Mega feature: General Core features
  * Sub-category: Blitter tests
  * Functionality: migration interface
- * Test category: i915 / HW
  *
  * SUBTEST: live@workarounds
  * Description: Check workarounds persist or are reapplied after resets and other power management events
@@ -413,7 +375,6 @@
  * Mega feature: General Core features
  * Sub-category: Workarounds
  * Functionality: driver workarounds
- * Test category: HW
  *
  * SUBTEST: mock
  * Category: Core
@@ -429,7 +390,6 @@
  * Mega feature: General Core features
  * Sub-category: Memory management tests
  * Functionality: buddy allocation
- * Test category: DRM
  *
  * SUBTEST: mock@contexts
  * Description: GEM context internal API checks
@@ -437,7 +397,6 @@
  * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: context
- * Test category: i915
  *
  * SUBTEST: mock@dmabuf
  * Description: dma-buf (buffer management) API checks
@@ -445,7 +404,6 @@
  * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: dmabuf test
- * Test category: DRM
  *
  * SUBTEST: mock@engine
  * Description: Engine topology API checks
@@ -453,7 +411,6 @@
  * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: engine topology
- * Test category: i915
  *
  * SUBTEST: mock@evict
  * Description: GTT eviction API checks
@@ -461,7 +418,6 @@
  * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: gtt eviction
- * Test category: i915
  *
  * SUBTEST: mock@fence
  * Description: semaphore API checks
@@ -469,7 +425,6 @@
  * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: semaphore api
- * Test category: i915
  *
  * SUBTEST: mock@gtt
  * Description: Virtual address management API checks
@@ -477,7 +432,6 @@
  * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: gtt
- * Test category: i915
  *
  * SUBTEST: mock@hugepages
  * Description: Hugepage API checks
@@ -485,7 +439,6 @@
  * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: huge page
- * Test category: i915
  *
  * SUBTEST: mock@memory_region
  * Description: Memory region API checks
@@ -493,7 +446,6 @@
  * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: memory region
- * Test category: i915
  *
  * SUBTEST: mock@objects
  * Description: Buffer object API checks
@@ -501,7 +453,6 @@
  * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: buffer object
- * Test category: i915
  *
  * SUBTEST: mock@phys
  * Description: legacy physical object API checks
@@ -509,7 +460,6 @@
  * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: physical object
- * Test category: i915
  *
  * SUBTEST: mock@requests
  * Description: Internal command submission API checks
@@ -517,7 +467,6 @@
  * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: requests
- * Test category: i915
  *
  * SUBTEST: mock@ring
  * Description: Ringbuffer management API checks
@@ -525,7 +474,6 @@
  * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: ringbuffer
- * Test category: i915
  *
  * SUBTEST: mock@sanitycheck
  * Description: Selftest for the selftest
@@ -533,7 +481,6 @@
  * Mega feature: General Core features
  * Sub-category: driver
  * Functionality: sanitycheck
- * Test category: i915
  *
  * SUBTEST: mock@scatterlist
  * Description: Scatterlist API checks
@@ -541,7 +488,6 @@
  * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: scatterlist
- * Test category: i915
  *
  * SUBTEST: mock@shmem
  * Description: SHM utils API checks
@@ -549,7 +495,6 @@
  * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: shm
- * Test category: i915
  *
  * SUBTEST: mock@syncmap
  * Description: API checks for the contracted radixtree
@@ -557,7 +502,6 @@
  * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: contracted radixtree
- * Test category: i915
  *
  * SUBTEST: mock@timelines
  * Description: API checks for semaphore tracking
@@ -565,14 +509,12 @@
  * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: semaphore api
- * Test category: i915
  *
  * SUBTEST: mock@tlb
  * Category: Core
  * Mega feature: General Core features
  * Sub-category: Memory management tests
  * Functionality: tlb
- * Test category: Memory Management
  *
  * SUBTEST: mock@uncore
  * Description: Basic i915 driver module selftests
@@ -588,7 +530,6 @@
  * Mega feature: General Core features
  * Sub-category: uapi
  * Functionality: virtual address
- * Test category: i915
  *
  * SUBTEST: perf
  * Category: Core
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 5bdbe2917..94c985ad2 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -176,14 +176,12 @@ const char *get_topo_name(int value)
 /**
  * SUBTEST: query-engines
  * Description: Display engine classes available for xe device
- * Test category: functionality test
  *
  * SUBTEST: multigpu-query-engines
  * Description: Display engine classes available for all Xe devices.
  * Category: Core
  * Mega feature: General Core features
  * Sub-category: MultiGPU
- * Test category: functionality test
  */
 static void
 test_query_engines(int fd)
@@ -203,7 +201,6 @@ test_query_engines(int fd)
 
 /**
  * SUBTEST: query-mem-usage
- * Test category: functionality test
  * Description: Display memory information like memory class, size
  *	and alignment.
  *
@@ -212,7 +209,6 @@ test_query_engines(int fd)
  * Category: Core
  * Mega feature: General Core features
  * Sub-category: MultiGPU
- * Test category: functionality test
  */
 static void
 test_query_mem_regions(int fd)
@@ -270,7 +266,6 @@ test_query_mem_regions(int fd)
 
 /**
  * SUBTEST: query-gt-list
- * Test category: functionality test
  * Description: Display information about available GT components for xe device.
  *
  * SUBTEST: multigpu-query-gt-list
@@ -278,7 +273,6 @@ test_query_mem_regions(int fd)
  * Category: Core
  * Mega feature: General Core features
  * Sub-category: MultiGPU
- * Test category: functionality test
  */
 static void
 test_query_gt_list(int fd)
@@ -342,7 +336,6 @@ test_query_gt_list(int fd)
 
 /**
  * SUBTEST: query-topology
- * Test category: functionality test
  * Description: Display topology information of GT.
  *
  * SUBTEST: multigpu-query-topology
@@ -350,7 +343,6 @@ test_query_gt_list(int fd)
  * Category: Core
  * Mega feature: General Core features
  * Sub-category: MultiGPU
- * Test category: functionality test
  */
 static void
 test_query_gt_topology(int fd)
@@ -393,11 +385,9 @@ test_query_gt_topology(int fd)
 
 /**
  * SUBTEST: query-topology-l3-bank-mask
- * Test category: functionality test
  * Description: Check the value of the l3 bank mask
  *
  * SUBTEST: multigpu-query-topology-l3-bank-mask
- * Test category: functionality test
  * Description: Check the value of the l3 bank mask for all Xe devices.
  * Sub-category: MultiGPU
  */
@@ -465,7 +455,6 @@ test_query_gt_topology_l3_bank_mask(int fd)
 
 /**
  * SUBTEST: query-config
- * Test category: functionality test
  * Description: Display xe device id, revision and configuration.
  *
  * SUBTEST: multigpu-query-config
@@ -473,7 +462,6 @@ test_query_gt_topology_l3_bank_mask(int fd)
  * Category: Core
  * Mega feature: General Core features
  * Sub-category: MultiGPU
- * Test category: functionality test
  */
 static void
 test_query_config(int fd)
@@ -521,7 +509,6 @@ test_query_config(int fd)
 
 /**
  * SUBTEST: query-hwconfig
- * Test category: functionality test
  * Description: Display hardware configuration of xe device.
  *
  * SUBTEST: multigpu-query-hwconfig
@@ -529,7 +516,6 @@ test_query_config(int fd)
  * Category: Core
  * Sub-category: MultiGPU
  * Mega feature: General Core features
- * Test category: functionality test
  */
 static void
 test_query_hwconfig(int fd)
@@ -915,14 +901,12 @@ test_query_uc_fw_version(int fd, uint32_t uc_type)
 
 /**
  * SUBTEST: query-uc-fw-version-guc
- * Test category: functionality test
  * Description: Display the GuC firmware submission version
  *
  * SUBTEST: multigpu-query-uc-fw-version-guc
  * Description: Display GuC firmware submission version for all Xe devices.
  * Mega feature: General Core features
  * Sub-category: MultiGPU
- * Test category: functionality test
  */
 static void
 test_query_uc_fw_version_guc(int fd)
@@ -932,14 +916,12 @@ test_query_uc_fw_version_guc(int fd)
 
 /**
  * SUBTEST: query-invalid-uc-fw-version-mbz
- * Test category: functionality test
  * Description: Check query with invalid arguments returns expected error code.
  *
  * SUBTEST: multigpu-query-invalid-uc-fw-version-mbz
  * Description: Check query with invalid arguments for all Xe devices.
  * Mega feature: General Core features
  * Sub-category: MultiGPU
- * Test category: functionality test
  */
 static void
 test_query_uc_fw_version_invalid_mbz(int fd)
@@ -982,13 +964,11 @@ test_query_uc_fw_version_invalid_mbz(int fd)
 
 /**
  * SUBTEST: query-uc-fw-version-huc
- * Test category: functionality test
  * Description: Display the HuC firmware version
  *
  * SUBTEST: multigpu-query-uc-fw-version-huc
  * Description: Display HuC firmware version for all Xe devices.
  * Sub-category: MultiGPU
- * Test category: functionality test
  */
 static void
 test_query_uc_fw_version_huc(int fd)
-- 
2.34.1

