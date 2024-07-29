Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4D6C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:03:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC7710E420;
	Mon, 29 Jul 2024 16:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UlAtK7u4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D39E10E42F
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269019; x=1753805019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xXHKOUI04owaxeb9+M8zJBG4+OflG0HTCt3X6cNE95Y=;
 b=UlAtK7u4QdYZqTS98nh7ETUbHsEUhLSKfG4CfVMtfVQMFBb/p1KBup5C
 4SOhNHGwt4npC6bLPhKL+Is8aOtMTeJeV7yDAva5gVKj5+I8/LBXuDUgu
 rx5YR1M3zsbbCjwz7c/wzZMHyJ8GdrCdR1T/fekZ8J6vOvJofM1cy3SH1
 fqS9M67rbAV48kM/V8IXXp1haSKMdBFAlJLlDHOzS44OAJAe3AEbd6i9k
 9QPy6PwvAqtXMr6GqCgJn3zkbyn8Tw3Zx1HV6x+Ae0hS7rto7xu7HKUBW
 eaNC2Dwq/ht73xdHpLL0UfWpHh98MeKHiExK6iBH4vf9EoZbFEwpnJu68 A==;
X-CSE-ConnectionGUID: NhpwX8tvQ2GP7c0gt3JsTA==
X-CSE-MsgGUID: /ttWYsFrTJewd1Z7+x6HLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427103"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427103"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:39 -0700
X-CSE-ConnectionGUID: D5iV60XnQZ2irAg9EyjXbQ==
X-CSE-MsgGUID: 01VWaqGqTJWHr1dMbK7v4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53737915"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:36 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH 24/66] tests/xe_eudebug: Add vm-bind discovery tests
Date: Mon, 29 Jul 2024 18:01:17 +0200
Message-Id: <20240729160159.37036-25-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
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

Extend vm-bind testing by adding variations of existing subtests,
that exercise the eu debugger's discovery mechanism, by attaching
after relevant vm-bind operations were performed by the client.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug.c | 133 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 125 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index fa81cbfe6..3a3cf5e45 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -46,22 +46,33 @@ static void test_sysfs_toggle(int fd)
 	igt_assert(xe_eudebug_debugger_available(fd));
 }
 
+#define STAGE_PRE_DEBUG_RESOURCES_DONE 1
+#define STAGE_DISCOVERY_DONE 2
+
 #define CREATE_VMS (1 << 0)
 #define CREATE_EXEC_QUEUES (1 << 1)
 #define VM_BIND (1 << 2)
 #define VM_BIND_VM_DESTROY (1 << 3)
 #define VM_BIND_EXTENDED (1 << 4)
 #define VM_METADATA (1 << 5)
+#define TEST_DISCOVERY (1 << 31)
 
 static void basic_vm_bind_client(int fd, struct xe_eudebug_client *c)
 {
 	uint32_t vm = xe_eudebug_client_vm_create(c, fd, 0, 0);
 	size_t bo_size = xe_get_default_alignment(fd);
+	bool test_discovery = c->flags & TEST_DISCOVERY;
 	uint32_t bo = xe_bo_create(fd, 0, bo_size,
 				   system_memory(fd), 0);
 	uint64_t addr = 0x1a0000;
 
 	xe_eudebug_client_vm_bind(c, fd, vm, bo, 0, addr, bo_size);
+
+	if (test_discovery) {
+		xe_eudebug_client_signal_stage(c, STAGE_PRE_DEBUG_RESOURCES_DONE);
+		xe_eudebug_client_wait_stage(c, STAGE_DISCOVERY_DONE);
+	}
+
 	xe_eudebug_client_vm_unbind(c, fd, vm, 0, addr, bo_size);
 
 	gem_close(fd, bo);
@@ -72,12 +83,25 @@ static void basic_vm_bind_vm_destroy_client(int fd, struct xe_eudebug_client *c)
 {
 	uint32_t vm = xe_eudebug_client_vm_create(c, fd, 0, 0);
 	size_t bo_size = xe_get_default_alignment(fd);
+	bool test_discovery = c->flags & TEST_DISCOVERY;
 	uint32_t bo = xe_bo_create(fd, 0, bo_size,
 				   system_memory(fd), 0);
 	uint64_t addr = 0x1a0000;
 
-	xe_eudebug_client_vm_bind(c, fd, vm, bo, 0, addr, bo_size);
-	xe_eudebug_client_vm_destroy(c, fd, vm);
+	if (test_discovery) {
+		vm = xe_vm_create(fd, 0, 0);
+
+		xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, NULL, 0);
+
+		xe_vm_destroy(fd, vm);
+
+		xe_eudebug_client_signal_stage(c, STAGE_PRE_DEBUG_RESOURCES_DONE);
+		xe_eudebug_client_wait_stage(c, STAGE_DISCOVERY_DONE);
+	} else {
+		vm = xe_eudebug_client_vm_create(c, fd, 0, 0);
+		xe_eudebug_client_vm_bind(c, fd, vm, bo, 0, addr, bo_size);
+		xe_eudebug_client_vm_destroy(c, fd, vm);
+	}
 
 	gem_close(fd, bo);
 }
@@ -213,6 +237,7 @@ static void vm_bind_client(int fd, struct xe_eudebug_client *c)
 {
 	uint64_t op_ref_seqno, ref_seqno;
 	struct bind_list *bl;
+	bool test_discovery = c->flags & TEST_DISCOVERY;
 	size_t bo_size = 3 * xe_get_default_alignment(fd);
 	uint32_t bo[2] = {
 		xe_bo_create(fd, 0, bo_size, system_memory(fd), 0),
@@ -222,15 +247,48 @@ static void vm_bind_client(int fd, struct xe_eudebug_client *c)
 	uint64_t addr[] = {0x2a0000, 0x3a0000};
 	uint64_t rebind_bo_offset = 2 * bo_size / 3;
 	uint64_t size = bo_size / 3;
+	int i = 0;
+
+	if (test_discovery) {
+		xe_vm_bind_async(fd, vm, 0, bo[0], 0, addr[0], bo_size, NULL, 0);
+
+		xe_vm_unbind_async(fd, vm, 0, 0, addr[0] + size, size, NULL, 0);
 
-	xe_eudebug_client_vm_bind(c, fd, vm, bo[0], 0, addr[0], bo_size);
-	xe_eudebug_client_vm_unbind(c, fd, vm, 0, addr[0] + size, size);
+		xe_vm_bind_async(fd, vm, 0, bo[1], 0, addr[1], bo_size, NULL, 0);
 
-	xe_eudebug_client_vm_bind(c, fd, vm, bo[1], 0, addr[1], bo_size);
-	xe_eudebug_client_vm_bind(c, fd, vm, bo[1], rebind_bo_offset, addr[1], size);
+		xe_vm_bind_async(fd, vm, 0, bo[1], rebind_bo_offset, addr[1], size, NULL, 0);
 
-	bl = create_bind_list(fd, system_memory(fd), vm, 4);
-	do_bind_list(c, bl, NULL);
+		bl = create_bind_list(fd, system_memory(fd), vm, 4);
+		xe_vm_bind_array(bl->fd, bl->vm, 0, bl->bind_ops, bl->n, NULL, 0);
+
+		xe_vm_unbind_all_async(fd, vm, 0, bo[0], NULL, 0);
+
+		xe_eudebug_client_vm_bind_event(c, DRM_XE_EUDEBUG_EVENT_STATE_CHANGE,
+						bl->fd, bl->vm, 0, bl->n + 2, &ref_seqno);
+
+		xe_eudebug_client_vm_bind_op_event(c, DRM_XE_EUDEBUG_EVENT_CREATE, ref_seqno,
+						   &op_ref_seqno, addr[1], size, 0);
+		xe_eudebug_client_vm_bind_op_event(c, DRM_XE_EUDEBUG_EVENT_CREATE, ref_seqno,
+						   &op_ref_seqno, addr[1] + size, size * 2, 0);
+
+		for (i = 0; i < bl->n; i++)
+			xe_eudebug_client_vm_bind_op_event(c, DRM_XE_EUDEBUG_EVENT_CREATE,
+							   ref_seqno, &op_ref_seqno,
+							   bl->bind_ops[i].addr,
+							   bl->bind_ops[i].range, 0);
+
+		xe_eudebug_client_signal_stage(c, STAGE_PRE_DEBUG_RESOURCES_DONE);
+		xe_eudebug_client_wait_stage(c, STAGE_DISCOVERY_DONE);
+	} else {
+		xe_eudebug_client_vm_bind(c, fd, vm, bo[0], 0, addr[0], bo_size);
+		xe_eudebug_client_vm_unbind(c, fd, vm, 0, addr[0] + size, size);
+
+		xe_eudebug_client_vm_bind(c, fd, vm, bo[1], 0, addr[1], bo_size);
+		xe_eudebug_client_vm_bind(c, fd, vm, bo[1], rebind_bo_offset, addr[1], size);
+
+		bl = create_bind_list(fd, system_memory(fd), vm, 4);
+		do_bind_list(c, bl, NULL);
+	}
 
 	xe_vm_unbind_all_async(fd, vm, 0, bo[1], NULL, 0);
 
@@ -581,6 +639,56 @@ static void test_basic_sessions(int fd, unsigned int flags, int count, bool matc
 		xe_eudebug_session_destroy(s[i]);
 }
 
+/**
+ * SUBTEST: basic-vm-bind-discovery
+ * Description:
+ *	Attach the debugger to a process that performs vm-bind before attaching
+ *	and check if the discovery process reports it.
+ *
+ * SUBTEST: basic-vm-bind-vm-destroy-discovery
+ * Description:
+ *	Attach the debugger to a process that performs vm bind, and destroys
+ *	the vm without unbinding before attaching. Make sure that we don't get
+ *	any bind/unbind and vm create/destroy events.
+ *
+ * SUBTEST: basic-vm-bind-extended-discovery
+ * Description:
+ *	Attach the debugger to a process that performs bind, bind array, rebind,
+ *	partial unbind, and unbind all operations before attaching. Ensure that
+ *	we get a only a singe 'VM_BIND' event from the discovery worker.
+ */
+static void test_basic_discovery(int fd, unsigned int flags, bool match_opposite)
+{
+	struct xe_eudebug_debugger *d;
+	struct xe_eudebug_session *s;
+	struct xe_eudebug_client *c;
+
+	s = xe_eudebug_session_create(fd, run_basic_client, flags | TEST_DISCOVERY, NULL);
+
+	c = s->c;
+	d = s->d;
+
+	xe_eudebug_client_start(c);
+	xe_eudebug_debugger_wait_stage(s, STAGE_PRE_DEBUG_RESOURCES_DONE);
+
+	igt_assert_eq(xe_eudebug_debugger_attach(d, c), 0);
+	xe_eudebug_debugger_start_worker(d);
+
+	/* give the worker time to do it's job */
+	sleep(2);
+	xe_eudebug_debugger_signal_stage(d, STAGE_DISCOVERY_DONE);
+
+	xe_eudebug_client_wait_done(c);
+
+	xe_eudebug_debugger_stop_worker(d, 1);
+
+	xe_eudebug_event_log_print(d->log, true);
+	xe_eudebug_event_log_print(c->log, true);
+
+	xe_eudebug_session_check(s, match_opposite, 0);
+	xe_eudebug_session_destroy(s);
+}
+
 #define RESOURCE_COUNT 16
 #define PRIMARY_THREAD			(1 << 0)
 #define DISCOVERY_CLOSE_CLIENT		(1 << 1)
@@ -1199,12 +1307,21 @@ igt_main
 	igt_subtest("basic-vm-bind")
 		test_basic_sessions(fd, VM_BIND, 1, true);
 
+	igt_subtest("basic-vm-bind-discovery")
+		test_basic_discovery(fd, VM_BIND, true);
+
 	igt_subtest("basic-vm-bind-vm-destroy")
 		test_basic_sessions(fd, VM_BIND_VM_DESTROY, 1, false);
 
+	igt_subtest("basic-vm-bind-vm-destroy-discovery")
+		test_basic_discovery(fd, VM_BIND_VM_DESTROY, false);
+
 	igt_subtest("basic-vm-bind-extended")
 		test_basic_sessions(fd, VM_BIND_EXTENDED, 1, true);
 
+	igt_subtest("basic-vm-bind-extended-discovery")
+		test_basic_discovery(fd, VM_BIND_EXTENDED, true);
+
 	igt_subtest("read-metadata")
 		test_metadata_read(fd, 0, 1);
 
-- 
2.34.1

