Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC4AC5478C
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 09:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A86110E17D;
	Fri,  1 Mar 2024 09:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mI+FFmHX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F8310E1D0
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 09:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709284175; x=1740820175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cEfL8L0qRJ/hn8L9p3i9PKf8sxjNfIk14E/3geBQv7g=;
 b=mI+FFmHXQxVLdfiiw6Pvf8HZH6beYj16AyTPILF0QQLmE+JuAFfHaXjn
 /73VmVLPOnLw5YYJgPTaVl7Cjr4q3HKFEyJ2uvzrAjSM7EcZCRpAf1l9h
 k0LWZt6l8Rrl65NRf1rbdMVbuMAuQDlEnwzt1BRJwEUEGGgxLTScfaiBb
 7zHkmh4SGMusgR9QZE4H6cIP1CdesyHAnHfF0tPTgupO9TLI8UQhlsf5s
 COeqQ4bK0zc5VVBs2+d6oaRucISZkep6LusoQx36mlbKe3EtlBbWcQWFq
 ynUPhviE/Caa3InXYoEYrtK20mY9nyWyrVTv51IGUtoruiP+IIkX7DHl+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3985830"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="3985830"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 01:09:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="8542441"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 01:09:31 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t v2 4/5] tests/intel: Documentation refactoring part 4
Date: Fri,  1 Mar 2024 09:08:43 +0000
Message-Id: <20240301090844.671493-5-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301090844.671493-1-katarzyna.piecielska@intel.com>
References: <20240301090844.671493-1-katarzyna.piecielska@intel.com>
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

Unify documentation for Intel i915 tests that we have by moving
common parts to be available for all tests.

v2: fix checkpatch warning

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
---
 tests/intel/gem_flink_basic.c   |  35 ++-----
 tests/intel/gem_linear_blits.c  |  23 ++---
 tests/intel/gem_lmem_swapping.c | 101 +-----------------
 tests/intel/gem_madvise.c       |  29 +++---
 tests/intel/gem_mmap_gtt.c      | 175 ++------------------------------
 tests/intel/gem_mmap_offset.c   |  75 ++------------
 tests/intel/gem_mmap_wc.c       |  43 +-------
 tests/intel/gem_ppgtt.c         |  16 +--
 tests/intel/gem_pxp.c           |  24 +----
 tests/intel/gem_ringfill.c      |  30 ++----
 tests/intel/gem_shrink.c        |   8 +-
 tests/intel/gem_softpin.c       | 134 ++----------------------
 tests/intel/gem_spin_batch.c    |  60 +----------
 tests/intel/gem_sync.c          |  86 ++--------------
 14 files changed, 79 insertions(+), 760 deletions(-)

diff --git a/tests/intel/gem_flink_basic.c b/tests/intel/gem_flink_basic.c
index e70cab4d1..85cd78a46 100644
--- a/tests/intel/gem_flink_basic.c
+++ b/tests/intel/gem_flink_basic.c
@@ -40,52 +40,29 @@
 #include "igt_types.h"
 /**
  * TEST: gem flink basic
- * Description: Tests for flink - a way to export a gem object by name
- *
- * SUBTEST: bad-flink
  * Category: Desktop client
- * Description: Verify that GEM_FLINK ioctl with invalid gem object fails.
+ * Description: Tests for flink - a way to export a gem object by name
  * Feature: xorg_dri2
  * Functionality: buffer management
- * Run type: BAT
  * Sub-category: DRM
  * Test category: GEM_Legacy
+ * Run type: BAT
+ *
+ * SUBTEST: bad-flink
+ * Description: Verify that GEM_FLINK ioctl with invalid gem object fails.
  *
  * SUBTEST: bad-open
- * Category: Desktop client
  * Description: Verify that GEM_OPEN ioctl with invalid flink name fails.
- * Feature: xorg_dri2
- * Functionality: buffer management
- * Run type: BAT
- * Sub-category: DRM
- * Test category: GEM_Legacy
  *
  * SUBTEST: basic
- * Category: Desktop client
  * Description: Check if gem object can be exported to global namespace and then opened.
- * Feature: xorg_dri2
- * Functionality: buffer management
- * Run type: BAT
- * Sub-category: DRM
- * Test category: GEM_Legacy
  *
  * SUBTEST: double-flink
- * Category: Desktop client
  * Description: Tests that multiple flinks for the same gem object share the same name.
- * Feature: xorg_dri2
- * Functionality: buffer management
- * Run type: BAT
- * Sub-category: DRM
- * Test category: GEM_Legacy
  *
  * SUBTEST: flink-lifetime
- * Category: Desktop client
  * Description: Tests flink lifetime by referencing from multiple descriptors.
- * Feature: xorg_dri2
- * Functionality: buffer management
- * Run type: BAT
- * Sub-category: DRM
- * Test category: GEM_Legacy
+ *
  */
 
 IGT_TEST_DESCRIPTION("Tests for flink - a way to export a gem object by name");
diff --git a/tests/intel/gem_linear_blits.c b/tests/intel/gem_linear_blits.c
index cc28e43fe..64f220cb3 100644
--- a/tests/intel/gem_linear_blits.c
+++ b/tests/intel/gem_linear_blits.c
@@ -51,34 +51,23 @@
 #include "intel_blt.h"
 /**
  * TEST: gem linear blits
+ * Category: Infrastructure
  * Description: Test doing many blits with a working set larger than the aperture size.
+ * Feature: blitter
+ * Functionality: blitter
+ * Sub-category: CMD submission
+ * Test category: GEM_Legacy
+ * Run type: FULL
  *
  * SUBTEST: basic
- * Category: Infrastructure
  * Description: Basic blitter functionality check with 2 buffers
- * Feature: blitter
- * Functionality: command submission
  * Run type: BAT
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: interruptible
- * Category: Infrastructure
  * Description: Test with interrupts in between the parent process
- * Feature: blitter
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: normal
- * Category: Infrastructure
  * Description: The intent is to push beyond the working GTT size to force the driver to rebind the buffers
- * Feature: blitter
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  */
 
 IGT_TEST_DESCRIPTION("Test doing many blits with a working set larger than the"
diff --git a/tests/intel/gem_lmem_swapping.c b/tests/intel/gem_lmem_swapping.c
index 381510f1a..451d55423 100644
--- a/tests/intel/gem_lmem_swapping.c
+++ b/tests/intel/gem_lmem_swapping.c
@@ -26,170 +26,79 @@
 #include "intel_mocs.h"
 /**
  * TEST: gem lmem swapping
- * Description: Exercise local memory swapping.
- *
- * SUBTEST: basic
  * Category: Server
- * Description: Exercise local memory swapping to system memory
+ * Description: Exercise local memory swapping.
  * Feature: local_memory
  * Functionality: buffer management
- * Run type: BAT
  * Sub-category: i915
  * Test category: GEM_Legacy
  *
+ * SUBTEST: basic
+ * Description: Exercise local memory swapping to system memory
+ * Run type: BAT
+ *
  * SUBTEST: heavy-multi
- * Category: Server
  * Description: Exercise local memory swapping to system memory
- * Feature: local_memory
- * Functionality: buffer management
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: heavy-random
- * Category: Server
  * Description: Exercise local memory swapping to system memory
- * Feature: local_memory
- * Functionality: buffer management
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: heavy-verify-multi
- * Category: Server
  * Description: Exercise local memory swapping to system memory
- * Feature: local_memory
- * Functionality: buffer management
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: heavy-verify-multi-ccs
  * Description: Exercise local memory swapping to system memory
- * Feature: local_memory
- * Run type: FULL
  *
  * SUBTEST: heavy-verify-random
- * Category: Server
  * Description: Exercise local memory swapping to system memory
- * Feature: local_memory
- * Functionality: buffer management
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: heavy-verify-random-ccs
  * Description: Exercise local memory swapping to system memory
- * Feature: local_memory
- * Run type: FULL
  *
  * SUBTEST: massive
  * Description: Exercise local memory swapping to system memory
- * Feature: local_memory
- * Run type: FULL
- * Test category: GEM_Legacy
  *
  * SUBTEST: massive-random
  * Description: Exercise local memory swapping to system memory
- * Feature: local_memory
- * Run type: FULL
- * Test category: GEM_Legacy
  *
  * SUBTEST: parallel-multi
- * Category: Server
  * Description: Exercise local memory swapping to system memory
- * Feature: local_memory
- * Functionality: buffer management
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: parallel-random
- * Category: Server
  * Description: Exercise local memory swapping to system memory
- * Feature: local_memory
- * Functionality: buffer management
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: parallel-random-engines
- * Category: Server
  * Description: Exercise local memory swapping to system memory
- * Feature: local_memory
- * Functionality: buffer management
  * Run type: BAT
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: parallel-random-verify
- * Category: Server
  * Description: Exercise local memory swapping to system memory
- * Feature: local_memory
- * Functionality: buffer management
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: parallel-random-verify-ccs
  * Description: Exercise local memory swapping to system memory
- * Feature: local_memory
- * Run type: FULL
  *
  * SUBTEST: random
- * Category: Server
  * Description: Exercise local memory swapping to system memory
- * Feature: local_memory
- * Functionality: buffer management
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: random-engines
- * Category: Server
  * Description: Exercise local memory swapping to system memory
- * Feature: local_memory
- * Functionality: buffer management
  * Run type: BAT
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: smem-oom
- * Category: Server
  * Description: Exercise local memory swapping during exhausting system memory
- * Feature: local_memory
- * Functionality: buffer management
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: verify
- * Category: Server
  * Description: Exercise local memory swapping to system memory
- * Feature: local_memory
- * Functionality: buffer management
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: verify-ccs
  * Description: Exercise local memory swapping to system memory
- * Feature: local_memory
- * Run type: FULL
  *
  * SUBTEST: verify-random
- * Category: Server
  * Description: Exercise local memory swapping to system memory
- * Feature: local_memory
- * Functionality: buffer management
  * Run type: BAT
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: verify-random-ccs
  * Description: Exercise local memory swapping to system memory
- * Feature: local_memory
- * Run type: FULL
  */
 
 IGT_TEST_DESCRIPTION("Exercise local memory swapping.");
diff --git a/tests/intel/gem_madvise.c b/tests/intel/gem_madvise.c
index 06b3ddf32..b443d16ae 100644
--- a/tests/intel/gem_madvise.c
+++ b/tests/intel/gem_madvise.c
@@ -40,35 +40,30 @@
 #include "i915/gem_create.h"
 /**
  * TEST: gem madvise
- * Description: Checks that the kernel reports EFAULT when trying to use purged bo.
- * Run type: FULL
- *
- * SUBTEST: dontneed-after-mmap
  * Category: Desktop client
- * Description:
- *   Check signal for Segmentation Fault and bus error after obtaining a purgeable object and
- *   calling for sighandler.
+ * Description: Checks that the kernel reports EFAULT when trying to use purged bo.
  * Feature: caching, mapping
  * Functionality: buffer management
  * Sub-category: i915
  * Test category: GEM_Legacy
+ * Run type: FULL
+ *
+ * SUBTEST: dontneed-after-mmap
+ * Description: Check signal for Segmentation Fault and bus error after
+ *		obtaining a purgeable object and calling for sighandler.
  *
  * SUBTEST: dontneed-before-exec
- * Description: Check if EXECBUFFER2 reports EFAULT when trying to submit purged bo for GPU.
+ * Description: Check if EXECBUFFER2 reports EFAULT when trying to submit
+ *		purged bo for GPU.
  * Feature: caching, gtt, mapping
  *
  * SUBTEST: dontneed-before-mmap
- * Category: Desktop client
- * Description:
- *   Check signal for Segmentation Fault and bus error before obtaining a purgeable object and
- *   calling for sighandler.
- * Feature: caching, mapping
- * Functionality: buffer management
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Description: Check signal for Segmentation Fault and bus error before
+ *		obtaining a purgeable object and calling for sighandler.
  *
  * SUBTEST: dontneed-before-pwrite
- * Description: Check if PWRITE reports EFAULT when trying to use purged bo for write operation.
+ * Description: Check if PWRITE reports EFAULT when trying to use purged bo
+ *		for write operation.
  * Feature: caching, gtt, mapping
  */
 
diff --git a/tests/intel/gem_mmap_gtt.c b/tests/intel/gem_mmap_gtt.c
index 9c06785d2..9aecd08ce 100644
--- a/tests/intel/gem_mmap_gtt.c
+++ b/tests/intel/gem_mmap_gtt.c
@@ -49,490 +49,331 @@
 /**
  * TEST: gem mmap gtt
  * Description: Ensure that all operations around MMAP_GTT ioctl works.
+ * Feature: gtt
+ * Run type: FULL
  *
  * SUBTEST: bad-object
  * Description: Verify mapping to invalid gem objects fails.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: basic
  * Description: Basic checks of GEM_MMAP_GTT ioctl.
- * Feature: gtt
- * Run type: BAT
  *
  * SUBTEST: basic-copy
  * Description: Test copy between two GTT mmappings.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: basic-read
  * Description: Test to read content from GTT mmapped object.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: basic-read-write
  * Description: Check basic read->write order of a GTT mmapped bo.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: basic-read-write-distinct
  * Description: Check distinct read->write order of a GTT mmapped bo.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: basic-short
  * Description: Test mmaping less than the full object.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: basic-small-bo
- * Description: Check mmap access to a small buffer object by CPU directly and through GTT in sequence.
- * Feature: gtt
- * Run type: FULL
+ * Description: Check mmap access to a small buffer object by CPU directly and
+ *		through GTT in sequence.
  *
  * SUBTEST: basic-small-bo-tiledX
- * Description:
- *   Check mmap access to a small X-tiled buffer object by CPU directly and through GTT in
- *   sequence.
- * Feature: gtt
- * Run type: FULL
+ * Description: Check mmap access to a small X-tiled buffer object by CPU
+ *		directly and through GTT in sequence.
  *
  * SUBTEST: basic-small-bo-tiledY
- * Description:
- *   Check mmap access to a small Y-tiled buffer object by CPU directly and through GTT in
+ * Description: Check mmap access to a small Y-tiled buffer object by CPU
+ *		directly and through GTT in
  *   sequence.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: basic-small-copy
  * Description: Check page by page copying between two GTT mmapped normal-small bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: basic-small-copy-XY
  * Description: Check page by page copying between two GTT mmapped tiled-small bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: basic-small-copy-odd
  * Description: Check page by page copying between two GTT mmapped odd tiled-small bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: basic-wc
  * Description:
  *   Check the performance of WC writes with WC reads of GTT and WC writes of GTT with WB writes of.
  *   CPU.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: basic-write
  * Description: Test to write content to GTT mmapped object.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: basic-write-cpu-read-gtt
  * Description: Check coherency between GTT and CPU mmappings with LLC.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: basic-write-gtt
  * Description: Test creates a prefault object into GTT and writes into it from another GTT mmapped.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: basic-write-read
  * Description: Check basic write->read order of a GTT mmapped bo.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: basic-write-read-distinct
  * Description: Check distinct write->read order of a GTT mmapped bo.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: big-bo
  * Description: Check mmap access to a big buffer object by CPU directly and through GTT in sequence.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: big-bo-tiledX
  * Description: Check mmap access to a big X-tiled buffer object by CPU directly and through GTT in sequence.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: big-bo-tiledY
  * Description: Check mmap access to a big Y-tiled buffer object by CPU directly and through GTT in sequence.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: big-copy
  * Description: Check page by page copying between two GTT mmapped normal-big bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: big-copy-XY
  * Description: Check page by page copying between two GTT mmapped tiled-big bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: big-copy-odd
  * Description: Check page by page copying between two GTT mmapped odd tiled-big bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: clflush
  * Description: Check the userspace clflushing of the GTT mmap.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: close-race
  * Description:
  *   Test to check that a few threads opening and closing handles cause explosion in other threads
  *   in the process of mmaping that handle.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: coherency
  * Description: Check whether a write through the GTT is immediately visible to the CPU.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: cpuset-basic-small-copy
  * Description:
  *   Add forked contention with lighter variant (single cpu) and check page by page copying
  *   between two GTT mmapped normal-small bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: cpuset-basic-small-copy-XY
  * Description:
  *   Add forked contention with lighter variant (single cpu) and check page by page copying
  *   between two GTT mmapped tiled-small bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: cpuset-basic-small-copy-odd
  * Description:
  *   Add forked contention with lighter variant (single cpu) and check page by page copying
  *   between two GTT mmapped odd tiled-small bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: cpuset-big-copy
  * Description:
  *   Add forked contention with lighter variant (single cpu) and check page by page copying
  *   between two GTT mmapped normal-big bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: cpuset-big-copy-XY
  * Description:
  *   Add forked contention with lighter variant (single cpu) and check page by page copying
  *   between two GTT mmapped tiled-big bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: cpuset-big-copy-odd
  * Description:
  *   Add forked contention with lighter variant (single cpu) and check page by page copying
  *   between two GTT mmapped odd tiled-big bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: cpuset-huge-copy
  * Description:
  *   Add forked contention with lighter variant (single cpu) and check page by page copying
  *   between two GTT mmapped normal-huge bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: cpuset-huge-copy-XY
  * Description:
  *   Add forked contention with lighter variant (single cpu) and check page by page copying
  *   between two GTT mmapped tiled-huge bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: cpuset-huge-copy-odd
  * Description:
  *   Add forked contention with lighter variant (single cpu) and check page by page copying
  *   between two GTT mmapped odd tiled-huge bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: cpuset-medium-copy
  * Description:
  *   Add forked contention with lighter variant (single cpu) and check page by page copying
  *   between two GTT mmapped normal-medium bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: cpuset-medium-copy-XY
  * Description:
  *   Add forked contention with lighter variant (single cpu) and check page by page copying
  *   between two GTT mmapped tiled-medium bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: cpuset-medium-copy-odd
  * Description:
  *   Add forked contention with lighter variant (single cpu) and check page by page copying
  *   between two GTT mmapped odd tiled-medium bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: cpuset-swap-copy
  * Description:
  *   Add forked contention with lighter variant (single cpu) and check page by page copying
  *   between two GTT mmapped normal-huge bo's larger than physical memory and resulting in
  *   thrashing of swap space.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: cpuset-swap-copy-XY
  * Description:
  *   Add forked contention with lighter variant (single cpu) and check page by page copying
  *   between two GTT mmapped tiled-huge bo's larger than physical memory and resulting in
  *   thrashing of swap space.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: cpuset-swap-copy-odd
  * Description:
  *   Add forked contention with lighter variant (single cpu) and check page by page copying
  *   between two GTT mmapped odd tiled-huge bo's larger than physical memory and resulting in
  *   thrashing of swap space.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: fault-concurrent
  * Description: Excercise concurrent pagefaulting of a GTT mmaped bo.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: fault-concurrent-X
  * Description: Excercise concurrent pagefaulting of a X-tiled GTT mmaped bo.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: fault-concurrent-Y
  * Description: Excercise concurrent pagefaulting of a Y-tiled GTT mmaped bo.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: flink-race
  * Description:
  *   Test to check that a few threads opening and closing flink handles cause explosion in other
  *   threads in the process of mmaping that handle.
  * Feature: gtt, xorg_dri2
- * Run type: FULL
  *
  * SUBTEST: forked-basic-small-copy
  * Description:
  *   Add forked contention and check page by page copying between two GTT mmapped normal-small
  *   bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: forked-basic-small-copy-XY
  * Description:
  *   Add forked contention and check page by page copying between two GTT mmapped tiled-small
  *   bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: forked-basic-small-copy-odd
  * Description:
  *   Add forked contention and check page by page copying between two GTT mmapped odd tiled-small
  *   bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: forked-big-copy
  * Description:
  *   Add forked contention and check page by page copying between two GTT mmapped normal-big
  *   bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: forked-big-copy-XY
  * Description: Add forked contention and check page by page copying between two GTT mmapped tiled-big bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: forked-big-copy-odd
  * Description:
  *   Add forked contention and check page by page copying between two GTT mmapped odd tiled-big
  *   bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: forked-huge-copy
  * Description:
  *   Add forked contention and check page by page copying between two GTT mmapped normal-huge
  *   bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: forked-huge-copy-XY
  * Description:
  *   Add forked contention and check page by page copying between two GTT mmapped tiled-huge
  *   bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: forked-huge-copy-odd
  * Description:
  *   Add forked contention and check page by page copying between two GTT mmapped odd tiled-huge
  *   bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: forked-medium-copy
  * Description:
  *   Add forked contention and check page by page copying between two GTT mmapped normal-medium
  *   bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: forked-medium-copy-XY
  * Description:
  *   Add forked contention and check page by page copying between two GTT mmapped tiled-medium
  *   bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: forked-medium-copy-odd
  * Description:
  *   Add forked contention and check page by page copying between two GTT mmapped odd
  *   tiled-medium bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: forked-swap-copy
  * Description:
  *   Add forked contention and check page by page copying between two GTT mmapped normal-huge
  *   bo's larger than physical memory and resulting in thrashing of swap space.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: forked-swap-copy-XY
  * Description:
  *   Add forked contention and check page by page copying between two GTT mmapped tiled-huge bo's
  *   larger than physical memory and resulting in thrashing of swap space.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: forked-swap-copy-odd
  * Description:
  *   Add forked contention and check page by page copying between two GTT mmapped odd tiled-huge
  *   bo's larger than physical memory and resulting in thrashing of swap space.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: hang
  * Description: Check read/writes across a GPU reset.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: hang-busy
  * Description: Exercise the GTT mmap revocation for a reset on a busy object.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: hang-user
  * Description: Mix a busy hang with GTT and userptr.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: huge-bo
  * Description: Check mmap access to a huge buffer object by CPU directly and through GTT in sequence.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: huge-bo-tiledX
  * Description: Check mmap access to a huge X-tiled buffer object by CPU directly and through GTT in sequence.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: huge-bo-tiledY
  * Description: Check mmap access to a huge Y-tiled buffer object by CPU directly and through GTT in sequence.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: huge-copy
  * Description: Check page by page copying between two GTT mmapped normal-huge bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: huge-copy-XY
  * Description: Check page by page copying between two GTT mmapped tiled-huge bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: huge-copy-odd
  * Description: Check page by page copying between two GTT mmapped odd tiled-huge bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: isolation
  * Description:
  *   Test mmap_offset lifetime, closing the object on another file should not affect the local
  *   mmap_offset.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: medium-copy
  * Description: Check page by page copying between two GTT mmapped normal-medium bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: medium-copy-XY
  * Description: Check page by page copying between two GTT mmapped tiled-medium bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: medium-copy-odd
  * Description: Check page by page copying between two GTT mmapped odd tiled-medium bo's.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: pf-nonblock
  * Description: Check that the initial pagefault is non-blocking.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: ptrace
  * Description: Inspect a GTT mmap using ptrace().
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: swap-copy
  * Description:
  *   Check page by page copying between two GTT mmapped normal-huge bo's larger than physical
  *   memory and resulting in thrashing of swap space.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: swap-copy-XY
  * Description:
  *   Check page by page copying between two GTT mmapped tiled-huge bo's larger than physical
  *   memory and resulting in thrashing of swap space.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: swap-copy-odd
  * Description:
  *   Check page by page copying between two GTT mmapped odd tiled-huge bo's larger than physical
  *   memory and resulting in thrashing of swap space.
- * Feature: gtt
- * Run type: FULL
  *
  * SUBTEST: zero-extend
  * Description: Test MMAP_GTT extension validity.
- * Feature: gtt
- * Run type: FULL
  */
 
 #ifndef PAGE_SIZE
diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/gem_mmap_offset.c
index bc801cd04..b069b80f6 100644
--- a/tests/intel/gem_mmap_offset.c
+++ b/tests/intel/gem_mmap_offset.c
@@ -40,90 +40,27 @@
 /**
  * TEST: gem mmap offset
  * Description: Basic MMAP_OFFSET IOCTL tests for mem regions
- * Run type: FULL
- * Test category: GEM_Legacy
- *
- * SUBTEST: bad-extensions
  * Category: Infrastructure
  * Feature: mapping
- * Functionality: memory management
- * Sub-category: i915
+ * Functionality: mapping
+ * Sub-category: Memory management
+ * Test category: GEM_Legacy
+ * Run type: FULL
  *
+ * SUBTEST: bad-extensions
  * SUBTEST: bad-flags
- * Category: Infrastructure
- * Feature: mapping
- * Functionality: memory management
- * Sub-category: i915
- *
  * SUBTEST: bad-object
- * Category: Infrastructure
- * Description: Verify mapping to invalid gem objects won't be created
- * Feature: mapping
- * Functionality: memory management
- * Sub-category: i915
- *
  * SUBTEST: basic-uaf
- * Category: Infrastructure
- * Description: Check buffer object mapping persists after gem_close
- * Feature: mapping
- * Functionality: memory management
- * Sub-category: i915
- *
  * SUBTEST: blt-coherency
- * Category: Infrastructure
- * Feature: mapping
- * Functionality: memory management
- * Sub-category: i915
- *
  * SUBTEST: clear
- * Category: Infrastructure
- * Feature: mapping
- * Functionality: memory management
- * Sub-category: i915
- *
  * SUBTEST: close-race
- * Category: Infrastructure
- * Description: Check race between close and mmap offset between threads
- * Feature: mapping
- * Functionality: memory management
- * Sub-category: i915
- *
  * SUBTEST: isolation
- * Category: Infrastructure
- * Feature: mapping
- * Functionality: memory management
- * Sub-category: i915
- *
  * SUBTEST: oob-read
- * Category: Infrastructure
- * Description: Check for out-of-bound access in vm_access
- * Feature: mapping
- * Functionality: memory management
- * Sub-category: i915
- *
  * SUBTEST: open-flood
- * Category: Infrastructure
- * Feature: mapping
- * Functionality: memory management
- * Sub-category: i915
- *
  * SUBTEST: perf
- * Category: Infrastructure
- * Feature: mapping
- * Functionality: memory management
- * Sub-category: i915
- *
  * SUBTEST: pf-nonblock
- * Category: Infrastructure
- * Feature: mapping
- * Functionality: memory management
- * Sub-category: i915
- *
  * SUBTEST: ptrace
- * Category: Infrastructure
- * Feature: mapping
- * Functionality: memory management
- * Sub-category: i915
+ *
  */
 
 IGT_TEST_DESCRIPTION("Basic MMAP_OFFSET IOCTL tests for mem regions\n");
diff --git a/tests/intel/gem_mmap_wc.c b/tests/intel/gem_mmap_wc.c
index c56e8c353..a82d779f9 100644
--- a/tests/intel/gem_mmap_wc.c
+++ b/tests/intel/gem_mmap_wc.c
@@ -41,70 +41,31 @@
 #include "i915/gem_create.h"
 /**
  * TEST: gem mmap wc
+ * Feature: caching, mapping
  * Run type: FULL
  *
  * SUBTEST: bad-object
- * Feature: caching, mapping
- *
  * SUBTEST: bad-offset
- * Feature: caching, mapping
- *
  * SUBTEST: bad-size
- * Feature: caching, mapping
- *
  * SUBTEST: close
- * Feature: caching, mapping
- *
  * SUBTEST: coherency
- * Feature: caching, mapping
- *
  * SUBTEST: copy
- * Feature: caching, mapping
- *
  * SUBTEST: fault-concurrent
- * Feature: caching, mapping
- *
  * SUBTEST: invalid-flags
- * Feature: caching, mapping
- *
  * SUBTEST: pf-nonblock
- * Feature: caching, mapping
- *
  * SUBTEST: read
- * Feature: caching, mapping
- *
  * SUBTEST: read-write
- * Feature: caching, mapping
- *
  * SUBTEST: read-write-distinct
- * Feature: caching, mapping
- *
  * SUBTEST: set-cache-level
- * Feature: caching, mapping
- *
  * SUBTEST: write
- * Feature: caching, mapping
- *
  * SUBTEST: write-cpu-read-wc
- * Feature: caching, mapping
- *
  * SUBTEST: write-cpu-read-wc-unflushed
- * Feature: caching, mapping
- *
  * SUBTEST: write-gtt-read-wc
- * Feature: caching, gtt, mapping
- *
  * SUBTEST: write-prefaulted
- * Feature: caching, mapping
- *
  * SUBTEST: write-read
- * Feature: caching, mapping
- *
  * SUBTEST: write-read-distinct
- * Feature: caching, mapping
- *
  * SUBTEST: write-wc-read-gtt
- * Feature: caching, gtt, mapping
+ *
  */
 
 static int OBJECT_SIZE = 16*1024*1024;
diff --git a/tests/intel/gem_ppgtt.c b/tests/intel/gem_ppgtt.c
index b6081b1e9..c25bf5f88 100644
--- a/tests/intel/gem_ppgtt.c
+++ b/tests/intel/gem_ppgtt.c
@@ -41,30 +41,24 @@
 #include "igt_debugfs.h"
 /**
  * TEST: gem ppgtt
+ * Category: Desktop client
+ * Feature: mapping, xorg_dri2
+ * Functionality: buffer management
+ * Sub-category: Memory management
+ * Test category: GEM_Legacy
  * Run type: FULL
  *
  * SUBTEST: blt-vs-render-ctx0
- * Feature: mapping
  *
  * SUBTEST: blt-vs-render-ctxN
- * Feature: mapping
  *
  * SUBTEST: flink-and-close-vma-leak
- * Category: Desktop client
- * Feature: mapping, xorg_dri2
- * Functionality: buffer management
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: shrink-vs-evict-any
  * Description: Regression test to verify GTT eviction can't randomly fail due to object lock contention
- * Feature: mapping
- * Test category: GEM_Legacy
  *
  * SUBTEST: shrink-vs-evict-pinned
  * Description: Regression test to verify GTT eviction can't randomly fail due to object lock contention
- * Feature: mapping
- * Test category: GEM_Legacy
  */
 
 #define WIDTH 512
diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index 9cc6b9c2f..6a7f8e487 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -10,81 +10,63 @@
 /**
  * TEST: gem pxp
  * Description: Test PXP that manages protected content through arbitrated HW-PXP-session
+ * Feature: PXP
+ * Functionality: pxp
+ * Sub-category: Power management
  * Run type: FULL
  *
  * SUBTEST: create-protected-buffer
- * Feature: PXP
  *
  * SUBTEST: create-regular-buffer
  * Description: Verify protected buffer on supported hw:
- * Feature: PXP
  *
  * SUBTEST: create-regular-context-1
  * Description: Verify protected context on supported hw:
- * Feature: PXP
  *
  * SUBTEST: create-regular-context-2
- * Feature: PXP
  *
  * SUBTEST: create-valid-protected-context
- * Feature: PXP
  *
  * SUBTEST: display-protected-crc
  * Description: Test the display CRC
- * Feature: PXP
  *
  * SUBTEST: dmabuf-shared-protected-dst-is-context-refcounted
  * Feature: PXP, prime
  *
  * SUBTEST: fail-invalid-protected-context
- * Feature: PXP
  *
  * SUBTEST: hw-rejects-pxp-buffer
  * Description: Verify protected buffer on unsupported hw:
- * Feature: PXP
  *
  * SUBTEST: hw-rejects-pxp-context
  * Description: Verify protected context on unsupported hw:
- * Feature: PXP
  *
  * SUBTEST: protected-encrypted-src-copy-not-readible
- * Feature: PXP
  *
  * SUBTEST: protected-raw-src-copy-not-readible
- * Feature: PXP
  *
  * SUBTEST: regular-baseline-src-copy-readible
  * Description: Verify protected render operations:
- * Feature: PXP
  *
  * SUBTEST: reject-modify-context-protection-off-1
- * Feature: PXP
  *
  * SUBTEST: reject-modify-context-protection-off-2
- * Feature: PXP
  *
  * SUBTEST: reject-modify-context-protection-off-3
- * Feature: PXP
  *
  * SUBTEST: reject-modify-context-protection-on
  * Description: Verify protected context integrity:
- * Feature: PXP
  *
  * SUBTEST: verify-pxp-execution-after-suspend-resume
- * Feature: PXP
  *
  * SUBTEST: verify-pxp-key-change-after-suspend-resume
  * Description: Verify suspend-resume teardown management:
- * Feature: PXP
  *
  * SUBTEST: verify-pxp-stale-buf-execution
- * Feature: PXP
  *
  * SUBTEST: verify-pxp-stale-buf-optout-execution
- * Feature: PXP
  *
  * SUBTEST: verify-pxp-stale-ctx-execution
- * Feature: PXP
  */
 
 IGT_TEST_DESCRIPTION("Test PXP that manages protected content through arbitrated HW-PXP-session");
diff --git a/tests/intel/gem_ringfill.c b/tests/intel/gem_ringfill.c
index 66fbd27fa..0704ac1be 100644
--- a/tests/intel/gem_ringfill.c
+++ b/tests/intel/gem_ringfill.c
@@ -43,35 +43,34 @@
 #include <sys/ioctl.h>
 /**
  * TEST: gem ringfill
+ * Category: Infrastructure
  * Description:
  *   Exercise many tiny batchbuffer operations, in the hope of catching failure to manage the ring
  *   properly near full.
- *
- * SUBTEST: basic-all
- * Category: Infrastructure
- * Description: Basic check to fill the ring upto maximum on all engines simultaneously.
  * Feature: cmd_submission
  * Functionality: command submission
- * Run type: BAT
  * Sub-category: i915
  * Test category: GEM_Legacy
+ * Run type: FULL
+ *
+ * SUBTEST: basic-all
+ * Run type: BAT
+ * Description: Basic check to fill the ring up to maximum on all engines
+ *		simultaneously.
  *
  * SUBTEST: engines-S3
  * Description: Handle a full ring across suspend cycle.
  * Feature: cmd_submission, multitile
- * Run type: FULL
  *
  * SUBTEST: engines-S4
  * Description: Handle a full ring across hibernate cycle.
  * Feature: cmd_submission, multitile
- * Run type: FULL
  *
  * SUBTEST: engines-basic
  * Description:
  *   Basic check how the driver handles a full ring.
  *   Test spamming ring with contexts
  * Feature: cmd_submission, multitile
- * Run type: FULL
  * Test category: MultiTile
  *
  * SUBTEST: engines-bomb
@@ -79,51 +78,42 @@
  *   Fills the ring upto maximim parallely using fork with different fd's along with
  *   interruptions.
  * Feature: cmd_submission, multitile
- * Run type: FULL
  *
  * SUBTEST: engines-child
  * Description: Check to fill the ring parallely using fork.
  * Feature: cmd_submission, multitile
- * Run type: FULL
  *
  * SUBTEST: engines-fd
  * Description: Fills the ring upto maximim parallely using fork with different fd's.
  * Feature: cmd_submission, multitile
- * Run type: FULL
  *
  * SUBTEST: engines-forked
  * Description: Check to fill the ring parallely using fork.
  * Feature: cmd_submission, multitile
- * Run type: FULL
  *
  * SUBTEST: engines-hang
  * Description: Exercise many batchbuffer operations along with a hang batch until ring is full.
  * Feature: cmd_submission, multitile
- * Run type: FULL
  *
  * SUBTEST: engines-interruptible
  * Description:
  *   Exercise all potential injection sites by using igt_sigiter interface to repeat the
  *   ringfill testing.
  * Feature: cmd_submission, multitile
- * Run type: FULL
  *
  * SUBTEST: legacy-S3
  * Description: Handle a full ring across suspend cycle - on legacy ring.
  * Feature: cmd_submission, multitile
- * Run type: FULL
  *
  * SUBTEST: legacy-S4
  * Description: Handle a full ring across hibernate cycle - on legacy ring.
  * Feature: cmd_submission, multitile
- * Run type: FULL
  *
  * SUBTEST: legacy-basic
  * Description:
  *   Basic check how the driver handles a full ring - on legacy ring.
  *   Test spamming ring with contexts - legacy path
  * Feature: cmd_submission, multitile
- * Run type: FULL
  * Test category: MultiTile
  *
  * SUBTEST: legacy-bomb
@@ -131,36 +121,30 @@
  *   Fills the ring upto maximim parallely using fork with different fd's along with
  *   interruptions - on legacy ring.
  * Feature: cmd_submission, multitile
- * Run type: FULL
  *
  * SUBTEST: legacy-child
  * Description: Check to fill the ring parallely using fork - on legacy ring.
  * Feature: cmd_submission, multitile
- * Run type: FULL
  *
  * SUBTEST: legacy-fd
  * Description: Fills the ring upto maximim parallely using fork with different fd's - on legacy ring.
  * Feature: cmd_submission, multitile
- * Run type: FULL
  *
  * SUBTEST: legacy-forked
  * Description: Check to fill the ring parallely using fork - on legacy ring.
  * Feature: cmd_submission, multitile
- * Run type: FULL
  *
  * SUBTEST: legacy-hang
  * Description:
  *   Exercise many batchbuffer operations along with a hang batch until ring is full - on legacy
  *   ring.
  * Feature: cmd_submission, multitile
- * Run type: FULL
  *
  * SUBTEST: legacy-interruptible
  * Description:
  *   Exercise all potential injection sites by using igt_sigiter interface to repeat the
  *   ringfill testing - on legacy ring.
  * Feature: cmd_submission, multitile
- * Run type: FULL
  */
 
 #define INTERRUPTIBLE 0x1
diff --git a/tests/intel/gem_shrink.c b/tests/intel/gem_shrink.c
index 1f16f8a78..094881a15 100644
--- a/tests/intel/gem_shrink.c
+++ b/tests/intel/gem_shrink.c
@@ -36,6 +36,10 @@
 /**
  * TEST: gem shrink
  * Feature: mapping
+ * Category: Desktop client
+ * Functionality: buffer management
+ * Sub-category: CMD submission
+ * Test category: GEM_Legacy
  * Run type: FULL
  *
  * SUBTEST: execbuf1
@@ -139,10 +143,6 @@
  * SUBTEST: pwrite-userptr-dirty
  *
  * SUBTEST: reclaim
- * Category: Desktop client
- * Functionality: buffer management
- * Sub-category: i915
- * Test category: GEM_Legacy
  */
 
 #ifndef MADV_FREE
diff --git a/tests/intel/gem_softpin.c b/tests/intel/gem_softpin.c
index f5f0ba257..f06e58be9 100644
--- a/tests/intel/gem_softpin.c
+++ b/tests/intel/gem_softpin.c
@@ -33,219 +33,97 @@
 #include "intel_allocator.h"
 /**
  * TEST: gem softpin
+ * Category: Infrastructure
  * Description:
  *   Tests softpin feature with normal usage, invalid inputs scenarios and couple of eviction
  *   tests which copy buffers between CPU and GPU.
+ * Feature: mapping
+ * Functionality: softpin
+ * Sub-category: CMD submission
+ * Test category: GEM_Legacy
+ * Run type: FULL
  *
  * SUBTEST: 32b-excludes-last-page
- * Category: Infrastructure
  * Description: Check the last 32b page is excluded.
- * Feature: mapping
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: allocator-basic
- * Category: Infrastructure
  * Description: Check that we can place objects at start/end of the GTT using the allocator.
- * Feature: mapping
- * Functionality: command submission
  * Run type: BAT
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: allocator-basic-reserve
- * Category: Infrastructure
  * Description: Check that if we can reserve a space for an object starting from a given offset.
- * Feature: mapping
- * Functionality: command submission
  * Run type: BAT
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: allocator-evict
- * Category: Infrastructure
  * Description: Exercise eviction with softpinning.
- * Feature: mapping
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: allocator-fork
- * Category: Infrastructure
  * Description: Check if multiple processes can use allocator.
- * Feature: mapping
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: allocator-nopin
- * Category: Infrastructure
  * Description: Check that we can combine manual placement with automatic GTT placement.
- * Feature: mapping
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: allocator-nopin-reserve
- * Category: Infrastructure
  * Description:
  *   Check that we can combine manual placement with automatic GTT placement and
  *   reserves/unreserves space for objects.
- * Feature: mapping
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: evict-active
- * Category: Infrastructure
  * Description: Check eviction with active bo.
- * Feature: mapping
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: evict-active-interruptible
- * Category: Infrastructure
  * Description: Check eviction with active bo with interrupts.
- * Feature: mapping
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: evict-hang
  * Description: Check eviction of softpinned bo with hung batch.
- * Feature: mapping
- * Run type: FULL
  *
  * SUBTEST: evict-prime
  * Description: Check eviction of vma on importing prime fd in reopened drm fds
- * Feature: mapping
- * Run type: FULL
- * Test category: GEM_Legacy
  *
  * SUBTEST: evict-prime-sanity-check
  * Description: Check eviction of vma on importing prime fd in reopened drm fd in single thread
- * Feature: mapping
- * Run type: FULL
- * Test category: GEM_Legacy
  *
  * SUBTEST: evict-single-offset
- * Category: Infrastructure
  * Description: Use same offset for all engines and for different handles.
- * Feature: mapping
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: evict-snoop
  * Description: Check eviction against snooping.
- * Feature: mapping
- * Run type: FULL
  *
  * SUBTEST: evict-snoop-interruptible
  * Description: Check eviction against snooping with interrupts.
- * Feature: mapping
- * Run type: FULL
  *
  * SUBTEST: full
- * Category: Infrastructure
  * Description: Check the total occupancy by using pad-to-size to fill the entire GTT.
- * Feature: mapping
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: invalid
- * Category: Infrastructure
  * Description: Check that invalid inputs are handled correctly.
- * Feature: mapping
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: noreloc
- * Category: Infrastructure
  * Description: Check that noreloc support works.
- * Feature: mapping
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: noreloc-S3
  * Description: Check noreloc survives after suspend to RAM/resume cycle.
- * Feature: mapping
- * Run type: FULL
  *
  * SUBTEST: noreloc-S4
  * Description: Check noreloc survives after suspend to disk/resume cycle.
- * Feature: mapping
- * Run type: FULL
  *
  * SUBTEST: noreloc-interruptible
- * Category: Infrastructure
  * Description: Check noreloc support with interruptible.
- * Feature: mapping
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: overlap
- * Category: Infrastructure
  * Description: Check all the possible pages aligned overlaps.
- * Feature: mapping
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: reverse
- * Category: Infrastructure
  * Description: Check that if the user demands the vma will be swapped.
- * Feature: mapping
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: safe-alignment
- * Category: Infrastructure
  * Description: Check start offset and alignment detection.
- * Feature: mapping
- * Functionality: command submission
- * Run type: BAT
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: softpin
- * Category: Infrastructure
  * Description: Check softpinning of a gem buffer object.
- * Feature: mapping
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: zero
- * Category: Infrastructure
  * Description: Check full placement control under full-ppGTT.
- * Feature: mapping
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  */
 
 IGT_TEST_DESCRIPTION("Tests softpin feature with normal usage, invalid inputs"
diff --git a/tests/intel/gem_spin_batch.c b/tests/intel/gem_spin_batch.c
index ec1458e35..2e617289c 100644
--- a/tests/intel/gem_spin_batch.c
+++ b/tests/intel/gem_spin_batch.c
@@ -27,80 +27,26 @@
 #include "igt.h"
 /**
  * TEST: gem spin batch
- * Run type: FULL
  * Test category: GEM_Legacy
- *
- * SUBTEST: engines
  * Category: Infrastructure
  * Feature: context, igt_core
  * Functionality: dummy workload
  * Sub-category: IGT Lib
+ * Run type: FULL
  *
+ * SUBTEST: engines
  * SUBTEST: legacy
- * Category: Infrastructure
- * Feature: context, igt_core
- * Functionality: dummy workload
- * Sub-category: IGT Lib
- *
  * SUBTEST: legacy-resubmit
- * Category: Infrastructure
- * Feature: context, igt_core
- * Functionality: dummy workload
- * Sub-category: IGT Lib
- *
  * SUBTEST: legacy-resubmit-new
- * Category: Infrastructure
- * Feature: context, igt_core, multictx
- * Functionality: dummy workload
- * Sub-category: IGT Lib
- *
  * SUBTEST: resubmit
- * Category: Infrastructure
- * Feature: context, igt_core
- * Functionality: dummy workload
- * Sub-category: IGT Lib
- *
  * SUBTEST: resubmit-all
- * Category: Infrastructure
- * Feature: context, igt_core, multictx
- * Functionality: dummy workload
- * Sub-category: IGT Lib
- *
  * SUBTEST: resubmit-new
- * Category: Infrastructure
- * Feature: context, igt_core, multictx
- * Functionality: dummy workload
- * Sub-category: IGT Lib
- *
  * SUBTEST: resubmit-new-all
- * Category: Infrastructure
- * Feature: context, igt_core, multictx
- * Functionality: dummy workload
- * Sub-category: IGT Lib
- *
  * SUBTEST: spin-all
- * Category: Infrastructure
- * Feature: igt_core, multictx
- * Functionality: dummy workload
- * Sub-category: IGT Lib
- *
  * SUBTEST: spin-all-new
- * Category: Infrastructure
- * Feature: igt_core, multictx
- * Functionality: dummy workload
- * Sub-category: IGT Lib
- *
  * SUBTEST: spin-each
- * Category: Infrastructure
- * Feature: igt_core, multictx
- * Functionality: dummy workload
- * Sub-category: IGT Lib
- *
  * SUBTEST: user-each
- * Category: Infrastructure
- * Feature: igt_core, multictx
- * Functionality: dummy workload
- * Sub-category: IGT Lib
+ *
  */
 
 #define MAX_ERROR 5 /* % */
diff --git a/tests/intel/gem_sync.c b/tests/intel/gem_sync.c
index f98d4364c..d3de2e77e 100644
--- a/tests/intel/gem_sync.c
+++ b/tests/intel/gem_sync.c
@@ -34,43 +34,37 @@
 #include "igt_sysfs.h"
 /**
  * TEST: gem sync
+ * Category: Infrastructure
  * Description: Basic check of ring<->ring write synchronisation.
+ * Feature: synchronization
+ * Functionality: semaphore
+ * Sub-category: i915
+ * Test category: GEM_Legacy
+ * Run type: FULL
  *
  * SUBTEST: active
  * Description: Exercise waiting while keeping the GPU busy on each engine.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: active-each
  * Description: Exercise waiting while keeping the GPU busy.
  * Feature: multitile, synchronization
- * Run type: FULL
  *
  * SUBTEST: active-wakeup
  * Description: Measure wakeup latency while also scheduling the next batch on each engine.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: active-wakeup-each
  * Description: Measure wakeup latency while also scheduling the next batch.
  * Feature: multitile, synchronization
- * Run type: FULL
  *
  * SUBTEST: basic-all
- * Category: Infrastructure
  * Description: Basic test to wait upon a batch on all rings.
- * Feature: synchronization
- * Functionality: semaphore
  * Run type: BAT
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: basic-each
  * Description:
  *   Check synchronisation of ring.
  *   Exercise all physical engine selection and legacy rings
  * Feature: multitile, synchronization
- * Functionality: semaphore
  * Run type: BAT
  * Test category: MultiTile
  *
@@ -79,139 +73,91 @@
  *   Create race condition and see if we can catch interrupts.
  *   Basic check of ring to ring write synchronisation
  * Feature: multitile, synchronization
- * Run type: FULL
  * Test category: MultiTile
  *
  * SUBTEST: basic-store-all
- * Category: Infrastructure
  * Description: Basic version of store synchronisation test.
- * Feature: synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: basic-store-each
  * Description:
  *   Check that store synchronisation works.
  *   Basic check of ring to ring write, store synchronisation
  * Feature: multitile, synchronization
- * Run type: FULL
  * Test category: MultiTile
  *
  * SUBTEST: default
  * Description: Check synchronisation of rings on each engine.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: double-wakeup
  * Description: Double stress test for nop + sync on each engine.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: double-wakeup-each
  * Description: Double stress test for nop + sync.
  * Feature: multitile, synchronization
- * Run type: FULL
  *
  * SUBTEST: forked
  * Description: Check synchronisation of ring with parallel executions on each engine.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: forked-all
  * Description: Parallel execution of batch on all rings and then wait.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: forked-each
  * Description:
  *   Forked variant of sync_ring, which checks synchronisation of ring with parallel
  *   executions.
  * Feature: multitile, synchronization
- * Run type: FULL
  *
  * SUBTEST: forked-store
  * Description: Check store synchronisation works with parallel multiple executions on each engine.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: forked-store-all
  * Description: Parallel execution of store synchronisation.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: forked-store-each
  * Description: Forked variant of store_ring, check if parallel store synchronisation works.
  * Feature: multitile, synchronization
- * Run type: FULL
  *
  * SUBTEST: forked-switch
  * Description: Check sync after context switch parallelly on each engine.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: forked-switch-each
  * Description: Check sync after context switch parallelly.
  * Feature: multitile, synchronization
- * Run type: FULL
  *
  * SUBTEST: idle
  * Description: Exercise and measure idle requests on each engine.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: legacy-active
  * Description: Exercise waiting while keeping the GPU busy for each legacy engine.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: legacy-active-wakeup
  * Description: Measure wakeup latency while also scheduling the next batch for each legacy engine.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: legacy-default
  * Description: Check synchronisation of rings for each legacy engine.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: legacy-double-wakeup
  * Description: Double stress test for nop + sync for each legacy engine.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: legacy-forked
  * Description: Check synchronisation of ring with parallel executions for each legacy engine.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: legacy-forked-store
  * Description:
  *   Check store synchronisation works with parallel multiple executions for each legacy
  *   engine.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: legacy-forked-switch
  * Description: Check sync after context switch parallelly for each legacy engine.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: legacy-idle
  * Description: Exercise and measure idle requests for each legacy engine.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: legacy-many
  * Description: Create race condition and see if we can catch interrupts for each legacy engine.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: legacy-store
  * Description: Check that store synchronisation works for each legacy engine.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: legacy-switch
  * Description: Check sync after context switch for each legacy engine.
@@ -220,60 +166,40 @@
  *
  * SUBTEST: legacy-wakeup
  * Description: Stress for nop + sync for each legacy engine.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: many
  * Description: Create race condition and see if we can catch interrupts on each engine.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: preempt
  * Description: For each context engine check how priority of task are submitted when engine is already busy.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: preempt-all
  * Description:
  *   Check and measure how well we can submit a second high priority task when the engine is already
  *   busy with a low priority task on all engines.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: store
  * Description: Check that store synchronisation works on each engine.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: store-all
  * Description: Extended version of existing basic-store-all test.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: switch
  * Description: Check sync after context switch on each engine.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: switch-each
  * Description: Check sync after context switch.
  * Feature: multitile, synchronization
- * Run type: FULL
  *
  * SUBTEST: wait-all
  * Description: Extended version of existing basic-all test.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: wakeup
  * Description: Stress for nop + sync on each engine.
- * Feature: synchronization
- * Run type: FULL
  *
  * SUBTEST: wakeup-each
  * Description: Stress test for nop + sync.
  * Feature: multitile, synchronization
- * Run type: FULL
  */
 
 #define MAX_PRIO I915_CONTEXT_MAX_USER_PRIORITY
-- 
2.34.1

