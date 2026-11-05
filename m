Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54F6606A32C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Nov 2026 18:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GC7sK49E
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E12010E96F;
	Thu,  5 Nov 2026 18:44:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D8410E96F
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2026 18:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793904169; x=1825440169;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wvdl/kinVogDdNbqop2LTRcurZ6199vJo/QaLnQeWuE=;
 b=GC7sK49EyEnU7KYjuTgdNfGmy2JYaBr2X004RPx2YLY6hPq0+IsV3Jrl
 DGylmz0DmeaoRtvRuOnoUSC7vMXhxdcgtft7t0TRthqEAS22ae2NXkA/T
 ByiP4xP2NOit5j5NSzlGnpWexlEzb1/NaB3gM0JJN1Ru8TSoCl9EaNbe9
 9+yzQQ0YoxjEs6iuzrTXJqDbWnc2+uI0nQvec9EvGHv5HAKegETqFvJxb
 WNdIBwHHNmVJBLJqMCkmey+dLIVYSOakG0f08lmuDgvwTYZ57lsFKIz1/
 /Pzs2Q+AME0+uoymI7ead09CN9eZ70//sxf0cFcegyqH47SyuUQUbRSG3 A==;
X-CSE-ConnectionGUID: x7MGAItrS/OqEPrjrDMMUQ==
X-CSE-MsgGUID: wQ73+s62RTiu5j4hUwvscQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2578788"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2578788"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 10:42:48 -0800
X-CSE-ConnectionGUID: PXwgTsXMRdu06ZDdi++KMQ==
X-CSE-MsgGUID: rIawGK94TkmPYNgUggEFHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7400069"
Received: from dut4040nvlp.fm.intel.com (HELO DUT4040NVLP) ([10.105.10.98])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 10:42:49 -0800
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH i-g-t v5 1/3] tests/intel/xe_exec_threads: Parametrise worker
 and queue counts
Date: Thu,  5 Nov 2026 18:42:40 +0000
Message-ID: <20261105184242.14910-2-jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105184242.14910-1-jagmeet.randhawa@intel.com>
References: <20261105184242.14910-1-jagmeet.randhawa@intel.com>
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

threads() hardcodes one worker thread per engine and N_EXEC_QUEUE exec
queues per worker. Subtests that need a different shape have no way to ask
for one.

Pass the number of worker threads per engine and the number of exec queues
per worker as arguments, with the existing callers keeping the current
behaviour by passing 1 and N_EXEC_QUEUE.

The balancer threads are not created per engine, so require one worker per
engine when BALANCER is set. A queue cannot be destroyed while its
multi-queue group is live, so reject MANY_QUEUES together with MULTI_QUEUE.

No functional change.

v5:
 - Assert that MULTI_QUEUE and MANY_QUEUES are not requested together.

v4:
 - Actually use n_exec_queues for the per engine workers. The previous
   revision still set the fixed N_EXEC_QUEUE there, so the queue count
   never reached them.
 - Nest the worker loop inside the engine walk, after the engines that
   cannot run the job are skipped.
 - Assert one worker per engine when BALANCER is set.

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 tests/intel/xe_exec_threads.c | 73 +++++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 30 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index f03f20142..773627140 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -32,6 +32,7 @@
 #include <string.h>
 
 #define MAX_N_EXEC_QUEUES	16
+#define N_EXEC_QUEUE		16
 #define USERPTR		(0x1 << 0)
 #define REBIND		(0x1 << 1)
 #define INVALIDATE	(0x1 << 2)
@@ -1343,7 +1344,8 @@ static void *thread(void *data)
  *	multi-queue compute mode fd userptr invalidate race
  */
 
-static void threads(int fd, int flags)
+static void threads(int fd, int flags, int n_threads_per_engine,
+		    int n_exec_queues)
 {
 	struct thread_data *threads_data;
 	struct drm_xe_engine_class_instance *hwe;
@@ -1351,13 +1353,18 @@ static void threads(int fd, int flags)
 	uint64_t userptr = 0x00007000eadbe000;
 	pthread_mutex_t mutex;
 	pthread_cond_t cond;
-	int n_engines = 0, class;
+	int n_engines = 0, class, t;
 	uint64_t i = 0;
 	uint32_t vm_legacy_mode = 0, vm_compute_mode = 0;
 	bool go = false;
 	int n_threads = 0;
 	int gt;
 
+	/* The balancer threads below are not created per engine. */
+	igt_assert(!(flags & BALANCER) || n_threads_per_engine == 1);
+	/* A queue cannot be destroyed while its multi-queue group is live. */
+	igt_assert(!(flags & MULTI_QUEUE) || !(flags & MANY_QUEUES));
+
 	xe_for_each_engine(fd, hwe) {
 		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(fd, hwe->engine_class))
 			continue;
@@ -1374,7 +1381,8 @@ static void threads(int fd, int flags)
 			}
 	}
 
-	threads_data = calloc(n_engines, sizeof(*threads_data));
+	threads_data = calloc(n_engines * n_threads_per_engine,
+			      sizeof(*threads_data));
 	igt_assert(threads_data);
 
 	pthread_mutex_init(&mutex, 0);
@@ -1388,33 +1396,37 @@ static void threads(int fd, int flags)
 	}
 
 	xe_for_each_engine(fd, hwe) {
-		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(fd, hwe->engine_class))
+		if ((flags & MULTI_QUEUE) &&
+		    !xe_engine_class_supports_multi_queue(fd,
+							  hwe->engine_class))
 			continue;
-		threads_data[i].mutex = &mutex;
-		threads_data[i].cond = &cond;
+
+		for (t = 0; t < n_threads_per_engine; t++) {
+			threads_data[i].mutex = &mutex;
+			threads_data[i].cond = &cond;
 #define ADDRESS_SHIFT	39
-		threads_data[i].addr = addr | (i << ADDRESS_SHIFT);
-		threads_data[i].userptr = userptr | (i << ADDRESS_SHIFT);
-		threads_data[i].fd = fd;
-		threads_data[i].vm_legacy_mode = vm_legacy_mode;
-		threads_data[i].vm_compute_mode = vm_compute_mode;
-		threads_data[i].eci = hwe;
-#define N_EXEC_QUEUE	16
-		threads_data[i].n_exec_queue = N_EXEC_QUEUE;
+			threads_data[i].addr = addr | (i << ADDRESS_SHIFT);
+			threads_data[i].userptr = userptr | (i << ADDRESS_SHIFT);
+			threads_data[i].fd = fd;
+			threads_data[i].vm_legacy_mode = vm_legacy_mode;
+			threads_data[i].vm_compute_mode = vm_compute_mode;
+			threads_data[i].eci = hwe;
+			threads_data[i].n_exec_queue = n_exec_queues;
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
@@ -1448,7 +1460,7 @@ static void threads(int fd, int flags)
 					threads_data[i].vm_legacy_mode =
 						vm_legacy_mode;
 					threads_data[i].class = class;
-					threads_data[i].n_exec_queue = N_EXEC_QUEUE;
+					threads_data[i].n_exec_queue = n_exec_queues;
 					threads_data[i].n_exec = N_EXEC;
 					threads_data[i].flags = flags;
 					threads_data[i].flags &= ~BALANCER;
@@ -1471,7 +1483,7 @@ static void threads(int fd, int flags)
 	pthread_cond_broadcast(&cond);
 	pthread_mutex_unlock(&mutex);
 
-	for (i = 0; i < n_engines; ++i)
+	for (i = 0; i < n_threads; ++i)
 		pthread_join(threads_data[i].thread, NULL);
 
 	if (vm_legacy_mode)
@@ -1762,7 +1774,7 @@ int igt_main()
 			if ((s->flags & MULTI_QUEUE) && (s->flags & HANG))
 				ignore_multi_queue_hang_warnings_in_dmesg();
 
-			threads(fd, s->flags);
+			threads(fd, s->flags, 1, N_EXEC_QUEUE);
 		}
 	}
 
@@ -1863,7 +1875,8 @@ int igt_main()
 			atomic_store(&wq_stress_hang_detected, false);
 			igt_until_timeout(WQ_STRESS_DURATION_SEC) {
 				threads(child_fd,
-					REBIND | BIND_EXEC_QUEUE | WQ_STRESS);
+					REBIND | BIND_EXEC_QUEUE | WQ_STRESS,
+					1, N_EXEC_QUEUE);
 				if (atomic_load(&wq_stress_hang_detected))
 					break;
 			}
-- 
2.53.0

