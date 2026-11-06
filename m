Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3AB606A326
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 18:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZsXzp/Uy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E22D10E129;
	Fri,  6 Nov 2026 18:34:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F2310E129
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 18:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793989978; x=1825525978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IxQTe9eah5IouVot7PlWLvkEWFd7IWVkv3lMFAJAi7A=;
 b=ZsXzp/UyS2Jz8cYguK5gSDkukW/tsxd5AqbuWkWlcNOc0zBf9EIibH0/
 ahnJlA5kS3JK7cZaMubj1+ue/63iV7wEVWrY3gGlH+vncNJHJ3qaGSCOq
 jlHFEX5hOUdrnCN5PpB5NSz/UXvDCaK5Q4330TCfxgoJXPJiOPR22la/t
 WEX0NAbqsNArGT16htf+9PT5JtDf/AAlyB3u0yWk8xyLee2qmXS4LyD1s
 ExtIT8bnfgffaSBxjLh8WX99zGtMw+R2ALMyelZlnjcjevXg7A8dfqiCr
 xXPnkQQ16wX4BtLQBtEOKUqDAU/EddaX7NziJmOGQlBTjhXaJ4gg9Q+7R Q==;
X-CSE-ConnectionGUID: kHHStymCQkez7HGMttpPIw==
X-CSE-MsgGUID: WNaR/xMLRIeiWfFHGf5blg==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2910367"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2910367"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 10:32:56 -0800
X-CSE-ConnectionGUID: jsqYjqozRW2JfH4VU/7B5A==
X-CSE-MsgGUID: kZ951BqeT7CT47EwVtHkZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="9198532"
Received: from dut4040nvlp.fm.intel.com (HELO DUT4040NVLP) ([10.105.10.98])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 10:32:56 -0800
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH i-g-t v6 3/3] tests/intel/xe_exec_threads: Add multi-queue
 CGP_SYNC replay subtests
Date: Fri,  6 Nov 2026 18:32:46 +0000
Message-ID: <20261106183246.14482-4-jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106183246.14482-1-jagmeet.randhawa@intel.com>
References: <20261106183246.14482-1-jagmeet.randhawa@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
ones. Both are driven from the legacy and the compute mode paths, so a
mixed mode run spreads the groups and the updates across both.

A group holds at most MULTI_QUEUE_GROUP_SIZE queues, so asking for more
queues than that spans several groups and registers them in parallel.

Add MULTI_QUEUE_PRIORITY to issue a short burst of priority updates after
each exec, alternating the values since the KMD ignores a set to the
current value.

Add three subtests built from these sources, repeated under
igt_until_timeout() with a bounded wall clock:

  multi-queue-many-groups                registers several full groups in
                                         parallel from multiple workers
                                         per engine
  multi-queue-mixed-many-groups          the same across legacy and
                                         compute mode workers
  multi-queue-mixed-many-groups-priority drives dynamic updates on those
                                         groups from a single worker per
                                         engine

Registration and dynamic traffic are kept apart. Driving dynamic updates
alongside many parallel registrations makes an update wait long enough to
exceed the KMD sync timeout, which bans the group instead of leaving the
update to be replayed.

v6:
 - Issue the priority burst from the compute mode path as well, and make
   the priority subtest a mixed mode one.

v5:
 - Rename the worker count to MULTI_QUEUE_THREADS_PER_ENGINE.
 - Move the dynamic array allocation to its own patch, it is not specific
   to multi-queue.
 - Place queues the same way in test_compute_mode() so the group limit is
   honoured there too, and add multi-queue-mixed-many-groups.

v4:
 - Keep the multi-queue extension at its only use site.
 - Mask instead of dividing in multi_queue_group_value().

v3:
 - Use the MULTI_QUEUE prefix.
 - Drop the many groups flag and derive the group layout from the queue
   count, since a group is limited to MULTI_QUEUE_GROUP_SIZE queues.
 - Take the worker and queue counts from the section rather than deriving
   them from flags.
 - No subtest destroys queues, so the churn flag and the queue recreate
   path are dropped: registration traffic comes from the repeated runs
   under igt_until_timeout().

v2:
 - Drop the secondary churn. A secondary cannot be replaced within a live
   group.

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 tests/intel/xe_exec_threads.c | 83 +++++++++++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 6f46781d8..6378b78fe 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -50,6 +50,30 @@
 #define MANY_QUEUES	(0x1 << 14)
 #define MULTI_QUEUE		(0x1 << 15)
 #define WQ_STRESS		(0x1 << 16)
+#define MULTI_QUEUE_PRIORITY	(0x1 << 17)
+
+/* Mirrors XE_MAX_GROUP_SIZE: one primary plus its secondaries. */
+#define MULTI_QUEUE_GROUP_SIZE	64
+
+/* Enough queues to span several full multi-queue groups. */
+#define N_EXEC_QUEUE_MULTI_GROUP	(8 * MULTI_QUEUE_GROUP_SIZE)
+
+/*
+ * Multi-queue priority updates issued per exec. The values must alternate:
+ * the KMD ignores a priority set to its current value, so a constant value
+ * would generate no CGP_SYNC traffic at all.
+ */
+#define MULTI_QUEUE_PRIORITY_BURST	8
+
+/*
+ * Workers per engine for the registration subtests. Registering several
+ * groups at once widens the window where one queue's CGP_SYNC is still
+ * outstanding while another queue waits on it.
+ */
+#define MULTI_QUEUE_THREADS_PER_ENGINE	8
+
+/* Wall clock budget for the CGP_SYNC replay subtests. */
+#define CGP_REPEAT_SEC		5
 
 /*
  * Maximum fence wait time when WQ_STRESS is active. If any bind/unbind
@@ -362,6 +386,27 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		drm_close_driver(fd);
 }
 
+/*
+ * Group membership for the queue at @i. A group holds at most
+ * MULTI_QUEUE_GROUP_SIZE queues, so a larger queue count simply spans
+ * several groups.
+ */
+static uint64_t multi_queue_group_value(uint32_t *exec_queues, int i)
+{
+	return i % MULTI_QUEUE_GROUP_SIZE ?
+	       exec_queues[i & ~(MULTI_QUEUE_GROUP_SIZE - 1)] :
+	       DRM_XE_MULTI_GROUP_CREATE;
+}
+
+static void multi_queue_priority_burst(int fd, uint32_t exec_queue)
+{
+	uint32_t prop = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY;
+	int z;
+
+	for (z = 0; z < MULTI_QUEUE_PRIORITY_BURST; z++)
+		xe_exec_queue_set_property(fd, exec_queue, prop, z & 1);
+}
+
 static void
 test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		  struct drm_xe_engine_class_instance *eci,
@@ -446,7 +491,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 			};
 			uint64_t ext = to_user_pointer(&multi_queue);
 
-			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
+			multi_queue.value = multi_queue_group_value(exec_queues, i);
 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
 		} else {
 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
@@ -491,6 +536,9 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		exec.address = batch_addr;
 		xe_exec(fd, &exec);
 
+		if (flags & MULTI_QUEUE_PRIORITY)
+			multi_queue_priority_burst(fd, exec_queues[e]);
+
 		if (flags & REBIND && i && !(i & 0x1f)) {
 			for (j = i == 0x20 ? 0 : i - 0x1f; j <= i; ++j)
 				xe_wait_ufence(fd, &exec_sync[j],
@@ -691,7 +739,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 			uint64_t ext = to_user_pointer(&multi_queue);
 
-			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
+			multi_queue.value = multi_queue_group_value(exec_queues, i);
 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
 		} else {
 			if (!(flags & MANY_QUEUES))
@@ -789,6 +837,9 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 			xe_exec(fd, &exec);
 		}
 
+		if (flags & MULTI_QUEUE_PRIORITY)
+			multi_queue_priority_burst(fd, exec_queues[e]);
+
 		if (flags & REBIND && i && !(i & 0x1f)) {
 			xe_vm_unbind_async(fd, vm, bind_exec_queues[e],
 					   0, addr, bo_size,
@@ -1237,6 +1288,12 @@ static void *thread(void *data)
  * arg[1]:
  * @multi-queue-basic:
  *	multi-queue basic
+ * @multi-queue-many-groups:
+ *	multi-queue many groups
+ * @multi-queue-mixed-many-groups:
+ *	multi-queue mixed many groups
+ * @multi-queue-mixed-many-groups-priority:
+ *	multi-queue mixed many groups priority
  * @multi-queue-userptr:
  *	multi-queue userptr
  * @multi-queue-rebind:
@@ -1518,6 +1575,9 @@ int igt_main()
 	const struct section {
 		const char *name;
 		unsigned int flags;
+		unsigned int repeat_secs;
+		int n_threads_per_engine;
+		int n_exec_queues;
 	} sections[] = {
 		{ "basic", 0 },
 		{ "many-queues", MANY_QUEUES },
@@ -1764,6 +1824,14 @@ int igt_main()
 			USERPTR | INVALIDATE },
 		{ "multi-queue-cm-fd-userptr-invalidate-race", MULTI_QUEUE | COMPUTE_MODE | FD |
 			USERPTR | INVALIDATE | RACE },
+		{ "multi-queue-many-groups", MULTI_QUEUE, CGP_REPEAT_SEC,
+			MULTI_QUEUE_THREADS_PER_ENGINE, N_EXEC_QUEUE_MULTI_GROUP },
+		{ "multi-queue-mixed-many-groups", MULTI_QUEUE | MIXED_MODE,
+			CGP_REPEAT_SEC, MULTI_QUEUE_THREADS_PER_ENGINE,
+			N_EXEC_QUEUE_MULTI_GROUP },
+		{ "multi-queue-mixed-many-groups-priority", MULTI_QUEUE |
+			MIXED_MODE | MULTI_QUEUE_PRIORITY, CGP_REPEAT_SEC, 1,
+			N_EXEC_QUEUE_MULTI_GROUP },
 		{ NULL },
 	};
 	int fd;
@@ -1773,6 +1841,11 @@ int igt_main()
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("threads-%s", s->name) {
+			int n_threads = s->n_threads_per_engine ?
+				s->n_threads_per_engine : 1;
+			int n_queues = s->n_exec_queues ?
+				s->n_exec_queues : N_EXEC_QUEUE;
+
 			if (s->flags & MULTI_QUEUE) {
 				igt_skip_on_f(!(xe_has_multi_queue_engine(fd)),
 						"multi_queue is supported on graphics version 35 and above");
@@ -1783,7 +1856,11 @@ int igt_main()
 			if ((s->flags & MULTI_QUEUE) && (s->flags & HANG))
 				ignore_multi_queue_hang_warnings_in_dmesg();
 
-			threads(fd, s->flags, 1, N_EXEC_QUEUE);
+			if (s->repeat_secs)
+				igt_until_timeout(s->repeat_secs)
+					threads(fd, s->flags, n_threads, n_queues);
+			else
+				threads(fd, s->flags, n_threads, n_queues);
 		}
 	}
 
-- 
2.53.0

