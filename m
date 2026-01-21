Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E486C4450D
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 11:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F5F10E1FC;
	Wed, 21 Jan 2026 11:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IudyzZz7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B890F10E75A
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 11:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768996005; x=1800532005;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Ovc1IN4g5l3owa0Juu+GWoDJu4RPIJ4qJ6ttw6mPlMo=;
 b=IudyzZz71HFk2fujgrpEEkH+xoPCnQEC2w2JOTXtGdU5ncaA+fwiVuuB
 /PzCBgCrWI88XkHhU349tvd912E440iCDB5cYXiKV8mPAFol54ZcExHso
 QGAnvpwPT6y9iQuqmrxsmBBcWVMIKbkZtW+tLarBYdUWKFc7NUO7+3EST
 pAeFSBsDHX66dEFO1uW3OdaTW33lkolujKFQOrU4W081yO0v0rfTTLhih
 rJnUGFBCp/bD8LmKTA2WJ+6rlhmU9Elk2GN+R4xaZjE74rLKTG6M9er8B
 U4xibg1uGzsJbgZfZZlB6k41ZqyE6/FJa2BmbEX+FofDP2imXTY75ecF3 Q==;
X-CSE-ConnectionGUID: 64YpOqlxQ2qOrOMAy/Fzlg==
X-CSE-MsgGUID: 6hF7zQTYTLaCquX0f6P9PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="92889037"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="92889037"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 03:46:45 -0800
X-CSE-ConnectionGUID: +feZu12FRXqvW7/O8a8qgA==
X-CSE-MsgGUID: NmCEDEjfSNOK43t8BXd5ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206347468"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa006.fm.intel.com with ESMTP; 21 Jan 2026 03:46:44 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com, ramadevi.gandi@intel.com,
 dwarakanath.ramadeva@intel.com
Subject: [PATCH v3 6/6] tests/intel/xe_exec_threads: Add multi queue for
 compute mode
Date: Wed, 21 Jan 2026 17:16:31 +0530
Message-ID: <20260121114631.277272-7-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121114631.277272-1-priyanka.dandamudi@intel.com>
References: <20260121114631.277272-1-priyanka.dandamudi@intel.com>
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

Add multi queue tests for compute mode.

v3: Add multi queue related code in the test_compute_code function.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_exec_threads.c | 79 ++++++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 0c14b242a..27d5a8928 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -312,8 +312,21 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	igt_assert(exec_sync != MAP_FAILED);
 	memset(exec_sync, 0, sync_size);
 
-	for (i = 0; i < n_exec_queues; i++)
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+	for (i = 0; i < n_exec_queues; i++) {
+		if (flags & MULTI_QUEUE) {
+			struct drm_xe_ext_set_property multi_queue = {
+				.base.next_extension = 0,
+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
+			};
+			uint64_t ext = to_user_pointer(&multi_queue);
+
+			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
+		} else {
+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		}
+	}
 
 	pthread_barrier_wait(&barrier);
 
@@ -1074,6 +1087,42 @@ static void *thread(void *data)
  *	multi-queue-mixed fd userptr invalidate
  * @multi-queue-mixed-fd-userptr-invalidate-race:
  *	multi-queue-mixed fd userptr invalidate race
+ * @multi-queue-cm-basic:
+ * 	multi-queue cm basic
+ * @multi-queue-cm-fd-basic:
+ * 	multi-queue cm fd basic
+ * @multi-queue-cm-userptr:
+ *	multi-queue compute mode userptr
+ * @multi-queue-cm-rebind:
+ *	multi-queue compute mode rebind
+ * @multi-queue-cm-userptr-rebind:
+ *	multi-queue compute mode userptr rebind
+ * @multi-queue-cm-userptr-invalidate:
+ *	multi-queue compute mode userptr invalidate
+ * @multi-queue-cm-userptr-invalidate-race:
+ *	multi-queue compute mode userptr invalidate race
+ * @multi-queue-cm-shared-vm-basic:
+ *	multi-queue compute mode shared vm basic
+ * @multi-queue-cm-shared-vm-userptr:
+ *	multi-queue compute mode shared vm userptr
+ * @multi-queue-cm-shared-vm-rebind:
+ *	multi-queue compute mode shared vm rebind
+ * @multi-queue-cm-shared-vm-userptr-rebind:
+ *	multi-queue compute mode shared vm userptr rebind
+ * @multi-queue-cm-shared-vm-userptr-invalidate:
+ *	multi-queue compute mode shared vm userptr invalidate
+ * @multi-queue-cm-shared-vm-userptr-invalidate-race:
+ *	multi-queue compute mode shared vm userptr invalidate race
+ * @multi-queue-cm-fd-userptr:
+ *	multi-queue compute mode fd userptr
+ * @multi-queue-cm-fd-rebind:
+ *	multi-queue compute mode fd rebind
+ * @multi-queue-cm-fd-userptr-rebind:
+ *	multi-queue compute mode fd userptr rebind
+ * @multi-queue-cm-fd-userptr-invalidate:
+ *	multi-queue compute mode fd userptr invalidate
+ * @multi-queue-cm-fd-userptr-invalidate-race:
+ *	multi-queue compute mode fd userptr invalidate race
  */
 
 static void threads(int fd, int flags)
@@ -1434,6 +1483,32 @@ int igt_main()
 			USERPTR | INVALIDATE },
 		{ "multi-queue-mixed-fd-userptr-invalidate-race", MULTI_QUEUE | MIXED_MODE | FD |
 			USERPTR | INVALIDATE | RACE },
+		{ "multi-queue-cm-basic", MULTI_QUEUE | COMPUTE_MODE },
+		{ "multi-queue-cm-userptr", MULTI_QUEUE | COMPUTE_MODE | USERPTR },
+		{ "multi-queue-cm-rebind", MULTI_QUEUE | COMPUTE_MODE | REBIND },
+		{ "multi-queue-cm-userptr-rebind", MULTI_QUEUE | COMPUTE_MODE | USERPTR | REBIND },
+		{ "multi-queue-cm-userptr-invalidate", MULTI_QUEUE | COMPUTE_MODE | USERPTR |
+			INVALIDATE },
+		{ "multi-queue-cm-userptr-invalidate-race", MULTI_QUEUE | COMPUTE_MODE | USERPTR |
+			INVALIDATE | RACE },
+		{ "multi-queue-cm-shared-vm-basic", MULTI_QUEUE | COMPUTE_MODE | SHARED_VM },
+		{ "multi-queue-cm-shared-vm-userptr", MULTI_QUEUE | COMPUTE_MODE | SHARED_VM | USERPTR },
+		{ "multi-queue-cm-shared-vm-rebind", MULTI_QUEUE | COMPUTE_MODE | SHARED_VM | REBIND },
+		{ "multi-queue-cm-shared-vm-userptr-rebind", MULTI_QUEUE | COMPUTE_MODE | SHARED_VM |
+			USERPTR | REBIND },
+		{ "multi-queue-cm-shared-vm-userptr-invalidate", MULTI_QUEUE | COMPUTE_MODE | SHARED_VM |
+			USERPTR | INVALIDATE },
+		{ "multi-queue-cm-shared-vm-userptr-invalidate-race", MULTI_QUEUE | COMPUTE_MODE |
+			SHARED_VM | USERPTR | INVALIDATE | RACE },
+		{ "multi-queue-cm-fd-basic", MULTI_QUEUE | COMPUTE_MODE | FD },
+		{ "multi-queue-cm-fd-userptr", MULTI_QUEUE | COMPUTE_MODE | FD | USERPTR },
+		{ "multi-queue-cm-fd-rebind", MULTI_QUEUE | COMPUTE_MODE | FD | REBIND },
+		{ "multi-queue-cm-fd-userptr-rebind", MULTI_QUEUE | COMPUTE_MODE | FD | USERPTR |
+			REBIND },
+		{ "multi-queue-cm-fd-userptr-invalidate", MULTI_QUEUE | COMPUTE_MODE | FD |
+			USERPTR | INVALIDATE },
+		{ "multi-queue-cm-fd-userptr-invalidate-race", MULTI_QUEUE | COMPUTE_MODE | FD |
+			USERPTR | INVALIDATE | RACE },
 		{ NULL },
 	};
 	int fd;
-- 
2.43.0

