Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2431ED31A14
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 06:59:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BA510E58D;
	Wed, 14 Jan 2026 06:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eBfmpOyN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D2510E5CA
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 06:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768373978; x=1799909978;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=3LWW2YXdYbvwK4bXHYOIdv94lz4czXUQLYynTVU0ymQ=;
 b=eBfmpOyNn5s6oUz8ggCL6/7nGfj6+WuUM+HWJ6MoVr63yu5GoHK3IAif
 fCyIu90GiKZG+xu9HkhQFw+DQWwOddHDhYn4UtGZbNm2kfLO4nC9xnXtp
 P3wcgPHhGhMr9l3ZI4be59jAtpr4vGB8+ty/H0zre3RyhCsMLf0uZ/it9
 jgeFo2ZSuhV8SaOGEGiKr10XOFcssV1ExEqKbIXoBUQmIFzkzbCmz9G6c
 a4igyLu2Itxz3EaoaDjHJxWC4/w91b1Q5cyC2iR5Q8YmNaQ44+w8nbGPE
 qeH8IrSYMAGAO8fzxtJSQIlZc6K8Ct/u4zpeHVJTmzT+xTacg6a43Ru4u g==;
X-CSE-ConnectionGUID: LuNl6dYuQquDfv5KOFkQOA==
X-CSE-MsgGUID: v5uD1zeVSlqVUQU920YKiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69647894"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69647894"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:59:38 -0800
X-CSE-ConnectionGUID: ytUvtXX3Qs64ETPG4SkS+A==
X-CSE-MsgGUID: OMDkCAGATZW18gxVTsaEXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="205159914"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jan 2026 22:59:36 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com, ramadevi.gandi@intel.com,
 dwarakanath.ramadeva@intel.com
Subject: [PATCH i-g-t 5/9] tests/intel/xe_exec_threads: Add multi-queue basic
 test
Date: Wed, 14 Jan 2026 12:29:21 +0530
Message-ID: <20260114065925.197958-6-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
References: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Check multiq functionality in parallel execution scenario.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_exec_threads.c | 191 ++++++++++++++++++++++++++++++++--
 1 file changed, 184 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index e8d56a3ef..d63d81552 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -41,6 +41,7 @@
 #define REBIND_ERROR	(0x1 << 12)
 #define BIND_EXEC_QUEUE	(0x1 << 13)
 #define MANY_QUEUES	(0x1 << 14)
+#define MULTI_QUEUE		(0x1 << 15)
 
 pthread_barrier_t barrier;
 
@@ -311,9 +312,21 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	igt_assert(exec_sync != MAP_FAILED);
 	memset(exec_sync, 0, sync_size);
 
-	for (i = 0; i < n_exec_queues; i++)
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
-
+	for (i = 0; i < n_exec_queues; i++) {
+		if (flags & MULTI_QUEUE) {
+			struct drm_xe_ext_set_property multi_queue = {
+				.base.next_extension = 0,
+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
+			};
+			uint64_t ext = to_user_pointer(&multi_queue);
+
+			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
+		} else {
+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		}
+	}
 	pthread_barrier_wait(&barrier);
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
@@ -540,8 +553,22 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	memset(sync_all, 0, sizeof(sync_all));
 	for (i = 0; i < n_exec_queues; i++) {
-		if (!(flags & MANY_QUEUES))
-			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		if (flags & MULTI_QUEUE) {
+			struct drm_xe_ext_set_property multi_queue = {
+				.base.next_extension = 0,
+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
+			};
+
+			uint64_t ext = to_user_pointer(&multi_queue);
+
+			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
+		} else {
+			if (!(flags & MANY_QUEUES))
+				exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		}
+
 		if (flags & BIND_EXEC_QUEUE)
 			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm,
 									0);
@@ -979,6 +1006,86 @@ static void *thread(void *data)
  *	balancer mixed fd userptr invalidate
  * @bal-mixed-fd-userptr-invalidate-race:
  *	balancer mixed fd userptr invalidate race
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
+ * @multi-queue-shared-vm-basic:
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
@@ -996,8 +1103,11 @@ static void threads(int fd, int flags)
 	int n_threads = 0;
 	int gt;
 
-	xe_for_each_engine(fd, hwe)
+	xe_for_each_engine(fd, hwe) {
+		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(hwe->engine_class))
+			continue;
 		++n_engines;
+	}
 
 	if (flags & BALANCER) {
 		xe_for_each_gt(fd, gt)
@@ -1023,6 +1133,8 @@ static void threads(int fd, int flags)
 	}
 
 	xe_for_each_engine(fd, hwe) {
+		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(hwe->engine_class))
+			continue;
 		threads_data[i].mutex = &mutex;
 		threads_data[i].cond = &cond;
 #define ADDRESS_SHIFT	39
@@ -1277,6 +1389,63 @@ int igt_main()
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
+		{ "multi-queue-shared-vm-basic", MULTI_QUEUE | SHARED_VM },
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
@@ -1285,8 +1454,16 @@ int igt_main()
 		fd = drm_open_driver(DRIVER_XE);
 
 	for (const struct section *s = sections; s->name; s++) {
-		igt_subtest_f("threads-%s", s->name)
+		igt_subtest_f("threads-%s", s->name) {
+			if (s->flags & MULTI_QUEUE) {
+				igt_skip_on_f(!(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0)),
+						"multi_queue is supported on graphics version 35 and above");
+				/* Balancer can't be set with multi-queue at the same time */
+				igt_assert(!(s->flags & BALANCER));
+			}
+
 			threads(fd, s->flags);
+		}
 	}
 
 	igt_fixture()
-- 
2.43.0

