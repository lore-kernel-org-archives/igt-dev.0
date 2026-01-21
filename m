Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D5FC4451F
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 11:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08FE10E1FC;
	Wed, 21 Jan 2026 11:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngmyv2E/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F5A10E1FC
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 11:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768995995; x=1800531995;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xsNnYgX3BWeltqD9P7dQYbbm4lMw7NBoBqvFjwBlC30=;
 b=ngmyv2E/F/H8Xw+f9O5b9JqDsczegyBr25n/ndRV9DNVvhXJh4q0YYct
 oJXMQq7Pt6vASxf2DR9neU4hu9LlA6CT9FoWDzMfmc+4mIhgEdJI8ibye
 TqZW7NKgRzHn5UbBo5RdAHydHf4M/x0MgHWSTUPc7fHFDIb5q/OJbc1Un
 BvGvPBujHtYFd+QjyJ3mf/F8ly7X66f6h71hofxrax05iu/dCgYl0UITA
 Y5WbH924rUY7o57keuFwILJxX1cmzTjTagqFET0neTTgW1rZEZS76sKA0
 3USQXE9+Nw4vX0QWbvBOH7chFOFN5YwuVoyQvBsObR1F67x3MDOhZlSTp Q==;
X-CSE-ConnectionGUID: NTFloiAnQ3Oa1qSBgiLu2g==
X-CSE-MsgGUID: 0Qp+F8l2T9C9iEbavlrSEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="92889031"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="92889031"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 03:46:35 -0800
X-CSE-ConnectionGUID: 1qSFO3G1RaOVXJKIhMdj5A==
X-CSE-MsgGUID: /LX7lTnpRryy6PKApZ5EVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206347407"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa006.fm.intel.com with ESMTP; 21 Jan 2026 03:46:33 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com, ramadevi.gandi@intel.com,
 dwarakanath.ramadeva@intel.com
Subject: [PATCH v3 1/6] tests/intel/xe_exec_fault_mode: Add multi-queue test
 support
Date: Wed, 21 Jan 2026 17:16:26 +0530
Message-ID: <20260121114631.277272-2-priyanka.dandamudi@intel.com>
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

Extend fault mode test to cover multi-queue test scenarios.

v2: Remove emailid's no longer valid.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
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

