Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0480C28B2F
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 11:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E5510E9C6;
	Fri, 14 Mar 2025 11:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="huNhF/8u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE74410E9C6
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 11:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741953299; x=1773489299;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vXJtNKpZpEtQZ7mo4PJzPQt6eTb4e2HrRM6V7em4zLs=;
 b=huNhF/8uJ5Lvfwjf1LAZvmYigZvv3gZwmY7eh8Z/pkLGEY+oDD/QvF8v
 ZrvLj+7JvYhFiP6WMA+LdzgDCIsIeKZovuPaR1OK8icLtT/WWlBupbzlb
 MGUvJfd5L2O4AcWNnNJBKZtHlb+dAxFfbNbod/H2ZwQxGXOttoylBibWF
 XjZAfRBIR3Z+nZ6uPAKimmHbIcCY7Vm44P5K+jcRz9j1woEi3Wswbempm
 T6cEeoVteas6xQREUv45TfWoW2HYV8oLuFbSzb1KwClkq/pPOqf0XDj4R
 YOKuQkWVjNVPho2NjQRbCZTzeb4gZ6gkbsldwulfo4twJi9dvyrClO02B g==;
X-CSE-ConnectionGUID: BtAktVSNSa6XrLeWg4tugA==
X-CSE-MsgGUID: dO/gh2AUS2OSiBmABkOazQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="30689517"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="30689517"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 04:54:58 -0700
X-CSE-ConnectionGUID: FeueJMRTTl6W1NOy/zLZew==
X-CSE-MsgGUID: dMb0h1sHSTuax73jw4ogEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="125882143"
Received: from unknown (HELO mkuoppal-desk.fi.intel.com) ([10.237.72.193])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 04:54:57 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t] lib/intel_allocator_simple: Prevent deadlock due to log
 mutex contention
Date: Fri, 14 Mar 2025 13:54:44 +0200
Message-ID: <20250314115444.293063-1-mika.kuoppala@linux.intel.com>
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

On the allocator::handle_request() we hold allocator's own mutex while
we check if the simple allocator is empty with allocator_close().
That in turn will call igt_debug that tries to take igt_log mutex.

If the another thread encountered an error and is trying to print it,
it is also trying to take igt_log mutex. And there wont be
allocator requests received by the client anymore as the handle_request()
is stuck. So we deadlock.

The intel_allocator does put logging behind unset define
but the intel_allocator_simple uses igt_info and igt_debug
directly. Follow the main allocator's lead and put the
logging inside intel_allocator_simple behind a unset define
with a warning that enabling it risks rare but possible deadlock.

Here are the stacks for the deadlock:

0  futex_wait (private=0, expected=2, futex_word=0x7f7195d5ff80 <log_buffer_mutex>) at ../sysdeps/nptl/futex-internal.h:146
1  __GI___lll_lock_wait (futex=futex@entry=0x7f7195d5ff80 <log_buffer_mutex>, private=0) at ./nptl/lowlevellock.c:49
2  0x00007f7195898002 in lll_mutex_lock_optimized (mutex=0x7f7195d5ff80 <log_buffer_mutex>) at ./nptl/pthread_mutex_lock.c:48
3  ___pthread_mutex_lock (mutex=mutex@entry=0x7f7195d5ff80 <log_buffer_mutex>) at ./nptl/pthread_mutex_lock.c:93
4  0x00007f7195cc0867 in _igt_log_buffer_append (
   line=0x7f718800be70 "(xe_eudebug_online:40711) [thread:40713] intel_allocator_simple-DEBUG: <ial: 0x7f7188009e20, fd: 5> objects: 0, reserved_areas: 1\n") at ../lib/igt_core.c:461
5  igt_vlog (domain=0x7f7195cfca78 "intel_allocator_simple", level=IGT_LOG_DEBUG, format=<optimized out>, args=args@entry=0x7f71931fe8d0) at ../lib/igt_core.c:3215
6  0x00007f7195cc0b23 in igt_log (domain=domain@entry=0x7f7195cfca78 "intel_allocator_simple", level=level@entry=IGT_LOG_DEBUG,
   format=format@entry=0x7f7195cfc4b0 "<ial: %p, fd: %d> objects: %ld, reserved_areas: %ld\n") at ../lib/igt_core.c:3137
7  0x00007f7195c7d851 in intel_allocator_simple_is_empty (ial=<optimized out>) at ../lib/intel_allocator_simple.c:613
8  0x00007f7195c7aa99 in __allocator_put (al=0x556bef180950) at ../lib/intel_allocator.c:312
9  allocator_close (ahnd=263) at ../lib/intel_allocator.c:430
10 0x00007f7195c7add1 in handle_request (req=req@entry=0x7f71931feaf0, resp=resp@entry=0x7f71931fead0) at ../lib/intel_allocator.c:561
11 0x00007f7195c7b567 in allocator_thread_loop (data=<optimized out>) at ../lib/intel_allocator.c:766
12 0x00007f7195894ac3 in start_thread (arg=<optimized out>) at ./nptl/pthread_create.c:442
13 0x00007f7195926850 in clone3 () at ../sysdeps/unix/sysv/linux/x86_64/clone3.S:81

0  futex_wait (private=0, expected=2, futex_word=0x7f7195d5ff80 <log_buffer_mutex>) at ../sysdeps/nptl/futex-internal.h:146
1  __GI___lll_lock_wait (futex=futex@entry=0x7f7195d5ff80 <log_buffer_mutex>, private=0) at ./nptl/lowlevellock.c:49
2  0x00007f7195898002 in lll_mutex_lock_optimized (mutex=0x7f7195d5ff80 <log_buffer_mutex>) at ./nptl/pthread_mutex_lock.c:48
3  ___pthread_mutex_lock (mutex=mutex@entry=0x7f7195d5ff80 <log_buffer_mutex>) at ./nptl/pthread_mutex_lock.c:93
4  0x00007f7195cc0867 in _igt_log_buffer_append (line=0x556bef182920 "(xe_eudebug_online:40711) xe/xe_eudebug-CRITICAL: Test assertion failure function __wait_token, file ../lib/xe/xe_eudebug.c:303:\n")
   at ../lib/igt_core.c:461
5  igt_vlog (domain=0x7f7195d27b7f "xe/xe_eudebug", level=IGT_LOG_CRITICAL, format=<optimized out>, args=args@entry=0x7fff266ac070) at ../lib/igt_core.c:3215
6  0x00007f7195cc0b23 in igt_log (domain=domain@entry=0x7f7195d27b7f "xe/xe_eudebug", level=level@entry=IGT_LOG_CRITICAL,
   format=format@entry=0x7f7195d19e60 "Test assertion failure function %s, file %s:%i:\n") at ../lib/igt_core.c:3137
7  0x00007f7195cc2bd1 in __igt_fail_assert (domain=domain@entry=0x7f7195d27b7f "xe/xe_eudebug", file=file@entry=0x7f7195d27b68 "../lib/xe/xe_eudebug.c", line=line@entry=303,
   func=func@entry=0x7f7195d278b8 <__func__.29> "__wait_token", assertion=assertion@entry=0x7f7195d1b044 "ret > 0", f=f@entry=0x7f7195d27fd8 "Pipe read timeout waiting for token '%s:(%ld)'\n")
   at ../lib/igt_core.c:2254
8  0x00007f7195ce9944 in __wait_token (pipe=pipe@entry=0x556bef15b4b4, token=token@entry=3, timeout_ms=60000) at ../lib/xe/xe_eudebug.c:303
9  0x00007f7195cebcf1 in wait_from_client (token=3, c=<optimized out>) at ../lib/xe/xe_eudebug.c:324
10 xe_eudebug_client_wait_done (c=0x556bef15b480) at ../lib/xe/xe_eudebug.c:1523
11 xe_eudebug_client_wait_done (c=0x556bef15b480) at ../lib/xe/xe_eudebug.c:1519
12 0x0000556bbde6bf19 in test_set_breakpoint_online_sigint_debugger (flags=16777216, hwe=0x556bef159ce8, fd=3) at ../tests/intel/xe_eudebug_online.c:1591
13 __igt_unique____real_main2500 () at ../tests/intel/xe_eudebug_online.c:2525
14 0x0000556bbde6704d in main (argc=<optimized out>, argv=<optimized out>) at ../tests/intel/xe_eudebug_online.c:2500

0  futex_wait (private=0, expected=2, futex_word=0x7f7195d5ff80 <log_buffer_mutex>) at ../sysdeps/nptl/futex-internal.h:146
1  __GI___lll_lock_wait (futex=futex@entry=0x7f7195d5ff80 <log_buffer_mutex>, private=0) at ./nptl/lowlevellock.c:49
2  0x00007f7195898002 in lll_mutex_lock_optimized (mutex=0x7f7195d5ff80 <log_buffer_mutex>) at ./nptl/pthread_mutex_lock.c:48
3  ___pthread_mutex_lock (mutex=mutex@entry=0x7f7195d5ff80 <log_buffer_mutex>) at ./nptl/pthread_mutex_lock.c:93
4  0x00007f7195cc0867 in _igt_log_buffer_append (line=0x556bef182920 "(xe_eudebug_online:40711) xe/xe_eudebug-CRITICAL: Test assertion failure function __wait_token, file ../lib/xe/xe_eudebug.c:303:\n")
   at ../lib/igt_core.c:461
5  igt_vlog (domain=0x7f7195d27b7f "xe/xe_eudebug", level=IGT_LOG_CRITICAL, format=<optimized out>, args=args@entry=0x7fff266ac070) at ../lib/igt_core.c:3215
6  0x00007f7195cc0b23 in igt_log (domain=domain@entry=0x7f7195d27b7f "xe/xe_eudebug", level=level@entry=IGT_LOG_CRITICAL,
   format=format@entry=0x7f7195d19e60 "Test assertion failure function %s, file %s:%i:\n") at ../lib/igt_core.c:3137
7  0x00007f7195cc2bd1 in __igt_fail_assert (domain=domain@entry=0x7f7195d27b7f "xe/xe_eudebug", file=file@entry=0x7f7195d27b68 "../lib/xe/xe_eudebug.c", line=line@entry=303,
   func=func@entry=0x7f7195d278b8 <__func__.29> "__wait_token", assertion=assertion@entry=0x7f7195d1b044 "ret > 0", f=f@entry=0x7f7195d27fd8 "Pipe read timeout waiting for token '%s:(%ld)'\n")
   at ../lib/igt_core.c:2254
8  0x00007f7195ce9944 in __wait_token (pipe=pipe@entry=0x556bef15b4b4, token=token@entry=3, timeout_ms=60000) at ../lib/xe/xe_eudebug.c:303
9  0x00007f7195cebcf1 in wait_from_client (token=3, c=<optimized out>) at ../lib/xe/xe_eudebug.c:324
10 xe_eudebug_client_wait_done (c=0x556bef15b480) at ../lib/xe/xe_eudebug.c:1523
11 xe_eudebug_client_wait_done (c=0x556bef15b480) at ../lib/xe/xe_eudebug.c:1519
12 0x0000556bbde6bf19 in test_set_breakpoint_online_sigint_debugger (flags=16777216, hwe=0x556bef159ce8, fd=3) at ../tests/intel/xe_eudebug_online.c:1591
13 __igt_unique____real_main2500 () at ../tests/intel/xe_eudebug_online.c:2525
14 0x0000556bbde6704d in main (argc=<optimized out>, argv=<optimized out>) at ../tests/intel/xe_eudebug_online.c:2500

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 lib/intel_allocator_simple.c | 88 ++++++++++++++++++++----------------
 1 file changed, 48 insertions(+), 40 deletions(-)

diff --git a/lib/intel_allocator_simple.c b/lib/intel_allocator_simple.c
index 25b92db11..a73b16854 100644
--- a/lib/intel_allocator_simple.c
+++ b/lib/intel_allocator_simple.c
@@ -11,6 +11,14 @@
 #include "intel_bufops.h"
 #include "igt_map.h"
 
+/* Enabling these you risk deadlock with igt_vlog mutex */
+#ifdef ALLOCDBG
+#define alloc_info igt_info
+#define alloc_debug igt_debug
+#else
+#define alloc_info(...) {}
+#define alloc_debug(...) {}
+#endif
 
 /* Avoid compilation warning */
 struct intel_allocator *
@@ -505,7 +513,7 @@ static bool intel_allocator_simple_reserve(struct intel_allocator *ial,
 		return true;
 	}
 
-	igt_debug("Failed to reserve %llx + %llx\n", (long long)start, (long long)size);
+	alloc_debug("Failed to reserve %llx + %llx\n", (long long)start, (long long)size);
 	return false;
 }
 
@@ -534,19 +542,19 @@ static bool intel_allocator_simple_unreserve(struct intel_allocator *ial,
 	entry = igt_map_search_entry(ials->reserved, &start);
 
 	if (!entry || !entry->data) {
-		igt_debug("Only reserved blocks can be unreserved\n");
+		alloc_debug("Only reserved blocks can be unreserved\n");
 		return false;
 	}
 	rec = entry->data;
 
 	if (rec->size != size) {
-		igt_debug("Only the whole block unreservation allowed\n");
+		alloc_debug("Only the whole block unreservation allowed\n");
 		return false;
 	}
 
 	if (rec->handle != handle) {
-		igt_debug("Handle %u doesn't match reservation handle: %u\n",
-			 rec->handle, handle);
+		alloc_debug("Handle %u doesn't match reservation handle: %u\n",
+			    rec->handle, handle);
 		return false;
 	}
 
@@ -610,10 +618,10 @@ static bool intel_allocator_simple_is_empty(struct intel_allocator *ial)
 {
 	struct intel_allocator_simple *ials = ial->priv;
 
-	igt_debug("<ial: %p, fd: %d> objects: %" PRId64
-		  ", reserved_areas: %" PRId64 "\n",
-		  ial, ial->fd,
-		  ials->allocated_objects, ials->reserved_areas);
+	alloc_debug("<ial: %p, fd: %d> objects: %" PRId64
+		    ", reserved_areas: %" PRId64 "\n",
+		    ial, ial->fd,
+		    ials->allocated_objects, ials->reserved_areas);
 
 	return !ials->allocated_objects && !ials->reserved_areas;
 }
@@ -632,51 +640,51 @@ static void intel_allocator_simple_print(struct intel_allocator *ial, bool full)
 	igt_assert(ials);
 	heap = &ials->heap;
 
-	igt_info("intel_allocator_simple <ial: %p, fd: %d> on "
-		 "[0x%"PRIx64" : 0x%"PRIx64"]:\n", ial, ial->fd,
-		 ials->start, ials->end);
+	alloc_info("intel_allocator_simple <ial: %p, fd: %d> on "
+		   "[0x%"PRIx64" : 0x%"PRIx64"]:\n", ial, ial->fd,
+		   ials->start, ials->end);
 
 	if (full) {
-		igt_info("holes:\n");
+		alloc_info("holes:\n");
 		simple_vma_foreach_hole(hole, heap) {
-			igt_info("offset = %"PRIu64" (0x%"PRIx64", "
-				 "size = %"PRIu64" (0x%"PRIx64")\n",
-				 hole->offset, hole->offset, hole->size,
-				 hole->size);
+			alloc_info("offset = %"PRIu64" (0x%"PRIx64", "
+				   "size = %"PRIu64" (0x%"PRIx64")\n",
+				   hole->offset, hole->offset, hole->size,
+				   hole->size);
 			total_free += hole->size;
 		}
 		igt_assert(total_free <= ials->total_size);
-		igt_info("total_free: %" PRIx64
-			 ", total_size: %" PRIx64
-			 ", allocated_size: %" PRIx64
-			 ", reserved_size: %" PRIx64 "\n",
-			 total_free, ials->total_size, ials->allocated_size,
-			 ials->reserved_size);
+		alloc_info("total_free: %" PRIx64
+			   ", total_size: %" PRIx64
+			   ", allocated_size: %" PRIx64
+			   ", reserved_size: %" PRIx64 "\n",
+			   total_free, ials->total_size, ials->allocated_size,
+			   ials->reserved_size);
 		igt_assert(total_free ==
 			   ials->total_size - ials->allocated_size - ials->reserved_size);
 
-		igt_info("objects:\n");
+		alloc_info("objects:\n");
 		igt_map_foreach(ials->objects, pos) {
 			struct intel_allocator_record *rec = pos->data;
 
-			igt_info("handle = %d, offset = %"PRIu64" "
-				"(0x%"PRIx64", size = %"PRIu64" (0x%"PRIx64")\n",
-				 rec->handle, rec->offset, rec->offset,
-				 rec->size, rec->size);
+			alloc_info("handle = %d, offset = %"PRIu64" "
+				   "(0x%"PRIx64", size = %"PRIu64" (0x%"PRIx64")\n",
+				   rec->handle, rec->offset, rec->offset,
+				   rec->size, rec->size);
 			allocated_objects++;
 			allocated_size += rec->size;
 		}
 		igt_assert(ials->allocated_size == allocated_size);
 		igt_assert(ials->allocated_objects == allocated_objects);
 
-		igt_info("reserved areas:\n");
+		alloc_info("reserved areas:\n");
 		igt_map_foreach(ials->reserved, pos) {
 			struct intel_allocator_record *rec = pos->data;
 
-			igt_info("offset = %"PRIu64" (0x%"PRIx64", "
-				 "size = %"PRIu64" (0x%"PRIx64")\n",
-				 rec->offset, rec->offset,
-				 rec->size, rec->size);
+			alloc_info("offset = %"PRIu64" (0x%"PRIx64", "
+				   "size = %"PRIu64" (0x%"PRIx64")\n",
+				   rec->offset, rec->offset,
+				   rec->size, rec->size);
 			reserved_areas++;
 			reserved_size += rec->size;
 		}
@@ -687,12 +695,12 @@ static void intel_allocator_simple_print(struct intel_allocator *ial, bool full)
 			total_free += hole->size;
 	}
 
-	igt_info("free space: %"PRIu64"B (0x%"PRIx64") (%.2f%% full)\n"
-		 "allocated objects: %"PRIu64", reserved areas: %"PRIu64"\n",
-		 total_free, total_free,
-		 ((double) (ials->total_size - total_free) /
-		  (double) ials->total_size) * 100,
-		 ials->allocated_objects, ials->reserved_areas);
+	alloc_info("free space: %"PRIu64"B (0x%"PRIx64") (%.2f%% full)\n"
+		   "allocated objects: %"PRIu64", reserved areas: %"PRIu64"\n",
+		   total_free, total_free,
+		   ((double) (ials->total_size - total_free) /
+		    (double) ials->total_size) * 100,
+		   ials->allocated_objects, ials->reserved_areas);
 }
 
 struct intel_allocator *
@@ -702,7 +710,7 @@ intel_allocator_simple_create(int fd, uint64_t start, uint64_t end,
 	struct intel_allocator *ial;
 	struct intel_allocator_simple *ials;
 
-	igt_debug("Using simple allocator\n");
+	alloc_debug("Using simple allocator\n");
 
 	ial = calloc(1, sizeof(*ial));
 	igt_assert(ial);
-- 
2.43.0

