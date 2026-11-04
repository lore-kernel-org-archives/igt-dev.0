Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6051B6081742
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 20:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b4XtRP3h
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E36A10E51D;
	Wed,  4 Nov 2026 20:13:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA6C10FED4
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 20:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793823095; x=1825359095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VSUnfqL+kakyJngwtguI7G2xBU02BduIlh9/vmmd+5A=;
 b=b4XtRP3h+9M5f9v0kz0Lozv9lnBImdOLrgTFGT/ib1nmNZR3rjbVgya/
 paoV949wP1gITa/fSOzN8DIIDEqWoEq7CKBeUurRWW9wfAtazUe0WRUZp
 CqDPayBaiOKqCeNiYxT+mBsm5St+tubX/f+zk9qFN2m5h1iwWT3IPOQWm
 3RR0EXTnzrcOaq98WRI4FOc5U22/bwdFUlZenxiXnSHCsYlwjS6ME/eD9
 Ksr621poxpM2phg4fz8Niflcs465c7XVlYjCTNiNxw008xs8DrV9Q3bg6
 4bxqYSo970zMB6uFInxBJL7coVzM/VZrrUYvkB9S8cZ5NnU8g6MEilAvx g==;
X-CSE-ConnectionGUID: 94bd4aXDT7KM5k5QKwJ6xg==
X-CSE-MsgGUID: ehCCk40fQX+6Qer/e7iApg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2467185"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2467185"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 12:11:32 -0800
X-CSE-ConnectionGUID: TVCnefKtR6isnV27549ROg==
X-CSE-MsgGUID: bqA7mRTeR9axmOU/I+EXbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6820991"
Received: from dut4008nvlp.fm.intel.com (HELO DUT4008NVLP) ([10.105.8.84])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 12:11:32 -0800
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH i-g-t v4 2/2] tests/intel/xe_exec_threads: Add multi-queue
 CGP_SYNC replay subtests
Date: Wed,  4 Nov 2026 20:11:19 +0000
Message-ID: <20261104201119.14137-3-jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104201119.14137-1-jagmeet.randhawa@intel.com>
References: <20261104201119.14137-1-jagmeet.randhawa@intel.com>
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
ones.

A group holds at most MULTI_QUEUE_GROUP_SIZE queues, so asking for more
queues than that spans several groups and registers them in parallel. The
legacy mode queue arrays are sized to the request rather than to a fixed
maximum, so the larger counts cost nothing for the tests that do not ask
for them.

Add MULTI_QUEUE_PRIORITY to issue a short burst of priority updates after
each exec, alternating the values since the KMD ignores a set to the
current value.

Add two subtests built from these sources, repeated under
igt_until_timeout() with a bounded wall clock:

  multi-queue-many-groups      registers several full groups in parallel
                               from multiple workers per engine
  multi-queue-groups-priority  drives dynamic updates on those groups from
                               a single worker per engine

The two cannot be merged. Driving dynamic updates alongside many parallel
registrations makes an update wait long enough to exceed the KMD sync
timeout, which bans the group instead of leaving the update to be replayed.

v4:
 - Size the legacy mode queue arrays to n_exec_queues instead of raising
   MAX_N_EXEC_QUEUES, which would have grown the stack arrays of every
   other test.
 - Keep the multi-queue extension at its only use site.
 - Mask instead of dividing in multi_queue_group_value().

v3:
 - Use the MULTI_QUEUE prefix.
 - Drop the many groups flag and derive the group layout from the queue
   count, since a group is limited to MULTI_QUEUE_GROUP_SIZE queues.
 - Take the worker and queue counts from the section rather than deriving
   them from flags, on top of the preceding patch.
 - Four subtests down to two. Neither remaining subtest destroys queues, so
   the churn flag and the queue recreate path are dropped entirely rather
   than renamed: registration traffic comes from the repeated runs under
   igt_until_timeout().

v2:
 - Drop the secondary churn. A secondary cannot be replaced within a live
   group, so MANY_QUEUES is no longer combined with MULTI_QUEUE and
   MQ_CHURN_INTERVAL is gone.

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 tests/intel/xe_exec_threads.c | 88 +++++++++++++++++++++++++++++++----
 1 file changed, 80 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index e5056192b..393ab8d75 100644
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
+ * Workers per engine for the registration subtest. Registering several
+ * groups at once widens the window where one queue's CGP_SYNC is still
+ * outstanding while another queue waits on it.
+ */
+#define MULTI_QUEUE_REG_THREADS	8
+
+/* Wall clock budget for the CGP_SYNC replay subtests. */
+#define CGP_REPEAT_SEC		5
 
 /*
  * Maximum fence wait time when WQ_STRESS is active. If any bind/unbind
@@ -611,6 +635,18 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	}
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
 static void
 test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		 struct drm_xe_engine_class_instance *eci, int n_exec_queues,
@@ -620,15 +656,13 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 	};
-	struct drm_xe_sync sync_all[MAX_N_EXEC_QUEUES];
+	struct drm_xe_sync *sync_all;
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
 		.num_syncs = 2,
 		.syncs = to_user_pointer(sync),
 	};
-	uint32_t exec_queues[MAX_N_EXEC_QUEUES] = {};
-	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
-	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
+	uint32_t *exec_queues, *bind_exec_queues, *syncobjs;
 	size_t bo_size;
 	uint32_t bo = 0;
 	struct {
@@ -641,7 +675,11 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	int i, j, b, hang_exec_queue = n_exec_queues / 2;
 	bool owns_vm = false, owns_fd = false;
 
-	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
+	sync_all = calloc(n_exec_queues, sizeof(*sync_all));
+	exec_queues = calloc(n_exec_queues, sizeof(*exec_queues));
+	bind_exec_queues = calloc(n_exec_queues, sizeof(*bind_exec_queues));
+	syncobjs = calloc(n_exec_queues, sizeof(*syncobjs));
+	igt_assert(sync_all && exec_queues && bind_exec_queues && syncobjs);
 
 	if (flags & FD) {
 		fd = drm_reopen_driver(fd);
@@ -676,7 +714,6 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	}
 	memset(data, 0, bo_size);
 
-	memset(sync_all, 0, sizeof(sync_all));
 	for (i = 0; i < n_exec_queues; i++) {
 		if (flags & MULTI_QUEUE) {
 			struct drm_xe_ext_set_property multi_queue = {
@@ -687,7 +724,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 			uint64_t ext = to_user_pointer(&multi_queue);
 
-			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
+			multi_queue.value = multi_queue_group_value(exec_queues, i);
 			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
 		} else {
 			if (!(flags & MANY_QUEUES))
@@ -785,6 +822,16 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 			xe_exec(fd, &exec);
 		}
 
+		if (flags & MULTI_QUEUE_PRIORITY) {
+			uint32_t prop =
+				DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY;
+			int z;
+
+			for (z = 0; z < MULTI_QUEUE_PRIORITY_BURST; z++)
+				xe_exec_queue_set_property(fd, exec_queues[e],
+							   prop, z & 1);
+		}
+
 		if (flags & REBIND && i && !(i & 0x1f)) {
 			xe_vm_unbind_async(fd, vm, bind_exec_queues[e],
 					   0, addr, bo_size,
@@ -942,6 +989,11 @@ wq_stress_cleanup:
 		xe_vm_destroy(fd, vm);
 	if (owns_fd)
 		drm_close_driver(fd);
+
+	free(sync_all);
+	free(exec_queues);
+	free(bind_exec_queues);
+	free(syncobjs);
 }
 
 struct thread_data {
@@ -1228,6 +1280,10 @@ static void *thread(void *data)
  * arg[1]:
  * @multi-queue-basic:
  *	multi-queue basic
+ * @multi-queue-many-groups:
+ *	multi-queue many groups
+ * @multi-queue-groups-priority:
+ *	multi-queue groups priority
  * @multi-queue-userptr:
  *	multi-queue userptr
  * @multi-queue-rebind:
@@ -1507,6 +1563,9 @@ int igt_main()
 	const struct section {
 		const char *name;
 		unsigned int flags;
+		unsigned int repeat_secs;
+		int n_threads_per_engine;
+		int n_exec_queues;
 	} sections[] = {
 		{ "basic", 0 },
 		{ "many-queues", MANY_QUEUES },
@@ -1753,6 +1812,10 @@ int igt_main()
 			USERPTR | INVALIDATE },
 		{ "multi-queue-cm-fd-userptr-invalidate-race", MULTI_QUEUE | COMPUTE_MODE | FD |
 			USERPTR | INVALIDATE | RACE },
+		{ "multi-queue-many-groups", MULTI_QUEUE, CGP_REPEAT_SEC,
+			MULTI_QUEUE_REG_THREADS, N_EXEC_QUEUE_MULTI_GROUP },
+		{ "multi-queue-groups-priority", MULTI_QUEUE | MULTI_QUEUE_PRIORITY,
+			CGP_REPEAT_SEC, 1, N_EXEC_QUEUE_MULTI_GROUP },
 		{ NULL },
 	};
 	int fd;
@@ -1762,6 +1825,11 @@ int igt_main()
 
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
@@ -1772,7 +1840,11 @@ int igt_main()
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

