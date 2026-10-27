Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1010606A31A
	for <igt-dev@archiver.kernel.org>; Tue, 27 Oct 2026 21:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NdL7rKQF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6E910E4A2;
	Tue, 27 Oct 2026 21:16:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA3F10E4A2
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Oct 2026 21:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793135752; x=1824671752;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pj3/p5eOQ+iN3MA9xfHQ4eWL48+tM5hUueHVcfwe+nM=;
 b=NdL7rKQF1XZ0fIyG5OFtF47qgVsJKYIyNklvrIOq9JSoLfb/UMPh8AuT
 U07BRtBg6nWX2SEAr8TCl+WOLsDuwrTAY3AvNTUYbjaWsP+austEIu1Fm
 oCC/t8trJLYsGZ1uHjAAhOaeu7wGneMOkNJBU6lGnb5483JMpkY8ndJ0G
 Tmc/mRckwQvy6JzpoVPeHQyS60ZXhb5HeHV7XOTMPpNmDkDWM1OoKlHd+
 3zi5XwlLWGqHvlYNDVjj9RihcCHfIkibAU3xSms2MvLzLJVv0C5JSQUqa
 hi3LOY8C5Dpf/HQtuBqZVuaPefzNIZhlMivLBI1nCEGg5iQwPnQSitIzE Q==;
X-CSE-ConnectionGUID: QqS1ZtafTAOh5C9g3uN8sQ==
X-CSE-MsgGUID: 8/5CtE+cRl+wsrE1XDE/mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1861315"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1861315"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 14:15:51 -0700
X-CSE-ConnectionGUID: 20MKaXkDRKW8dW0IaRx0qA==
X-CSE-MsgGUID: To14z0HwQMi4GC2H95P6gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4662175"
Received: from dut4040nvlp.fm.intel.com (HELO DUT4040NVLP) ([10.105.10.94])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 14:15:51 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [i-g-t,
 v2] tests/intel/xe_exec_threads: Add multi-queue CGP_SYNC replay
 subtests
Date: Tue, 27 Oct 2026 21:15:41 +0000
Message-ID: <20261027211541.35132-1-jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add coverage for the replay paths introduced by "drm/xe/multi_queue: Handle
lost message during VF migration":
https://patchwork.freedesktop.org/series/165324/

A CGP_SYNC message can be lost during VF migration and is replayed by the
KMD on recovery. Exercising that needs a CGP_SYNC queued or outstanding on
a live multi-queue group when the migration lands.

A group serialises on one outstanding sync, so both CGP sources are needed:
queue creation for registration updates, MULTI_QUEUE_PRIORITY for dynamic
ones.

Add MQ_PRIORITY to issue a short burst of priority updates after each exec,
alternating the values since the KMD ignores a set to the current value.

Add MQ_SOLO_CHURN, which gives every queue its own group, so destroying a
queue tears its group down and the recreate issues a fresh registration
sync. A secondary cannot be replaced within a live group, so this is the
only layout that is safe to churn.

Add MQ_MANY_GROUPS, which spreads the queues over several full size groups
registering in parallel, widening the window where one queue's sync is
still outstanding while another queue waits on it.

Add four subtests from these sources and an optional repeat_secs to repeat
them under igt_until_timeout() with a bounded wall clock. The combined
groups and priority subtest runs a single thread per engine: more threads
there make a dynamic update wait behind enough registrations to exceed the
KMD sync timeout, which bans the group instead of leaving the update to be
replayed.

v2:
 - Drop the secondary churn. A secondary cannot be replaced within a live
   group, so MANY_QUEUES is no longer combined with MULTI_QUEUE and
   MQ_CHURN_INTERVAL is gone.
 - Add MQ_SOLO_CHURN: churn now happens on solo groups, where destroying
   the queue tears down the group and the recreate registers afresh.
 - Add MQ_MANY_GROUPS to register several full size groups in parallel.
 - Add the combined multi-queue-groups-priority subtest, so a dynamic
   update can queue behind an outstanding registration sync.
 - Rename the subtests to match the new layouts.

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 tests/intel/xe_exec_threads.c | 170 +++++++++++++++++++++++++++-------
 1 file changed, 136 insertions(+), 34 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 2974fc312..c228469e2 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -31,7 +31,7 @@
 #include "xe/xe_spin.h"
 #include <string.h>
 
-#define MAX_N_EXEC_QUEUES	16
+#define MAX_N_EXEC_QUEUES	512
 #define USERPTR		(0x1 << 0)
 #define REBIND		(0x1 << 1)
 #define INVALIDATE	(0x1 << 2)
@@ -49,6 +49,32 @@
 #define MANY_QUEUES	(0x1 << 14)
 #define MULTI_QUEUE		(0x1 << 15)
 #define WQ_STRESS		(0x1 << 16)
+#define MQ_SOLO_CHURN		(0x1 << 17)
+#define MQ_MANY_GROUPS		(0x1 << 18)
+#define MQ_PRIORITY		(0x1 << 19)
+
+/* Mirrors XE_MAX_GROUP_SIZE: one primary plus its secondaries. */
+#define MQ_GROUP_SIZE		64
+
+/* Queues used by MQ_MANY_GROUPS, enough to span several full groups. */
+#define MQ_MANY_GROUPS_QUEUES	(8 * MQ_GROUP_SIZE)
+
+/*
+ * Multi-queue priority updates issued per exec. The values must alternate:
+ * the KMD ignores a priority set to its current value, so a constant value
+ * would generate no CGP_SYNC traffic at all.
+ */
+#define MQ_PRIORITY_BURST	8
+
+/* Wall clock budget for the CGP_SYNC replay subtests. */
+#define CGP_REPEAT_SEC		5
+
+/*
+ * Worker threads per engine for the registration subtests. Several groups
+ * concurrently widens the window where one queue's CGP_SYNC is still
+ * outstanding while another queue waits on it.
+ */
+#define MQ_THREADS_PER_ENGINE	8
 
 /*
  * Maximum fence wait time when WQ_STRESS is active. If any bind/unbind
@@ -610,6 +636,24 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	}
 }
 
+/*
+ * Group membership for the queue at @i. A secondary cannot be replaced
+ * within a live group, so only the solo layout is safe to churn: there
+ * destroying the queue tears down the whole group.
+ */
+static uint64_t mq_group_value(unsigned int flags, uint32_t *exec_queues, int i)
+{
+	if (flags & MQ_SOLO_CHURN)
+		return DRM_XE_MULTI_GROUP_CREATE;
+
+	if (flags & MQ_MANY_GROUPS)
+		return i % MQ_GROUP_SIZE ?
+		       exec_queues[(i / MQ_GROUP_SIZE) * MQ_GROUP_SIZE] :
+		       DRM_XE_MULTI_GROUP_CREATE;
+
+	return i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
+}
+
 static void
 test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		 struct drm_xe_engine_class_instance *eci, int n_exec_queues,
@@ -686,7 +730,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 			uint64_t ext = to_user_pointer(&multi_queue);
 
-			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
+			multi_queue.value = mq_group_value(flags, exec_queues, i);
 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
 		} else {
 			if (!(flags & MANY_QUEUES))
@@ -727,13 +771,32 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		if ((flags & WQ_STRESS) && atomic_load(&wq_stress_hang_detected))
 			goto wq_stress_cleanup;
 
-		if (flags & MANY_QUEUES) {
+		if (flags & (MANY_QUEUES | MQ_SOLO_CHURN)) {
 			if (exec_queues[e]) {
-				igt_assert(syncobj_wait(fd, &syncobjs[e], 1,
-							INT64_MAX, 0, NULL));
+				/*
+				 * Multi-queue creates every queue up front, so a
+				 * slot can still be unused on its first visit and
+				 * its syncobj would never signal.
+				 */
+				if (i >= n_exec_queues)
+					igt_assert(syncobj_wait(fd, &syncobjs[e], 1,
+								INT64_MAX, 0, NULL));
 				xe_exec_queue_destroy(fd, exec_queues[e]);
 			}
-			exec_queues[e] = xe_exec_queue_create(fd, vm, eci, 0);
+			if (flags & MQ_SOLO_CHURN) {
+				struct drm_xe_ext_set_property multi_queue = {
+					.base.next_extension = 0,
+					.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+					.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
+					.value = DRM_XE_MULTI_GROUP_CREATE,
+				};
+
+				exec_queues[e] =
+					xe_exec_queue_create(fd, vm, eci,
+							     to_user_pointer(&multi_queue));
+			} else {
+				exec_queues[e] = xe_exec_queue_create(fd, vm, eci, 0);
+			}
 		}
 
 		if (flags & HANG && e == hang_exec_queue && i == e) {
@@ -770,6 +833,16 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 			xe_exec(fd, &exec);
 		}
 
+		if (flags & MQ_PRIORITY) {
+			uint32_t prop =
+				DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY;
+			int z;
+
+			for (z = 0; z < MQ_PRIORITY_BURST; z++)
+				xe_exec_queue_set_property(fd, exec_queues[e],
+							   prop, z & 1);
+		}
+
 		if (flags & REBIND && i && !(i & 0x1f)) {
 			xe_vm_unbind_async(fd, vm, bind_exec_queues[e],
 					   0, addr, bo_size,
@@ -1213,6 +1286,14 @@ static void *thread(void *data)
  * arg[1]:
  * @multi-queue-basic:
  *	multi-queue basic
+ * @multi-queue-solo-churn:
+ *	multi-queue solo churn
+ * @multi-queue-many-groups:
+ *	multi-queue many groups
+ * @multi-queue-priority:
+ *	multi-queue priority
+ * @multi-queue-groups-priority:
+ *	multi-queue groups priority
  * @multi-queue-userptr:
  *	multi-queue userptr
  * @multi-queue-rebind:
@@ -1337,7 +1418,10 @@ static void threads(int fd, int flags)
 	uint64_t userptr = 0x00007000eadbe000;
 	pthread_mutex_t mutex;
 	pthread_cond_t cond;
-	int n_engines = 0, class;
+	int n_engines = 0, class, t;
+	/* Extra threads only where there is no dynamic traffic to starve. */
+	int mq_threads = ((flags & MQ_MANY_GROUPS) &&
+			  !(flags & MQ_PRIORITY)) ? MQ_THREADS_PER_ENGINE : 1;
 	uint64_t i = 0;
 	uint32_t vm_legacy_mode = 0, vm_compute_mode = 0;
 	bool go = false;
@@ -1360,7 +1444,7 @@ static void threads(int fd, int flags)
 			}
 	}
 
-	threads_data = calloc(n_engines, sizeof(*threads_data));
+	threads_data = calloc(n_engines * mq_threads, sizeof(*threads_data));
 	igt_assert(threads_data);
 
 	pthread_mutex_init(&mutex, 0);
@@ -1373,34 +1457,39 @@ static void threads(int fd, int flags)
 					       0);
 	}
 
-	xe_for_each_engine(fd, hwe) {
-		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(fd, hwe->engine_class))
-			continue;
-		threads_data[i].mutex = &mutex;
-		threads_data[i].cond = &cond;
+	for (t = 0; t < mq_threads; t++) {
+		xe_for_each_engine(fd, hwe) {
+			if ((flags & MULTI_QUEUE) &&
+			    !xe_engine_class_supports_multi_queue(fd,
+								  hwe->engine_class))
+				continue;
+			threads_data[i].mutex = &mutex;
+			threads_data[i].cond = &cond;
 #define ADDRESS_SHIFT	39
-		threads_data[i].addr = addr | (i << ADDRESS_SHIFT);
-		threads_data[i].userptr = userptr | (i << ADDRESS_SHIFT);
-		threads_data[i].fd = fd;
-		threads_data[i].vm_legacy_mode = vm_legacy_mode;
-		threads_data[i].vm_compute_mode = vm_compute_mode;
-		threads_data[i].eci = hwe;
+			threads_data[i].addr = addr | (i << ADDRESS_SHIFT);
+			threads_data[i].userptr = userptr | (i << ADDRESS_SHIFT);
+			threads_data[i].fd = fd;
+			threads_data[i].vm_legacy_mode = vm_legacy_mode;
+			threads_data[i].vm_compute_mode = vm_compute_mode;
+			threads_data[i].eci = hwe;
 #define N_EXEC_QUEUE	16
-		threads_data[i].n_exec_queue = N_EXEC_QUEUE;
+			threads_data[i].n_exec_queue = (flags & MQ_MANY_GROUPS) ?
+				MQ_MANY_GROUPS_QUEUES : N_EXEC_QUEUE;
 #define N_EXEC		1024
-		threads_data[i].n_exec = N_EXEC;
-		threads_data[i].flags = flags;
-		if (flags & MIXED_MODE) {
-			threads_data[i].flags &= ~MIXED_MODE;
-			if (i & 1)
-				threads_data[i].flags |= COMPUTE_MODE;
-		}
-		threads_data[i].go = &go;
+			threads_data[i].n_exec = N_EXEC;
+			threads_data[i].flags = flags;
+			if (flags & MIXED_MODE) {
+				threads_data[i].flags &= ~MIXED_MODE;
+				if (i & 1)
+					threads_data[i].flags |= COMPUTE_MODE;
+			}
+			threads_data[i].go = &go;
 
-		++n_threads;
-		pthread_create(&threads_data[i].thread, 0, thread,
-			       &threads_data[i]);
-		++i;
+			++n_threads;
+			pthread_create(&threads_data[i].thread, 0, thread,
+				       &threads_data[i]);
+			++i;
+		}
 	}
 
 	if (flags & BALANCER) {
@@ -1457,7 +1546,7 @@ static void threads(int fd, int flags)
 	pthread_cond_broadcast(&cond);
 	pthread_mutex_unlock(&mutex);
 
-	for (i = 0; i < n_engines; ++i)
+	for (i = 0; i < n_engines * mq_threads; ++i)
 		pthread_join(threads_data[i].thread, NULL);
 
 	if (vm_legacy_mode)
@@ -1483,6 +1572,7 @@ int igt_main()
 	const struct section {
 		const char *name;
 		unsigned int flags;
+		unsigned int repeat_secs;
 	} sections[] = {
 		{ "basic", 0 },
 		{ "many-queues", MANY_QUEUES },
@@ -1729,6 +1819,14 @@ int igt_main()
 			USERPTR | INVALIDATE },
 		{ "multi-queue-cm-fd-userptr-invalidate-race", MULTI_QUEUE | COMPUTE_MODE | FD |
 			USERPTR | INVALIDATE | RACE },
+		{ "multi-queue-solo-churn", MULTI_QUEUE | MQ_SOLO_CHURN,
+			CGP_REPEAT_SEC },
+		{ "multi-queue-many-groups", MULTI_QUEUE | MQ_MANY_GROUPS,
+			CGP_REPEAT_SEC },
+		{ "multi-queue-priority", MULTI_QUEUE | MQ_PRIORITY,
+			CGP_REPEAT_SEC },
+		{ "multi-queue-groups-priority", MULTI_QUEUE | MQ_MANY_GROUPS |
+			MQ_PRIORITY, CGP_REPEAT_SEC },
 		{ NULL },
 	};
 	int fd;
@@ -1748,7 +1846,11 @@ int igt_main()
 			if ((s->flags & MULTI_QUEUE) && (s->flags & HANG))
 				ignore_multi_queue_hang_warnings_in_dmesg();
 
-			threads(fd, s->flags);
+			if (s->repeat_secs)
+				igt_until_timeout(s->repeat_secs)
+					threads(fd, s->flags);
+			else
+				threads(fd, s->flags);
 		}
 	}
 
-- 
2.53.0

