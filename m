Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46837606D802
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 19:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lOWvTO/5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E567210F7F3;
	Tue,  3 Nov 2026 19:52:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A9F10F7F5
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 19:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793735518; x=1825271518;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/+wIBm7TUz5yfFZqys4WUGu8uobTY2ww0YZK7TyGFgA=;
 b=lOWvTO/5w8w8thVSY9pyp5RGQ0Q6DXkQ5f3h5azdbOOF2/uHa5BXhkjy
 WM8aGjjTjG65LhI/coAopQoAy8SOKjPKY+RA7Oq1oqJlvEtxfDzzjzU+S
 Y5yG8vl8Am2nguTi7vvD0KzFmD7NXjmwr5YFWv/qwf62FZHBr9tt7JrjM
 dze/C1xjm0BHvkBevJ8Zk8tA/mGcPZDhDRVpR0WDKkDQcFBzcWuPTnkJu
 YM/hvnIGvrrvkvYkMfhqkSImBFVYszQWkTf8xAdQvechM7ZNb1wphZGR0
 xeabBgzCk0XTRguOJIUeYoaoB0iKJq6UEEfjP9juB8sLU5FxdedQPbob+ A==;
X-CSE-ConnectionGUID: +WQnoJnJRLiyfe+6BmH2tw==
X-CSE-MsgGUID: 0zby1fD5QyG4QBedqvjVVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2351991"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2351991"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 11:51:58 -0800
X-CSE-ConnectionGUID: Hthl/ZYkTymN11m8/xb8RQ==
X-CSE-MsgGUID: zNwEb9wTThu2o2T3fBtMcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6604924"
Received: from dut4008nvlp.fm.intel.com (HELO DUT4008NVLP) ([10.105.8.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 11:51:55 -0800
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH i-g-t v3 1/2] tests/intel/xe_exec_threads: Parametrise worker
 and queue counts
Date: Tue,  3 Nov 2026 19:51:48 +0000
Message-ID: <20261103195149.48923-1-jagmeet.randhawa@intel.com>
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

No functional change.

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 tests/intel/xe_exec_threads.c | 71 +++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 32 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index f03f20142..e7e472b4a 100644
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
@@ -1351,7 +1353,7 @@ static void threads(int fd, int flags)
 	uint64_t userptr = 0x00007000eadbe000;
 	pthread_mutex_t mutex;
 	pthread_cond_t cond;
-	int n_engines = 0, class;
+	int n_engines = 0, class, t;
 	uint64_t i = 0;
 	uint32_t vm_legacy_mode = 0, vm_compute_mode = 0;
 	bool go = false;
@@ -1374,7 +1376,8 @@ static void threads(int fd, int flags)
 			}
 	}
 
-	threads_data = calloc(n_engines, sizeof(*threads_data));
+	threads_data = calloc(n_engines * n_threads_per_engine,
+			      sizeof(*threads_data));
 	igt_assert(threads_data);
 
 	pthread_mutex_init(&mutex, 0);
@@ -1387,34 +1390,37 @@ static void threads(int fd, int flags)
 					       0);
 	}
 
-	xe_for_each_engine(fd, hwe) {
-		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(fd, hwe->engine_class))
-			continue;
-		threads_data[i].mutex = &mutex;
-		threads_data[i].cond = &cond;
+	for (t = 0; t < n_threads_per_engine; t++) {
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
-#define N_EXEC_QUEUE	16
-		threads_data[i].n_exec_queue = N_EXEC_QUEUE;
+			threads_data[i].addr = addr | (i << ADDRESS_SHIFT);
+			threads_data[i].userptr = userptr | (i << ADDRESS_SHIFT);
+			threads_data[i].fd = fd;
+			threads_data[i].vm_legacy_mode = vm_legacy_mode;
+			threads_data[i].vm_compute_mode = vm_compute_mode;
+			threads_data[i].eci = hwe;
+			threads_data[i].n_exec_queue = N_EXEC_QUEUE;
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
@@ -1448,7 +1454,7 @@ static void threads(int fd, int flags)
 					threads_data[i].vm_legacy_mode =
 						vm_legacy_mode;
 					threads_data[i].class = class;
-					threads_data[i].n_exec_queue = N_EXEC_QUEUE;
+					threads_data[i].n_exec_queue = n_exec_queues;
 					threads_data[i].n_exec = N_EXEC;
 					threads_data[i].flags = flags;
 					threads_data[i].flags &= ~BALANCER;
@@ -1471,7 +1477,7 @@ static void threads(int fd, int flags)
 	pthread_cond_broadcast(&cond);
 	pthread_mutex_unlock(&mutex);
 
-	for (i = 0; i < n_engines; ++i)
+	for (i = 0; i < n_threads; ++i)
 		pthread_join(threads_data[i].thread, NULL);
 
 	if (vm_legacy_mode)
@@ -1762,7 +1768,7 @@ int igt_main()
 			if ((s->flags & MULTI_QUEUE) && (s->flags & HANG))
 				ignore_multi_queue_hang_warnings_in_dmesg();
 
-			threads(fd, s->flags);
+			threads(fd, s->flags, 1, N_EXEC_QUEUE);
 		}
 	}
 
@@ -1863,7 +1869,8 @@ int igt_main()
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

