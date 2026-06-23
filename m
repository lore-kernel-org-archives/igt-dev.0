Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63271CDB46F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 11:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173D310EAA7;
	Tue, 23 Jun 2026 11:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNiZGEox";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2301B10EA9A
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 11:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782213318; x=1813749318;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5BojPd5f8DnIvZbFo+o0gIRqFFq47sKzGGadHQw8t24=;
 b=YNiZGEoxLtmuGbpMNWBc7JwTjevCJ6xVM1uKZzKdt9zZuUjH1XiwkTY6
 5S23fyYgwv1TeqB1x9pVgUvKePeHqVtBNChgfyiuLxadG9mVQQPPvDnpq
 3qSioPCevz/eq4v6BOvJi3r4EbI5FQFiy4ZF/iIaoPrT9p158CCRFeMQv
 5advhZUwh/wSDQu9a6tsveYjQo8GH0CElfL9T7GDqG2nKiQL03oid/eXa
 JFT9RgHuqLnh8/rbTesV49uqEDjauaxYlrwjokbEtZ5zNdkJEonldoQ1b
 FNBT29ZqwwOZe+L/mpaoSdzsfjrzZYFQmkGPO5aE1y4IqCLDZQyjnFtKC g==;
X-CSE-ConnectionGUID: g0w9/GjOSxO8zgmpyipsMw==
X-CSE-MsgGUID: 0i2lZpreSSeOfGW4PWZbyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="108496958"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="108496958"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 04:15:18 -0700
X-CSE-ConnectionGUID: JnuNfJvTQ2ewvOT7Z3jU1w==
X-CSE-MsgGUID: 9lIFkvK6Q4aPrjw9XBuXiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="249610557"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by orviesa009.jf.intel.com with ESMTP; 23 Jun 2026 04:15:16 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com, ramadevi.gandi@intel.com,
 dwarakanath.ramadeva@intel.com, kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t 2/2] tests/intel/xe*.c: Add documentation to multi-queue
 tests and subtests.
Date: Tue, 23 Jun 2026 16:45:13 +0530
Message-ID: <20260623111510.1651747-6-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623111510.1651747-4-priyanka.dandamudi@intel.com>
References: <20260623111510.1651747-4-priyanka.dandamudi@intel.com>
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

Add Mega feature and Sub-category fields to multi-queue tests and subtests.

v2: Do not make single params, instead directly code it in evict
documentation and some nits in reset test.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_evict.c           | 62 ++++++++++++++++++------
 tests/intel/xe_exec_fault_mode.c | 81 ++++++++++++++++++++++----------
 tests/intel/xe_exec_reset.c      | 52 +++++++++++++++-----
 tests/intel/xe_exec_threads.c    | 44 ++++++++++-------
 4 files changed, 169 insertions(+), 70 deletions(-)

diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 3f1d6cb9ce..5a7298db04 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -559,11 +559,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  * arg[1]:
  *
  * @small:			small
- * @small-multi-queue:		small multi queue
- * @small-multi-queue-priority:
- * 				small multi queue priority
  * @small-external:		small external
- * @small-external-multi-queue: small external multi queue
  * @small-multi-vm:		small multi VM
  * @beng-small:			small bind exec_queue
  * @beng-small-external:	small external bind exec_queue
@@ -593,12 +589,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  * arg[1]:
  *
  * @small-cm:			small compute machine
- * @small-multi-queue-cm:	small multi queue compute machine
- * @small-multi-queue-priority-cm:
- * 				small multi queue priority compute machine
  * @small-external-cm:		small external compute machine
- * @small-external-multi-queue-cm:
- * 				small external compute machine multi queue
  * @small-multi-vm-cm:		small multi VM compute machine
  * @beng-small-cm:		small bind exec_queue compute machine
  * @beng-small-external-cm:	small external bind exec_queue compute machine
@@ -629,8 +620,6 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  * arg[1]:
  *
  * @mixed-threads-small:	mixed threads small
- * @mixed-threads-small-multi-queue:
- * 				mixed threads small multi queue
  * @mixed-many-threads-small:	mixed many threads small
  * @mixed-threads-small-multi-vm:
  * 				mixed threads small multi vm
@@ -668,8 +657,6 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  *
  * arg[1]:
  * @cm-threads-small:		compute mode threads small
- * @cm-threads-small-multi-queue:
- * 				compute mode threads small multi queue
  * @cm-threads-small-multi-vm:	compute mode threads small multi vm
  * @beng-cm-threads-small:	bind exec_queue compute mode threads small
  * @beng-cm-threads-small-multi-vm:
@@ -700,7 +687,6 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  *
  * @threads-small:		threads small
  * @beng-threads-small:		bind exec_queue threads small
- * @threads-small-multi-queue:	threads small multi queue
  * @threads-small-multi-vm:	threads small multi vm
  * @beng-threads-small-multi-vm:
  *				bind exec_queue threads small multi vm
@@ -722,6 +708,54 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  * @beng-threads-large:		bind exec_queue threads large
  *
  */
+/**
+ * SUBTEST: evict-%s
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description:  %arg[1] evict test.
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @small-multi-queue:		small multi queue
+ * @small-multi-queue-priority:	small multi queue priority
+ * @small-external-multi-queue: small external multi queue
+ *
+ * SUBTEST: evict-%s
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description:  %arg[1] evict test.
+ * Feature: compute machine
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @small-multi-queue-cm:	small multi queue compute machine
+ * @small-multi-queue-priority-cm:	small multi queue priority compute machine
+ * @small-external-multi-queue-cm:	small external compute machine multi queue
+ *
+ * SUBTEST: evict-mixed-threads-small-multi-queue
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description:  mixed threads small multi queue evict test.
+ * Feature: mixed threads
+ * Test category: functionality test
+ *
+ * SUBTEST: evict-cm-threads-small-multi-queue
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description:  compute mode threads small multi queue evict test.
+ * Feature: compute mode threads
+ * Test category: functionality test
+ *
+ * SUBTEST: evict-threads-small-multi-queue
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description:  threads small multi queue evict test.
+ * Feature: threads
+ * Test category: functionality test
+ *
+ */
 
 /*
  * Table driven test that attempts to cover all possible scenarios of eviction
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 4649c67de7..7277eb007c 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -78,14 +78,6 @@
  *					bindexecqueue userptr invalidate
  * @bindexecqueue-userptr-invalidate-race:
  *					bindexecqueue userptr invalidate race
- * @multi-queue:			multi-queue
- * @multi-queue-userptr:		multi-queue userptr
- * @multi-queue-rebind:			multi-queue rebind
- * @multi-queue-userptr-rebind:		multi-queue userptr rebind
- * @multi-queue-userptr-invalidate:
- *					multi-queue userptr invalidate
- * @multi-queue-userptr-invalidate-race:
- *					multi-queue userptr invalidate race
  * @basic-imm:				basic imm
  * @userptr-imm:			userptr imm
  * @rebind-imm:				rebind imm
@@ -101,15 +93,6 @@
  *					bindexecqueue userptr invalidate imm
  * @bindexecqueue-userptr-invalidate-race-imm:
  *					bindexecqueue userptr invalidate race imm
- * @multi-queue-imm:			multi-queue imm
- * @multi-queue-userptr-imm:		multi-queue userptr imm
- * @multi-queue-rebind-imm:		multi-queue rebind imm
- * @multi-queue-userptr-rebind-imm:
- *					multi-queue userptr rebind imm
- * @multi-queue-userptr-invalidate-imm:
- *					multi-queue userptr invalidate imm
- * @multi-queue-userptr-invalidate-race-imm:
- *					multi-queue userptr invalidate race imm
  * @basic-prefetch:			basic prefetch
  * @userptr-prefetch:			userptr prefetch
  * @rebind-prefetch:			rebind prefetch
@@ -124,17 +107,63 @@
  *					bindexecqueue userptr invalidate prefetch
  * @bindexecqueue-userptr-invalidate-race-prefetch:
  *					bindexecqueue userptr invalidate race prefetch
- * @multi-queue-prefetch:		multi-queue prefetch
- * @multi-queue-userptr-prefetch:	multi-queue userptr prefetch
- * @multi-queue-rebind-prefetch:	multi-queue rebind prefetch
- * @multi-queue-userptr-rebind-prefetch:	multi-queue userptr rebind prefetch
- * @multi-queue-userptr-invalidate-prefetch:
- *					multi-queue userptr invalidate prefetch
- * @multi-queue-userptr-invalidate-race-prefetch:
- *					multi-queue userptr invalidate race prefetch
  * @invalid-fault:			invalid fault
  * @invalid-userptr-fault:		invalid userptr fault
- * @multi-queue-invalid-fault:		multi-queue invalid fault
+ */
+/**
+ * SUBTEST: once-%s
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description: Run %arg[1] fault mode test only once
+ * Test category: functionality test
+ *
+ * SUBTEST: twice-%s
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description: Run %arg[1] fault mode test twice
+ * Test category: functionality test
+ *
+ * SUBTEST: many-%s
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description: Run %arg[1] fault mode test many times
+ * Test category: stress test
+ *
+ * SUBTEST: many-execqueues-%s
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description: Run %arg[1] fault mode test on many exec_queues
+ * Test category: stress test
+ *
+ * arg[1]:
+ *
+ * @multi-queue:                        multi-queue
+ * @multi-queue-userptr:                multi-queue userptr
+ * @multi-queue-rebind:                 multi-queue rebind
+ * @multi-queue-userptr-rebind:         multi-queue userptr rebind
+ * @multi-queue-userptr-invalidate:
+ *                                      multi-queue userptr invalidate
+ * @multi-queue-userptr-invalidate-race:
+ *                                      multi-queue userptr invalidate race
+ * @multi-queue-imm:                    multi-queue imm
+ * @multi-queue-userptr-imm:            multi-queue userptr imm
+ * @multi-queue-rebind-imm:             multi-queue rebind imm
+ * @multi-queue-userptr-rebind-imm:
+ *                                      multi-queue userptr rebind imm
+ * @multi-queue-userptr-invalidate-imm:
+ *                                      multi-queue userptr invalidate imm
+ * @multi-queue-userptr-invalidate-race-imm:
+ *                                      multi-queue userptr invalidate race imm
+ * @multi-queue-prefetch:               multi-queue prefetch
+ * @multi-queue-userptr-prefetch:       multi-queue userptr prefetch
+ * @multi-queue-rebind-prefetch:        multi-queue rebind prefetch
+ * @multi-queue-userptr-rebind-prefetch:
+ *                                      multi-queue userptr rebind prefetch
+ * @multi-queue-userptr-invalidate-prefetch:
+ *                                      multi-queue userptr invalidate prefetch
+ * @multi-queue-userptr-invalidate-race-prefetch:
+ *                                      multi-queue userptr invalidate race prefetch
+ * @multi-queue-invalid-fault:          multi-queue invalid fault
  * @multi-queue-invalid-userptr-fault:  multi-queue invalid userptr fault
  */
 
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 4634c24d94..044d8f007e 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -350,9 +350,13 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
  * Description: Test long spinners with many preemptable jobs, use queues again spinners complete on media GT
  *
  * SUBTEST: multi-queue-long-spin-many-queue-switch
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
  * Description: Test long spinners with many jobs with multi-queue switching
  *
  * SUBTEST: multi-queue-long-spin-reuse-many-queue-switch
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
  * Description: Test long spinners with many jobs with multi-queue switching, use queues again once spinners complete
  *
  * SUBTEST: gt-reset
@@ -383,43 +387,67 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
  * Description: Test compute mode close exec_queues close fd
  *
  * SUBTEST: multi-queue-cat-error
- * Description: Test cat error with multi_queue
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description: Test cat error with Multi-Queue
  *
  * SUBTEST: multi-queue-cat-error-on-secondary
- * Description: Test cat error with multi_queue
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description: Test cat error with Multi-Queue
  *              on a secondary queue
  *
  * SUBTEST: multi-queue-gt-reset
- * Description: Test GT reset with multi_queue
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description: Test GT reset with Multi-Queue
  *
  * SUBTEST: multi-queue-cancel
- * Description: Test engine reset with multi_queue
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description: Test engine reset with Multi-Queue
  *
  * SUBTEST: multi-queue-cancel-on-secondary
- * Description: Test engine reset with multi_queue
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description: Test engine reset with Multi-Queue
  *              on a secondary queue
  *
  * SUBTEST: multi-queue-close-fd
- * Description: Test close fd with multi_queue
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description: Test close fd with Multi-Queue
  *
  * SUBTEST: multi-queue-close-execqueues
- * Description: Test close execqueues with multi_queue
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description: Test close execqueues with Multi-Queue
  *
  * SUBTEST: cm-multi-queue-cat-error
- * Description: Test compute mode cat error with multi_queue
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description: Test compute mode cat error with Multi-Queue
  *
  * SUBTEST: cm-multi-queue-cat-error-on-secondary
- * Description: Test compute mode cat error with multi_queue
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description: Test compute mode cat error with Multi-Queue
  *              on a secondary queue
  *
  * SUBTEST: cm-multi-queue-gt-reset
- * Description: Test compute mode GT reset with multi_queue
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description: Test compute mode GT reset with Multi-Queue
  *
  * SUBTEST: cm-multi-queue-close-fd
- * Description: Test compute mode close fd with multi_queue
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description: Test compute mode close fd with Multi-Queue
  *
  * SUBTEST: cm-multi-queue-close-execqueues
- * Description: Test compute mode close execqueues with multi_queue
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description: Test compute mode close execqueues with Multi-Queue
  */
 
 static void
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 24dae2b52b..0480df779e 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -1203,6 +1203,14 @@ static void *thread(void *data)
  *	balancer mixed fd userptr invalidate
  * @bal-mixed-fd-userptr-invalidate-race:
  *	balancer mixed fd userptr invalidate race
+ */
+/**
+ * SUBTEST: threads-%s
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description: Run threads %arg[1] test with multi threads
+ *
+ * arg[1]:
  * @multi-queue-basic:
  *	multi-queue basic
  * @multi-queue-userptr:
@@ -1244,49 +1252,49 @@ static void *thread(void *data)
  * @multi-queue-fd-userptr-invalidate-race:
  *	multi-queue fd userptr invalidate race
  * @multi-queue-hang-basic:
- *     multi-queue hang basic
+ *	multi-queue hang basic
  * @multi-queue-hang-fd-userptr-invalidate-race:
  *	multi-queue hang fd userptr invalidate race
  * @multi-queue-mixed-basic:
  *	multi-queue mixed basic
  * @multi-queue-mixed-userptr:
- *	multi-queue-mixed userptr
+ *	multi-queue mixed userptr
  * @multi-queue-mixed-rebind:
- *	multi-queue-mixed rebind
+ *	multi-queue mixed rebind
  * @multi-queue-mixed-userptr-rebind:
- *	multi-queue-mixed userptr rebind
+ *	multi-queue mixed userptr rebind
  * @multi-queue-mixed-userptr-invalidate:
- *	multi-queue-mixed userptr invalidate
+ *	multi-queue mixed userptr invalidate
  * @multi-queue-mixed-userptr-invalidate-race:
- *	multi-queue-mixed userptr invalidate race
+ *	multi-queue mixed userptr invalidate race
  * @multi-queue-mixed-shared-vm-basic:
  *	multi-queue mixed shared vm basic
  * @multi-queue-mixed-shared-vm-userptr:
- *	multi-queue-mixed shared vm userptr
+ *	multi-queue mixed shared vm userptr
  * @multi-queue-mixed-shared-vm-rebind:
- *	multi-queue-mixed shared vm rebind
+ *	multi-queue mixed shared vm rebind
  * @multi-queue-mixed-shared-vm-userptr-rebind:
- *	multi-queue-mixed shared vm userptr rebind
+ *	multi-queue mixed shared vm userptr rebind
  * @multi-queue-mixed-shared-vm-userptr-invalidate:
- *	multi-queue-mixed shared vm userptr invalidate
+ *	multi-queue mixed shared vm userptr invalidate
  * @multi-queue-mixed-shared-vm-userptr-invalidate-race:
- *	multi-queue-mixed shared vm userptr invalidate race
+ *	multi-queue mixed shared vm userptr invalidate race
  * @multi-queue-mixed-fd-basic:
  *	multi-queue mixed fd basic
  * @multi-queue-mixed-fd-userptr:
- *	multi-queue-mixed fd userptr
+ *	multi-queue mixed fd userptr
  * @multi-queue-mixed-fd-rebind:
- *	multi-queue-mixed fd rebind
+ *	multi-queue mixed fd rebind
  * @multi-queue-mixed-fd-userptr-rebind:
- *	multi-queue-mixed fd userptr rebind
+ *	multi-queue mixed fd userptr rebind
  * @multi-queue-mixed-fd-userptr-invalidate:
- *	multi-queue-mixed fd userptr invalidate
+ *	multi-queue mixed fd userptr invalidate
  * @multi-queue-mixed-fd-userptr-invalidate-race:
- *	multi-queue-mixed fd userptr invalidate race
+ *	multi-queue mixed fd userptr invalidate race
  * @multi-queue-cm-basic:
- * 	multi-queue cm basic
+ *	multi-queue cm basic
  * @multi-queue-cm-fd-basic:
- * 	multi-queue cm fd basic
+ *	multi-queue cm fd basic
  * @multi-queue-cm-userptr:
  *	multi-queue compute mode userptr
  * @multi-queue-cm-rebind:
-- 
2.43.0

