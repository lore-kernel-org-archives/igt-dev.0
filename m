Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A927C54E60
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 14:35:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F9E10FBAD;
	Thu, 14 Mar 2024 14:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFe8x3Xm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA9D10FBAD
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710426936; x=1741962936;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6b8v+s159sJPHxs/81ymniP0PE5kdaunraxm+wQVwW8=;
 b=ZFe8x3XmnQrJE5TFDN4fPuukp98PY1jsdtp6Z4SM0K4u739JxXb07AJs
 ILOSSWLzu58MAMq2pczHhDAp7RTSj5G3Zj/4ZJiFj+7hf9bvIOxvt4Fv7
 WLXvs1CwP9McJRjH7wNEelGNo4t1iq0m46tBu+SQLyQ1oslb1D4EUeZ8k
 RFU71mNRB3U5vRBTWspo6d4/2UaIpNUugtnpjcoqzuVqhbVYfC+cdIKJH
 qC9YaHecgPwTAp071PvRxJbHivTkGeyrXnglckPRQ9WXfxmDj/iPPOh2c
 aeIPFMp3kRVzgL3mSMK2163KNEAUHUqCXGlh/yGwmRzKXw5c1saDrOhq2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="16697504"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16697504"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:35:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12233705"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:35:33 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v4 03/25] tests/intel: Introduce CMD submission
 subcategory
Date: Thu, 14 Mar 2024 14:34:33 +0000
Message-Id: <20240314143455.1436688-4-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
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

Let's have 'CMD submission' subcategory to explicitly show where we are
testing cmd submission.
In some cases change subcategory i915 to CMD submission.

v2: Make Sub-category/Functionality/Feature unique. (Kamil)

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/gem_bad_reloc.c               | 14 ++++++++------
 tests/intel/gem_barrier_race.c            |  3 +++
 tests/intel/gem_ctx_bad_destroy.c         |  4 ++--
 tests/intel/gem_ctx_create.c              |  2 +-
 tests/intel/gem_ctx_engines.c             |  4 ++--
 tests/intel/gem_ctx_exec.c                |  4 ++--
 tests/intel/gem_ctx_shared.c              |  2 +-
 tests/intel/gem_ctx_switch.c              |  3 +++
 tests/intel/gem_evict_alignment.c         |  3 +++
 tests/intel/gem_evict_everything.c        |  3 +++
 tests/intel/gem_exec_alignment.c          |  4 ++--
 tests/intel/gem_exec_async.c              |  4 ++--
 tests/intel/gem_exec_await.c              |  4 ++--
 tests/intel/gem_exec_endless.c            |  6 +++---
 tests/intel/gem_exec_fair.c               |  3 +++
 tests/intel/gem_exec_flush.c              |  3 +++
 tests/intel/gem_exec_latency.c            |  3 +++
 tests/intel/gem_exec_lut_handle.c         |  3 +++
 tests/intel/gem_exec_nop.c                |  4 ++--
 tests/intel/gem_exec_reloc.c              |  3 +++
 tests/intel/gem_exec_store.c              | 18 ++++++++++--------
 tests/intel/gem_exec_suspend.c            |  3 +++
 tests/intel/gem_exec_whisper.c            |  4 ++--
 tests/intel/gem_fd_exhaustion.c           |  3 +++
 tests/intel/gem_fence_thrash.c            |  3 +++
 tests/intel/gem_fence_upload.c            |  3 +++
 tests/intel/gem_fenced_exec_thrash.c      |  3 +++
 tests/intel/gem_lut_handle.c              |  3 +++
 tests/intel/gem_partial_pwrite_pread.c    |  3 +++
 tests/intel/gem_pipe_control_store_loop.c |  4 ++--
 tests/intel/gem_pread.c                   |  3 +++
 tests/intel/gem_pread_after_blit.c        |  3 +++
 tests/intel/gem_pwrite.c                  |  3 +++
 tests/intel/gem_pwrite_snooped.c          |  3 +++
 tests/intel/gem_render_linear_blits.c     |  3 +++
 tests/intel/gem_render_tiled_blits.c      |  3 +++
 tests/intel/gem_request_retire.c          |  6 +++---
 tests/intel/gem_ringfill.c                |  4 ++--
 tests/intel/gem_stress.c                  |  3 +++
 tests/intel/gem_unref_active_buffers.c    |  2 +-
 tests/intel/gem_watchdog.c                |  3 +++
 tests/intel/gen7_exec_parse.c             |  3 +++
 42 files changed, 122 insertions(+), 43 deletions(-)

diff --git a/tests/intel/gem_bad_reloc.c b/tests/intel/gem_bad_reloc.c
index b058639ea..8e17d6630 100644
--- a/tests/intel/gem_bad_reloc.c
+++ b/tests/intel/gem_bad_reloc.c
@@ -43,16 +43,18 @@
 #include "igt.h"
 /**
  * TEST: gem bad reloc
- * Description:
- *   Simulates SNA behaviour using negative self-relocations for STATE_BASE_ADDRESS command
- *   packets.
+ * Description: Simulates SNA behaviour using negative self-relocations for
+ *		STATE_BASE_ADDRESS command packets.
  * Feature: cmd_submission
+ * Sub-category: CMD submission
+ * Category: Desktop client
+ * Functionality: relocations
  * Run type: FULL
  *
  * SUBTEST: negative-reloc
- * Description:
- *   SNA behaviour is compressing batch buffer which leads to negative relocation deltas.
- *   Negative self-relocation happening with real offset 0.
+ * Description: SNA behaviour is compressing batch buffer which leads to
+ *		negative relocation deltas. Negative self-relocation happening
+ *		with real offset 0.
  *
  * SUBTEST: negative-reloc-bltcopy
  * Description: Exercising blitter operation with negative reloc.
diff --git a/tests/intel/gem_barrier_race.c b/tests/intel/gem_barrier_race.c
index 591ddc222..7f434a68c 100644
--- a/tests/intel/gem_barrier_race.c
+++ b/tests/intel/gem_barrier_race.c
@@ -21,6 +21,9 @@
  * TEST: gem barrier race
  * Description: Exercise engine barriers and their interaction with other subsystems
  * Feature: core
+ * Category: Desktop client
+ * Sub-category: CMD submission
+ * Functionality: barrier
  * Run type: FULL
  * Test category: GEM_Legacy
  *
diff --git a/tests/intel/gem_ctx_bad_destroy.c b/tests/intel/gem_ctx_bad_destroy.c
index 65f6b5583..2b1127833 100644
--- a/tests/intel/gem_ctx_bad_destroy.c
+++ b/tests/intel/gem_ctx_bad_destroy.c
@@ -39,9 +39,9 @@
  * Category: Infrastructure
  * Description: Negative test cases for destroy contexts.
  * Feature: context
- * Functionality: context management
+ * Functionality: context
  * Run type: FULL
- * Sub-category: i915
+ * Sub-category: CMD submission
  * Test category: GEM_Legacy
  *
  * SUBTEST: double-destroy
diff --git a/tests/intel/gem_ctx_create.c b/tests/intel/gem_ctx_create.c
index 5fb0f9a1f..2f3a99ac6 100644
--- a/tests/intel/gem_ctx_create.c
+++ b/tests/intel/gem_ctx_create.c
@@ -41,7 +41,7 @@
  * Category: Infrastructure
  * Feature: context
  * Functionality: context
- * Sub-category: Context
+ * Sub-category: CMD submission
  * Test category: GEM_Legacy
  * Run type: FULL
  *
diff --git a/tests/intel/gem_ctx_engines.c b/tests/intel/gem_ctx_engines.c
index 61718494e..b82c499b5 100644
--- a/tests/intel/gem_ctx_engines.c
+++ b/tests/intel/gem_ctx_engines.c
@@ -47,9 +47,9 @@
  * TEST: gem ctx engines
  * Category: Infrastructure
  * Feature: context
- * Functionality: context management
+ * Functionality: context
  * Run type: FULL
- * Sub-category: i915
+ * Sub-category: CMD submission
  * Test category: GEM_Legacy
  *
  * SUBTEST: execute-allforone
diff --git a/tests/intel/gem_ctx_exec.c b/tests/intel/gem_ctx_exec.c
index 20d42d5b0..7912bedf2 100644
--- a/tests/intel/gem_ctx_exec.c
+++ b/tests/intel/gem_ctx_exec.c
@@ -52,8 +52,8 @@
  * Description: Test context batch buffer execution.
  * Category: Infrastructure
  * Feature: context
- * Functionality: execbuf
- * Sub-category: Context
+ * Functionality: context
+ * Sub-category: CMD submission
  * Test category: GEM_Legacy
  * Run type: FULL
  *
diff --git a/tests/intel/gem_ctx_shared.c b/tests/intel/gem_ctx_shared.c
index 8b045e20a..bf728673c 100644
--- a/tests/intel/gem_ctx_shared.c
+++ b/tests/intel/gem_ctx_shared.c
@@ -53,7 +53,7 @@
  * Category: Desktop client
  * Feature: context
  * Functionality: shared contex
- * Sub-category: Context
+ * Sub-category: CMD submission
  * Test category: GEM_Legacy
  * Run type: FULL
  *
diff --git a/tests/intel/gem_ctx_switch.c b/tests/intel/gem_ctx_switch.c
index f94a41bec..483aede20 100644
--- a/tests/intel/gem_ctx_switch.c
+++ b/tests/intel/gem_ctx_switch.c
@@ -48,6 +48,9 @@
 /**
  * TEST: gem ctx switch
  * Feature: context
+ * Category: Desktop client
+ * Sub-category: CMD Submission
+ * Functionality: context switching
  * Run type: FULL
  *
  * SUBTEST: all-heavy
diff --git a/tests/intel/gem_evict_alignment.c b/tests/intel/gem_evict_alignment.c
index 4a9507a06..7cd11d169 100644
--- a/tests/intel/gem_evict_alignment.c
+++ b/tests/intel/gem_evict_alignment.c
@@ -50,6 +50,9 @@
 /**
  * TEST: gem evict alignment
  * Description: Run a couple of big batches to force the unbind on misalignment code.
+ * Sub-category: CMD submission
+ * Category: Desktop client
+ * Functionality: misalignment
  * Run type: FULL
  *
  * SUBTEST: major-hang
diff --git a/tests/intel/gem_evict_everything.c b/tests/intel/gem_evict_everything.c
index f0f356cc3..578018e4d 100644
--- a/tests/intel/gem_evict_everything.c
+++ b/tests/intel/gem_evict_everything.c
@@ -51,6 +51,9 @@
 /**
  * TEST: gem evict everything
  * Description: Run a couple of big batches to force the eviction code.
+ * Sub-category: CMD submission
+ * Category: Desktop client
+ * Functionality: eviction
  * Run type: FULL
  *
  * SUBTEST: forked-interruptible
diff --git a/tests/intel/gem_exec_alignment.c b/tests/intel/gem_exec_alignment.c
index 10732fec5..40ff15030 100644
--- a/tests/intel/gem_exec_alignment.c
+++ b/tests/intel/gem_exec_alignment.c
@@ -50,9 +50,9 @@
  * Category: Desktop client
  * Description: Exercises the basic execbuffer using object alignments
  * Feature: cmd_submission
- * Functionality: command submission
+ * Functionality: execbuf
  * Run type: FULL
- * Sub-category: i915
+ * Sub-category: CMD submission
  * Test category: GEM_Legacy
  *
  * SUBTEST: forked
diff --git a/tests/intel/gem_exec_async.c b/tests/intel/gem_exec_async.c
index 1497c5c6c..8db8fbf3c 100644
--- a/tests/intel/gem_exec_async.c
+++ b/tests/intel/gem_exec_async.c
@@ -29,9 +29,9 @@
  * Category: Infrastructure
  * Description: Check that we can issue concurrent writes across the engines.
  * Feature: cmd_submission
- * Functionality: command submission
+ * Functionality: concurent writes
  * Run type: FULL
- * Sub-category: i915
+ * Sub-category: CMD submission
  * Test category: GEM_Legacy
  *
  * SUBTEST: concurrent-writes
diff --git a/tests/intel/gem_exec_await.c b/tests/intel/gem_exec_await.c
index 0652b649b..b2b8218bf 100644
--- a/tests/intel/gem_exec_await.c
+++ b/tests/intel/gem_exec_await.c
@@ -47,9 +47,9 @@
  * TEST: gem exec await
  * Category: Infrastructure
  * Feature: cmd_submission
- * Functionality: command submission
+ * Functionality: requests
  * Run type: FULL
- * Sub-category: i915
+ * Sub-category: CMD submission
  * Test category: GEM_Legacy
  *
  * SUBTEST: wide-all
diff --git a/tests/intel/gem_exec_endless.c b/tests/intel/gem_exec_endless.c
index 42991c018..b7e2bb429 100644
--- a/tests/intel/gem_exec_endless.c
+++ b/tests/intel/gem_exec_endless.c
@@ -34,10 +34,10 @@
  * TEST: gem exec endless
  * Category: Server
  * Feature: cmd_submission
- * Functionality: command submission
+ * Functionality: compute
  * Run type: FULL
- * Sub-category: Compute
- * Test category: GEM_Legacy
+ * Sub-category: CMD submission
+ * Test category: Compute
  *
  * SUBTEST: dispatch
  */
diff --git a/tests/intel/gem_exec_fair.c b/tests/intel/gem_exec_fair.c
index 5ad13f97a..2c33c0187 100644
--- a/tests/intel/gem_exec_fair.c
+++ b/tests/intel/gem_exec_fair.c
@@ -30,6 +30,9 @@
  * TEST: gem exec fair
  * Description: Check that GPU time and execution order is fairly distributed across clients
  * Feature: cmd_submission
+ * Sub-category: CMD submission
+ * Category: Desktop client
+ * Functionality: multi-client systems
  * Run type: FULL
  *
  * SUBTEST: basic-deadline
diff --git a/tests/intel/gem_exec_flush.c b/tests/intel/gem_exec_flush.c
index 3902ee957..a540d1f30 100644
--- a/tests/intel/gem_exec_flush.c
+++ b/tests/intel/gem_exec_flush.c
@@ -31,6 +31,9 @@
 /**
  * TEST: gem exec flush
  * Description: Basic check of flushing after batches
+ * Sub-category: CMD submission
+ * Category: Desktop client
+ * Functionality: execbuf
  * Run type: FULL
  *
  * SUBTEST: basic-batch-kernel-default-cmd
diff --git a/tests/intel/gem_exec_latency.c b/tests/intel/gem_exec_latency.c
index c0e607f97..42955e97a 100644
--- a/tests/intel/gem_exec_latency.c
+++ b/tests/intel/gem_exec_latency.c
@@ -50,6 +50,9 @@
 #include "i915/gem_create.h"
 /**
  * TEST: gem exec latency
+ * Sub-category: CMD submission
+ * Functionality: execbuf
+ * Category: Desktop client
  * Run type: FULL
  *
  * SUBTEST: context-preempt
diff --git a/tests/intel/gem_exec_lut_handle.c b/tests/intel/gem_exec_lut_handle.c
index c5e8f1d72..a03a716e5 100644
--- a/tests/intel/gem_exec_lut_handle.c
+++ b/tests/intel/gem_exec_lut_handle.c
@@ -43,6 +43,9 @@
 /**
  * TEST: gem exec lut handle
  * Description: Exercises the basic execbuffer using the handle LUT interface.
+ * Sub-category: CMD submission
+ * Category: Desktop client
+ * Functionality: execbuf
  * Run type: FULL
  *
  * SUBTEST:
diff --git a/tests/intel/gem_exec_nop.c b/tests/intel/gem_exec_nop.c
index 88a6ba224..48308312e 100644
--- a/tests/intel/gem_exec_nop.c
+++ b/tests/intel/gem_exec_nop.c
@@ -52,8 +52,8 @@
  * TEST: gem exec nop
  * Category: Infrastructure
  * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
+ * Functionality: execbuf
+ * Sub-category: CMD submission
  * Test category: GEM_Legacy
  * Run type: FULL
  *
diff --git a/tests/intel/gem_exec_reloc.c b/tests/intel/gem_exec_reloc.c
index 8259ff1d9..f3a8a45c0 100644
--- a/tests/intel/gem_exec_reloc.c
+++ b/tests/intel/gem_exec_reloc.c
@@ -34,6 +34,9 @@
 /**
  * TEST: gem exec reloc
  * Description: Basic sanity check of execbuf-ioctl relocations.
+ * Sub-category: CMD submission
+ * Category: Desktop client
+ * Functionality: relocations
  * Run type: FULL
  *
  * SUBTEST: basic-active
diff --git a/tests/intel/gem_exec_store.c b/tests/intel/gem_exec_store.c
index 0ab931062..a5a6538cb 100644
--- a/tests/intel/gem_exec_store.c
+++ b/tests/intel/gem_exec_store.c
@@ -40,24 +40,26 @@
  * Description: Exercise store dword functionality using execbuf-ioctl
  * Feature: cmd_submission
  * Functionality: coherency
- * Sub-category: HW
+ * Sub-category: CMD submission
  * Test category: GEM_Legacy
+ * Run type: FULL
  *
  * SUBTEST: basic
- * Description: Verify that all capable engines can store dwords to a common buffer object
+ * Description: Verify that all capable engines can store dwords to a common
+ *		buffer object
  * Run type: BAT
  *
  * SUBTEST: cachelines
- * Description: Verify that each capable engine can store a dword to different cachelines of a buffer object
- * Run type: FULL
+ * Description: Verify that each capable engine can store a dword to different
+ *		cachelines of a buffer object
  *
  * SUBTEST: dword
- * Description: Verify that each capable engine can store a dword to a buffer object
- * Run type: FULL
+ * Description: Verify that each capable engine can store a dword to a buffer
+ *		object
  *
  * SUBTEST: pages
- * Description: Verify that each capable engine can store a dword to various page-sized buffer objects
- * Run type: FULL
+ * Description: Verify that each capable engine can store a dword to various
+ *		page-sized buffer objects
  */
 
 IGT_TEST_DESCRIPTION("Exercise store dword functionality using execbuf-ioctl");
diff --git a/tests/intel/gem_exec_suspend.c b/tests/intel/gem_exec_suspend.c
index faf2e10f5..1d185c56b 100644
--- a/tests/intel/gem_exec_suspend.c
+++ b/tests/intel/gem_exec_suspend.c
@@ -40,6 +40,9 @@
  * TEST: gem exec suspend
  * Description: Exercise simple execbufs runs across various suspend/resume cycles.
  * Feature: cmd_submission, suspend
+ * Sub-category: CMD submission
+ * Category: Desktop client
+ * Functionality: suspend
  * Run type: FULL
  *
  * SUBTEST: basic
diff --git a/tests/intel/gem_exec_whisper.c b/tests/intel/gem_exec_whisper.c
index effb47335..29ed163cc 100644
--- a/tests/intel/gem_exec_whisper.c
+++ b/tests/intel/gem_exec_whisper.c
@@ -41,8 +41,8 @@
  * TEST: gem exec whisper
  * Feature: cmd_submission
  * Category: Infrastructure
- * Functionality: command submission
- * Sub-category: i915
+ * Functionality: execbuf
+ * Sub-category: CMD submission
  * Test category: GEM_Legacy
  * Run type: FULL
  *
diff --git a/tests/intel/gem_fd_exhaustion.c b/tests/intel/gem_fd_exhaustion.c
index e79d03478..0bf7b309a 100644
--- a/tests/intel/gem_fd_exhaustion.c
+++ b/tests/intel/gem_fd_exhaustion.c
@@ -36,6 +36,9 @@
 #include "i915/gem_create.h"
 /**
  * TEST: gem fd exhaustion
+ * Sub-category: CMD submission
+ * Category: Desktop client
+ * Functionality: fd exhaustion
  * Run type: FULL
  *
  * SUBTEST:
diff --git a/tests/intel/gem_fence_thrash.c b/tests/intel/gem_fence_thrash.c
index 4cb3d842b..b769d8b88 100644
--- a/tests/intel/gem_fence_thrash.c
+++ b/tests/intel/gem_fence_thrash.c
@@ -46,6 +46,9 @@
 /**
  * TEST: gem fence thrash
  * Feature: gtt, synchronization
+ * Sub-category: CMD submission
+ * Category: Desktop client
+ * Functionality: synchronization
  * Run type: FULL
  *
  * SUBTEST: bo-copy
diff --git a/tests/intel/gem_fence_upload.c b/tests/intel/gem_fence_upload.c
index b239c0e78..fd6858759 100644
--- a/tests/intel/gem_fence_upload.c
+++ b/tests/intel/gem_fence_upload.c
@@ -43,6 +43,9 @@
 #include "i915/gem_create.h"
 /**
  * TEST: gem fence upload
+ * Sub-category: CMD submission
+ * Category: Desktop client
+ * Functionality: synchronization
  * Run type: FULL
  *
  * SUBTEST: performance
diff --git a/tests/intel/gem_fenced_exec_thrash.c b/tests/intel/gem_fenced_exec_thrash.c
index 098f22ef4..2a258f09c 100644
--- a/tests/intel/gem_fenced_exec_thrash.c
+++ b/tests/intel/gem_fenced_exec_thrash.c
@@ -37,6 +37,9 @@
  * TEST: gem fenced exec thrash
  * Description: Test execbuf fence accounting.
  * Feature: gtt, synchronization
+ * Sub-category: CMD submission
+ * Category: Desktop client
+ * Functionality: synchronization
  * Run type: FULL
  *
  * SUBTEST: 2-spare-fences
diff --git a/tests/intel/gem_lut_handle.c b/tests/intel/gem_lut_handle.c
index cdd56a5d8..359e1a921 100644
--- a/tests/intel/gem_lut_handle.c
+++ b/tests/intel/gem_lut_handle.c
@@ -42,6 +42,9 @@
 /**
  * TEST: gem lut handle
  * Description: Exercises the basic execbuffer using the handle LUT interface.
+ * Sub-category: CMD submission
+ * Category: Desktop client
+ * Functionality: execbuf
  * Run type: FULL
  *
  * SUBTEST:
diff --git a/tests/intel/gem_partial_pwrite_pread.c b/tests/intel/gem_partial_pwrite_pread.c
index 9a5855752..782a4f3b8 100644
--- a/tests/intel/gem_partial_pwrite_pread.c
+++ b/tests/intel/gem_partial_pwrite_pread.c
@@ -42,6 +42,9 @@
  * TEST: gem partial pwrite pread
  * Description: Test pwrite/pread consistency when touching partial cachelines.
  * Feature: caching, mapping
+ * Sub-category: CMD submission
+ * Category: Desktop client
+ * Functionality: pread/pwrite
  * Run type: FULL
  *
  * SUBTEST: reads
diff --git a/tests/intel/gem_pipe_control_store_loop.c b/tests/intel/gem_pipe_control_store_loop.c
index 1913b874a..3cfef84e7 100644
--- a/tests/intel/gem_pipe_control_store_loop.c
+++ b/tests/intel/gem_pipe_control_store_loop.c
@@ -48,9 +48,9 @@
  * Category: Desktop client
  * Description: Test (TLB-)Coherency of pipe_control QW writes.
  * Feature: cmd_submission
- * Functionality: command submission
+ * Functionality: coherency
  * Run type: FULL
- * Sub-category: i915
+ * Sub-category: CMD submission
  * Test category: GEM_Legacy
  *
  * SUBTEST: fresh-buffer
diff --git a/tests/intel/gem_pread.c b/tests/intel/gem_pread.c
index 6f50785da..bfd20b8f8 100644
--- a/tests/intel/gem_pread.c
+++ b/tests/intel/gem_pread.c
@@ -48,6 +48,9 @@
 /**
  * TEST: gem pread
  * Feature: mapping
+ * Sub-category: CMD submission
+ * Category: Desktop client
+ * Functionality: pread
  * Run type: FULL
  *
  * SUBTEST: bench
diff --git a/tests/intel/gem_pread_after_blit.c b/tests/intel/gem_pread_after_blit.c
index b3e20697d..64453ad3d 100644
--- a/tests/intel/gem_pread_after_blit.c
+++ b/tests/intel/gem_pread_after_blit.c
@@ -50,6 +50,9 @@
 /**
  * TEST: gem pread after blit
  * Description: Test pread behavior when getting values out of just-drawn-to buffers.
+ * Sub-category: CMD submission
+ * Category: Desktop client
+ * Functionality: pread
  * Run type: FULL
  *
  * SUBTEST: default-hang
diff --git a/tests/intel/gem_pwrite.c b/tests/intel/gem_pwrite.c
index e2b48b843..f265eb68c 100644
--- a/tests/intel/gem_pwrite.c
+++ b/tests/intel/gem_pwrite.c
@@ -49,6 +49,9 @@
 /**
  * TEST: gem pwrite
  * Feature: mapping
+ * Sub-category: CMD submission
+ * Category: Desktop client
+ * Functionality: pwrite
  * Run type: FULL
  *
  * SUBTEST: basic-exhaustion
diff --git a/tests/intel/gem_pwrite_snooped.c b/tests/intel/gem_pwrite_snooped.c
index 5d9e8da20..fede6e1c8 100644
--- a/tests/intel/gem_pwrite_snooped.c
+++ b/tests/intel/gem_pwrite_snooped.c
@@ -41,6 +41,9 @@
  * TEST: gem pwrite snooped
  * Description: pwrite to a snooped bo then make it uncached and check that the GPU sees the data.
  * Feature: gtt, mapping
+ * Sub-category: CMD submission
+ * Category: Desktop client
+ * Functionality: pwrite
  * Run type: FULL
  *
  * SUBTEST:
diff --git a/tests/intel/gem_render_linear_blits.c b/tests/intel/gem_render_linear_blits.c
index 61ec1593f..095d0acb2 100644
--- a/tests/intel/gem_render_linear_blits.c
+++ b/tests/intel/gem_render_linear_blits.c
@@ -52,6 +52,9 @@
 /**
  * TEST: gem render linear blits
  * Feature: mapping
+ * Sub-category: CMD submission
+ * Category: Desktop client
+ * Functionality: render blits
  * Run type: FULL
  *
  * SUBTEST: aperture-shrink
diff --git a/tests/intel/gem_render_tiled_blits.c b/tests/intel/gem_render_tiled_blits.c
index a25ea0812..dda6faf42 100644
--- a/tests/intel/gem_render_tiled_blits.c
+++ b/tests/intel/gem_render_tiled_blits.c
@@ -55,6 +55,9 @@
  *   objects using render engine with various working set sizes and compares
  *   outputs with expected ones.
  * Feature: mapping
+ * Sub-category: CMD submission
+ * Category: Desktop client
+ * Functionality: render blits
  * Run type: FULL
  *
  * SUBTEST: aperture-shrink
diff --git a/tests/intel/gem_request_retire.c b/tests/intel/gem_request_retire.c
index 9814b435d..8db5780c5 100644
--- a/tests/intel/gem_request_retire.c
+++ b/tests/intel/gem_request_retire.c
@@ -54,10 +54,10 @@
  * Category: Infrastructure
  * Description: Collection of tests targeting request retirement code paths.
  * Feature: cmd_submission
- * Functionality: command submission
- * Run type: FULL
- * Sub-category: i915
+ * Functionality: requests
+ * Sub-category: CMD submission
  * Test category: GEM_Legacy
+ * Run type: FULL
  *
  * SUBTEST: retire-vma-not-inactive
  */
diff --git a/tests/intel/gem_ringfill.c b/tests/intel/gem_ringfill.c
index 0704ac1be..e9f0c7d97 100644
--- a/tests/intel/gem_ringfill.c
+++ b/tests/intel/gem_ringfill.c
@@ -48,8 +48,8 @@
  *   Exercise many tiny batchbuffer operations, in the hope of catching failure to manage the ring
  *   properly near full.
  * Feature: cmd_submission
- * Functionality: command submission
- * Sub-category: i915
+ * Functionality: execbuf
+ * Sub-category: CMD submission
  * Test category: GEM_Legacy
  * Run type: FULL
  *
diff --git a/tests/intel/gem_stress.c b/tests/intel/gem_stress.c
index bf2e06d71..c3ee00012 100644
--- a/tests/intel/gem_stress.c
+++ b/tests/intel/gem_stress.c
@@ -64,6 +64,9 @@
 /**
  * TEST: gem stress
  * Description: General gem coherency test.
+ * Category: Desktop client
+ * Sub-category: CMD submission
+ * Functionality: coherency
  * Run type: FULL
  *
  * SUBTEST:
diff --git a/tests/intel/gem_unref_active_buffers.c b/tests/intel/gem_unref_active_buffers.c
index 47023a3a0..e30214bc7 100644
--- a/tests/intel/gem_unref_active_buffers.c
+++ b/tests/intel/gem_unref_active_buffers.c
@@ -48,7 +48,7 @@
  * Feature: cmd_submission
  * Functionality: buffer management
  * Run type: FULL
- * Sub-category: i915
+ * Sub-category: CMD submission
  * Test category: GEM_Legacy
  *
  * SUBTEST:
diff --git a/tests/intel/gem_watchdog.c b/tests/intel/gem_watchdog.c
index c9dd0deb5..a844cdfe0 100644
--- a/tests/intel/gem_watchdog.c
+++ b/tests/intel/gem_watchdog.c
@@ -38,6 +38,9 @@
 /**
  * TEST: gem watchdog
  * Feature: gem_core
+ * Sub-category: CMD submission
+ * Category: Desktop client
+ * Functionality: fences
  * Run type: FULL
  *
  * SUBTEST: default-physical
diff --git a/tests/intel/gen7_exec_parse.c b/tests/intel/gen7_exec_parse.c
index 807cb1e9d..f9033a5d8 100644
--- a/tests/intel/gen7_exec_parse.c
+++ b/tests/intel/gen7_exec_parse.c
@@ -37,6 +37,9 @@
 /**
  * TEST: gen7 exec parse
  * Feature: cmd_submission, command_parser
+ * Sub-category: CMD submission
+ * Category: Desktop client
+ * Functionality: command_parser
  * Run type: FULL
  *
  * SUBTEST: basic-allocation
-- 
2.34.1

