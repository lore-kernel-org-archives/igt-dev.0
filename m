Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B102C4451E
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 11:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E3D10E759;
	Wed, 21 Jan 2026 11:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f6/vfJgB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB44D10E75A
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 11:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768996003; x=1800532003;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=izerMG8xSWEq781wQUqz8Dr2GUDPx9jVGBNHBAydusg=;
 b=f6/vfJgBVBKrD9kbCd0cczrqedc5It7p9IGnEsV3Jf8nqfnIITxM2UsT
 Un8qwzhkm7parhbugIeNGwgrOHfGfVWs6WE4lj7pg4+WVZwdTx83tL+eK
 2tVdFe5+Rs4mfKSxLQEiKzsqcX2n0i04dkU9B2xvPDh5EOnzrl8FFgwIi
 yyad/X3xSmoTgpdLcv5x+gadz7/S5gceP/29G03eH4kHQ8nPYN+70wyIV
 sqBK+LbJ578TBqY01Q9ozir8ggmDGCic0ggTYJ5r2+rZaCcIq4ROHmiFK
 oSBIp7ccc6QqZ1A+Im1L7ygunKYUquXmJlwmuf5hfUV8PEMhpD7cc/YaP A==;
X-CSE-ConnectionGUID: EHQPND6uT36CdacVf5VKmQ==
X-CSE-MsgGUID: rzTlijbeRj6Po7lp/Megww==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="92889036"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="92889036"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 03:46:43 -0800
X-CSE-ConnectionGUID: 6pLS7lZqQKO1uCUJno0GXA==
X-CSE-MsgGUID: J2S7Vb0CQdOWmiYq8nMERA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206347458"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa006.fm.intel.com with ESMTP; 21 Jan 2026 03:46:41 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com, ramadevi.gandi@intel.com,
 dwarakanath.ramadeva@intel.com
Subject: [PATCH v3 5/6] tests/intel/xe_exec_threads: Add multi-queue basic test
Date: Wed, 21 Jan 2026 17:16:30 +0530
Message-ID: <20260121114631.277272-6-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121114631.277272-1-priyanka.dandamudi@intel.com>
References: <20260121114631.277272-1-priyanka.dandamudi@intel.com>
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

Check multi-queue functionality in parallel execution scenario.

v3: Move out compute related to compute related patch.
Rename multiq to multi-queue in the commit description.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_exec_threads.c | 173 +++++++++++++++++++++++++++++++++-
 1 file changed, 169 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index e8d56a3ef..0c14b242a 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -41,6 +41,7 @@
 #define REBIND_ERROR	(0x1 << 12)
 #define BIND_EXEC_QUEUE	(0x1 << 13)
 #define MANY_QUEUES	(0x1 << 14)
+#define MULTI_QUEUE		(0x1 << 15)
 
 pthread_barrier_t barrier;
 
@@ -540,8 +541,22 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
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
@@ -979,6 +994,86 @@ static void *thread(void *data)
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
@@ -996,8 +1091,11 @@ static void threads(int fd, int flags)
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
@@ -1023,6 +1121,8 @@ static void threads(int fd, int flags)
 	}
 
 	xe_for_each_engine(fd, hwe) {
+		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(hwe->engine_class))
+			continue;
 		threads_data[i].mutex = &mutex;
 		threads_data[i].cond = &cond;
 #define ADDRESS_SHIFT	39
@@ -1277,6 +1377,63 @@ int igt_main()
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
@@ -1285,8 +1442,16 @@ int igt_main()
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

