Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362FFC5475B
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 09:09:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D6910E1F5;
	Fri,  1 Mar 2024 09:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MSPVycPH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6978F10E1D7
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 09:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709284164; x=1740820164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ujN5BM3ZwC2vB5YcbZFKkew0mLQjAD6eDJ6WUrOpGA4=;
 b=MSPVycPHmwiDQCZihULAcm63rflp6t1KuEp+1YM8h58MLWARgjBq4g+r
 PI7Jw5NKGauVchXn8xzCCSpATALGG5bEaOomQqCj/kFnXHeb9gVIchqbZ
 Ig0gzF0ausADrZM0bQKW5iXj6eGxEYeh3ZpbpOrBDHxczw1oAyaYBsqqT
 b6VdlfOPRT+gNkf3qHt+PastZXtGKzSngAxlssl1PusSJsQ67O5kCk7nL
 KVgdnekSnp27H1Qt7m6dkmJTcQKk2l3j6G8WGJImlv7Ae7f1dtA1ibgXF
 eFvCA747zQnrxkxRjRICJ95332QoBP5E6xKwJSINWtPous/PiTkpa9YEn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3985824"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="3985824"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 01:09:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="8542410"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 01:09:21 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 3/5] tests/intel: Documentation refactoring part 3
Date: Fri,  1 Mar 2024 09:08:42 +0000
Message-Id: <20240301090844.671493-4-katarzyna.piecielska@intel.com>
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

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_exec_basic.c    |  13 +-
 tests/intel/gem_exec_big.c      |   8 +-
 tests/intel/gem_exec_capture.c  |  25 +--
 tests/intel/gem_exec_create.c   |  48 ++---
 tests/intel/gem_exec_fence.c    | 277 ++++++---------------------
 tests/intel/gem_exec_gttfill.c  |  23 +--
 tests/intel/gem_exec_nop.c      |  27 +--
 tests/intel/gem_exec_parallel.c |  37 +---
 tests/intel/gem_exec_params.c   | 112 +----------
 tests/intel/gem_exec_schedule.c | 324 +-------------------------------
 tests/intel/gem_exec_suspend.c  |  40 +---
 tests/intel/gem_exec_whisper.c  | 181 +-----------------
 12 files changed, 119 insertions(+), 996 deletions(-)

diff --git a/tests/intel/gem_exec_basic.c b/tests/intel/gem_exec_basic.c
index 83f71e289..aae773987 100644
--- a/tests/intel/gem_exec_basic.c
+++ b/tests/intel/gem_exec_basic.c
@@ -28,17 +28,16 @@
 /**
  * TEST: gem exec basic
  * Description: Basic sanity check of execbuf-ioctl rings.
- *
- * SUBTEST: basic
  * Category: Infrastructure
- * Description:
- *   Check basic functionality of GEM_EXECBUFFER2 ioctl on every ring and iterating over memory
- *   regions.
  * Feature: cmd_submission
- * Functionality: command submission
+ * Functionality: execbuf
  * Run type: BAT
- * Sub-category: i915
+ * Sub-category: CMD submission
  * Test category: GEM_Legacy
+ *
+ * SUBTEST: basic
+ * Description: Check basic functionality of GEM_EXECBUFFER2 ioctl on every
+ *		ring and iterating over memory regions.
  */
 
 IGT_TEST_DESCRIPTION("Basic sanity check of execbuf-ioctl rings.");
diff --git a/tests/intel/gem_exec_big.c b/tests/intel/gem_exec_big.c
index 9de9941d5..f22be96db 100644
--- a/tests/intel/gem_exec_big.c
+++ b/tests/intel/gem_exec_big.c
@@ -52,15 +52,15 @@
  * TEST: gem exec big
  * Description: Run a large nop batch to stress test the error capture code.
  * Feature: cmd_submission
+ * Category: Infrastructure
+ * Functionality: large nop batch
+ * Sub-category: CMD submission
+ * Test category: GEM_Legacy
  * Run type: FULL
  *
  * SUBTEST: exhaustive
  *
  * SUBTEST: single
- * Category: Infrastructure
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
  */
 
 IGT_TEST_DESCRIPTION("Run a large nop batch to stress test the error capture"
diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
index d231c53b9..3617dd994 100644
--- a/tests/intel/gem_exec_capture.c
+++ b/tests/intel/gem_exec_capture.c
@@ -35,21 +35,21 @@
  * TEST: gem exec capture
  * Description: Check that we capture the user specified objects on a hang
  * Feature: cmd_submission
- * Run type: FULL
- *
- * SUBTEST: capture
  * Category: Server
  * Functionality: offline debugging
- * Sub-category: debugger
+ * Sub-category: Debugger
  * Test category: GEM_Legacy
+ * Run type: FULL
+ *
+ * SUBTEST: capture
  *
  * SUBTEST: capture-invisible
- * Description:
- *   Check that the kernel doesn't crash if the pages can't be copied from the CPU during error
- *   capture.
+ * Description: Check that the kernel doesn't crash if the pages can't be
+ *		copied from the CPU during error capture.
  *
  * SUBTEST: capture-recoverable
- * Description: Verify that the kernel rejects EXEC_OBJECT_CAPTURE with recoverable contexts.
+ * Description: Verify that the kernel rejects EXEC_OBJECT_CAPTURE with
+ *		recoverable contexts.
  *
  * SUBTEST: many-256M-incremental
  *
@@ -62,16 +62,9 @@
  * SUBTEST: many-4K-zero
  *
  * SUBTEST: pi
- * Category: Server
- * Functionality: offline debugging
- * Sub-category: debugger
- * Test category: GEM_Legacy
  *
  * SUBTEST: userptr
- * Category: Server
- * Functionality: offline debugging
- * Sub-category: debugger
- * Test category: GEM_Legacy
+ *
  */
 
 #define MAX_RESET_TIME	600
diff --git a/tests/intel/gem_exec_create.c b/tests/intel/gem_exec_create.c
index 4eb77ecbb..1d5c2512f 100644
--- a/tests/intel/gem_exec_create.c
+++ b/tests/intel/gem_exec_create.c
@@ -48,48 +48,32 @@
 #include "i915/intel_memory_region.h"
 /**
  * TEST: gem exec create
- * Description:
- *   This test overloads the driver with transient active objects and checks if we don't kill the
- *   system under the memory pressure some of the symptoms this test look for include mysterious
- *   hangs.
- *
- * SUBTEST: basic
  * Category: Infrastructure
- * Description: Check if we kill system by overloading it with active objects iterating over all engines.
+ * Description: This test overloads the driver with transient active objects
+ *		and checks if we don't kill the system under the memory pressure
+ *		some of the symptoms this test look for include mysterious hangs.
  * Feature: cmd_submission
  * Functionality: buffer management
- * Run type: BAT
- * Sub-category: i915
+ * Run type: FULL
+ * Sub-category: CMD submission
  * Test category: GEM_Legacy
  *
+ * SUBTEST: basic
+ * Run type: BAT
+ * Description: Check if we kill system by overloading it with active objects
+ *		iterating over all engines.
+ *
  * SUBTEST: forked
- * Category: Infrastructure
- * Description: Concurrently overloads system with active objects and checks if we kill system.
- * Feature: cmd_submission
- * Functionality: buffer management
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Description: Concurrently overloads system with active objects and checks
+ *		if we kill system.
  *
  * SUBTEST: legacy
- * Category: Infrastructure
- * Description:
- *   Check if we kill the system by overloading it with active objects iterating over legacy
- *   engines.
- * Feature: cmd_submission
- * Functionality: buffer management
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Description: Check if we kill the system by overloading it with active
+ *		objects iterating over legacy engines.
  *
  * SUBTEST: madvise
- * Category: Infrastructure
- * Description: This test does a forced reclaim, behaving like a bad application leaking its bo cache.
- * Feature: cmd_submission
- * Functionality: buffer management
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Description: This test does a forced reclaim, behaving like a bad application
+ *		leaking its bo cache.
  */
 
 IGT_TEST_DESCRIPTION("This test overloads the driver with transient active objects"
diff --git a/tests/intel/gem_exec_fence.c b/tests/intel/gem_exec_fence.c
index 4bf29a3e4..a0cfc1378 100644
--- a/tests/intel/gem_exec_fence.c
+++ b/tests/intel/gem_exec_fence.c
@@ -38,352 +38,189 @@
 /**
  * TEST: gem exec fence
  * Description: Check that execbuf waits for explicit fences
- *
- * SUBTEST: await-hang
- * Description: Check for explicit fence with async wait on each engine with a pending gpu hang.
+ * Category: Infrastructure
  * Feature: cmd_submission, synchronization
+ * Functionality: semaphore
+ * Sub-category: CMD submission
+ * Test category: GEM_Legacy
  * Run type: FULL
  *
+ * SUBTEST: await-hang
+ * Description: Check for explicit fence with async wait on each engine with a
+ *		pending gpu hang.
+ *
  * SUBTEST: basic-await
  * Description: Basic check for explicit fence with async wait on each engine.
- * Feature: cmd_submission, multitile, synchronization
- * Functionality: semaphore
  * Run type: BAT
  * Test category: MultiTile
  *
  * SUBTEST: basic-busy
  * Description: Basic check for explicit fence on each busy engine.
  * Feature: cmd_submission, multitile, synchronization
- * Functionality: semaphore
  * Run type: BAT
  * Test category: MultiTile
  *
  * SUBTEST: basic-busy-all
  * Description: Basic check for composite fence on all busy engines.
  * Feature: cmd_submission, multitile, synchronization
- * Run type: FULL
  * Test category: MultiTile
  *
  * SUBTEST: basic-wait
- * Description: Basic check for explicit fence with additional wait time on each busy engine.
+ * Description: Basic check for explicit fence with additional wait time on
+ *		each busy engine.
  * Feature: cmd_submission, multitile, synchronization
- * Functionality: semaphore
  * Run type: BAT
  * Test category: MultiTile
  *
  * SUBTEST: basic-wait-all
- * Description:
- *   Basic check for composite fence with additional wait on all busy engines.
- *   Execute the same batch on each engine and check that the composite fence across all engines completes only after the batch is completed on every engine.
+ * Description: Basic check for composite fence with additional wait on all
+ *		busy engines. Execute the same batch on each engine and check
+ *		that the composite fence across all engines completes only
+ *		after the batch is completed on every engine.
  * Feature: cmd_submission, multitile, synchronization
- * Run type: FULL
  * Test category: MultiTile
  *
  * SUBTEST: busy-hang
- * Description: Check for explicit fence on each busy engine with a pending gpu hang.
- * Feature: cmd_submission, synchronization
- * Run type: FULL
+ * Description: Check for explicit fence on each busy engine with a pending
+ *		gpu hang.
  *
  * SUBTEST: busy-hang-all
- * Description: Check for composite fence on all busy engines with a pending gpu hang.
- * Feature: cmd_submission, synchronization
- * Run type: FULL
+ * Description: Check for composite fence on all busy engines with a pending
+ *		gpu hang.
  *
  * SUBTEST: concurrent
  * Description: Check blocking bonded fences on each engine.
- * Feature: cmd_submission, synchronization
- * Run type: FULL
  *
  * SUBTEST: expired-history
  * Category: Infrastructure
  * Description: Verifies long history of fences are expired.
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: invalid-fence-array
- * Category: Infrastructure
  * Description: Verifies invalid fence-array pointers are rejected.
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: invalid-timeline-fence-array
- * Category: Infrastructure
- * Description:
- *   Verifies invalid execbuf parameters in drm_i915_gem_execbuffer_ext_timeline_fences
- *   are rejected
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Description: Verifies invalid execbuf parameters in
+ *		drm_i915_gem_execbuffer_ext_timeline_fences are rejected
  *
  * SUBTEST: keep-in-fence
  * Description: Check in-fence is not overwritten with out-fence on each engine.
  * Feature: cmd_submission, multitile, synchronization
- * Run type: FULL
  * Test category: MultiTile
  *
  * SUBTEST: long-history
- * Category: Infrastructure
  * Description: Verifies accumulation of long history of fences.
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: nb-await
  * Description: Check for explicit fence with non-blocking wait on each engine.
  * Feature: cmd_submission, multitile, synchronization
- * Functionality: semaphore
  * Run type: BAT
  * Test category: MultiTile
  *
  * SUBTEST: nb-await-hang
- * Description: Check for explicit fence with non-blocking async wait on each engine with a pending gpu hang.
+ * Description: Check for explicit fence with non-blocking async wait on each
+ *		engine with a pending gpu hang.
  * Feature: cmd_submission, multitile, synchronization
- * Run type: FULL
  *
  * SUBTEST: parallel
- * Description: Check for EXEC_FENCE_SUBMIT in parallel execution scenarios on each engine.
+ * Description: Check for EXEC_FENCE_SUBMIT in parallel execution scenarios
+ *		on each engine.
  * Feature: cmd_submission, multitile, synchronization
- * Run type: FULL
  * Test category: MultiTile
  *
  * SUBTEST: submit
  * Description: Check timeslicing on submit-fence.
- * Feature: cmd_submission, synchronization
- * Run type: FULL
  *
  * SUBTEST: submit-chain
- * Description: Check launching a chain of spinners across all engines using submit-fence.
- * Feature: cmd_submission, synchronization
- * Run type: FULL
+ * Description: Check launching a chain of spinners across all engines using
+ *		submit-fence.
  *
  * SUBTEST: submit3
  * Description: Check timeslicing on submit-fence by submitting coupled batches.
- * Feature: cmd_submission, synchronization
- * Run type: FULL
  *
  * SUBTEST: submit67
- * Description:
- *   Check timeslicing on submit-fence by submitting more coupled batches than can possibly fit
- *   into the ELSP.
- * Feature: cmd_submission, synchronization
- * Run type: FULL
+ * Description: Check timeslicing on submit-fence by submitting more coupled
+ *		batches than can possibly fit into the ELSP.
  *
  * SUBTEST: syncobj-backward-timeline-chain-engines
- * Category: Infrastructure
- * Description:
- *   Engine chaining tests to verify ordering of timeline syncobjs with backward timeline
- *   points.
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Description: Engine chaining tests to verify ordering of timeline syncobjs
+ *		with backward timeline points.
  *
  * SUBTEST: syncobj-channel
- * Category: Infrastructure
  * Description: Verifies two clients racing for syncobj using channel.
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: syncobj-export
- * Category: Infrastructure
  * Description: Verify exporting of fence-array syncobj signaled by i915.
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: syncobj-import
- * Category: Infrastructure
  * Description: Verifies creating of a syncobj from explicit fence.
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: syncobj-invalid-flags
- * Category: Infrastructure
  * Description: Verifies that invalid fence flags in fence-array are rejected.
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: syncobj-invalid-wait
- * Category: Infrastructure
- * Description: Verifies that submitting an execbuf with a wait on a syncobj that doesn't exists is rejected.
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Description: Verifies that submitting an execbuf with a wait on a syncobj
+ *		that doesn't exists is rejected.
  *
  * SUBTEST: syncobj-repeat
- * Category: Infrastructure
- * Description: Verifies that waiting & signaling a same fence-array syncobj within the same execbuf works.
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Description: Verifies that waiting & signaling a same fence-array syncobj
+ *		within the same execbuf works.
  *
  * SUBTEST: syncobj-signal
- * Category: Infrastructure
  * Description: Verifies proper signaling of a fence-array syncobj through execbuf.
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: syncobj-stationary-timeline-chain-engines
- * Category: Infrastructure
- * Description:
- *   Engine chaining tests to verify ordering of timeline syncobj with stationary timeline
- *   points.
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Description: Engine chaining tests to verify ordering of timeline syncobj
+ *		with stationary timeline points.
  *
  * SUBTEST: syncobj-timeline-chain-engines
- * Category: Infrastructure
- * Description: Engine chaining tests to verify ordering of timeline syncobjs through execbuf.
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Description: Engine chaining tests to verify ordering of timeline syncobjs
+ *		through execbuf.
  *
  * SUBTEST: syncobj-timeline-export
- * Category: Infrastructure
  * Description: Verify exporting of timeline syncobj signaled by i915
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: syncobj-timeline-invalid-flags
- * Category: Infrastructure
- * Description:
- *   Verifies that invalid fence flags in drm_i915_gem_execbuffer_ext_timeline_fences are
- *   rejected
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Description: Verifies that invalid fence flags in
+ *		drm_i915_gem_execbuffer_ext_timeline_fences are rejected
  *
  * SUBTEST: syncobj-timeline-invalid-wait
- * Category: Infrastructure
- * Description:
- *   Verifies that submitting an execbuf with a wait on a timeline syncobj point that does not
- *   exists is rejected
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Description: Verifies that submitting an execbuf with a wait on a timeline
+ *		syncobj point that does not exists is rejected
  *
  * SUBTEST: syncobj-timeline-multiple-ext-nodes
- * Category: Infrastructure
  * Description: Verify that passing multiple execbuffer_ext nodes works
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: syncobj-timeline-repeat
- * Category: Infrastructure
- * Description:
- *   Verifies that waiting & signaling a same timeline syncobj point within the same execbuf
- *   fworks
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Description: Verifies that waiting & signaling a same timeline syncobj point
+ *		within the same execbuf works
  *
  * SUBTEST: syncobj-timeline-signal
- * Category: Infrastructure
  * Description: Verifies proper signaling of a timeline syncobj through execbuf
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: syncobj-timeline-unused-fence
- * Category: Infrastructure
- * Description:
- *   Verifies that a timeline syncobj passed into
- *   drm_i915_gem_execbuffer_ext_timeline_fences but with no signal/wait flag is left
- *   untouched
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Description: Verifies that a timeline syncobj passed into
+ *		drm_i915_gem_execbuffer_ext_timeline_fences but with no
+ *		signal/wait flag is left untouched
  *
  * SUBTEST: syncobj-timeline-wait
- * Category: Infrastructure
- * Description: Verifies that waiting on a timeline syncobj point between engines works
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Description: Verifies that waiting on a timeline syncobj point between
+ *		engines works
  *
  * SUBTEST: syncobj-unused-fence
- * Category: Infrastructure
- * Description: Verifies that a syncobj passed into execbuf but with no signal/wait flag is left untouched.
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Description: Verifies that a syncobj passed into execbuf but with no
+ *		signal/wait flag is left untouched.
  *
  * SUBTEST: syncobj-wait
- * Category: Infrastructure
- * Description: Verifies that waiting on a timeline syncobj point between engines works.
- * Feature: cmd_submission, synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
+ * Description: Verifies that waiting on a timeline syncobj point between
+ *		engines works.
  *
  * SUBTEST: wait-hang
- * Description:
- *   Check for explicit fence with additional wait time on each busy engine with a pending gpu
- *   hang.
- * Feature: cmd_submission, synchronization
- * Run type: FULL
+ * Description: Check for explicit fence with additional wait time on each
+ *		busy engine with a pending gpu hang.
  *
  * SUBTEST: wait-hang-all
- * Description:
- *   Check for composite fence with additional wait on all busy engines and with a pending gpu
- *   hang.
- * Feature: cmd_submission, synchronization
- * Run type: FULL
+ * Description: Check for composite fence with additional wait on all busy
+ *		engines and with a pending gpu hang.
  */
 
 IGT_TEST_DESCRIPTION("Check that execbuf waits for explicit fences");
diff --git a/tests/intel/gem_exec_gttfill.c b/tests/intel/gem_exec_gttfill.c
index 28c251915..b1063437b 100644
--- a/tests/intel/gem_exec_gttfill.c
+++ b/tests/intel/gem_exec_gttfill.c
@@ -29,36 +29,25 @@
 /**
  * TEST: gem exec gttfill
  * Description: Fill the GTT with batches.
- *
- * SUBTEST: all-engines
  * Category: Infrastructure
- * Description: Stress test check behaviour/correctness of handling batches to fill gtt
  * Feature: cmd_submission, gtt
- * Functionality: command submission
- * Run type: FULL
+ * Functionality: execbuf
+ * Sub-category: CMD submission
  * Test category: GEM_Legacy
+ * Run type: FULL
+ *
+ * SUBTEST: all-engines
+ * Description: Stress test check behaviour/correctness of handling batches to fill gtt
  *
  * SUBTEST: basic
- * Category: Infrastructure
  * Description: Checks if it can handle enough batches to fill gtt
- * Feature: cmd_submission, gtt
- * Functionality: command submission
  * Run type: BAT
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: engines
- * Category: Infrastructure
  * Description: Checks the correctness of handling enough batches to fill gtt for each engine
- * Feature: cmd_submission, gtt
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: multigpu-basic
  * Feature: cmd_submission, gtt, multigpu
- * Run type: FULL
  * Test category: MultiGPU
  */
 
diff --git a/tests/intel/gem_exec_nop.c b/tests/intel/gem_exec_nop.c
index 6dea8b167..88a6ba224 100644
--- a/tests/intel/gem_exec_nop.c
+++ b/tests/intel/gem_exec_nop.c
@@ -50,61 +50,41 @@
 
 /**
  * TEST: gem exec nop
- * Run type: FULL
- *
- * SUBTEST: basic-parallel
  * Category: Infrastructure
  * Feature: cmd_submission
  * Functionality: command submission
  * Sub-category: i915
  * Test category: GEM_Legacy
+ * Run type: FULL
+ *
+ * SUBTEST: basic-parallel
  *
  * SUBTEST: basic-sequential
- * Category: Infrastructure
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: basic-series
- * Category: Infrastructure
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: context-sequential
- * Feature: cmd_submission
  *
  * SUBTEST: forked-sequential
- * Feature: cmd_submission
  *
  * SUBTEST: headless
- * Feature: cmd_submission
  *
  * SUBTEST: independent
- * Feature: cmd_submission
  *
  * SUBTEST: multiple
- * Feature: cmd_submission
  *
  * SUBTEST: parallel
- * Feature: cmd_submission
  *
  * SUBTEST: poll
- * Feature: cmd_submission
  *
  * SUBTEST: poll-sequential
- * Feature: cmd_submission
  *
  * SUBTEST: preempt
  * Feature: cmd_submission, multitile
  *
  * SUBTEST: sequential
- * Feature: cmd_submission
  *
  * SUBTEST: series
- * Feature: cmd_submission
  *
  * SUBTEST: signal
  * Feature: cmd_submission, multitile
@@ -113,7 +93,6 @@
  * Feature: cmd_submission, multitile
  *
  * SUBTEST: single
- * Feature: cmd_submission
  */
 
 #define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
diff --git a/tests/intel/gem_exec_parallel.c b/tests/intel/gem_exec_parallel.c
index cae1553f6..fdf22cbea 100644
--- a/tests/intel/gem_exec_parallel.c
+++ b/tests/intel/gem_exec_parallel.c
@@ -36,51 +36,24 @@
 /**
  * TEST: gem exec parallel
  * Description: Exercise filling buffers by many clients working in parallel.
- *
- * SUBTEST: basic
  * Category: Infrastructure
  * Description: Check basic functionality per engine.
  * Feature: cmd_submission
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
+ * Functionality: parallel clients
+ * Sub-category: CMD submission
  * Test category: GEM_Legacy
+ * Run type: FULL
+ *
+ * SUBTEST: basic
  *
  * SUBTEST: contexts
- * Category: Infrastructure
- * Description: Check with many contexts.
- * Feature: cmd_submission
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: engines
- * Category: Infrastructure
- * Description: Check with engines working in parallel.
- * Feature: cmd_submission
- * Functionality: command submission
  * Run type: BAT
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: fds
- * Category: Infrastructure
- * Description: Check with many fds.
- * Feature: cmd_submission
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: userptr
- * Category: Infrastructure
- * Description: Check basic userptr thrashing.
- * Feature: cmd_submission
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
- * Test category: GEM_Legacy
  */
 
 IGT_TEST_DESCRIPTION("Exercise filling buffers by many clients working in parallel.");
diff --git a/tests/intel/gem_exec_params.c b/tests/intel/gem_exec_params.c
index caaa5fee0..912c4f856 100644
--- a/tests/intel/gem_exec_params.c
+++ b/tests/intel/gem_exec_params.c
@@ -46,166 +46,70 @@
 #include "sw_sync.h"
 /**
  * TEST: gem exec params
+ * Category: Desktop client
+ * Feature: cmd_submission
+ * Functionality: execbuf
+ * Sub-category: CMD submission
+ * Test category: GEM_Legacy
  * Run type: FULL
  *
  * SUBTEST: DR1-dirt
- * Feature: cmd_submission
  *
  * SUBTEST: DR4-dirt
- * Feature: cmd_submission
  *
  * SUBTEST: batch-first
- * Category: Desktop client
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: cliprects-invalid
- * Category: Desktop client
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: cliprects_ptr-dirt
- * Category: Desktop client
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: invalid-batch-start-offset
- * Category: Desktop client
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: invalid-bsd-ring
- * Category: Desktop client
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: invalid-bsd1-flag-on-blt
- * Category: Desktop client
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: invalid-bsd1-flag-on-render
- * Feature: cmd_submission
  *
  * SUBTEST: invalid-bsd1-flag-on-vebox
- * Feature: cmd_submission
  *
  * SUBTEST: invalid-bsd2-flag-on-blt
- * Category: Desktop client
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: invalid-bsd2-flag-on-render
- * Feature: cmd_submission
  *
  * SUBTEST: invalid-bsd2-flag-on-vebox
- * Feature: cmd_submission
  *
  * SUBTEST: invalid-fence-in
- * Category: Desktop client
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: invalid-fence-in-submit
- * Category: Desktop client
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: invalid-flag
- * Category: Desktop client
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: invalid-ring
- * Category: Desktop client
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: invalid-ring2
- * Category: Desktop client
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: larger-than-life-batch
- * Category: Desktop client
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: mmapped
- * Category: Desktop client
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: no-blt
- * Feature: cmd_submission
  *
  * SUBTEST: no-bsd
- * Feature: cmd_submission
  *
  * SUBTEST: no-vebox
- * Feature: cmd_submission
  *
  * SUBTEST: readonly
- * Category: Desktop client
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: rel-constants-invalid
- * Category: Desktop client
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: rel-constants-invalid-rel-gen5
- * Category: Desktop client
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: rel-constants-invalid-ring
- * Feature: cmd_submission
  *
  * SUBTEST: rs-invalid
- * Category: Desktop client
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
  *
  * SUBTEST: rsvd2-dirt
- * Feature: cmd_submission
  *
  * SUBTEST: secure-non-master
  * Feature: cmd_submission, obsolete
@@ -214,14 +118,8 @@
  * Feature: cmd_submission, obsolete
  *
  * SUBTEST: sol-reset-invalid
- * Feature: cmd_submission
  *
  * SUBTEST: sol-reset-not-gen7
- * Category: Desktop client
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
  */
 
 #define ALIGNMENT (1 << 22)
diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
index 3fd91b2fa..41dfc394b 100644
--- a/tests/intel/gem_exec_schedule.c
+++ b/tests/intel/gem_exec_schedule.c
@@ -47,388 +47,72 @@
 /**
  * TEST: gem exec schedule
  * Description: Check that we can control the order of execution
- * Run type: FULL
- *
- * SUBTEST: deep
  * Category: Desktop \ Server
  * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
+ * Functionality: execution order
+ * Sub-category: CMD submission
  * Test category: GEM_Legacy
+ * Run type: FULL
  *
+ * SUBTEST: deep
  * SUBTEST: fairslice
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: fairslice-all
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: fifo
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: implicit-boths
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: implicit-read-write
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: implicit-write-read
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: in-order
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: independent
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: lateslice
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: manyslice
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: noreorder
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: noreorder-corked
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: noreorder-priority
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: out-order
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: pi-common
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: pi-distinct-iova
- * Feature: cmd_submission
- *
  * SUBTEST: pi-ringfull
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: pi-shared-iova
- * Feature: cmd_submission
- *
  * SUBTEST: pi-userfault
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: preempt
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: preempt-contexts
- * Category: Desktop \ Server
- * Feature: cmd_submission, multictx
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: preempt-engines
- * Category: Desktop \ Server
- * Feature: cmd_submission, multictx
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: preempt-hang
- * Category: Desktop \ Server
- * Feature: cmd_submission, multictx
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: preempt-other
- * Category: Desktop \ Server
- * Feature: cmd_submission, multictx
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: preempt-other-chain
- * Category: Desktop \ Server
- * Feature: cmd_submission, multictx
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: preempt-queue
- * Feature: cmd_submission, multictx
- *
  * SUBTEST: preempt-queue-chain
- * Feature: cmd_submission, multictx
- *
  * SUBTEST: preempt-queue-contexts
- * Feature: cmd_submission, multictx
- *
  * SUBTEST: preempt-queue-contexts-chain
- * Feature: cmd_submission, multictx
- *
  * SUBTEST: preempt-self
- * Category: Desktop \ Server
- * Feature: cmd_submission, multictx
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: preempt-user
- * Category: Desktop \ Server
- * Feature: cmd_submission, multictx
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: preemptive-hang
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: promotion
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: reorder-wide
- * Feature: cmd_submission
- *
  * SUBTEST: semaphore-codependency
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: semaphore-noskip
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: semaphore-power
- * Feature: cmd_submission
- *
  * SUBTEST: semaphore-resolve
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: semaphore-user
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: smoketest
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: smoketest-all
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: submit-early-slice
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: submit-golden-slice
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: submit-late-slice
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: thriceslice
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: timeslicing
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: u-fairslice
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: u-fairslice-all
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: u-independent
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: u-lateslice
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: u-semaphore-codependency
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: u-semaphore-noskip
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: u-semaphore-resolve
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: u-semaphore-user
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: u-submit-early-slice
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: u-submit-golden-slice
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: u-submit-late-slice
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: wide
- * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
  */
 
 #define LO 0
diff --git a/tests/intel/gem_exec_suspend.c b/tests/intel/gem_exec_suspend.c
index 39d75ee03..faf2e10f5 100644
--- a/tests/intel/gem_exec_suspend.c
+++ b/tests/intel/gem_exec_suspend.c
@@ -39,101 +39,65 @@
 /**
  * TEST: gem exec suspend
  * Description: Exercise simple execbufs runs across various suspend/resume cycles.
+ * Feature: cmd_submission, suspend
+ * Run type: FULL
  *
  * SUBTEST: basic
  * Description: Check basic functionality without any suspend/resume cycle.
- * Feature: cmd_submission, suspend
- * Run type: FULL
  *
  * SUBTEST: basic-S0
  * Description: Check with suspend-to-idle target state.
- * Feature: cmd_submission, suspend
- * Run type: FULL
  *
  * SUBTEST: basic-S3
  * Description: Check full cycle of suspend-to-mem.
- * Feature: cmd_submission, suspend
- * Run type: FULL
  *
  * SUBTEST: basic-S3-devices
  * Description: Check with suspend-to-mem with devices only.
- * Feature: cmd_submission, suspend
- * Run type: FULL
  *
  * SUBTEST: basic-S4
  * Description: Check full cycle of suspend-to-disk.
- * Feature: cmd_submission, suspend
- * Run type: FULL
  *
  * SUBTEST: basic-S4-devices
  * Description: Check with suspend-to-disk with devices only.
- * Feature: cmd_submission, suspend
- * Run type: FULL
  *
  * SUBTEST: cached
  * Description: Check without suspend/resume cycle state with cached object.
- * Feature: cmd_submission, suspend
- * Run type: FULL
  *
  * SUBTEST: cached-S3
  * Description: Check suspend-to-mem state with cached object.
- * Feature: cmd_submission, suspend
- * Run type: FULL
  *
  * SUBTEST: cached-S4
  * Description: Check suspend-to-disk state with cached object.
- * Feature: cmd_submission, suspend
- * Run type: FULL
  *
  * SUBTEST: fixed
  * Description: Check without suspend/resume cycle state with fixed object.
- * Feature: cmd_submission, suspend
- * Run type: FULL
  *
  * SUBTEST: fixed-S3
  * Description: Check suspend-to-mem state with fixed object.
- * Feature: cmd_submission, suspend
- * Run type: FULL
  *
  * SUBTEST: fixed-S4
  * Description: Check suspend-to-disk state with fixed object.
- * Feature: cmd_submission, suspend
- * Run type: FULL
  *
  * SUBTEST: hang-S3
  * Description: Check full cycle of suspend-to-mem with a pending GPU hang.
- * Feature: cmd_submission, suspend
- * Run type: FULL
  *
  * SUBTEST: hang-S4
  * Description: Check full cycle of suspend-to-disk with a pending GPU hang.
- * Feature: cmd_submission, suspend
- * Run type: FULL
  *
  * SUBTEST: power-S0
  * Description: Check power consumption during idle state.
- * Feature: cmd_submission, suspend
- * Run type: FULL
  *
  * SUBTEST: power-S3
  * Description: Check power consumption during suspend-to-mem state.
- * Feature: cmd_submission, suspend
- * Run type: FULL
  *
  * SUBTEST: uncached
  * Description: Check without suspend/resume cycle state with uncached object.
- * Feature: cmd_submission, suspend
- * Run type: FULL
  *
  * SUBTEST: uncached-S3
  * Description: Check suspend-to-mem state with uncached object.
- * Feature: cmd_submission, suspend
- * Run type: FULL
  *
  * SUBTEST: uncached-S4
  * Description: Check suspend-to-disk state with uncached object.
- * Feature: cmd_submission, suspend
- * Run type: FULL
  */
 
 IGT_TEST_DESCRIPTION("Exercise simple execbufs runs across various suspend/resume cycles.");
diff --git a/tests/intel/gem_exec_whisper.c b/tests/intel/gem_exec_whisper.c
index 46712c3e8..effb47335 100644
--- a/tests/intel/gem_exec_whisper.c
+++ b/tests/intel/gem_exec_whisper.c
@@ -40,280 +40,103 @@
 /**
  * TEST: gem exec whisper
  * Feature: cmd_submission
- * Run type: FULL
- *
- * SUBTEST: basic-contexts
  * Category: Infrastructure
  * Functionality: command submission
  * Sub-category: i915
  * Test category: GEM_Legacy
+ * Run type: FULL
  *
+ * SUBTEST: basic-contexts
  * SUBTEST: basic-contexts-all
- * Category: Infrastructure
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: basic-contexts-forked
- * Category: Infrastructure
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: basic-contexts-forked-all
- * Category: Infrastructure
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: basic-contexts-priority
- * Category: Infrastructure
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: basic-contexts-priority-all
- * Category: Infrastructure
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: basic-fds
- * Category: Infrastructure
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: basic-fds-all
- * Category: Infrastructure
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: basic-fds-forked
- * Category: Infrastructure
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: basic-fds-forked-all
- * Category: Infrastructure
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: basic-fds-priority
- * Category: Infrastructure
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: basic-fds-priority-all
- * Category: Infrastructure
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: basic-forked
- * Category: Infrastructure
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: basic-forked-all
- * Category: Infrastructure
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: basic-normal
- * Category: Infrastructure
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: basic-normal-all
- * Category: Infrastructure
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: basic-queues
- * Category: Infrastructure
- * Functionality: command submission
- * Test category: GEM_Legacy
- *
  * SUBTEST: basic-queues-all
- * Category: Infrastructure
- * Functionality: command submission
- * Test category: GEM_Legacy
- *
  * SUBTEST: basic-queues-forked
- * Category: Infrastructure
- * Functionality: command submission
- * Test category: GEM_Legacy
- *
  * SUBTEST: basic-queues-forked-all
- * Category: Infrastructure
- * Functionality: command submission
- * Test category: GEM_Legacy
- *
  * SUBTEST: basic-queues-priority
- * Category: Infrastructure
- * Functionality: command submission
- * Test category: GEM_Legacy
- *
  * SUBTEST: basic-queues-priority-all
- * Category: Infrastructure
- * Functionality: command submission
- * Test category: GEM_Legacy
- *
  * SUBTEST: basic-sync
- * Category: Infrastructure
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: basic-sync-all
- * Category: Infrastructure
- * Functionality: command submission
- * Sub-category: i915
- * Test category: GEM_Legacy
- *
  * SUBTEST: chain
- *
  * SUBTEST: chain-all
- *
  * SUBTEST: chain-forked
- *
  * SUBTEST: chain-forked-all
- *
  * SUBTEST: chain-interruptible
- *
  * SUBTEST: chain-interruptible-all
- *
  * SUBTEST: chain-sync
- *
  * SUBTEST: chain-sync-all
- *
  * SUBTEST: contexts-chain
- *
  * SUBTEST: contexts-chain-all
- *
  * SUBTEST: contexts-engine
- *
  * SUBTEST: contexts-forked-engine
- *
  * SUBTEST: contexts-interruptible
- *
  * SUBTEST: contexts-interruptible-all
- *
  * SUBTEST: contexts-interruptible-engine
- *
  * SUBTEST: contexts-priority-engine
- *
  * SUBTEST: contexts-sync
- *
  * SUBTEST: contexts-sync-all
- *
  * SUBTEST: contexts-sync-engine
- *
  * SUBTEST: fds-chain
- *
  * SUBTEST: fds-chain-all
- *
  * SUBTEST: fds-engine
- *
  * SUBTEST: fds-forked-engine
- *
  * SUBTEST: fds-interruptible
- *
  * SUBTEST: fds-interruptible-all
- *
  * SUBTEST: fds-interruptible-engine
- *
  * SUBTEST: fds-priority-engine
- *
  * SUBTEST: fds-sync
- *
  * SUBTEST: fds-sync-all
- *
  * SUBTEST: fds-sync-engine
- *
  * SUBTEST: forked-engine
- *
  * SUBTEST: hang-chain
- *
  * SUBTEST: hang-chain-forked
- *
  * SUBTEST: hang-chain-sync
- *
  * SUBTEST: hang-contexts
- *
  * SUBTEST: hang-contexts-chain
- *
  * SUBTEST: hang-contexts-forked
- *
  * SUBTEST: hang-contexts-priority
- *
  * SUBTEST: hang-contexts-sync
- *
  * SUBTEST: hang-fds
- *
  * SUBTEST: hang-fds-chain
- *
  * SUBTEST: hang-fds-forked
- *
  * SUBTEST: hang-fds-priority
- *
  * SUBTEST: hang-fds-sync
- *
  * SUBTEST: hang-forked
- *
  * SUBTEST: hang-normal
- *
  * SUBTEST: hang-queues
- *
  * SUBTEST: hang-queues-chain
- *
  * SUBTEST: hang-queues-forked
- *
  * SUBTEST: hang-queues-priority
- *
  * SUBTEST: hang-queues-sync
- *
  * SUBTEST: hang-sync
- *
  * SUBTEST: interruptible
- *
  * SUBTEST: interruptible-all
- *
  * SUBTEST: interruptible-engine
- *
  * SUBTEST: normal-engine
- *
  * SUBTEST: queues-chain
- *
  * SUBTEST: queues-chain-all
- *
  * SUBTEST: queues-engine
- *
  * SUBTEST: queues-forked-engine
- *
  * SUBTEST: queues-interruptible
- *
  * SUBTEST: queues-interruptible-all
- *
  * SUBTEST: queues-interruptible-engine
- *
  * SUBTEST: queues-priority-engine
- *
  * SUBTEST: queues-sync
- *
  * SUBTEST: queues-sync-all
- *
  * SUBTEST: queues-sync-engine
- *
  * SUBTEST: sync-engine
  */
 
-- 
2.34.1

