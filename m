Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9B8D767F5
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 12:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802FC10EF24;
	Fri, 19 Dec 2025 12:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bWCOZ+qw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB3810EF7C
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 12:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766145727; x=1797681727;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=nWR5Kcuyn0uvx+hNJKygMxnJg4pUXB4Esk4PaQZUYD0=;
 b=bWCOZ+qw5mv+F9rkk6zcHZlfJKDkVV8A/gNOzm0gPPpbutNdvdqtIct6
 TfBk97Qh8INl8M5zqoG4LL9/Gxnf1NrWBvr8LCADbzZkLc87oQ6Gxz+/b
 Xo9RWMvNM8qkqx0i49xk3c7dqVijuHHhUCeqY9qQ2d8+t0S5HDGNPG736
 GEJly3tXwY1Uq7qhDP1wBoT7J4uK7crQ1C2vyhTyLN3s2Ri3w6s/NOon0
 vym4lynRrAc6IjzU5Zg4Wupn4GAYCjMgxk/Ik5QwW3lSIv2If7M3MIn1f
 lYSQdOuuI1lSxWx2+SNpLr4XdcJfZL8Bu49r/ZMad8K1AR+P+puCUow0d Q==;
X-CSE-ConnectionGUID: uQ2Ac4xGQtWrAaCBv8+4Wg==
X-CSE-MsgGUID: nO/tsYcTS6mDWvZdKeA9Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79473874"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79473874"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 04:02:06 -0800
X-CSE-ConnectionGUID: bB4urpuqQZ2Daw1SwSM62Q==
X-CSE-MsgGUID: 1vDpWObBRx2Hy3HqImVwtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203746988"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa004.fm.intel.com with ESMTP; 19 Dec 2025 04:02:05 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, niranjana.vishwanathapura@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 6/7] tests/intel/xe_exec_threads: Add multi queue basic
 test
Date: Fri, 19 Dec 2025 17:31:53 +0530
Message-ID: <20251219120154.695287-7-priyanka.dandamudi@intel.com>
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

Check multi queue functionality in parallel execution scenario.
Changed naming for multi queue and assign exec_queue create

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_exec_threads.c | 39 +++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index e8d56a3ef..4bf1cd1b1 100644
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
@@ -979,6 +994,8 @@ static void *thread(void *data)
  *	balancer mixed fd userptr invalidate
  * @bal-mixed-fd-userptr-invalidate-race:
  *	balancer mixed fd userptr invalidate race
+ * @multi-queue-shared-vm-basic:
+ *	multi-queue shared vm basic test
  */
 
 static void threads(int fd, int flags)
@@ -996,8 +1013,11 @@ static void threads(int fd, int flags)
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
@@ -1023,6 +1043,8 @@ static void threads(int fd, int flags)
 	}
 
 	xe_for_each_engine(fd, hwe) {
+		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(hwe->engine_class))
+			continue;
 		threads_data[i].mutex = &mutex;
 		threads_data[i].cond = &cond;
 #define ADDRESS_SHIFT	39
@@ -1277,6 +1299,7 @@ int igt_main()
 			FD | USERPTR | INVALIDATE },
 		{ "bal-mixed-fd-userptr-invalidate-race", BALANCER |
 			MIXED_MODE | FD | USERPTR | INVALIDATE | RACE },
+		{ "multi-queue-shared-vm-basic", MULTI_QUEUE | SHARED_VM },
 		{ NULL },
 	};
 	int fd;
@@ -1285,8 +1308,16 @@ int igt_main()
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

