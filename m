Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54292CAC5AC
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 23:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F2210E209;
	Tue, 23 Sep 2025 23:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PQ9j+Qom";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D220810E0C0
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 23:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758671084; x=1790207084;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cgj50HY8dtVygZ7wV1Cq8m4U7JcqmvE/vDp9MvO14Wo=;
 b=PQ9j+Qom387Z3zALP+dFKq1reO2Ke12hDvdWps8qpmehF0cUtu57SviI
 PSYS9Bt7UmvrbYC3xsvD781/9459OrzJwcQCMyxSwFF81XQ/fm+UmL/xe
 2TyweAtYtIGnkbhw7rD2y9R5waK6ChMBU9lKg/rjCTdzs8Yk8iNgXTooP
 jvNrquLj1XATwtNPzIHlY2jgPeK8tgKBzmD1imydrROC/Ui2bI//ppc23
 DSI0g7M/fctCRQFiAeVrgar6IDq9I9jQhcyM3K+wNBIqZ+slPXb/eWXnj
 Wtt+CloBrg4tsAr6n/p11uA6sMJegfbg83q/HMsMkLprY+nxVjr2ABQVH g==;
X-CSE-ConnectionGUID: UpVzxlwQTQ2u7W9v5McFRw==
X-CSE-MsgGUID: 6k6kIaj5RgaQu/a68o/4qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60901853"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60901853"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 16:44:43 -0700
X-CSE-ConnectionGUID: QLHEvu+IQ3KQyzIOVnD6vg==
X-CSE-MsgGUID: J+PduFaZQEi98WI0Vy7G5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="182059121"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 16:44:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] tests/intel/xe_exec_threads: Add many queues section
Date: Tue, 23 Sep 2025 16:44:39 -0700
Message-Id: <20250923234439.813972-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add many queues section which creates an exec queue for each submission.
Helpful to test VF migration which is rapidly creating / destroying
queues.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_threads.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index be5549c84f..bb39eecbe3 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -40,6 +40,7 @@
 #define HANG		(0x1 << 11)
 #define REBIND_ERROR	(0x1 << 12)
 #define BIND_EXEC_QUEUE	(0x1 << 13)
+#define MANY_QUEUES	(0x1 << 14)
 
 pthread_barrier_t barrier;
 
@@ -539,7 +540,8 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	memset(sync_all, 0, sizeof(sync_all));
 	for (i = 0; i < n_exec_queues; i++) {
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		if (!(flags & MANY_QUEUES))
+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 		if (flags & BIND_EXEC_QUEUE)
 			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm,
 									0);
@@ -570,6 +572,15 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		uint64_t exec_addr;
 		int e = i % n_exec_queues;
 
+		if (flags & MANY_QUEUES) {
+			if (exec_queues[e]) {
+				igt_assert(syncobj_wait(fd, &syncobjs[e], 1,
+							INT64_MAX, 0, NULL));
+				xe_exec_queue_destroy(fd, exec_queues[e]);
+			}
+			exec_queues[e] = xe_exec_queue_create(fd, vm, eci, 0);
+		}
+
 		if (flags & HANG && e == hang_exec_queue && i == e) {
 			spin_opts.addr = addr + spin_offset;
 			xe_spin_init(&data[i].spin, &spin_opts);
@@ -762,6 +773,8 @@ static void *thread(void *data)
  * arg[1]:
  * @basic:
  *	basic
+ * @many-queues:
+ *	many queues
  * @userptr:
  *	userptr
  * @rebind:
@@ -1103,6 +1116,7 @@ igt_main
 		unsigned int flags;
 	} sections[] = {
 		{ "basic", 0 },
+		{ "many-queues", MANY_QUEUES },
 		{ "userptr", USERPTR },
 		{ "rebind", REBIND },
 		{ "rebind-bindexecqueue", REBIND | BIND_EXEC_QUEUE },
-- 
2.34.1

