Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D39C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 14:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1A4113593;
	Wed, 17 Apr 2024 14:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NgB8u3MP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307CF113593
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 14:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713363977; x=1744899977;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SetG5pBHEKns58PuLfK4gu3wSo+apHVRnV88tIv0TJM=;
 b=NgB8u3MPwSWd9TLF1xQmJSN00BkB2Xt+g7ReX0PR6CJR7SU1UY0LCZ6W
 36AjmenJJMPIAs41i1Bwry1OOe19VcMyy/shEWJBpkbsAqPIQcqakJQfK
 UEDfxpVdq5kTEyUU/689LNIbCfQKaGId2yCDyZ3iAadJQyzbzX0lMvOq4
 8CM4tPmNeyRhLscwASeUoFIo4AXRNtGLlGEf/tyDg3gSb5nErFbzlGeht
 1mCuOQlOFg7NrACOLaCoXUA4L7UIKXrQ8klsJ3FjryjITHMWyaVwqUyP5
 qmzz9MsqiGipX3vG+AYQSxsavmSsc3Mjeq4UnHp01TEIs09jzlngL+cZk A==;
X-CSE-ConnectionGUID: IKL+LkN3Q7C7Ld6dlj0uLw==
X-CSE-MsgGUID: YPi6T4VZQuKzkK9fy2nqbQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9027472"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="9027472"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:26:16 -0700
X-CSE-ConnectionGUID: u7scl0ooTL+QlAGScx6VXw==
X-CSE-MsgGUID: A4Fh4jvLSZSKuLNr4y+hkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="23232366"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.246.229])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:26:15 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH i-g-t] tests/xe_evict|exec_threads: Use fd reopen to avoid
 corrupting global data
Date: Wed, 17 Apr 2024 16:26:07 +0200
Message-Id: <20240417142607.193339-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Device scanning and filtering was designed to work in multi-process
environment. Due to that opening the device with drm_open_driver()
in multiple threads lead to global device data corruption.

At the moment there's no easy way to redesign this so simplest thing
we may do is to just acquire device fd in main process and reopen it
(this doesn't involve any device scanning) in spawned threads.

Lets use drm_reopen_driver() to stop calling not thread-safe code.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_evict.c        |  8 ++++----
 tests/intel/xe_exec_threads.c | 22 ++++++++--------------
 2 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 8ef55211f7..9b97cccab2 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -61,7 +61,7 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 	bo = calloc(n_execs / 2, sizeof(*bo));
 	igt_assert(bo);
 
-	fd = drm_open_driver(DRIVER_XE);
+	fd = drm_reopen_driver(fd);
 
 	vm = xe_vm_create(fd, 0, 0);
 	if (flags & BIND_EXEC_QUEUE)
@@ -769,21 +769,21 @@ igt_main
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("evict-%s", s->name)
-			test_evict(-1, hwe, s->n_exec_queues, s->n_execs,
+			test_evict(fd, hwe, s->n_exec_queues, s->n_execs,
 				   calc_bo_size(vram_size, s->mul, s->div),
 				   s->flags, NULL);
 	}
 
 	for (const struct section_cm *s = sections_cm; s->name; s++) {
 		igt_subtest_f("evict-%s", s->name)
-			test_evict_cm(-1, hwe, s->n_exec_queues, s->n_execs,
+			test_evict_cm(fd, hwe, s->n_exec_queues, s->n_execs,
 				      calc_bo_size(vram_size, s->mul, s->div),
 				      s->flags, NULL);
 	}
 
 	for (const struct section_threads *s = sections_threads; s->name; s++) {
 		igt_subtest_f("evict-%s", s->name)
-			threads(-1, hwe, s->n_threads, s->n_exec_queues,
+			threads(fd, hwe, s->n_threads, s->n_exec_queues,
 				 s->n_execs,
 				 calc_bo_size(vram_size, s->mul, s->div),
 				 s->flags);
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 8083980f90..1e80842b98 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -71,8 +71,8 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 
-	if (!fd) {
-		fd = drm_open_driver(DRIVER_XE);
+	if (flags & FD) {
+		fd = drm_reopen_driver(fd);
 		owns_fd = true;
 	}
 
@@ -273,8 +273,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 
-	if (!fd) {
-		fd = drm_open_driver(DRIVER_XE);
+	if (flags & FD) {
+		fd = drm_reopen_driver(fd);
 		owns_fd = true;
 	}
 
@@ -477,8 +477,8 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
 
-	if (!fd) {
-		fd = drm_open_driver(DRIVER_XE);
+	if (flags & FD) {
+		fd = drm_reopen_driver(fd);
 		owns_fd = true;
 	}
 
@@ -995,10 +995,7 @@ static void threads(int fd, int flags)
 #define ADDRESS_SHIFT	39
 		threads_data[i].addr = addr | (i << ADDRESS_SHIFT);
 		threads_data[i].userptr = userptr | (i << ADDRESS_SHIFT);
-		if (flags & FD)
-			threads_data[i].fd = 0;
-		else
-			threads_data[i].fd = fd;
+		threads_data[i].fd = fd;
 		threads_data[i].vm_legacy_mode = vm_legacy_mode;
 		threads_data[i].vm_compute_mode = vm_compute_mode;
 		threads_data[i].eci = hwe;
@@ -1046,10 +1043,7 @@ static void threads(int fd, int flags)
 						threads_data[i].addr = addr;
 					threads_data[i].userptr = userptr |
 						(i << ADDRESS_SHIFT);
-					if (flags & FD)
-						threads_data[i].fd = 0;
-					else
-						threads_data[i].fd = fd;
+					threads_data[i].fd = fd;
 					threads_data[i].gt = gt;
 					threads_data[i].vm_legacy_mode =
 						vm_legacy_mode;
-- 
2.34.1

