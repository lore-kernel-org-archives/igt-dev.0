Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB62606A326
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 19:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hqcy6QAZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1D510E0F4;
	Tue,  3 Nov 2026 19:53:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28BF10F7FA
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 19:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793735524; x=1825271524;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ElbiFQ1cgCyKzZZrADmyTh5ciTZPuUM0AZ//nDgDuwc=;
 b=hqcy6QAZE2/maLUy9KK0C6efBosJr0+m0yu3gFfqOKSXx9lpTuNLfrCA
 PiPgxEXCqbdBOZDnbi26T8jJwpgh6dY4xxGSysd8Ji+YSHMxIypN4f49s
 h6OVVWS0VqbOESXElR02Oam2BRZ3NrwTk6yz8rXWmUZU3CriDqk1rFNqn
 21JCIodvbZMIsrYiw1oFjLN1CpPdjzf3n2obSUNb31W41+zjlzAFVmWeV
 kcZ7uAmZzhFkCei2C9zX7lV9ttXWdIZdx42TOMdOlMbs2pxpFRm8fC9/S
 CnQgRA67Ht7pesuiDmzQ5Pn0QK+vbWgKa93Dp246wglkMegvAAl7P6ZgT g==;
X-CSE-ConnectionGUID: P3q+ixVWTZGA+xZzN94rQg==
X-CSE-MsgGUID: yf9iMxLPT4axW1mi4lkX8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2351992"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2351992"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 11:51:58 -0800
X-CSE-ConnectionGUID: gA9vc/swT0CnwEL3iGTQNQ==
X-CSE-MsgGUID: 3vzhxSE8QF+3/Ez4KNUXGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6604928"
Received: from dut4008nvlp.fm.intel.com (HELO DUT4008NVLP) ([10.105.8.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 11:51:59 -0800
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH i-g-t v3 2/2] tests/intel/xe_exec_threads: Add multi-queue
 CGP_SYNC replay subtests
Date: Tue,  3 Nov 2026 19:51:49 +0000
Message-ID: <20261103195149.48923-2-jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103195149.48923-1-jagmeet.randhawa@intel.com>
References: <20261103195149.48923-1-jagmeet.randhawa@intel.com>
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
queues than that spans several groups and registers them in parallel.

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

v3:
 - Use the MULTI_QUEUE prefix.
 - Drop the many groups flag and derive the group layout from the queue
   count, since a group is limited to MULTI_QUEUE_GROUP_SIZE queues.
 - Define the multi-queue extension once and only vary the extension
   passed to xe_exec_queue_create().
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
 tests/intel/xe_exec_threads.c | 89 ++++++++++++++++++++++++++++++-----
 1 file changed, 77 insertions(+), 12 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index e7e472b4a..19d7e8fdd 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -31,7 +31,7 @@
 #include "xe/xe_spin.h"
 #include <string.h>
 
-#define MAX_N_EXEC_QUEUES	16
+#define MAX_N_EXEC_QUEUES	512
 #define N_EXEC_QUEUE		16
 #define USERPTR		(0x1 << 0)
 #define REBIND		(0x1 << 1)
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
+	       exec_queues[(i / MULTI_QUEUE_GROUP_SIZE) * MULTI_QUEUE_GROUP_SIZE] :
+	       DRM_XE_MULTI_GROUP_CREATE;
+}
+
 static void
 test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		 struct drm_xe_engine_class_instance *eci, int n_exec_queues,
@@ -638,6 +674,12 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		uint32_t data;
 	} *data;
 	struct xe_spin_opts spin_opts = { .preempt = false };
+	struct drm_xe_ext_set_property multi_queue = {
+		.base.next_extension = 0,
+		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
+	};
+	uint64_t multi_queue_ext = to_user_pointer(&multi_queue);
 	int i, j, b, hang_exec_queue = n_exec_queues / 2;
 	bool owns_vm = false, owns_fd = false;
 
@@ -679,16 +721,9 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	memset(sync_all, 0, sizeof(sync_all));
 	for (i = 0; i < n_exec_queues; i++) {
 		if (flags & MULTI_QUEUE) {
-			struct drm_xe_ext_set_property multi_queue = {
-				.base.next_extension = 0,
-				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
-				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
-			};
-
-			uint64_t ext = to_user_pointer(&multi_queue);
-
-			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
-			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
+			multi_queue.value = multi_queue_group_value(exec_queues, i);
+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci,
+							      multi_queue_ext);
 		} else {
 			if (!(flags & MANY_QUEUES))
 				exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
@@ -785,6 +820,16 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
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
@@ -1228,6 +1273,10 @@ static void *thread(void *data)
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
@@ -1503,6 +1552,9 @@ int igt_main()
 	const struct section {
 		const char *name;
 		unsigned int flags;
+		unsigned int repeat_secs;
+		int n_threads_per_engine;
+		int n_exec_queues;
 	} sections[] = {
 		{ "basic", 0 },
 		{ "many-queues", MANY_QUEUES },
@@ -1749,6 +1801,10 @@ int igt_main()
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
@@ -1758,6 +1814,11 @@ int igt_main()
 
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
@@ -1768,7 +1829,11 @@ int igt_main()
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

