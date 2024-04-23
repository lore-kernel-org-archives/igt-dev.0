Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A35BC16B13
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 10:49:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72521132E0;
	Tue, 23 Apr 2024 10:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jW8+Ohry";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CB41132E3
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 10:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713869375; x=1745405375;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zyjsGh3oApRkELb3hOILMNtxDolxav2z/B8AMwY+C2Q=;
 b=jW8+OhryMWgGzd3RE4sPJUvsu2OLFF/LY7H+IVfUxBZC8by7vvLGrC4T
 3orywkso52spwWmUvYmhINxTNA3pQMDOeG/3uJrsiv+JOJKDqPw68G6hL
 z4h3v9SXfRzhGlQfwMIAlWplP65dOmZRK0Y2wBxjqGqRK0n78fL4CC8Th
 SC9G7iWBjZpIzd3GiP51usnf8FB7vNw4qboIXh8QUiqBmieOmVC/REM0H
 zuE1XH78aTwAEEinInV9NQDmPKNTL3UwJwymfh2ukvaKkwpuyGf1n31aR
 RlzTfs19nh6ygxEP/6JaQs5HsNuejTraILeem1C49c2eue1BGKO0pjgdb g==;
X-CSE-ConnectionGUID: 3pju573DTbWRv3PRbOc0Jw==
X-CSE-MsgGUID: p9XaQPUkSOOjNdKzxG1hNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9984913"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9984913"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 03:49:34 -0700
X-CSE-ConnectionGUID: k3j3ZDmfSzyYTVZLFcJZ8w==
X-CSE-MsgGUID: iLvNQgZsRwiocWifsBmrrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24379849"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 03:49:32 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t v2 01/16] tests/intel: Introduce General Core Mega
 feature
Date: Tue, 23 Apr 2024 10:48:58 +0000
Message-Id: <20240423104913.3559587-2-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423104913.3559587-1-katarzyna.piecielska@intel.com>
References: <20240423104913.3559587-1-katarzyna.piecielska@intel.com>
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

Add tests around Command Submission to General Core mega feature.
Group:
	SUBTEST
	Description
	Category
	Mega feature
	Sub-category
	Functionality

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
CC: Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
---
 tests/intel/gem_bad_reloc.c               |  5 ++-
 tests/intel/gem_barrier_race.c            |  1 +
 tests/intel/gem_blits.c                   |  5 ++-
 tests/intel/gem_close_race.c              |  5 ++-
 tests/intel/gem_ctx_bad_destroy.c         |  7 ++--
 tests/intel/gem_ctx_create.c              |  5 ++-
 tests/intel/gem_ctx_engines.c             |  5 ++-
 tests/intel/gem_ctx_exec.c                |  5 ++-
 tests/intel/gem_ctx_shared.c              |  5 ++-
 tests/intel/gem_ctx_switch.c              |  1 +
 tests/intel/gem_evict_alignment.c         |  3 +-
 tests/intel/gem_evict_everything.c        |  3 +-
 tests/intel/gem_exec_alignment.c          |  7 ++--
 tests/intel/gem_exec_async.c              |  5 ++-
 tests/intel/gem_exec_await.c              |  5 ++-
 tests/intel/gem_exec_balancer.c           |  5 ++-
 tests/intel/gem_exec_basic.c              |  5 ++-
 tests/intel/gem_exec_big.c                |  3 +-
 tests/intel/gem_exec_create.c             |  5 ++-
 tests/intel/gem_exec_fair.c               |  5 ++-
 tests/intel/gem_exec_fence.c              |  5 ++-
 tests/intel/gem_exec_flush.c              |  1 +
 tests/intel/gem_exec_gttfill.c            |  5 ++-
 tests/intel/gem_exec_latency.c            |  3 +-
 tests/intel/gem_exec_lut_handle.c         |  3 +-
 tests/intel/gem_exec_nop.c                |  5 ++-
 tests/intel/gem_exec_parallel.c           |  6 +--
 tests/intel/gem_exec_params.c             |  5 ++-
 tests/intel/gem_exec_reloc.c              |  3 +-
 tests/intel/gem_exec_schedule.c           |  5 ++-
 tests/intel/gem_exec_store.c              |  7 ++--
 tests/intel/gem_exec_suspend.c            |  5 ++-
 tests/intel/gem_exec_whisper.c            |  3 +-
 tests/intel/gem_fd_exhaustion.c           |  3 +-
 tests/intel/gem_fence_thrash.c            |  5 ++-
 tests/intel/gem_fence_upload.c            |  3 +-
 tests/intel/gem_fenced_exec_thrash.c      |  1 +
 tests/intel/gem_lut_handle.c              |  3 +-
 tests/intel/gem_partial_pwrite_pread.c    |  5 ++-
 tests/intel/gem_pipe_control_store_loop.c |  5 ++-
 tests/intel/gem_pread.c                   |  5 ++-
 tests/intel/gem_pread_after_blit.c        |  3 +-
 tests/intel/gem_pwrite.c                  |  3 +-
 tests/intel/gem_pwrite_snooped.c          |  1 +
 tests/intel/gem_pxp.c                     |  7 ++--
 tests/intel/gem_render_linear_blits.c     |  5 ++-
 tests/intel/gem_render_tiled_blits.c      |  5 ++-
 tests/intel/gem_request_retire.c          |  7 ++--
 tests/intel/gem_ringfill.c                |  7 ++--
 tests/intel/gem_shrink.c                  |  3 +-
 tests/intel/gem_softpin.c                 |  7 ++--
 tests/intel/gem_stress.c                  |  1 +
 tests/intel/gem_unref_active_buffers.c    |  7 ++--
 tests/intel/gem_watchdog.c                |  5 ++-
 tests/intel/gen7_exec_parse.c             |  3 +-
 tests/intel/i915_selftest.c               | 46 ++++++++++++++---------
 tests/intel/xe_exec_balancer.c            |  2 +-
 tests/intel/xe_exec_basic.c               |  1 +
 tests/intel/xe_exec_compute_mode.c        |  1 +
 tests/intel/xe_exec_fault_mode.c          |  1 +
 tests/intel/xe_exec_reset.c               |  5 ++-
 tests/intel/xe_exec_store.c               |  1 +
 tests/intel/xe_exec_threads.c             |  1 +
 63 files changed, 184 insertions(+), 114 deletions(-)

diff --git a/tests/intel/gem_bad_reloc.c b/tests/intel/gem_bad_reloc.c
index beb24c8b9..319c65583 100644
--- a/tests/intel/gem_bad_reloc.c
+++ b/tests/intel/gem_bad_reloc.c
@@ -45,10 +45,11 @@
  * TEST: gem bad reloc
  * Description: Simulates SNA behaviour using negative self-relocations for
  *		STATE_BASE_ADDRESS command packets.
- * Feature: cmd_submission
- * Sub-category: CMD submission
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: relocations
+ * Feature: cmd_submission
  *
  * SUBTEST: negative-reloc
  * Description: SNA behaviour is compressing batch buffer which leads to
diff --git a/tests/intel/gem_barrier_race.c b/tests/intel/gem_barrier_race.c
index 221579ad9..c05a2f3de 100644
--- a/tests/intel/gem_barrier_race.c
+++ b/tests/intel/gem_barrier_race.c
@@ -22,6 +22,7 @@
  * Description: Exercise engine barriers and their interaction with other subsystems
  * Feature: core
  * Category: Desktop client
+ * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: barrier
  * Test category: GEM_Legacy
diff --git a/tests/intel/gem_blits.c b/tests/intel/gem_blits.c
index c23ad528d..175c7f871 100644
--- a/tests/intel/gem_blits.c
+++ b/tests/intel/gem_blits.c
@@ -31,9 +31,10 @@
 /**
  * TEST: gem blits
  * Category: Infrastructure
- * Feature: blitter
- * Functionality: command streamer
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: command streamer
+ * Feature: blitter
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic
diff --git a/tests/intel/gem_close_race.c b/tests/intel/gem_close_race.c
index 11843170f..4a22d308a 100644
--- a/tests/intel/gem_close_race.c
+++ b/tests/intel/gem_close_race.c
@@ -52,9 +52,10 @@
  * TEST: gem close race
  * Description: Test try to race gem_close against workload submission.
  * Category: Infrastructure
- * Feature: synchronization feature
- * Functionality: driver handler
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: driver handler
+ * Feature: synchronization
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic-process
diff --git a/tests/intel/gem_ctx_bad_destroy.c b/tests/intel/gem_ctx_bad_destroy.c
index 67a391f23..85a45a488 100644
--- a/tests/intel/gem_ctx_bad_destroy.c
+++ b/tests/intel/gem_ctx_bad_destroy.c
@@ -36,11 +36,12 @@
 
 /**
  * TEST: gem ctx bad destroy
- * Category: Infrastructure
  * Description: Negative test cases for destroy contexts.
- * Feature: cmd_submission
- * Functionality: context
+ * Category: Infrastructure
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: context
+ * Feature: context
  * Test category: GEM_Legacy
  *
  * SUBTEST: double-destroy
diff --git a/tests/intel/gem_ctx_create.c b/tests/intel/gem_ctx_create.c
index 471070177..69f2783df 100644
--- a/tests/intel/gem_ctx_create.c
+++ b/tests/intel/gem_ctx_create.c
@@ -39,9 +39,10 @@
  * TEST: gem ctx create
  * Description: Test the context create ioctls
  * Category: Infrastructure
- * Feature: cmd_submission
- * Functionality: context
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: context
+ * Feature: context
  * Test category: GEM_Legacy
  *
  * SUBTEST: active
diff --git a/tests/intel/gem_ctx_engines.c b/tests/intel/gem_ctx_engines.c
index 76fc05a36..6cf799912 100644
--- a/tests/intel/gem_ctx_engines.c
+++ b/tests/intel/gem_ctx_engines.c
@@ -46,9 +46,10 @@
 /**
  * TEST: gem ctx engines
  * Category: Infrastructure
- * Feature: cmd_submission
- * Functionality: context
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: context
+ * Feature: context
  * Test category: GEM_Legacy
  *
  * SUBTEST: execute-allforone
diff --git a/tests/intel/gem_ctx_exec.c b/tests/intel/gem_ctx_exec.c
index 70aa5413c..930724227 100644
--- a/tests/intel/gem_ctx_exec.c
+++ b/tests/intel/gem_ctx_exec.c
@@ -51,9 +51,10 @@
  * TEST: gem ctx exec
  * Description: Test context batch buffer execution.
  * Category: Infrastructure
- * Feature: cmd_submission
- * Functionality: context
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: context
+ * Feature: context
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic
diff --git a/tests/intel/gem_ctx_shared.c b/tests/intel/gem_ctx_shared.c
index f0005ead7..bbb9f19c8 100644
--- a/tests/intel/gem_ctx_shared.c
+++ b/tests/intel/gem_ctx_shared.c
@@ -51,9 +51,10 @@
  * TEST: gem ctx shared
  * Description: Test shared contexts.
  * Category: Desktop client
- * Feature: context feature
- * Functionality: shared contex
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: shared contex
+ * Feature: context
  * Test category: GEM_Legacy
  *
  * SUBTEST: Q-in-order
diff --git a/tests/intel/gem_ctx_switch.c b/tests/intel/gem_ctx_switch.c
index 350efb69e..d87fcb46f 100644
--- a/tests/intel/gem_ctx_switch.c
+++ b/tests/intel/gem_ctx_switch.c
@@ -49,6 +49,7 @@
  * TEST: gem ctx switch
  * Feature: context feature
  * Category: Desktop client
+ * Mega feature: General Core features
  * Sub-category: CMD Submission
  * Functionality: context switching
  *
diff --git a/tests/intel/gem_evict_alignment.c b/tests/intel/gem_evict_alignment.c
index 0ccddcfe3..d3f02c8ac 100644
--- a/tests/intel/gem_evict_alignment.c
+++ b/tests/intel/gem_evict_alignment.c
@@ -50,8 +50,9 @@
 /**
  * TEST: gem evict alignment
  * Description: Run a couple of big batches to force the unbind on misalignment code.
- * Sub-category: CMD submission
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: misalignment
  *
  * SUBTEST: major-hang
diff --git a/tests/intel/gem_evict_everything.c b/tests/intel/gem_evict_everything.c
index 87338506d..5d8f30bd6 100644
--- a/tests/intel/gem_evict_everything.c
+++ b/tests/intel/gem_evict_everything.c
@@ -51,8 +51,9 @@
 /**
  * TEST: gem evict everything
  * Description: Run a couple of big batches to force the eviction code.
- * Sub-category: CMD submission
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: eviction
  *
  * SUBTEST: forked-interruptible
diff --git a/tests/intel/gem_exec_alignment.c b/tests/intel/gem_exec_alignment.c
index 6e5496166..45237e4f4 100644
--- a/tests/intel/gem_exec_alignment.c
+++ b/tests/intel/gem_exec_alignment.c
@@ -47,11 +47,12 @@
 #include "igt_types.h"
 /**
  * TEST: gem exec alignment
- * Category: Desktop client
  * Description: Exercises the basic execbuffer using object alignments
- * Feature: cmd_submission
- * Functionality: execbuf
+ * Category: Desktop client
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: execbuf
+ * Feature: cmd_submission
  * Test category: GEM_Legacy
  *
  * SUBTEST: forked
diff --git a/tests/intel/gem_exec_async.c b/tests/intel/gem_exec_async.c
index f09bc8692..f61517e76 100644
--- a/tests/intel/gem_exec_async.c
+++ b/tests/intel/gem_exec_async.c
@@ -27,10 +27,11 @@
 /**
  * TEST: gem exec async
  * Category: Infrastructure
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
+ * Functionality: concurent writes
  * Description: Check that we can issue concurrent writes across the engines.
  * Feature: cmd_submission
- * Functionality: concurent writes
- * Sub-category: CMD submission
  * Test category: GEM_Legacy
  *
  * SUBTEST: concurrent-writes
diff --git a/tests/intel/gem_exec_await.c b/tests/intel/gem_exec_await.c
index fcbca1547..3b496593b 100644
--- a/tests/intel/gem_exec_await.c
+++ b/tests/intel/gem_exec_await.c
@@ -46,9 +46,10 @@
 /**
  * TEST: gem exec await
  * Category: Infrastructure
- * Feature: cmd_submission
- * Functionality: requests
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: requests
+ * Feature: cmd_submission
  * Test category: GEM_Legacy
  *
  * SUBTEST: wide-all
diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
index 7504f3737..f946cf13b 100644
--- a/tests/intel/gem_exec_balancer.c
+++ b/tests/intel/gem_exec_balancer.c
@@ -42,9 +42,10 @@
  * TEST: gem exec balancer
  * Description: Exercise in-kernel load-balancing
  * Category: Desktop \ Server
- * Feature: cmd_submission, media_scalability
- * Functionality: load balancing
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: load balancing
+ * Feature: cmd_submission, media_scalability
  * Test category: Media & Compute
  *
  * SUBTEST: bonded-chain
diff --git a/tests/intel/gem_exec_basic.c b/tests/intel/gem_exec_basic.c
index 3982bccc6..515c117cf 100644
--- a/tests/intel/gem_exec_basic.c
+++ b/tests/intel/gem_exec_basic.c
@@ -29,9 +29,10 @@
  * TEST: gem exec basic
  * Description: Basic sanity check of execbuf-ioctl rings.
  * Category: Infrastructure
- * Feature: cmd_submission
- * Functionality: execbuf
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: execbuf
+ * Feature: cmd_submission
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic
diff --git a/tests/intel/gem_exec_big.c b/tests/intel/gem_exec_big.c
index d464440e9..ffdfb650c 100644
--- a/tests/intel/gem_exec_big.c
+++ b/tests/intel/gem_exec_big.c
@@ -53,8 +53,9 @@
  * Description: Run a large nop batch to stress test the error capture code.
  * Feature: cmd_submission
  * Category: Infrastructure
- * Functionality: large nop batch
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: large nop batch
  * Test category: GEM_Legacy
  *
  * SUBTEST: exhaustive
diff --git a/tests/intel/gem_exec_create.c b/tests/intel/gem_exec_create.c
index e9a3cdc04..0d4fa97ef 100644
--- a/tests/intel/gem_exec_create.c
+++ b/tests/intel/gem_exec_create.c
@@ -49,12 +49,13 @@
 /**
  * TEST: gem exec create
  * Category: Infrastructure
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
+ * Functionality: buffer management
  * Description: This test overloads the driver with transient active objects
  *		and checks if we don't kill the system under the memory pressure
  *		some of the symptoms this test look for include mysterious hangs.
  * Feature: cmd_submission
- * Functionality: buffer management
- * Sub-category: CMD submission
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic
diff --git a/tests/intel/gem_exec_fair.c b/tests/intel/gem_exec_fair.c
index e71fa2f0d..142da4002 100644
--- a/tests/intel/gem_exec_fair.c
+++ b/tests/intel/gem_exec_fair.c
@@ -29,10 +29,11 @@
 /**
  * TEST: gem exec fair
  * Description: Check that GPU time and execution order is fairly distributed across clients
- * Feature: cmd_submission
- * Sub-category: CMD submission
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: multi-client systems
+ * Feature: cmd_submission
  *
  * SUBTEST: basic-deadline
  *
diff --git a/tests/intel/gem_exec_fence.c b/tests/intel/gem_exec_fence.c
index e4263b3f9..8cce3a2dc 100644
--- a/tests/intel/gem_exec_fence.c
+++ b/tests/intel/gem_exec_fence.c
@@ -39,9 +39,10 @@
  * TEST: gem exec fence
  * Description: Check that execbuf waits for explicit fences
  * Category: Infrastructure
- * Feature: cmd_submission, synchronization feature
- * Functionality: semaphore
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: semaphore
+ * Feature: cmd_submission, synchronization
  * Test category: GEM_Legacy
  *
  * SUBTEST: await-hang
diff --git a/tests/intel/gem_exec_flush.c b/tests/intel/gem_exec_flush.c
index 5e2804f7d..1151628bd 100644
--- a/tests/intel/gem_exec_flush.c
+++ b/tests/intel/gem_exec_flush.c
@@ -31,6 +31,7 @@
 /**
  * TEST: gem exec flush
  * Description: Basic check of flushing after batches
+ * Mega feature: General Core features
  * Sub-category: CMD submission
  * Category: Desktop client
  * Functionality: execbuf
diff --git a/tests/intel/gem_exec_gttfill.c b/tests/intel/gem_exec_gttfill.c
index e11580b40..db414c780 100644
--- a/tests/intel/gem_exec_gttfill.c
+++ b/tests/intel/gem_exec_gttfill.c
@@ -30,9 +30,10 @@
  * TEST: gem exec gttfill
  * Description: Fill the GTT with batches.
  * Category: Infrastructure
- * Feature: cmd_submission, gtt
- * Functionality: execbuf
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: execbuf
+ * Feature: cmd_submission, gtt
  * Test category: GEM_Legacy
  *
  * SUBTEST: all-engines
diff --git a/tests/intel/gem_exec_latency.c b/tests/intel/gem_exec_latency.c
index b9d086afc..08ad78091 100644
--- a/tests/intel/gem_exec_latency.c
+++ b/tests/intel/gem_exec_latency.c
@@ -50,9 +50,10 @@
 #include "i915/gem_create.h"
 /**
  * TEST: gem exec latency
+ * Category: Desktop client
+ * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: execbuf
- * Category: Desktop client
  *
  * SUBTEST: context-preempt
  *
diff --git a/tests/intel/gem_exec_lut_handle.c b/tests/intel/gem_exec_lut_handle.c
index ff37a9f0e..2aba9ffed 100644
--- a/tests/intel/gem_exec_lut_handle.c
+++ b/tests/intel/gem_exec_lut_handle.c
@@ -43,8 +43,9 @@
 /**
  * TEST: gem exec lut handle
  * Description: Exercises the basic execbuffer using the handle LUT interface.
- * Sub-category: CMD submission
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: execbuf
  *
  * SUBTEST:
diff --git a/tests/intel/gem_exec_nop.c b/tests/intel/gem_exec_nop.c
index 6c547a412..5ffd75bf6 100644
--- a/tests/intel/gem_exec_nop.c
+++ b/tests/intel/gem_exec_nop.c
@@ -51,9 +51,10 @@
 /**
  * TEST: gem exec nop
  * Category: Infrastructure
- * Feature: cmd_submission
- * Functionality: execbuf
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: execbuf
+ * Feature: cmd_submission
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic-parallel
diff --git a/tests/intel/gem_exec_parallel.c b/tests/intel/gem_exec_parallel.c
index cb9f0e33d..8d7a5a185 100644
--- a/tests/intel/gem_exec_parallel.c
+++ b/tests/intel/gem_exec_parallel.c
@@ -37,10 +37,10 @@
  * TEST: gem exec parallel
  * Description: Exercise filling buffers by many clients working in parallel.
  * Category: Infrastructure
- * Description: Check basic functionality per engine.
- * Feature: cmd_submission
- * Functionality: parallel clients
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: parallel clients
+ * Feature: cmd_submission
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic
diff --git a/tests/intel/gem_exec_params.c b/tests/intel/gem_exec_params.c
index b2f8fb247..18651c9fb 100644
--- a/tests/intel/gem_exec_params.c
+++ b/tests/intel/gem_exec_params.c
@@ -47,9 +47,10 @@
 /**
  * TEST: gem exec params
  * Category: Desktop client
- * Feature: cmd_submission
- * Functionality: execbuf
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: execbuf
+ * Feature: cmd_submission
  * Test category: GEM_Legacy
  *
  * SUBTEST: DR1-dirt
diff --git a/tests/intel/gem_exec_reloc.c b/tests/intel/gem_exec_reloc.c
index c7f7db27a..692811057 100644
--- a/tests/intel/gem_exec_reloc.c
+++ b/tests/intel/gem_exec_reloc.c
@@ -34,8 +34,9 @@
 /**
  * TEST: gem exec reloc
  * Description: Basic sanity check of execbuf-ioctl relocations.
- * Sub-category: CMD submission
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: relocations
  *
  * SUBTEST: basic-active
diff --git a/tests/intel/gem_exec_schedule.c b/tests/intel/gem_exec_schedule.c
index 70243e72b..0d2c2c3f2 100644
--- a/tests/intel/gem_exec_schedule.c
+++ b/tests/intel/gem_exec_schedule.c
@@ -48,9 +48,10 @@
  * TEST: gem exec schedule
  * Description: Check that we can control the order of execution
  * Category: Desktop \ Server
- * Feature: cmd_submission
- * Functionality: execution order
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: execution order
+ * Feature: cmd_submission
  * Test category: GEM_Legacy
  *
  * SUBTEST: deep
diff --git a/tests/intel/gem_exec_store.c b/tests/intel/gem_exec_store.c
index 3f44f2aa6..c480555e8 100644
--- a/tests/intel/gem_exec_store.c
+++ b/tests/intel/gem_exec_store.c
@@ -36,11 +36,12 @@
 #include "igt_gt.h"
 /**
  * TEST: gem exec store
- * Category: Infrastructure
  * Description: Exercise store dword functionality using execbuf-ioctl
- * Feature: cmd_submission
- * Functionality: coherency
+ * Category: Infrastructure
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: coherency
+ * Feature: cmd_submission
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic
diff --git a/tests/intel/gem_exec_suspend.c b/tests/intel/gem_exec_suspend.c
index 28d51996e..8dd23ee8c 100644
--- a/tests/intel/gem_exec_suspend.c
+++ b/tests/intel/gem_exec_suspend.c
@@ -39,10 +39,11 @@
 /**
  * TEST: gem exec suspend
  * Description: Exercise simple execbufs runs across various suspend/resume cycles.
- * Feature: cmd_submission, suspend feature
- * Sub-category: CMD submission
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: suspend
+ * Feature: cmd_submission, suspend
  *
  * SUBTEST: basic
  * Description: Check basic functionality without any suspend/resume cycle.
diff --git a/tests/intel/gem_exec_whisper.c b/tests/intel/gem_exec_whisper.c
index b813ea832..21ebc5b3e 100644
--- a/tests/intel/gem_exec_whisper.c
+++ b/tests/intel/gem_exec_whisper.c
@@ -41,8 +41,9 @@
  * TEST: gem exec whisper
  * Feature: cmd_submission
  * Category: Infrastructure
- * Functionality: execbuf
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: execbuf
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic-contexts
diff --git a/tests/intel/gem_fd_exhaustion.c b/tests/intel/gem_fd_exhaustion.c
index 14270897d..4b483863e 100644
--- a/tests/intel/gem_fd_exhaustion.c
+++ b/tests/intel/gem_fd_exhaustion.c
@@ -36,8 +36,9 @@
 #include "i915/gem_create.h"
 /**
  * TEST: gem fd exhaustion
- * Sub-category: CMD submission
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: fd exhaustion
  *
  * SUBTEST:
diff --git a/tests/intel/gem_fence_thrash.c b/tests/intel/gem_fence_thrash.c
index c7c9460c6..0517c0316 100644
--- a/tests/intel/gem_fence_thrash.c
+++ b/tests/intel/gem_fence_thrash.c
@@ -45,10 +45,11 @@
 #include "igt_x86.h"
 /**
  * TEST: gem fence thrash
- * Feature: gtt, synchronization feature
- * Sub-category: CMD submission
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: fences
+ * Feature: gtt, synchronization
  *
  * SUBTEST: bo-copy
  *
diff --git a/tests/intel/gem_fence_upload.c b/tests/intel/gem_fence_upload.c
index 8b92d3976..46a62a7ee 100644
--- a/tests/intel/gem_fence_upload.c
+++ b/tests/intel/gem_fence_upload.c
@@ -43,8 +43,9 @@
 #include "i915/gem_create.h"
 /**
  * TEST: gem fence upload
- * Sub-category: CMD submission
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: fences
  *
  * SUBTEST: performance
diff --git a/tests/intel/gem_fenced_exec_thrash.c b/tests/intel/gem_fenced_exec_thrash.c
index 614967615..94e5632c1 100644
--- a/tests/intel/gem_fenced_exec_thrash.c
+++ b/tests/intel/gem_fenced_exec_thrash.c
@@ -37,6 +37,7 @@
  * TEST: gem fenced exec thrash
  * Description: Test execbuf fence accounting.
  * Category: Desktop client
+ * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: fences
  * Feature: gtt, synchronization feature
diff --git a/tests/intel/gem_lut_handle.c b/tests/intel/gem_lut_handle.c
index b2911b3b6..be75154fc 100644
--- a/tests/intel/gem_lut_handle.c
+++ b/tests/intel/gem_lut_handle.c
@@ -42,8 +42,9 @@
 /**
  * TEST: gem lut handle
  * Description: Exercises the basic execbuffer using the handle LUT interface.
- * Sub-category: CMD submission
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: execbuf
  *
  * SUBTEST:
diff --git a/tests/intel/gem_partial_pwrite_pread.c b/tests/intel/gem_partial_pwrite_pread.c
index cb7737ffc..2787886ee 100644
--- a/tests/intel/gem_partial_pwrite_pread.c
+++ b/tests/intel/gem_partial_pwrite_pread.c
@@ -41,10 +41,11 @@
 /**
  * TEST: gem partial pwrite pread
  * Description: Test pwrite/pread consistency when touching partial cachelines.
- * Feature: caching, mapping
- * Sub-category: CMD submission
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: pread/pwrite
+ * Feature: caching, mapping
  *
  * SUBTEST: reads
  * Description:
diff --git a/tests/intel/gem_pipe_control_store_loop.c b/tests/intel/gem_pipe_control_store_loop.c
index e79cef60f..0a16574af 100644
--- a/tests/intel/gem_pipe_control_store_loop.c
+++ b/tests/intel/gem_pipe_control_store_loop.c
@@ -46,10 +46,11 @@
 /**
  * TEST: gem pipe control store loop
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
+ * Functionality: coherency
  * Description: Test (TLB-)Coherency of pipe_control QW writes.
  * Feature: cmd_submission
- * Functionality: coherency
- * Sub-category: CMD submission
  * Test category: GEM_Legacy
  *
  * SUBTEST: fresh-buffer
diff --git a/tests/intel/gem_pread.c b/tests/intel/gem_pread.c
index e5a7b48d3..bf77049e1 100644
--- a/tests/intel/gem_pread.c
+++ b/tests/intel/gem_pread.c
@@ -47,10 +47,11 @@
 #include "igt_vgem.h"
 /**
  * TEST: gem pread
- * Feature: mapping
- * Sub-category: CMD submission
+ * Mega feature: General Core features
  * Category: Desktop client
+ * Sub-category: CMD submission
  * Functionality: pread
+ * Feature: mapping
  *
  * SUBTEST: bench
  *
diff --git a/tests/intel/gem_pread_after_blit.c b/tests/intel/gem_pread_after_blit.c
index f6a1b625b..e30d2b467 100644
--- a/tests/intel/gem_pread_after_blit.c
+++ b/tests/intel/gem_pread_after_blit.c
@@ -50,8 +50,9 @@
 /**
  * TEST: gem pread after blit
  * Description: Test pread behavior when getting values out of just-drawn-to buffers.
- * Sub-category: CMD submission
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: pread
  *
  * SUBTEST: default-hang
diff --git a/tests/intel/gem_pwrite.c b/tests/intel/gem_pwrite.c
index a617a9999..3497b3932 100644
--- a/tests/intel/gem_pwrite.c
+++ b/tests/intel/gem_pwrite.c
@@ -49,8 +49,9 @@
 /**
  * TEST: gem pwrite
  * Feature: mapping
- * Sub-category: CMD submission
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: pwrite
  *
  * SUBTEST: basic-exhaustion
diff --git a/tests/intel/gem_pwrite_snooped.c b/tests/intel/gem_pwrite_snooped.c
index 19df2fd3d..be3595439 100644
--- a/tests/intel/gem_pwrite_snooped.c
+++ b/tests/intel/gem_pwrite_snooped.c
@@ -46,6 +46,7 @@
  * Functionality: pwrite
  *
  * SUBTEST:
+ * Mega feature: General Core features
  */
 
 IGT_TEST_DESCRIPTION(
diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index f90e92abd..79d17f99c 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -10,10 +10,11 @@
 /**
  * TEST: gem pxp
  * Description: Test PXP that manages protected content through arbitrated HW-PXP-session
- * Feature: Protected Xe Path
- * Functionality: pxp
- * Sub-category: Power management
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: driver
+ * Functionality: pxp
+ * Feature: Protected Xe Path
  *
  * SUBTEST: create-protected-buffer
  *
diff --git a/tests/intel/gem_render_linear_blits.c b/tests/intel/gem_render_linear_blits.c
index 121d1b2a8..cace14843 100644
--- a/tests/intel/gem_render_linear_blits.c
+++ b/tests/intel/gem_render_linear_blits.c
@@ -51,10 +51,11 @@
 #include "igt.h"
 /**
  * TEST: gem render linear blits
- * Feature: mapping
- * Sub-category: CMD submission
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: render blits
+ * Feature: mapping
  *
  * SUBTEST: aperture-shrink
  *
diff --git a/tests/intel/gem_render_tiled_blits.c b/tests/intel/gem_render_tiled_blits.c
index 4b49c2a36..14b06c181 100644
--- a/tests/intel/gem_render_tiled_blits.c
+++ b/tests/intel/gem_render_tiled_blits.c
@@ -54,10 +54,11 @@
  *   Tests performs cyclic forward, backward and random blits on tiled buffer
  *   objects using render engine with various working set sizes and compares
  *   outputs with expected ones.
- * Feature: mapping
- * Sub-category: CMD submission
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: render blits
+ * Feature: mapping
  *
  * SUBTEST: aperture-shrink
  * Description:
diff --git a/tests/intel/gem_request_retire.c b/tests/intel/gem_request_retire.c
index d86972536..60975279d 100644
--- a/tests/intel/gem_request_retire.c
+++ b/tests/intel/gem_request_retire.c
@@ -51,12 +51,13 @@
 #include "igt_types.h"
 /**
  * TEST: gem request retire
- * Category: Infrastructure
  * Description: Collection of tests targeting request retirement code paths.
- * Feature: cmd_submission
- * Functionality: requests
+ * Category: Infrastructure
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: requests
  * Test category: GEM_Legacy
+ * Feature: cmd_submission
  *
  * SUBTEST: retire-vma-not-inactive
  */
diff --git a/tests/intel/gem_ringfill.c b/tests/intel/gem_ringfill.c
index 84060c474..e64c98b4b 100644
--- a/tests/intel/gem_ringfill.c
+++ b/tests/intel/gem_ringfill.c
@@ -43,14 +43,15 @@
 #include <sys/ioctl.h>
 /**
  * TEST: gem ringfill
- * Category: Infrastructure
  * Description:
  *   Exercise many tiny batchbuffer operations, in the hope of catching failure to manage the ring
  *   properly near full.
- * Feature: cmd_submission
- * Functionality: execbuf
+ * Category: Infrastructure
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: execbuf
  * Test category: GEM_Legacy
+ * Feature: cmd_submission
  *
  * SUBTEST: basic-all
  * Description: Basic check to fill the ring up to maximum on all engines
diff --git a/tests/intel/gem_shrink.c b/tests/intel/gem_shrink.c
index f6df21c8d..ee373bf4d 100644
--- a/tests/intel/gem_shrink.c
+++ b/tests/intel/gem_shrink.c
@@ -37,8 +37,9 @@
  * TEST: gem shrink
  * Feature: mapping
  * Category: Desktop client
- * Functionality: buffer management
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: buffer management
  * Test category: GEM_Legacy
  *
  * SUBTEST: execbuf1
diff --git a/tests/intel/gem_softpin.c b/tests/intel/gem_softpin.c
index ab23ca7d5..9bea97d39 100644
--- a/tests/intel/gem_softpin.c
+++ b/tests/intel/gem_softpin.c
@@ -33,14 +33,15 @@
 #include "intel_allocator.h"
 /**
  * TEST: gem softpin
- * Category: Infrastructure
  * Description:
  *   Tests softpin feature with normal usage, invalid inputs scenarios and couple of eviction
  *   tests which copy buffers between CPU and GPU.
- * Feature: mapping
- * Functionality: softpin
+ * Category: Infrastructure
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: softpin
  * Test category: GEM_Legacy
+ * Feature: mapping
  *
  * SUBTEST: 32b-excludes-last-page
  * Description: Check the last 32b page is excluded.
diff --git a/tests/intel/gem_stress.c b/tests/intel/gem_stress.c
index fc1ff2519..9ee7a4210 100644
--- a/tests/intel/gem_stress.c
+++ b/tests/intel/gem_stress.c
@@ -65,6 +65,7 @@
  * TEST: gem stress
  * Description: General gem coherency test.
  * Category: Desktop client
+ * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: coherency
  *
diff --git a/tests/intel/gem_unref_active_buffers.c b/tests/intel/gem_unref_active_buffers.c
index f8138c7ac..1e04194f2 100644
--- a/tests/intel/gem_unref_active_buffers.c
+++ b/tests/intel/gem_unref_active_buffers.c
@@ -43,11 +43,12 @@
 #include "i915/gem_create.h"
 /**
  * TEST: gem unref active buffers
- * Category: Infrastructure
  * Description: Test unreferencing of active buffers.
- * Feature: cmd_submission
- * Functionality: buffer management
+ * Category: Infrastructure
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: buffer management
+ * Feature: cmd_submission
  * Test category: GEM_Legacy
  *
  * SUBTEST:
diff --git a/tests/intel/gem_watchdog.c b/tests/intel/gem_watchdog.c
index b66667f46..0d03c7f05 100644
--- a/tests/intel/gem_watchdog.c
+++ b/tests/intel/gem_watchdog.c
@@ -37,10 +37,11 @@
 #include "sw_sync.h"
 /**
  * TEST: gem watchdog
- * Feature: gem_core
- * Sub-category: CMD submission
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: fences
+ * Feature: gem_core
  *
  * SUBTEST: default-physical
  *
diff --git a/tests/intel/gen7_exec_parse.c b/tests/intel/gen7_exec_parse.c
index f670f9ce1..274a1ac30 100644
--- a/tests/intel/gen7_exec_parse.c
+++ b/tests/intel/gen7_exec_parse.c
@@ -37,8 +37,9 @@
 /**
  * TEST: gen7 exec parse
  * Feature: cmd_submission, command_parser
- * Sub-category: CMD submission
  * Category: Desktop client
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: command parser
  *
  * SUBTEST: basic-allocation
diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index 046c4004e..ce43042c8 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -85,53 +85,59 @@
  * Sub-category: Memory management
  *
  * SUBTEST: live@execlists
- * Category: Selftest
  * Description: command submission backend
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: execlists
  * Test category: i915
- * Sub-category: CMD submission
  *
  * SUBTEST: live@gem
  * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: execbuf
  * Test category: i915
- * Sub-category: CMD submission
  *
  * SUBTEST: live@gem_contexts
- * Category: Selftest
  * Description: User isolation and execution at the context level
- * Functionality: context
+ * Category: Selftest
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: context
  * Test category: GEM_Legacy
- * Test category: i915 / HW
  *
  * SUBTEST: live@gem_execbuf
- * Category: Selftest
  * Description: command submission support
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: execbuf
  * Test category: i915
- * Sub-category: CMD submission
  *
  * SUBTEST: live@gt_ccs_mode
- * Category: Selftest
  * Description: Multi-ccs internal validation
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: multii-ccs
  * Test category: i915
- * Sub-category: CMD submission
  *
  * SUBTEST: live@gt_contexts
- * Category: Selftest
  * Description: HW isolation and HW context validation
- * Functionality: context
+ * Category: Selftest
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: context
  * Test category: HW
  *
  * SUBTEST: live@gt_engines
- * Category: Selftest
  * Description: command submission topology validation
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: command submission topology
  * Test category: i915
- * Sub-category: CMD submission
  *
  * SUBTEST: live@gt_gtt
  * Category: Selftest
@@ -148,10 +154,11 @@
  * Sub-category: Reset
  *
  * SUBTEST: live@gt_lrc
- * Category: Selftest
  * Description: HW isolation and HW context validation
- * Functionality: context
+ * Category: Selftest
+ * Mega feature: General Core features
  * Sub-category: CMD submission
+ * Functionality: context
  * Test category: HW
  *
  * SUBTEST: live@gt_mocs
@@ -259,6 +266,7 @@
  *
  * SUBTEST: live@memory_region_cross_tile
  * Category: Selftest
+ * Mega feature: General Core features
  * Description: Multi-tile memory topology validation
  * Functionality: memory topology
  * Sub-category: MultiTile
@@ -298,11 +306,12 @@
  * Sub-category: MultiTile
  *
  * SUBTEST: live@requests
- * Category: Selftest
  * Description: Validation of internal i915 command submission interface
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
  * Functionality: command submission interface
  * Test category: i915
- * Sub-category: CMD submission
  *
  * SUBTEST: live@reset
  * Category: Selftest
@@ -320,6 +329,7 @@
  *
  * SUBTEST: live@scheduler
  * Category: Selftest
+ * Mega feature: General Core features
  * Sub-category: CMD Submission
  * Functionality: scheduler
  *
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 8ce8cbf7f..9d4de3206 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -6,6 +6,7 @@
 /**
  * TEST: Basic tests for execbuf functionality for virtual and parallel exec_queues
  * Category: Hardware building block
+ * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: virtual and parallel exec_queues
  * Test category: functionality test
@@ -358,7 +359,6 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
  * Description: Run compute mode virtual exec_queue arg[1] test on many exec_queues
  * Test category: stress test
  *
- *
  * SUBTEST: no-exec-cm-%s
  * Description: Run compute mode virtual exec_queue arg[1] no-exec test
  * Test category: functionality test
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index 5210e6730..56a5f2b5a 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -6,6 +6,7 @@
 /**
  * TEST: Basic tests for execbuf functionality
  * Category: Hardware building block
+ * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: exec_queues
  */
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index a73a7343c..13265b9c0 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -6,6 +6,7 @@
 /**
  * TEST: Basic tests for execbuf compute machine functionality
  * Category: Hardware building block
+ * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: compute test
  */
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 40fe1743e..4151b4aa6 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -6,6 +6,7 @@
 /**
  * TEST: Basic tests for execbuf functionality for virtual and parallel exec_queues
  * Category: Hardware building block
+ * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: fault mode
  * GPU requirements: GPU needs support for DRM_XE_VM_CREATE_FLAG_FAULT_MODE
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 8d731e689..291ca4942 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -6,8 +6,9 @@
 /**
  * TEST: Basic tests for execbuf functionality for virtual and parallel exec_queues
  * Category: Hardware building block
- * Sub-category: Reset
- * Functionality: gt reset
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
+ * Functionality: reset
  * Test category: functionality test
  */
 
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 728ce826b..4d4495791 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -15,6 +15,7 @@
 /**
  * TEST: Tests to verify store dword functionality.
  * Category: Software building block
+ * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: intel-bb
  * Test category: functionality test
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 1e80842b9..0c6150480 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -6,6 +6,7 @@
 /**
  * TEST: Basic tests for execbuf functionality
  * Category: Hardware building block
+ * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: multi-threads
  * Test category: functionality test
-- 
2.34.1

