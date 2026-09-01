Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0507C61DD3
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 18:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D7110E157;
	Tue,  1 Sep 2026 18:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xt5w4g3X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBA110E157
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 18:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788287342; x=1819823342;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wl5xmBh8poi5TdAzbVwa2vQbR3T86337rqQB/sAsrIg=;
 b=Xt5w4g3XxTtS3Hqq1aAMCufEDUQArnh0X9NHIh2REdcxR+fO9Y4A+Lhp
 4jT3aAhSUb5pVkwSc4wjBPIZOlS8nDrVT4gaf87wnAktE6yUSBsstmeTX
 nMaYjth+1P3NXkfOP3dGWJRQUKnh2BvqvQQXec18FxYToCDhWJqDcFgWy
 WYAMgvdecKdTZuEfb9LYZSlkZDYsO2BvM4Qs1JP9n3r8WAyfFkyekCuFz
 rhFPnxFBXILfETZlVOxmnEqtRJeWypHWWCeXCuH5d/L4470jAHE9P2pCG
 /bE+hCm12mJO9ZrqzQX1jnl124hCtmUoMkv+Jz6sL87eqiKXjFPWJM4aX g==;
X-CSE-ConnectionGUID: pezma54bRbu40CRPsf3o3A==
X-CSE-MsgGUID: syiyT4/AQvSauIr9M1QFMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99327921"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="99327921"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 11:29:02 -0700
X-CSE-ConnectionGUID: +r1uDPQ+SMGcEr3Apm4f/A==
X-CSE-MsgGUID: 78Nj8Ms9SvmbCjsIUHuO3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="265937560"
Received: from dut2148ptlh.iind.intel.com (HELO DUT2031NVLP.iind.intel.com)
 ([10.190.232.150])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 11:28:55 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [i-g-t] tests/intel/xe_exec_threads: Add multi-queue CGP_SYNC replay
 subtests
Date: Tue,  1 Sep 2026 18:28:24 +0000
Message-ID: <20260901182824.16038-1-jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.43.0
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

Let MANY_QUEUES combine with MULTI_QUEUE by recreating the destroyed queue
as a secondary of the surviving primary, keeping churn inside a live group.
Space the recreates out, as a destroyed queue only releases its group slot
after teardown completes.

Add three subtests from these sources and an optional repeat_secs to repeat
them under igt_until_timeout() with a bounded wall clock.

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 tests/intel/xe_exec_threads.c | 80 ++++++++++++++++++++++++++++++++---
 1 file changed, 75 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 2974fc312..137316a98 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -49,6 +49,24 @@
 #define MANY_QUEUES	(0x1 << 14)
 #define MULTI_QUEUE		(0x1 << 15)
 #define WQ_STRESS		(0x1 << 16)
+#define MQ_PRIORITY		(0x1 << 17)
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
+ * Execs between queue recreates in a multi-queue group. A destroyed queue
+ * only releases its group slot once teardown completes, so recreating on
+ * every exec exhausts the group and creation fails with EINVAL.
+ */
+#define MQ_CHURN_INTERVAL	32
 
 /*
  * Maximum fence wait time when WQ_STRESS is active. If any bind/unbind
@@ -722,18 +740,43 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		uint64_t sdi_addr = addr + sdi_offset;
 		uint64_t exec_addr;
 		int e = i % n_exec_queues;
+		bool churn;
 
 		/* Bail early if another thread already detected a hang */
 		if ((flags & WQ_STRESS) && atomic_load(&wq_stress_hang_detected))
 			goto wq_stress_cleanup;
 
-		if (flags & MANY_QUEUES) {
+		churn = flags & MANY_QUEUES;
+		if (churn && (flags & MULTI_QUEUE))
+			/* Keep the primary, and let group slots drain. */
+			churn = e && !(i & (MQ_CHURN_INTERVAL - 1));
+
+		if (churn) {
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
+			if (flags & MULTI_QUEUE) {
+				struct drm_xe_ext_set_property multi_queue = {
+					.base.next_extension = 0,
+					.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+					.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
+					.value = exec_queues[0],
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
@@ -770,6 +813,16 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
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
@@ -1213,6 +1266,12 @@ static void *thread(void *data)
  * arg[1]:
  * @multi-queue-basic:
  *	multi-queue basic
+ * @multi-queue-many-queues:
+ *	multi-queue many queues
+ * @multi-queue-priority:
+ *	multi-queue priority
+ * @multi-queue-many-queues-priority:
+ *	multi-queue many queues priority
  * @multi-queue-userptr:
  *	multi-queue userptr
  * @multi-queue-rebind:
@@ -1483,6 +1542,7 @@ int igt_main()
 	const struct section {
 		const char *name;
 		unsigned int flags;
+		unsigned int repeat_secs;
 	} sections[] = {
 		{ "basic", 0 },
 		{ "many-queues", MANY_QUEUES },
@@ -1729,6 +1789,12 @@ int igt_main()
 			USERPTR | INVALIDATE },
 		{ "multi-queue-cm-fd-userptr-invalidate-race", MULTI_QUEUE | COMPUTE_MODE | FD |
 			USERPTR | INVALIDATE | RACE },
+		{ "multi-queue-many-queues", MULTI_QUEUE | MANY_QUEUES,
+			CGP_REPEAT_SEC },
+		{ "multi-queue-priority", MULTI_QUEUE | MQ_PRIORITY,
+			CGP_REPEAT_SEC },
+		{ "multi-queue-many-queues-priority", MULTI_QUEUE | MANY_QUEUES |
+			MQ_PRIORITY, CGP_REPEAT_SEC },
 		{ NULL },
 	};
 	int fd;
@@ -1748,7 +1814,11 @@ int igt_main()
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
2.43.0

