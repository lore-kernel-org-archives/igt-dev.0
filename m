Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855BBD767FC
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 12:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3343410E44F;
	Fri, 19 Dec 2025 12:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WQ27gk5F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B10410EF6A
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 12:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766145728; x=1797681728;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=eIU3q9q+pNNNZL6034vuo++xjRYVw1PhlhjG6khd7bg=;
 b=WQ27gk5FAHd4TvPJOjMRNnothWhfL7bdfjEg8mzIWCLLgXX65FqXtxA1
 bUzCi9MSU8h1G43cwzAJaXjBWRGO6LksQG2k1e0n8zww6nk1gY+4DA8Hz
 OEVuNbl1ybMpaQ95hkNhVAafRngYEjbE/oBh+OQMKaYHNbnBH/6zUOfAj
 awPktQ8Uour+zzSBzq/zOAuy1kgP2kpvLJv1wpB/gF3JqTFx4KPghDb84
 JDpz7uKy4fKOtH4OzN7CwRXh40esUNQJED9hAN7HOHCmAuFGmXEvg/ArD
 glvaR9V3SkV5SsblP6rmf+yp8ako1qVAP4RgM4pf4rR7P92zbZ7AGAyk3 g==;
X-CSE-ConnectionGUID: ZPbTXmw0Qkuo+dRZWXYM0g==
X-CSE-MsgGUID: fNlYqmB9QdiYw+tKVJPstQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79473876"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79473876"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 04:02:08 -0800
X-CSE-ConnectionGUID: WQD6PQm2SQ+AQa6s7sQLWw==
X-CSE-MsgGUID: 9DoHo9yTToyhSK3nZP36FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203746993"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa004.fm.intel.com with ESMTP; 19 Dec 2025 04:02:07 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, niranjana.vishwanathapura@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 7/7] tests/intel/xe_exec_threads: Extend multi queue
 testing
Date: Fri, 19 Dec 2025 17:31:54 +0530
Message-ID: <20251219120154.695287-8-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
References: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Extend multi queue testing to different scenarios.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_exec_threads.c | 163 +++++++++++++++++++++++++++++++++-
 1 file changed, 160 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 4bf1cd1b1..0545c7ab6 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -312,9 +312,21 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	igt_assert(exec_sync != MAP_FAILED);
 	memset(exec_sync, 0, sync_size);
 
-	for (i = 0; i < n_exec_queues; i++)
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+	for (i = 0; i < n_exec_queues; i++) {
+		if (flags & MULTI_QUEUE) {
+			struct drm_xe_ext_set_property multi_queue = {
+				.base.next_extension = 0,
+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
+			};
+			uint64_t ext = to_user_pointer(&multi_queue);
 
+			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
+		} else {
+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		}
+	}
 	pthread_barrier_wait(&barrier);
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
@@ -994,8 +1006,95 @@ static void *thread(void *data)
  *	balancer mixed fd userptr invalidate
  * @bal-mixed-fd-userptr-invalidate-race:
  *	balancer mixed fd userptr invalidate race
+ */
+/**
+ * SUBTEST: threads-%s
+ * Mega feature: MultiQ
+ * Sub-category: MultiQ tests
+ * Description: Run threads %arg[1] test with multi threads
+ * arg[1]:
+ * @multi-queue-basic:
+ *	multi-queue basic
+ * @multi-queue-userptr:
+ *	multi-queue userptr
+ * @multi-queue-rebind:
+ *	multi-queue rebind
+ * @multi-queue-userptr-rebind:
+ *	multi-queue userptr rebind
+ * @multi-queue-userptr-invalidate:
+ *	multi-queue userptr invalidate
+ * @multi-queue-userptr-invalidate-race:
+ *	multi-queue userptr invalidate race
  * @multi-queue-shared-vm-basic:
- *	multi-queue shared vm basic test
+ *	multi-queue shared vm basic
+ * @multi-queue-shared-vm-userptr:
+ *	multi-queue shared vm userptr
+ * @multi-queue-shared-vm-rebind:
+ *	multi-queue shared vm rebind
+ * @multi-queue-shared-vm-userptr-rebind:
+ *	multi-queue shared vm userptr rebind
+ * @multi-queue-rebind-err:
+ *	multi-queue rebind err
+ * @multi-queue-userptr-rebind-err:
+ *	multi-queue userptr rebind err
+ * @multi-queue-shared-vm-userptr-invalidate:
+ *	multi-queue shared vm userptr invalidate
+ * @multi-queue-shared-vm-userptr-invalidate-race:
+ *	multi-queue shared vm userptr invalidate race
+ * @multi-queue-fd-basic:
+ *	multi-queue fd basic
+ * @multi-queue-fd-userptr:
+ *	multi-queue fd userptr
+ * @multi-queue-fd-rebind:
+ *	multi-queue fd rebind
+ * @multi-queue-fd-userptr-rebind:
+ *	multi-queue fd userptr rebind
+ * @multi-queue-fd-userptr-invalidate:
+ *	multi-queue fd userptr invalidate
+ * @multi-queue-fd-userptr-invalidate-race:
+ *	multi-queue fd userptr invalidate race
+ * @multi-queue-hang-basic:
+ *     multi-queue hang basic
+ * @multi-queue-hang-fd-userptr-invalidate-race:
+ *	multi-queue hang fd userptr invalidate race
+ * @multi-queue-cm-fd-userptr-invalidate-race:
+ *	multi-queue compute mode fd userptr invalidate race
+ * @multi-queue-mixed-basic:
+ *	multi-queue mixed basic
+ * @multi-queue-mixed-userptr:
+ *	multi-queue-mixed userptr
+ * @multi-queue-mixed-rebind:
+ *	multi-queue-mixed rebind
+ * @multi-queue-mixed-userptr-rebind:
+ *	multi-queue-mixed userptr rebind
+ * @multi-queue-mixed-userptr-invalidate:
+ *	multi-queue-mixed userptr invalidate
+ * @multi-queue-mixed-userptr-invalidate-race:
+ *	multi-queue-mixed userptr invalidate race
+ * @multi-queue-mixed-shared-vm-basic:
+ *	multi-queue mixed shared vm basic
+ * @multi-queue-mixed-shared-vm-userptr:
+ *	multi-queue-mixed shared vm userptr
+ * @multi-queue-mixed-shared-vm-rebind:
+ *	multi-queue-mixed shared vm rebind
+ * @multi-queue-mixed-shared-vm-userptr-rebind:
+ *	multi-queue-mixed shared vm userptr rebind
+ * @multi-queue-mixed-shared-vm-userptr-invalidate:
+ *	multi-queue-mixed shared vm userptr invalidate
+ * @multi-queue-mixed-shared-vm-userptr-invalidate-race:
+ *	multi-queue-mixed shared vm userptr invalidate race
+ * @multi-queue-mixed-fd-basic:
+ *	multi-queue mixed fd basic
+ * @multi-queue-mixed-fd-userptr:
+ *	multi-queue-mixed fd userptr
+ * @multi-queue-mixed-fd-rebind:
+ *	multi-queue-mixed fd rebind
+ * @multi-queue-mixed-fd-userptr-rebind:
+ *	multi-queue-mixed fd userptr rebind
+ * @multi-queue-mixed-fd-userptr-invalidate:
+ *	multi-queue-mixed fd userptr invalidate
+ * @multi-queue-mixed-fd-userptr-invalidate-race:
+ *	multi-queue-mixed fd userptr invalidate race
  */
 
 static void threads(int fd, int flags)
@@ -1299,7 +1398,65 @@ int igt_main()
 			FD | USERPTR | INVALIDATE },
 		{ "bal-mixed-fd-userptr-invalidate-race", BALANCER |
 			MIXED_MODE | FD | USERPTR | INVALIDATE | RACE },
+		{ "multi-queue-basic", MULTI_QUEUE | 0 },
+		{ "multi-queue-userptr", MULTI_QUEUE | USERPTR },
+		{ "multi-queue-rebind", MULTI_QUEUE | REBIND },
+		{ "multi-queue-userptr-rebind", MULTI_QUEUE | USERPTR | REBIND },
+		{ "multi-queue-userptr-invalidate", MULTI_QUEUE | USERPTR | INVALIDATE },
+		{ "multi-queue-userptr-invalidate-race", MULTI_QUEUE | USERPTR | INVALIDATE |
+			RACE },
 		{ "multi-queue-shared-vm-basic", MULTI_QUEUE | SHARED_VM },
+		{ "multi-queue-shared-vm-userptr", MULTI_QUEUE | SHARED_VM | USERPTR },
+		{ "multi-queue-shared-vm-rebind", MULTI_QUEUE | SHARED_VM | REBIND },
+		{ "multi-queue-shared-vm-userptr-rebind", MULTI_QUEUE | SHARED_VM | USERPTR |
+			REBIND },
+		{ "multi-queue-rebind-err", MULTI_QUEUE | REBIND | REBIND_ERROR },
+		{ "multi-queue-userptr-rebind-err", MULTI_QUEUE | USERPTR | REBIND |
+			REBIND_ERROR },
+		{ "multi-queue-shared-vm-userptr-invalidate", MULTI_QUEUE | SHARED_VM |
+			USERPTR | INVALIDATE },
+		{ "multi-queue-shared-vm-userptr-invalidate-race", MULTI_QUEUE | SHARED_VM |
+			USERPTR | INVALIDATE | RACE },
+		{ "multi-queue-fd-basic", MULTI_QUEUE | FD },
+		{ "multi-queue-fd-userptr", MULTI_QUEUE | FD | USERPTR },
+		{ "multi-queue-fd-rebind", MULTI_QUEUE | FD | REBIND },
+		{ "multi-queue-fd-userptr-rebind", MULTI_QUEUE | FD | USERPTR | REBIND },
+		{ "multi-queue-fd-userptr-invalidate", MULTI_QUEUE | FD | USERPTR |
+			INVALIDATE },
+		{ "multi-queue-fd-userptr-invalidate-race", MULTI_QUEUE | FD | USERPTR |
+			INVALIDATE | RACE },
+		{ "multi-queue-hang-basic", MULTI_QUEUE | HANG },
+		{ "multi-queue-hang-fd-userptr-invalidate-race", MULTI_QUEUE | HANG | FD | USERPTR |
+			INVALIDATE | RACE },
+		{ "multi-queue-cm-fd-userptr-invalidate-race", MULTI_QUEUE | COMPUTE_MODE | FD |
+			USERPTR | INVALIDATE | RACE },
+		{ "multi-queue-mixed-basic", MULTI_QUEUE | MIXED_MODE },
+		{ "multi-queue-mixed-userptr", MULTI_QUEUE | MIXED_MODE | USERPTR },
+		{ "multi-queue-mixed-rebind", MULTI_QUEUE | MIXED_MODE | REBIND },
+		{ "multi-queue-mixed-userptr-rebind", MULTI_QUEUE | MIXED_MODE | USERPTR | REBIND },
+		{ "multi-queue-mixed-userptr-invalidate", MULTI_QUEUE | MIXED_MODE | USERPTR |
+			INVALIDATE },
+		{ "multi-queue-mixed-userptr-invalidate-race", MULTI_QUEUE | MIXED_MODE | USERPTR |
+			INVALIDATE | RACE },
+		{ "multi-queue-mixed-shared-vm-basic", MULTI_QUEUE | MIXED_MODE | SHARED_VM },
+		{ "multi-queue-mixed-shared-vm-userptr", MULTI_QUEUE | MIXED_MODE | SHARED_VM |
+			USERPTR },
+		{ "multi-queue-mixed-shared-vm-rebind", MULTI_QUEUE | MIXED_MODE | SHARED_VM | REBIND },
+		{ "multi-queue-mixed-shared-vm-userptr-rebind", MULTI_QUEUE | MIXED_MODE | SHARED_VM |
+			USERPTR | REBIND },
+		{ "multi-queue-mixed-shared-vm-userptr-invalidate", MULTI_QUEUE | MIXED_MODE |
+			SHARED_VM | USERPTR | INVALIDATE },
+		{ "multi-queue-mixed-shared-vm-userptr-invalidate-race", MULTI_QUEUE | MIXED_MODE |
+			SHARED_VM | USERPTR | INVALIDATE | RACE },
+		{ "multi-queue-mixed-fd-basic", MULTI_QUEUE | MIXED_MODE | FD },
+		{ "multi-queue-mixed-fd-userptr", MULTI_QUEUE | MIXED_MODE | FD | USERPTR },
+		{ "multi-queue-mixed-fd-rebind", MULTI_QUEUE | MIXED_MODE | FD | REBIND },
+		{ "multi-queue-mixed-fd-userptr-rebind", MULTI_QUEUE | MIXED_MODE | FD | USERPTR |
+			REBIND },
+		{ "multi-queue-mixed-fd-userptr-invalidate", MULTI_QUEUE | MIXED_MODE | FD |
+			USERPTR | INVALIDATE },
+		{ "multi-queue-mixed-fd-userptr-invalidate-race", MULTI_QUEUE | MIXED_MODE | FD |
+			USERPTR | INVALIDATE | RACE },
 		{ NULL },
 	};
 	int fd;
-- 
2.43.0

