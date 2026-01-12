Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FF0C9EC88
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 13:00:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BDE10E3C8;
	Mon, 12 Jan 2026 13:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INrhEoKb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FDD10E3CB
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 13:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768222850; x=1799758850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=96hsv9TRbh+u8oJ0ElHVXD+1oGu6cjeQtpP+8xEyMYA=;
 b=INrhEoKbcFOhzKig8K+KqZsRf72wYNK6CqHS9aNVZCO2rSQ7ID1VTfmx
 4yp+dFLY4rTYoUCz72ONHQjTCA5haqRhJUU1EiRpnApkBWdaOicpNa0nQ
 /I+3i60mQ2i80M7Oa/gm0hxpZKHQPmmC/TZEWwdkTEJjbYtoLvcLtEpzv
 AqiLXsCXjwaZFQhUBdWMfylxUOVuCpwVpSL5qIxSo/lPQSJ2P4NZ1zKuH
 RdxkE7uYUM82nJnkutBOyVJoHc47JaVDNRPQSJN87uxti29z+jpn3CQVU
 mCOPtNiBrQTU5Vhz1nHkXy74rUxnaTOcIQl7fshJv0vgYRNmg/oTEbnS+ w==;
X-CSE-ConnectionGUID: 7CVGppPEQj+fw1DxHnZ5Sw==
X-CSE-MsgGUID: s5a+2/a+S2iq4PZutPq5ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69545549"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69545549"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:50 -0800
X-CSE-ConnectionGUID: TlAHXrNjQu2KigGLEThpNA==
X-CSE-MsgGUID: Ceaaa7M5Sca/OHxZBB3IGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204094999"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:48 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 11/21] tests/xe_eudebug: Adapt basic-vm-bind and remove
 basic-vm-bind-extended
Date: Mon, 12 Jan 2026 14:59:57 +0200
Message-ID: <20260112130008.1649357-12-mika.kuoppala@linux.intel.com>
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

EU debug no longer relays events for VM_BIND_OP_[MAP|UNMAP] operations.
Instead it reports newly added 'VM_BIND_OP_DEBUG_DATA_[ADD|REMOVE]'
operations through the event interface. Convert the basic-vm-bind
subtest to use these newly introduced ops. Because debug data can't be
rebound and partially unbound, remove the basic-vm-bind-extended
subtest.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 tests/intel/xe_eudebug.c | 154 ++++++++++-----------------------------
 1 file changed, 39 insertions(+), 115 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 353828f673..e9efb47da8 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -60,11 +60,10 @@ static void test_sysfs_toggle(int fd)
 #define CREATE_EXEC_QUEUES		(1 << 2)
 #define VM_BIND				(1 << 3)
 #define VM_BIND_VM_DESTROY		(1 << 4)
-#define VM_BIND_EXTENDED		(1 << 5)
-#define VM_BIND_OP_MAP_USERPTR		(1 << 6)
-#define VM_BIND_DELAY_UFENCE_ACK	(1 << 7)
-#define VM_BIND_UFENCE_DISCONNECT	(1 << 8)
-#define VM_BIND_UFENCE_SIGINT_CLIENT	(1 << 9)
+#define VM_BIND_OP_MAP_USERPTR		(1 << 5)
+#define VM_BIND_DELAY_UFENCE_ACK	(1 << 6)
+#define VM_BIND_UFENCE_DISCONNECT	(1 << 7)
+#define VM_BIND_UFENCE_SIGINT_CLIENT	(1 << 8)
 #define TEST_FAULTABLE			(1 << 30)
 #define TEST_DISCOVERY			(1 << 31)
 
@@ -74,41 +73,58 @@ static void test_sysfs_toggle(int fd)
 
 static void basic_vm_bind_client(struct xe_eudebug_client *c)
 {
-	struct drm_xe_vm_bind_op_ext_attach_debug *ext = NULL;
 	uint32_t vm = xe_eudebug_client_vm_create(c, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
-	size_t bo_size = xe_get_default_alignment(c->fd);
 	bool test_discovery = c->flags & TEST_DISCOVERY;
-	uint32_t bo = xe_bo_create(c->fd, 0, bo_size,
-				   system_memory(c->fd), 0);
 	uint64_t addr = 0x1a0000;
+	size_t range = 0x1000;
 
-	xe_eudebug_client_vm_bind_flags(c, vm, bo, 0, addr,
-					bo_size, 0, NULL, 0, to_user_pointer(ext));
+	xe_eudebug_client_vm_bind_debug_data_add(c, vm, 0, addr, range,
+						 DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_MODULE_AREA,
+						 NULL, NULL, 0);
 
 	if (test_discovery) {
 		xe_eudebug_client_signal_stage(c, STAGE_PRE_DEBUG_RESOURCES_DONE);
 		xe_eudebug_client_wait_stage(c, STAGE_DISCOVERY_DONE);
 	}
 
-	xe_eudebug_client_vm_unbind(c, vm, 0, addr, bo_size);
+	xe_eudebug_client_vm_bind_debug_data_remove(c, vm, addr, range);
 
-	gem_close(c->fd, bo);
 	xe_eudebug_client_vm_destroy(c, vm);
 }
 
+static void vm_bind_add_debug_data(struct xe_eudebug_client *c, uint32_t vm,
+				   uint64_t addr, uint64_t range)
+{
+	struct drm_xe_vm_bind_op_ext_debug_data op_ext = { 0, };
+
+	op_ext.base.name = XE_VM_BIND_OP_EXTENSIONS_DEBUG_DATA;
+	op_ext.base.next_extension = 0;
+	op_ext.base.pad = 0;
+
+	op_ext.pseudopath = DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_MODULE_AREA;
+	op_ext.flags = DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO;
+
+	op_ext.addr = addr;
+	op_ext.range = range;
+	op_ext.offset = 0;
+	op_ext.reserved = 0;
+
+	___xe_vm_bind(c->fd, vm, 0, 0, 0, 0, 0,
+		      DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA, 0, NULL, 0, 0,
+		      0, 0, to_user_pointer(&op_ext));
+}
+
 static void basic_vm_bind_vm_destroy_client(struct xe_eudebug_client *c)
 {
 	uint32_t vm = xe_eudebug_client_vm_create(c, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
-	size_t bo_size = xe_get_default_alignment(c->fd);
 	bool test_discovery = c->flags & TEST_DISCOVERY;
-	uint32_t bo = xe_bo_create(c->fd, 0, bo_size,
-				   system_memory(c->fd), 0);
 	uint64_t addr = 0x1a0000;
+	uint64_t range = 0x1000;
 
 	if (test_discovery) {
 		vm = xe_vm_create(c->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 
-		xe_vm_bind_async(c->fd, vm, 0, bo, 0, addr, bo_size, NULL, 0);
+		vm_bind_add_debug_data(c, vm, addr, range);
 
 		xe_vm_destroy(c->fd, vm);
 
@@ -116,11 +132,11 @@ static void basic_vm_bind_vm_destroy_client(struct xe_eudebug_client *c)
 		xe_eudebug_client_wait_stage(c, STAGE_DISCOVERY_DONE);
 	} else {
 		vm = xe_eudebug_client_vm_create(c, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
-		xe_eudebug_client_vm_bind(c, vm, bo, 0, addr, bo_size);
+		xe_eudebug_client_vm_bind_debug_data_add(c, vm, 0, addr, range,
+							 DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_MODULE_AREA,
+							 NULL, NULL, 0);
 		xe_eudebug_client_vm_destroy(c, vm);
 	}
-
-	gem_close(c->fd, bo);
 }
 
 #define BO_ITEMS 4096
@@ -307,75 +323,6 @@ static void free_bind_list(struct xe_eudebug_client *c, struct bind_list *bl)
 	free(bl);
 }
 
-static void vm_bind_client(struct xe_eudebug_client *c)
-{
-	uint64_t op_ref_seqno, ref_seqno;
-	struct bind_list *bl;
-	bool test_discovery = c->flags & TEST_DISCOVERY;
-	size_t bo_size = 3 * xe_get_default_alignment(c->fd);
-	uint32_t bo[2] = {
-		xe_bo_create(c->fd, 0, bo_size, system_memory(c->fd), 0),
-		xe_bo_create(c->fd, 0, bo_size, system_memory(c->fd), 0),
-	};
-	uint32_t vm = xe_eudebug_client_vm_create(c, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
-	uint64_t addr[] = {0x2a0000, 0x3a0000};
-	uint64_t rebind_bo_offset = 2 * bo_size / 3;
-	uint64_t size = bo_size / 3;
-	int i = 0;
-
-	if (test_discovery) {
-		xe_vm_bind_async(c->fd, vm, 0, bo[0], 0, addr[0], bo_size, NULL, 0);
-
-		xe_vm_unbind_async(c->fd, vm, 0, 0, addr[0] + size, size, NULL, 0);
-
-		xe_vm_bind_async(c->fd, vm, 0, bo[1], 0, addr[1], bo_size, NULL, 0);
-
-		xe_vm_bind_async(c->fd, vm, 0, bo[1], rebind_bo_offset, addr[1], size, NULL, 0);
-
-		bl = create_bind_list(c->fd, system_memory(c->fd), vm, 4, 0);
-		xe_vm_bind_array(c->fd, bl->vm, 0, bl->bind_ops, bl->n, NULL, 0);
-
-		xe_vm_unbind_all_async(c->fd, vm, 0, bo[0], NULL, 0);
-
-		xe_eudebug_client_vm_bind_event(c, DRM_XE_EUDEBUG_EVENT_STATE_CHANGE,
-						bl->vm, 0, bl->n + 2, &ref_seqno);
-
-		xe_eudebug_client_vm_bind_op_event(c, DRM_XE_EUDEBUG_EVENT_CREATE, ref_seqno,
-						   &op_ref_seqno, addr[1], size, 0);
-		xe_eudebug_client_vm_bind_op_event(c, DRM_XE_EUDEBUG_EVENT_CREATE, ref_seqno,
-						   &op_ref_seqno, addr[1] + size, size * 2, 0);
-
-		for (i = 0; i < bl->n; i++)
-			xe_eudebug_client_vm_bind_op_event(c, DRM_XE_EUDEBUG_EVENT_CREATE,
-							   ref_seqno, &op_ref_seqno,
-							   bl->bind_ops[i].addr,
-							   bl->bind_ops[i].range, 0);
-
-		xe_eudebug_client_signal_stage(c, STAGE_PRE_DEBUG_RESOURCES_DONE);
-		xe_eudebug_client_wait_stage(c, STAGE_DISCOVERY_DONE);
-	} else {
-		xe_eudebug_client_vm_bind(c, vm, bo[0], 0, addr[0], bo_size);
-		xe_eudebug_client_vm_unbind(c, vm, 0, addr[0] + size, size);
-
-		xe_eudebug_client_vm_bind(c, vm, bo[1], 0, addr[1], bo_size);
-		xe_eudebug_client_vm_bind(c, vm, bo[1], rebind_bo_offset, addr[1], size);
-
-		bl = create_bind_list(c->fd, system_memory(c->fd), vm, 4, 0);
-		do_bind_list(c, bl, false);
-	}
-
-	xe_vm_unbind_all_async(c->fd, vm, 0, bo[1], NULL, 0);
-
-	xe_eudebug_client_vm_bind_event(c, DRM_XE_EUDEBUG_EVENT_STATE_CHANGE, vm, 0,
-					1, &ref_seqno);
-	xe_eudebug_client_vm_bind_op_event(c, DRM_XE_EUDEBUG_EVENT_DESTROY, ref_seqno,
-					   &op_ref_seqno, 0, 0, 0);
-
-	gem_close(c->fd, bo[0]);
-	gem_close(c->fd, bo[1]);
-	xe_eudebug_client_vm_destroy(c, vm);
-}
-
 static void run_basic_client(struct xe_eudebug_client *c)
 {
 	int i;
@@ -432,9 +379,6 @@ static void run_basic_client(struct xe_eudebug_client *c)
 	if (c->flags & VM_BIND)
 		basic_vm_bind_client(c);
 
-	if (c->flags & VM_BIND_EXTENDED)
-		vm_bind_client(c);
-
 	if (c->flags & VM_BIND_VM_DESTROY)
 		basic_vm_bind_vm_destroy_client(c);
 }
@@ -891,20 +835,13 @@ static void test_read_event(int fd)
  * SUBTEST: basic-vm-bind
  * Functionality: VM bind event
  * Description:
- *	Attach the debugger to a process that performs synchronous vm bind
- *	and vm unbind.
+ *	Attach the debugger to a process that adds and removes vm debug data.
  *
  * SUBTEST: basic-vm-bind-vm-destroy
  * Functionality: VM bind event
  * Description:
- *	Attach the debugger to a process that performs vm bind, and destroys
- *	the vm without unbinding. Make sure that we don't get unbind events.
- *
- * SUBTEST: basic-vm-bind-extended
- * Functionality: VM bind event
- * Description:
- *	Attach the debugger to a process that performs bind, bind array, rebind,
- *	partial unbind, unbind and unbind all operations.
+ *	Attach the debugger to a process that adds vm debug data, and destroys the vm without
+ *	removing debug data. Make sure that we don't get debug data remove events.
  *
  * SUBTEST: multigpu-basic-client
  * Mega feature: MultiGPU
@@ -955,13 +892,6 @@ static void test_basic_sessions(int fd, unsigned int flags, int count, bool matc
  *	Attach the debugger to a process that performs vm bind, and destroys
  *	the vm without unbinding before attaching. Make sure that we don't get
  *	any bind/unbind and vm create/destroy events.
- *
- * SUBTEST: basic-vm-bind-extended-discovery
- * Functionality: VM bind event
- * Description:
- *	Attach the debugger to a process that performs bind, bind array, rebind,
- *	partial unbind, and unbind all operations before attaching. Ensure that
- *	we get a only a singe 'VM_BIND' event from the discovery worker.
  */
 static void test_basic_discovery(int fd, unsigned int flags, bool match_opposite)
 {
@@ -2661,12 +2591,6 @@ int igt_main()
 	igt_subtest("basic-vm-bind-vm-destroy-discovery")
 		test_basic_discovery(fd, VM_BIND_VM_DESTROY, false);
 
-	igt_subtest("basic-vm-bind-extended")
-		test_basic_sessions(fd, VM_BIND_EXTENDED, 1, true);
-
-	igt_subtest("basic-vm-bind-extended-discovery")
-		test_basic_discovery(fd, VM_BIND_EXTENDED, true);
-
 	igt_subtest("discovery-race")
 		test_race_discovery(fd, 0, 4);
 
-- 
2.43.0

