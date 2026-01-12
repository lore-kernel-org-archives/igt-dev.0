Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C71C9EC89
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 13:01:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6A010E3CB;
	Mon, 12 Jan 2026 13:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EG6aqnVi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3AC10E3CB
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 13:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768222862; x=1799758862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CEaxQtt9SR9uIGypkQQZgmfTW5cixtDezkFSm/3lTAI=;
 b=EG6aqnVi9oXc/N94+LbVMxjSQkhz1uUrKaGW7dQE3t2iJo/GgG2h0DEk
 5rl39RfC4FWWZ/I36U8InOBMeC+G0ijp5Z53seqTXnFTmFGvUCapAOqYR
 0dW/4AIzc/iG8vPrlmhgXD7dqzOpQaV1fAtpvYHSsTEZJ4zqJIASGUtjm
 2S4WaFcDwoW44mFzRra5vVsDnInzNRlxxJK1i81awFb8nAk3wjRY/nxo6
 jHqB9SfcXnqR2Tbv+Y3Dr+XQLayDEgVwYsPuB1SinMbZBttIul67Oh90q
 RJmBE3gmTzqIpAJiujefHDkrkcYL3KxFoQDQI4XfaayPs6c002XiAnsh7 Q==;
X-CSE-ConnectionGUID: h8fejJa7SceIMLKSlEzAEg==
X-CSE-MsgGUID: v8sClrYlQXKoUKSbBVudXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69545584"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69545584"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:01:00 -0800
X-CSE-ConnectionGUID: PObFTp2+Q9y3TZq/OUn4Zw==
X-CSE-MsgGUID: YZfYvdCcRbiW94/f44wjwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204095047"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:58 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 15/21] tests/xe_eudebug: Add vm-bind-debug-data-ufence
 subtest
Date: Mon, 12 Jan 2026 15:00:01 +0200
Message-ID: <20260112130008.1649357-16-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
References: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
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

From: Christoph Manszewski <christoph.manszewski@intel.com>

Add a subtest for the newly introduced debug data passing interface.
Debug data (formery metadata) used to be attached as an extension to
VM_BIND_OP_MAP operations. As dedicated VM_BIND_OP_DEBUG_DATA_[ADD|REMOVE]
operations got introduced for debug data passing, this subtest
provides basic coverage for this new interface.

v2: squash in uapi changes (Mika)

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 .../drm-uapi-experimental/xe_drm_eudebug.h    |  33 +-
 lib/xe/xe_eudebug.c                           |  32 +-
 lib/xe/xe_eudebug.h                           |   5 +-
 tests/intel/xe_eudebug.c                      | 314 ++++++++++++++++--
 tests/intel/xe_eudebug_online.c               |   6 +-
 5 files changed, 325 insertions(+), 65 deletions(-)

diff --git a/include/drm-uapi-experimental/xe_drm_eudebug.h b/include/drm-uapi-experimental/xe_drm_eudebug.h
index a9aa87f564..43b8d12b47 100644
--- a/include/drm-uapi-experimental/xe_drm_eudebug.h
+++ b/include/drm-uapi-experimental/xe_drm_eudebug.h
@@ -69,13 +69,11 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_READ		1
 #define DRM_XE_EUDEBUG_EVENT_VM			2
 #define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		3
-#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	4
-#define DRM_XE_EUDEBUG_EVENT_VM_BIND		5
-#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP		6
-#define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	7
-#define DRM_XE_EUDEBUG_EVENT_METADATA		8
-#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA 9
-#define DRM_XE_EUDEBUG_EVENT_PAGEFAULT		10
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND		4
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA 5
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	6
+#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	7
+#define DRM_XE_EUDEBUG_EVENT_PAGEFAULT		8
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
@@ -182,13 +180,20 @@ struct drm_xe_eudebug_event_vm_bind {
 	__u32 num_binds;
 };
 
-struct drm_xe_eudebug_event_vm_bind_op {
-	struct drm_xe_eudebug_event base;
-	__u64 vm_bind_ref_seqno; /* *_event_vm_bind.base.seqno */
-	__u64 num_extensions;
-
-	__u64 addr; /* XXX: Zero for unmap all? */
-	__u64 range; /* XXX: Zero for unmap all? */
+struct drm_xe_eudebug_event_vm_bind_op_debug_data {
+        struct drm_xe_eudebug_event base;
+        __u64 vm_bind_ref_seqno; /* *_event_vm_bind.base.seqno */
+        __u64 num_extensions;
+
+        __u64 addr;
+        __u64 range;
+        __u64 flags;
+        __u32 offset;
+        __u32 reserved;
+        union {
+                __u64 pseudopath;
+                char pathname[PATH_MAX];
+        };
 };
 
 struct drm_xe_eudebug_event_vm_bind_ufence {
diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 1774e01f6f..f441a3c824 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -86,8 +86,8 @@ static const char *type_to_str(unsigned int type)
 		return "exec_queue";
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND:
 		return "vm_bind";
-	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP:
-		return "vm_bind_op";
+	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA:
+		return "vm_bind_op_debug_data";
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE:
 		return "vm_bind_ufence";
 	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION:
@@ -150,8 +150,9 @@ static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *bu
 			evmb->vm_handle, evmb->flags, evmb->num_binds);
 		break;
 	}
-	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
-		struct drm_xe_eudebug_event_vm_bind_op *op = igt_container_of(e, op, base);
+	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA: {
+		struct drm_xe_eudebug_event_vm_bind_op_debug_data *op =
+			igt_container_of(e, op, base);
 
 		sprintf(buf, "vm_bind_ref_seqno=%lld, addr=%016llx, range=%llu num_extensions=%llu",
 			op->vm_bind_ref_seqno, op->addr, op->range, op->num_extensions);
@@ -599,9 +600,11 @@ static int match_fields(struct drm_xe_eudebug_event *a, void *data)
 			ret = 1;
 		break;
 	}
-	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
-		struct drm_xe_eudebug_event_vm_bind_op *ea = igt_container_of(a, ea, base);
-		struct drm_xe_eudebug_event_vm_bind_op *eb = igt_container_of(b, eb, base);
+	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA: {
+		struct drm_xe_eudebug_event_vm_bind_op_debug_data *ea =
+			igt_container_of(a, ea, base);
+		struct drm_xe_eudebug_event_vm_bind_op_debug_data *eb =
+			igt_container_of(b, eb, base);
 
 		if (ea->addr == eb->addr && ea->range == eb->range &&
 		    ea->num_extensions == eb->num_extensions)
@@ -637,8 +640,8 @@ static int match_client_handle(struct drm_xe_eudebug_event *e, void *data)
 		return 1;
 		break;
 	}
-	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
-		struct drm_xe_eudebug_event_vm_bind_op *eo = igt_container_of(e, eo, base);
+	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA: {
+		struct drm_xe_eudebug_event_vm_bind_op_debug_data *eo = igt_container_of(e, eo, base);
 
 		if (eo->vm_bind_ref_seqno == *bind_seqno) {
 			*bind_op_seqno = eo->base.seqno;
@@ -700,9 +703,10 @@ static int match_opposite_resource(struct drm_xe_eudebug_event *e, void *data)
 			return 1;
 		break;
 	}
-	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
-		struct drm_xe_eudebug_event_vm_bind_op *avmb = igt_container_of(e, avmb, base);
-		struct drm_xe_eudebug_event_vm_bind_op *filter = data;
+	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA: {
+		struct drm_xe_eudebug_event_vm_bind_op_debug_data *avmb =
+			igt_container_of(e, avmb, base);
+		struct drm_xe_eudebug_event_vm_bind_op_debug_data *filter = data;
 
 		if (avmb->addr == filter->addr &&
 		    avmb->range == filter->range)
@@ -2105,12 +2109,12 @@ void xe_eudebug_client_vm_bind_op_event(struct xe_eudebug_client *c, uint32_t ev
 					uint64_t addr, uint64_t range,
 					uint64_t num_extensions)
 {
-	struct drm_xe_eudebug_event_vm_bind_op op;
+	struct drm_xe_eudebug_event_vm_bind_op_debug_data op = { 0 };
 
 	igt_assert(c);
 	igt_assert(op_ref_seqno);
 
-	base_event(c, to_base(op), DRM_XE_EUDEBUG_EVENT_VM_BIND_OP,
+	base_event(c, to_base(op), DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA,
 		   event_flags, sizeof(op));
 	op.vm_bind_ref_seqno = bind_ref_seqno;
 	op.addr = addr;
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index d191f8be8d..acf5bf601d 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -166,11 +166,10 @@ next_event(struct drm_xe_eudebug_event *e, struct xe_eudebug_event_log *l)
 #define XE_EUDEBUG_FILTER_EVENT_READ			BIT(DRM_XE_EUDEBUG_EVENT_READ)
 #define XE_EUDEBUG_FILTER_EVENT_VM			BIT(DRM_XE_EUDEBUG_EVENT_VM)
 #define XE_EUDEBUG_FILTER_EVENT_EXEC_QUEUE		BIT(DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE)
-#define XE_EUDEBUG_FILTER_EVENT_EXEC_QUEUE_PLACEMENTS	BIT(DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS)
-#define XE_EUDEBUG_FILTER_EVENT_EU_ATTENTION		BIT(DRM_XE_EUDEBUG_EVENT_EU_ATTENTION)
 #define XE_EUDEBUG_FILTER_EVENT_VM_BIND			BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND)
-#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP		BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_OP)
+#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP_DEBUG_DATA		BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA)
 #define XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE		BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE)
+#define XE_EUDEBUG_FILTER_EVENT_EU_ATTENTION		BIT(DRM_XE_EUDEBUG_EVENT_EU_ATTENTION)
 #define XE_EUDEBUG_FILTER_EVENT_PAGEFAULT		BIT(DRM_XE_EUDEBUG_EVENT_PAGEFAULT)
 #define XE_EUDEBUG_FILTER_ALL				GENMASK(DRM_XE_EUDEBUG_EVENT_PAGEFAULT, 0)
 #define XE_EUDEBUG_EVENT_IS_FILTERED(_e, _f)		((1UL << (_e)) & (_f))
diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index bdd1996f38..9e40f61fcf 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -64,6 +64,7 @@ static void test_sysfs_toggle(int fd)
 #define VM_BIND_DELAY_UFENCE_ACK	(1 << 6)
 #define VM_BIND_UFENCE_DISCONNECT	(1 << 7)
 #define VM_BIND_UFENCE_SIGINT_CLIENT	(1 << 8)
+#define VM_BIND_UFENCE_DEBUG_DATA	(1 << 9)
 #define TEST_FAULTABLE			(1 << 30)
 #define TEST_DISCOVERY			(1 << 31)
 
@@ -1080,7 +1081,7 @@ static void *discovery_race_thread(void *data)
 					if (e->type == DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE)
 						clients[i].exec_queue_count++;
 
-					if (e->type == DRM_XE_EUDEBUG_EVENT_VM_BIND_OP)
+					if (e->type == DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA)
 						clients[i].vm_bind_op_count++;
 				};
 
@@ -1436,7 +1437,7 @@ static void debugger_test_vma(struct xe_eudebug_debugger *d,
 static void vm_trigger(struct xe_eudebug_debugger *d,
 		       struct drm_xe_eudebug_event *e)
 {
-	struct drm_xe_eudebug_event_vm_bind_op *eo = (void *)e;
+	struct drm_xe_eudebug_event_vm_bind_op_debug_data *eo = (void *)e;
 
 	if (e->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
 		struct drm_xe_eudebug_event_vm_bind *eb;
@@ -1491,10 +1492,10 @@ static void test_vm_access(int fd, unsigned int flags, int num_clients)
 	xe_eudebug_for_each_engine(fd, hwe)
 		test_client_with_trigger(fd, flags, num_clients,
 					 vm_access_client,
-					 DRM_XE_EUDEBUG_EVENT_VM_BIND_OP,
+					 DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA,
 					 vm_trigger, hwe,
 					 false,
-					 XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP |
+					 XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP_DEBUG_DATA |
 					 XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE);
 }
 
@@ -1592,7 +1593,7 @@ static void debugger_test_vma_parameters(struct xe_eudebug_debugger *d,
 static void vm_trigger_access_parameters(struct xe_eudebug_debugger *d,
 					 struct drm_xe_eudebug_event *e)
 {
-	struct drm_xe_eudebug_event_vm_bind_op *eo = (void *)e;
+	struct drm_xe_eudebug_event_vm_bind_op_debug_data *eo = (void *)e;
 
 	if (e->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
 		struct drm_xe_eudebug_event_vm_bind *eb;
@@ -1644,10 +1645,10 @@ static void test_vm_access_parameters(int fd, unsigned int flags, int num_client
 	xe_eudebug_for_each_engine(fd, hwe)
 		test_client_with_trigger(fd, flags, num_clients,
 					 vm_access_client,
-					 DRM_XE_EUDEBUG_EVENT_VM_BIND_OP,
+					 DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA,
 					 vm_trigger_access_parameters, hwe,
 					 false,
-					 XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP |
+					 XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP_DEBUG_DATA |
 					 XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE);
 }
 
@@ -1661,13 +1662,16 @@ struct ufence_bind {
 	uint64_t addr;
 	uint64_t range;
 	uint64_t value;
+
+	uint64_t pseudopath;
+	char pathname[PATH_MAX];
 	struct {
 		uint64_t vm_sync;
 	} *fence_data;
 };
 
-static void client_wait_ufences(struct xe_eudebug_client *c,
-				struct ufence_bind *binds, int count)
+static void client_wait_ufences_timeout(struct xe_eudebug_client *c,
+					struct ufence_bind *binds, int count)
 {
 	const int64_t default_fence_timeout_ns = 500 * NSEC_PER_MSEC;
 	int64_t timeout_ns;
@@ -1703,6 +1707,8 @@ static void client_wait_ufences(struct xe_eudebug_client *c,
 	}
 }
 
+#define BINDS_WITH_UFENCE_RANGE 0x1000
+#define BINDS_WITH_UFENCE_BASE_ADDR 0x100000
 static struct ufence_bind *create_binds_with_ufence(int fd, int count)
 {
 	struct ufence_bind *binds;
@@ -1713,8 +1719,8 @@ static struct ufence_bind *create_binds_with_ufence(int fd, int count)
 	for (int i = 0; i < count; i++) {
 		struct ufence_bind *b = &binds[i];
 
-		b->range = 0x1000;
-		b->addr = 0x100000 + b->range * i;
+		b->range = BINDS_WITH_UFENCE_RANGE;
+		b->addr = BINDS_WITH_UFENCE_BASE_ADDR + b->range * i;
 		b->fence_data = aligned_alloc(xe_get_default_alignment(fd),
 					      sizeof(*b->fence_data));
 		igt_assert(b->fence_data);
@@ -1744,6 +1750,7 @@ static void basic_ufence_client(struct xe_eudebug_client *c)
 	size_t bo_size = n * xe_get_default_alignment(c->fd);
 	uint32_t bo = xe_bo_create(c->fd, 0, bo_size,
 				   system_memory(c->fd), 0);
+
 	struct ufence_bind *binds = create_binds_with_ufence(c->fd, n);
 
 	for (int i = 0; i < n; i++) {
@@ -1754,7 +1761,7 @@ static void basic_ufence_client(struct xe_eudebug_client *c)
 							      0, &b->f, 1);
 	}
 
-	client_wait_ufences(c, binds, n);
+	client_wait_ufences_timeout(c, binds, n);
 
 	for (int i = 0; i < n; i++) {
 		struct ufence_bind *b = &binds[i];
@@ -1767,8 +1774,10 @@ static void basic_ufence_client(struct xe_eudebug_client *c)
 	xe_eudebug_client_vm_destroy(c, vm);
 }
 
+#define DEBUG_DATA_COUNT 4
 struct ufence_priv {
 	struct drm_xe_eudebug_event_vm_bind_ufence ufence_events[UFENCE_EVENT_COUNT_MAX];
+	struct drm_xe_eudebug_event_vm_bind_op_debug_data debug_data_events[DEBUG_DATA_COUNT];
 	uint64_t ufence_event_seqno[UFENCE_EVENT_COUNT_MAX];
 	uint64_t ufence_event_vm_addr_start[UFENCE_EVENT_COUNT_MAX];
 	uint64_t ufence_event_vm_addr_range[UFENCE_EVENT_COUNT_MAX];
@@ -2138,7 +2147,7 @@ static void vm_bind_clear_client(struct xe_eudebug_client *c)
 static void vm_bind_clear_test_trigger(struct xe_eudebug_debugger *d,
 				       struct drm_xe_eudebug_event *e)
 {
-	struct drm_xe_eudebug_event_vm_bind_op *eo = (void *)e;
+	struct drm_xe_eudebug_event_vm_bind_op_debug_data *eo = (void *)e;
 	struct vm_bind_clear_priv *priv = d->ptr;
 
 	if (e->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
@@ -2204,7 +2213,8 @@ static void test_vm_bind_clear(int fd, uint32_t flags)
 	priv = vm_bind_clear_priv_create();
 	s = xe_eudebug_session_create(fd, vm_bind_clear_client, flags, priv);
 
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_OP,
+	xe_eudebug_debugger_add_trigger(s->debugger,
+					DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA,
 					vm_bind_clear_test_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					vm_bind_clear_ack_trigger);
@@ -2226,6 +2236,24 @@ static void test_vm_bind_clear(int fd, uint32_t flags)
 #define UFENCE_CLIENT_VM_TEST_VAL_START 0xaaaaaaaa
 #define UFENCE_CLIENT_VM_TEST_VAL_END 0xbbbbbbbb
 
+static void client_wait_ufences(struct xe_eudebug_client *c, int num_ufences,
+				struct ufence_bind *binds)
+{
+	for (int i = 0; i < num_ufences; i++) {
+		int err;
+		int64_t timeout_ns;
+		struct ufence_bind *b = &binds[i];
+
+		timeout_ns = XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * NSEC_PER_SEC;
+		err = __xe_wait_ufence(c->fd,
+				       &b->fence_data->vm_sync, b->f.timeline_value,
+				       0, &timeout_ns);
+		igt_assert_eq(err, 0);
+		igt_assert_eq(b->fence_data->vm_sync, b->f.timeline_value);
+		igt_debug("wait #%d completed\n", i);
+	}
+}
+
 static void vma_ufence_client(struct xe_eudebug_client *c)
 {
 	const unsigned int n = UFENCE_EVENT_COUNT_EXPECTED;
@@ -2256,26 +2284,13 @@ static void vma_ufence_client(struct xe_eudebug_client *c)
 							      0, &b->f, 1);
 	}
 
-	/* Wait for acks on ufences */
+	client_wait_ufences(c, n, binds);
+
 	for (int i = 0; i < n; i++) {
-		int err;
-		int64_t timeout_ns;
 		struct ufence_bind *b = &binds[i];
 
-		timeout_ns = XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * NSEC_PER_SEC;
-		err = __xe_wait_ufence(c->fd,
-				       &b->fence_data->vm_sync, b->f.timeline_value,
-				       0, &timeout_ns);
-		igt_assert_eq(err, 0);
-		igt_assert_eq(b->fence_data->vm_sync, b->f.timeline_value);
-		igt_debug("wait #%d completed\n", i);
-
 		for (int j = 0; j < items; j++)
 			igt_assert_eq(ptr[i][j], UFENCE_CLIENT_VM_TEST_VAL_END);
-	}
-
-	for (int i = 0; i < n; i++) {
-		struct ufence_bind *b = &binds[i];
 
 		xe_eudebug_client_vm_bind_unmap_with_debug_data(c, vm, b->addr, b->range);
 	}
@@ -2339,7 +2354,7 @@ static void debugger_test_vma_ufence(struct xe_eudebug_debugger *d,
 static void vma_ufence_op_trigger(struct xe_eudebug_debugger *d,
 				  struct drm_xe_eudebug_event *e)
 {
-	struct drm_xe_eudebug_event_vm_bind_op *eo = (void *)e;
+	struct drm_xe_eudebug_event_vm_bind_op_debug_data *eo = (void *)e;
 	struct ufence_priv *priv = d->ptr;
 
 	if (e->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
@@ -2431,7 +2446,7 @@ static void test_vma_ufence(int fd, unsigned int flags)
 	s = xe_eudebug_session_create(fd, vma_ufence_client, flags, priv);
 
 	xe_eudebug_debugger_add_trigger(s->debugger,
-					DRM_XE_EUDEBUG_EVENT_VM_BIND_OP,
+					DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA,
 					vma_ufence_op_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger,
 					DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
@@ -2453,6 +2468,239 @@ static void test_vma_ufence(int fd, unsigned int flags)
 	ufence_priv_destroy(priv);
 }
 
+#define DEBUG_DATA_FPATH_TEMPLATE "/tmp/xe_eudebug_debug_data-%d"
+#define DEBUG_DATA_SIZE 16 * PATH_MAX
+
+static void debug_data_init(struct ufence_bind *b, int idx)
+{
+	const uint32_t debug_data_size = DEBUG_DATA_SIZE;
+	uint8_t *debug_data_content;
+	size_t written;
+	FILE *file;
+
+	b->pseudopath = idx;
+
+	if (idx)
+		return;
+
+	snprintf(b->pathname, PATH_MAX, DEBUG_DATA_FPATH_TEMPLATE, rand());
+	igt_debug("Debug data file path: %s\n", b->pathname);
+
+	debug_data_content = calloc(debug_data_size, sizeof(*debug_data_content));
+	igt_assert(debug_data_content);
+
+	for (int i = 0; i < debug_data_size; i++)
+		debug_data_content[i] = i % 256;
+
+	file = fopen(b->pathname, "wb");
+	igt_assert(file);
+
+	written = fwrite(debug_data_content, 1, debug_data_size, file);
+	igt_assert(written == debug_data_size);
+
+	fsync(fileno(file));
+	fclose(file);
+
+	free(debug_data_content);
+}
+
+static void debug_data_fini(struct ufence_bind *b, int idx)
+{
+	if (idx)
+		return;
+
+	igt_assert(b->pathname);
+	remove(b->pathname);
+}
+
+static void debug_data_ufence_client(struct xe_eudebug_client *c)
+{
+	const unsigned int n = DEBUG_DATA_COUNT;
+	struct ufence_bind *binds = create_binds_with_ufence(c->fd, n);
+	uint32_t vm;
+
+	size_t bo_size = xe_get_default_alignment(c->fd);
+	uint32_t bo[n];
+	uint32_t *ptr[n];
+
+	vm = xe_eudebug_client_vm_create(c, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+
+	for (int i = 0; i < n; i++)
+		debug_data_init(&binds[i], i);
+
+	for (int i = 0; i < n; i++) {
+		bo[i] = xe_bo_create(c->fd, 0, bo_size,
+				     system_memory(c->fd), 0);
+		ptr[i] = xe_bo_map(c->fd, bo[i], bo_size);
+		igt_assert(ptr[i]);
+		memset(ptr[i], UFENCE_CLIENT_VM_TEST_VAL_START, bo_size);
+	}
+
+	for (int i = 0; i < n; i++) {
+		struct ufence_bind *b = &binds[i];
+
+		xe_eudebug_client_vm_bind_debug_data_add(c, vm, 0, b->addr, b->range, b->pseudopath,
+							 b->pseudopath ? NULL : b->pathname,
+							 &b->f, 1);
+	}
+
+	client_wait_ufences(c, n, binds);
+
+	for (int i = 0; i < n; i++) {
+		struct ufence_bind *b = &binds[i];
+
+		xe_eudebug_client_vm_bind_debug_data_remove(c, vm, b->addr, b->range);
+		debug_data_fini(b, i);
+	}
+
+	destroy_binds_with_ufence(binds, n);
+	xe_eudebug_client_vm_destroy(c, vm);
+}
+
+static int debug_data_event_idx(struct drm_xe_eudebug_event_vm_bind_op_debug_data *event)
+{
+	if (!(event->flags & DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO))
+		return 0;
+	else if (event->pseudopath == DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_MODULE_AREA)
+		return 1;
+	else if (event->pseudopath == DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_SBA_AREA)
+		return 2;
+	else
+		return 3;
+}
+
+static void debug_data_op_trigger(struct xe_eudebug_debugger *d,
+				  struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_vm_bind_op_debug_data *eo = (void *)e;
+	struct ufence_priv *priv = d->ptr;
+
+	if (e->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
+		char event_str[XE_EUDEBUG_EVENT_STRING_MAX_LEN];
+		struct drm_xe_eudebug_event_vm_bind *eb;
+		unsigned int op_count = priv->vm_bind_op_count++;
+		int idx = debug_data_event_idx(eo);
+
+		xe_eudebug_event_to_str(e, event_str, XE_EUDEBUG_EVENT_STRING_MAX_LEN);
+		igt_debug("vm bind op event: ref %lld, addr 0x%llx, range 0x%llx, op_count %u\n",
+			  eo->vm_bind_ref_seqno,
+			  eo->addr,
+			  eo->range,
+			  op_count);
+		igt_debug("vm bind op event received: %s\n", event_str);
+		xe_eudebug_assert(d, eo->vm_bind_ref_seqno);
+		eb = (struct drm_xe_eudebug_event_vm_bind *)
+			xe_eudebug_event_log_find_seqno(d->log, eo->vm_bind_ref_seqno);
+
+		xe_eudebug_assert_f(d, eb, "vm bind event with seqno (%lld) not found\n",
+				    eo->vm_bind_ref_seqno);
+		xe_eudebug_assert_f(d, eb->flags & DRM_XE_EUDEBUG_EVENT_VM_BIND_FLAG_UFENCE,
+				    "vm bind event does not have ufence: %s\n", event_str);
+
+		memcpy(&priv->debug_data_events[idx], eo, sizeof(*eo));
+	}
+}
+
+static void check_debug_data(struct xe_eudebug_debugger *d,
+			     struct drm_xe_eudebug_event_vm_bind_op_debug_data *eo)
+{
+	uint8_t *debug_data_content;
+	uint8_t *debug_data_path;
+	size_t read;
+	FILE *file;
+	int i;
+
+	igt_assert_eq(eo->range, BINDS_WITH_UFENCE_RANGE);
+	igt_assert_eq(eo->addr, BINDS_WITH_UFENCE_BASE_ADDR + debug_data_event_idx(eo) * eo->range);
+	igt_assert_eq(eo->reserved, 0);
+
+	if (eo->flags & DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO) {
+		igt_assert_eq(eo->offset, 0);
+		return;
+	}
+
+	file = fopen(eo->pathname, "rb");
+	igt_assert(file);
+
+	debug_data_content = malloc(DEBUG_DATA_SIZE);
+	read = fread(debug_data_content, 1, DEBUG_DATA_SIZE, file);
+	igt_assert_eq(read, DEBUG_DATA_SIZE);
+
+	for (i = 0; i < read; i++)
+		igt_assert_eq(debug_data_content[i], i % 256);
+
+	free(debug_data_content);
+	fclose(file);
+	free(debug_data_path);
+}
+
+static void debug_data_ufence_trigger(struct xe_eudebug_debugger *d,
+				      struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_vm_bind_ufence *ef = (void *)e;
+	struct drm_xe_eudebug_event_vm_bind_op_debug_data *eo;
+	struct ufence_priv *priv = d->ptr;
+
+	if (e->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
+		char event_str[XE_EUDEBUG_EVENT_STRING_MAX_LEN];
+		bool found = false;
+
+		xe_eudebug_event_to_str(e, event_str, XE_EUDEBUG_EVENT_STRING_MAX_LEN);
+		igt_debug("ufence event received: %s\n", event_str);
+
+		xe_eudebug_assert_f(d, priv->ufence_event_count < DEBUG_DATA_COUNT,
+				    "surplus ufence event received: %s\n", event_str);
+		xe_eudebug_assert(d, ef->vm_bind_ref_seqno);
+
+		for (int i = 0; i < DEBUG_DATA_COUNT; ++i) {
+			if (priv->debug_data_events[i].vm_bind_ref_seqno == ef->vm_bind_ref_seqno) {
+				eo = &priv->debug_data_events[i];
+				found = true;
+				break;
+			}
+		}
+
+		xe_eudebug_assert_f(d, found,
+				    "vm bind op event with ref seqno (%lld) not found\n",
+				    ef->vm_bind_ref_seqno);
+
+		check_debug_data(d, eo);
+
+		xe_eudebug_ack_ufence(d->fd, ef);
+	}
+}
+
+/**
+ * SUBTEST: vm-bind-debug-data-ufence
+ * Functionality: VM bind debug data
+ * Description:
+ *	Intercept vm bind after receiving ufence event, then access debug data and ensure it matches
+ *	what the address and ranges provided by the client. For file based debug data, also ensure
+ *	the content matches what was written to the file by the client.
+ */
+static void test_debug_data(int fd)
+{
+	struct xe_eudebug_session *s;
+	struct ufence_priv *priv;
+
+	priv = ufence_priv_create();
+
+	s = xe_eudebug_session_create(fd, debug_data_ufence_client, 0, priv);
+
+	xe_eudebug_debugger_add_trigger(s->debugger,
+					DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA,
+					debug_data_op_trigger);
+	xe_eudebug_debugger_add_trigger(s->debugger,
+					DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+					debug_data_ufence_trigger);
+
+	xe_eudebug_session_run(s);
+	xe_eudebug_session_check(s, true, 0);
+	xe_eudebug_session_destroy(s);
+
+	ufence_priv_destroy(priv);
+}
+
 /**
  * SUBTEST: basic-exec-queues-enable
  * Functionality: exec queues events
@@ -2528,6 +2776,7 @@ int igt_main()
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 		was_enabled = xe_eudebug_enable(fd, true);
+		igt_srandom();
 
 		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
 		update_debug_mask_if_ci(DRM_UT_KMS);
@@ -2603,6 +2852,9 @@ int igt_main()
 	igt_subtest("basic-vm-bind-ufence-sigint-client")
 		test_basic_ufence(fd, VM_BIND_UFENCE_SIGINT_CLIENT);
 
+	igt_subtest("vm-bind-debug-data-ufence")
+		test_debug_data(fd);
+
 	igt_subtest("basic-vm-bind-discovery")
 		test_basic_discovery(fd, VM_BIND, true);
 
diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index c4e9ff2fce..34a8ff26e9 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1254,7 +1254,7 @@ static void online_session_check(struct xe_eudebug_session *s, int flags)
 	int pagefault_threads = 0;
 
 	xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND |
-					  XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP |
+					  XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP_DEBUG_DATA |
 					  XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE);
 
 	bitmask_size = query_attention_bitmask_size(s->debugger->master_fd, data->hwe.gt_id);
@@ -1949,7 +1949,7 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
 	xe_eudebug_event_log_print(debugee->log, true);
 
 	xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND |
-				 XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP |
+				 XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP_DEBUG_DATA |
 				 XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE);
 
 	xe_eudebug_client_destroy(debugee);
@@ -2160,7 +2160,7 @@ static void test_interrupt_reconnect(int fd, struct drm_xe_engine_class_instance
 	xe_eudebug_event_log_print(s->client->log, true);
 
 	xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND |
-					  XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP |
+					  XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP_DEBUG_DATA |
 					  XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE);
 
 	/* We expect workload reset, so no attention should be raised */
-- 
2.43.0

