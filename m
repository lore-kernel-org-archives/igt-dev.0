Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09357D31A14
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 06:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936C510E58D;
	Wed, 14 Jan 2026 06:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="He52+3ix";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D4510E362
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 06:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768373970; x=1799909970;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=gz2vAKFCqa5Yk0B0UxK4IlYrI96k/azzogwg9kdyAcA=;
 b=He52+3ixW4aP3H7RIliyWhTiuj+i8BdMC3p9NBgTsIO8Y5Mfr1W2yoC7
 83ut3pwClsBya3b/NkeHgdAJr0PmTEHVZPkCx6Eh2x0a1QGR4qIsHRSJJ
 EzfqTxGN5gWK8Pe5i/OvSF/dtARQx6a6/bXTvCcTGrCbGbNPWho0dQ05x
 dXM4dt59mv9qHF3edgLmdAmUIV8foIESFqwgEKKD76KQCtSc8e4uqtlYC
 NDR4LGoLbICWw0xElViqQ9Iy9gxydG1FtOnolcElVK1BeHBydVeMPxHBi
 epQty/wn9OJOA10405KGOaUldVkhZjEqhjqJtnQb+1+r5Q1TRL6gykRfC g==;
X-CSE-ConnectionGUID: 4GG8X4H+QpeGfuLSpkwNVw==
X-CSE-MsgGUID: BM77dEBYSOmdzL/6p6f+GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69647888"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69647888"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:59:30 -0800
X-CSE-ConnectionGUID: EvG4lB+3SwS2ch0h30/7FQ==
X-CSE-MsgGUID: dksY+KsnQ0aoftY9/g3KGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="205159890"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jan 2026 22:59:28 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com, ramadevi.gandi@intel.com,
 dwarakanath.ramadeva@intel.com
Subject: [PATCH i-g-t 1/9] tests/intel/xe_exec_fault_mode: Add multi-queue
 test support
Date: Wed, 14 Jan 2026 12:29:17 +0530
Message-ID: <20260114065925.197958-2-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
References: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
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

Extend fault mode test to cover multi-queue test scenarios.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_exec_fault_mode.c | 111 ++++++++++++++++++++++++++-----
 1 file changed, 96 insertions(+), 15 deletions(-)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 5f42051a1..3e92dfbd9 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -35,6 +35,7 @@
 #define INVALID_FAULT	(0x1 << 7)
 #define INVALID_VA	(0x1 << 8)
 #define ENABLE_SCRATCH  (0x1 << 9)
+#define MULTI_QUEUE	(0x1 << 10)
 
 /**
  * SUBTEST: invalid-va
@@ -77,6 +78,14 @@
  *					bindexecqueue userptr invalidate
  * @bindexecqueue-userptr-invalidate-race:
  *					bindexecqueue userptr invalidate race
+ * @multi-queue:			multi-queue
+ * @multi-queue-userptr:		multi-queue userptr
+ * @multi-queue-rebind:			multi-queue rebind
+ * @multi-queue-userptr-rebind:		multi-queue userptr rebind
+ * @multi-queue-userptr-invalidate:
+ *					multi-queue userptr invalidate
+ * @multi-queue-userptr-invalidate-race:
+ *					multi-queue userptr invalidate race
  * @basic-imm:				basic imm
  * @userptr-imm:			userptr imm
  * @rebind-imm:				rebind imm
@@ -92,6 +101,15 @@
  *					bindexecqueue userptr invalidate imm
  * @bindexecqueue-userptr-invalidate-race-imm:
  *					bindexecqueue userptr invalidate race imm
+ * @multi-queue-imm:			multi-queue imm
+ * @multi-queue-userptr-imm:		multi-queue userptr imm
+ * @multi-queue-rebind-imm:		multi-queue rebind imm
+ * @multi-queue-userptr-rebind-imm:
+ *					multi-queue userptr rebind imm
+ * @multi-queue-userptr-invalidate-imm:
+ *					multi-queue userptr invalidate imm
+ * @multi-queue-userptr-invalidate-race-imm:
+ *					multi-queue userptr invalidate race imm
  * @basic-prefetch:			basic prefetch
  * @userptr-prefetch:			userptr prefetch
  * @rebind-prefetch:			rebind prefetch
@@ -106,8 +124,18 @@
  *					bindexecqueue userptr invalidate prefetch
  * @bindexecqueue-userptr-invalidate-race-prefetch:
  *					bindexecqueue userptr invalidate race prefetch
+ * @multi-queue-prefetch:		multi-queue prefetch
+ * @multi-queue-userptr-prefetch:	multi-queue userptr prefetch
+ * @multi-queue-rebind-prefetch:	multi-queue rebind prefetch
+ * @multi-queue-userptr-rebind-prefetch:	multi-queue userptr rebind prefetch
+ * @multi-queue-userptr-invalidate-prefetch:
+ *					multi-queue userptr invalidate prefetch
+ * @multi-queue-userptr-invalidate-race-prefetch:
+ *					multi-queue userptr invalidate race prefetch
  * @invalid-fault:			invalid fault
  * @invalid-userptr-fault:		invalid userptr fault
+ * @multi-queue-invalid-fault:		multi-queue invalid fault
+ * @multi-queue-invalid-userptr-fault:  multi-queue invalid userptr fault
  */
 
 static void
@@ -188,7 +216,19 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	memset(exec_sync, 0, sync_size);
 
 	for (i = 0; i < n_exec_queues; i++) {
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
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
+		} else
+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+
 		if (flags & BIND_EXEC_QUEUE)
 			bind_exec_queues[i] =
 				xe_bind_exec_queue_create(fd, vm, 0);
@@ -398,6 +438,21 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		close(map_fd);
 }
 
+static void
+test_exec_main(int fd, int n_exec_queues, int n_execs, unsigned int flags)
+{
+	struct drm_xe_engine_class_instance *hwe;
+
+	if (flags & MULTI_QUEUE) {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			test_exec(fd, hwe, n_exec_queues, n_execs, flags);
+	} else {
+		xe_for_each_engine(fd, hwe)
+			test_exec(fd, hwe, n_exec_queues, n_execs, flags);
+	}
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -420,6 +475,15 @@ int igt_main()
 			INVALIDATE },
 		{ "bindexecqueue-userptr-invalidate-race", BIND_EXEC_QUEUE | USERPTR |
 			INVALIDATE | RACE },
+		{ "multi-queue", MULTI_QUEUE },
+		{ "multi-queue-userptr", MULTI_QUEUE | USERPTR },
+		{ "multi-queue-rebind",  MULTI_QUEUE | REBIND },
+		{ "multi-queue-userptr-rebind", MULTI_QUEUE | USERPTR | REBIND },
+		{ "multi-queue-userptr-invalidate", MULTI_QUEUE | USERPTR |
+			INVALIDATE },
+		{ "multi-queue-userptr-invalidate-race", MULTI_QUEUE | USERPTR |
+			INVALIDATE | RACE },
+
 		{ "basic-imm", IMMEDIATE },
 		{ "userptr-imm", IMMEDIATE | USERPTR },
 		{ "rebind-imm", IMMEDIATE | REBIND },
@@ -436,6 +500,15 @@ int igt_main()
 			USERPTR | INVALIDATE },
 		{ "bindexecqueue-userptr-invalidate-race-imm", IMMEDIATE |
 			BIND_EXEC_QUEUE | USERPTR | INVALIDATE | RACE },
+		{ "multi-queue-imm", IMMEDIATE | MULTI_QUEUE },
+		{ "multi-queue-userptr-imm", IMMEDIATE | MULTI_QUEUE | USERPTR },
+		{ "multi-queue-rebind-imm", IMMEDIATE | MULTI_QUEUE | REBIND },
+		{ "multi-queue-userptr-rebind-imm", IMMEDIATE | MULTI_QUEUE |
+			USERPTR | REBIND },
+		{ "multi-queue-userptr-invalidate-imm", IMMEDIATE | MULTI_QUEUE |
+			USERPTR | INVALIDATE },
+		{ "multi-queue-userptr-invalidate-race-imm", IMMEDIATE |
+			MULTI_QUEUE | USERPTR | INVALIDATE | RACE },
 
 		{ "basic-prefetch", PREFETCH },
 		{ "userptr-prefetch", PREFETCH | USERPTR },
@@ -453,8 +526,20 @@ int igt_main()
 			USERPTR | INVALIDATE },
 		{ "bindexecqueue-userptr-invalidate-race-prefetch", PREFETCH |
 			BIND_EXEC_QUEUE | USERPTR | INVALIDATE | RACE },
+		{ "multi-queue-prefetch", PREFETCH | MULTI_QUEUE },
+		{ "multi-queue-userptr-prefetch", PREFETCH | MULTI_QUEUE | USERPTR },
+		{ "multi-queue-rebind-prefetch", PREFETCH | MULTI_QUEUE | REBIND },
+		{ "multi-queue-userptr-rebind-prefetch", PREFETCH | MULTI_QUEUE |
+			USERPTR | REBIND },
+		{ "multi-queue-userptr-invalidate-prefetch", PREFETCH | MULTI_QUEUE |
+			USERPTR | INVALIDATE },
+		{ "multi-queue-userptr-invalidate-race-prefetch", PREFETCH |
+			MULTI_QUEUE | USERPTR | INVALIDATE | RACE },
 		{ "invalid-fault", INVALID_FAULT },
 		{ "invalid-userptr-fault", INVALID_FAULT | USERPTR },
+		{ "multi-queue-invalid-fault", MULTI_QUEUE | INVALID_FAULT },
+		{ "multi-queue-invalid-userptr-fault", MULTI_QUEUE | INVALID_FAULT | USERPTR },
+
 		{ NULL },
 	};
 	int fd;
@@ -478,26 +563,22 @@ int igt_main()
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("once-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 1, 1, s->flags);
+			test_exec_main(fd, 1, 1, s->flags);
 
 		igt_subtest_f("twice-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 1, 2, s->flags);
+			test_exec_main(fd, 1, 2, s->flags);
 
 		igt_subtest_f("many-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 1,
-					  s->flags & (REBIND | INVALIDATE) ?
-					  64 : 128,
-					  s->flags);
+			test_exec_main(fd, 1,
+					s->flags & (REBIND | INVALIDATE) ?
+					64 : 128,
+					s->flags);
 
 		igt_subtest_f("many-execqueues-%s", s->name)
-			xe_for_each_engine(fd, hwe)
-				test_exec(fd, hwe, 16,
-					  s->flags & (REBIND | INVALIDATE) ?
-					  64 : 128,
-					  s->flags);
+			test_exec_main(fd, 16,
+					s->flags & (REBIND | INVALIDATE) ?
+					64 : 128,
+					s->flags);
 	}
 
 	igt_subtest("invalid-va")
-- 
2.43.0

