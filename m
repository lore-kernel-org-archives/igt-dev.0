Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B68C3DA7E
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5840810E427;
	Mon, 29 Jul 2024 16:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M9M/kELw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8440210E439
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269003; x=1753805003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zOyAnJN/ccAyFf+huDUyc3M2myBkVq1iTadbigRcjpU=;
 b=M9M/kELwdCLKUSKGWVtWWxiaiW6023KBiEuOVYOjRbUrshWmrTNExHbP
 qil1yFzh7ZE0WxdA0k0F6gIQwLL7RdnV9LDYgnBED7w3+lUa3U9WAvKih
 v+kl43KnCI5N70qPgf8k9FF0cxjJeM5f6Dh73eVOEjs2iqXHEWJGmi/8F
 LTmCvZs8vSTZMU/9HieZTf7mYgDjHYrRcNfiJB2Tp7zgFTd+hWNTCVed1
 6SrPUaILg44CKmXit8K+mPNItzQIM6lS7+oyaYovLnv8M427dnqGawh6R
 pbHiR+sElNBw6T/tyKZ4LXBj1m4lXSHWMZWhaHnmJhNhGwGGy6qg0+TVn g==;
X-CSE-ConnectionGUID: k88MmNkeQ66AG+8e5QZaAA==
X-CSE-MsgGUID: H0I2oYW4Sje/zwqKj0V0hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427022"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427022"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:23 -0700
X-CSE-ConnectionGUID: fbv7Yye7TkObvWPe1qnHqA==
X-CSE-MsgGUID: i4Eao+RuQvG3uA4EnZwzAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53737731"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:20 -0700
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
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH 19/66] tests/xe_eudebug: Add basic vm-bind coverage
Date: Mon, 29 Jul 2024 18:01:12 +0200
Message-Id: <20240729160159.37036-20-christoph.manszewski@intel.com>
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

Add basic coverage for vm-bind event delivery mechanism that enables the
user to track client vm-bind ioctl calls.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug.c | 117 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 109 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 0951129da..35c2a0cc0 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -22,6 +22,41 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+#define CREATE_VMS (1 << 0)
+#define CREATE_EXEC_QUEUES (1 << 1)
+#define VM_BIND (1 << 2)
+#define VM_BIND_VM_DESTROY (1 << 3)
+#define VM_BIND_EXTENDED (1 << 4)
+
+static void basic_vm_bind_client(int fd, struct xe_eudebug_client *c)
+{
+	uint32_t vm = xe_eudebug_client_vm_create(c, fd, 0, 0);
+	size_t bo_size = xe_get_default_alignment(fd);
+	uint32_t bo = xe_bo_create(fd, 0, bo_size,
+				   system_memory(fd), 0);
+	uint64_t addr = 0x1a0000;
+
+	xe_eudebug_client_vm_bind(c, fd, vm, bo, 0, addr, bo_size);
+	xe_eudebug_client_vm_unbind(c, fd, vm, 0, addr, bo_size);
+
+	gem_close(fd, bo);
+	xe_eudebug_client_vm_destroy(c, fd, vm);
+}
+
+static void basic_vm_bind_vm_destroy_client(int fd, struct xe_eudebug_client *c)
+{
+	uint32_t vm = xe_eudebug_client_vm_create(c, fd, 0, 0);
+	size_t bo_size = xe_get_default_alignment(fd);
+	uint32_t bo = xe_bo_create(fd, 0, bo_size,
+				   system_memory(fd), 0);
+	uint64_t addr = 0x1a0000;
+
+	xe_eudebug_client_vm_bind(c, fd, vm, bo, 0, addr, bo_size);
+	xe_eudebug_client_vm_destroy(c, fd, vm);
+
+	gem_close(fd, bo);
+}
+
 #define BO_ADDR 0x1a0000
 #define BO_ITEMS 4096
 #define MIN_BO_SIZE (BO_ITEMS * sizeof(uint64_t))
@@ -149,8 +184,41 @@ static void check_bind_list(struct bind_list *bl)
 	}
 }
 
-#define CREATE_VMS	(1 << 0)
-#define CREATE_EXEC_QUEUES	(1 << 1)
+static void vm_bind_client(int fd, struct xe_eudebug_client *c)
+{
+	uint64_t op_ref_seqno, ref_seqno;
+	struct bind_list *bl;
+	size_t bo_size = 3 * xe_get_default_alignment(fd);
+	uint32_t bo[2] = {
+		xe_bo_create(fd, 0, bo_size, system_memory(fd), 0),
+		xe_bo_create(fd, 0, bo_size, system_memory(fd), 0),
+	};
+	uint32_t vm = xe_eudebug_client_vm_create(c, fd, 0, 0);
+	uint64_t addr[] = {0x2a0000, 0x3a0000};
+	uint64_t rebind_bo_offset = 2 * bo_size / 3;
+	uint64_t size = bo_size / 3;
+
+	xe_eudebug_client_vm_bind(c, fd, vm, bo[0], 0, addr[0], bo_size);
+	xe_eudebug_client_vm_unbind(c, fd, vm, 0, addr[0] + size, size);
+
+	xe_eudebug_client_vm_bind(c, fd, vm, bo[1], 0, addr[1], bo_size);
+	xe_eudebug_client_vm_bind(c, fd, vm, bo[1], rebind_bo_offset, addr[1], size);
+
+	bl = create_bind_list(fd, system_memory(fd), vm, 4);
+	do_bind_list(c, bl, NULL);
+
+	xe_vm_unbind_all_async(fd, vm, 0, bo[1], NULL, 0);
+
+	xe_eudebug_client_vm_bind_event(c, DRM_XE_EUDEBUG_EVENT_STATE_CHANGE, fd, vm, 0,
+					1, &ref_seqno);
+	xe_eudebug_client_vm_bind_op_event(c, DRM_XE_EUDEBUG_EVENT_DESTROY, ref_seqno,
+					   &op_ref_seqno, 0, 0, 0);
+
+	gem_close(fd, bo[0]);
+	gem_close(fd, bo[1]);
+	xe_eudebug_client_vm_destroy(c, fd, vm);
+}
+
 static void run_basic_client(struct xe_eudebug_client *c)
 {
 	int fd, i;
@@ -216,6 +284,15 @@ static void run_basic_client(struct xe_eudebug_client *c)
 		xe_eudebug_client_vm_destroy(c, fd,  vm);
 	}
 
+	if (c->flags & VM_BIND)
+		basic_vm_bind_client(fd, c);
+
+	if (c->flags & VM_BIND_EXTENDED)
+		vm_bind_client(fd, c);
+
+	if (c->flags & VM_BIND_VM_DESTROY)
+		basic_vm_bind_vm_destroy_client(fd, c);
+
 	xe_device_put(fd);
 	xe_eudebug_client_close_driver(c, fd);
 }
@@ -437,12 +514,27 @@ static void test_read_event(int fd)
  * Description:
  *	Attach the debugger to process which creates and destroys a few %arg[1].
  *
+ * SUBTEST: basic-vm-bind
+ * Description:
+ *	Attach the debugger to a process that performs synchronous vm bind
+ *	and vm unbind.
+ *
+ * SUBTEST: basic-vm-bind-vm-destroy
+ * Description:
+ *	Attach the debugger to a process that performs vm bind, and destroys
+ *	the vm without unbinding. Make sure that we don't get unbind events.
+ *
+ * SUBTEST: basic-vm-bind-extended
+ * Description:
+ *	Attach the debugger to a process that performs bind, bind array, rebind,
+ *	partial unbind, unbind and unbind all operations.
+ *
  * arg[1]:
  *
  * @vms: vms
  * @exec-queues: exec queues
  */
-static void test_basic_sessions(int fd, unsigned int flags, int count)
+static void test_basic_sessions(int fd, unsigned int flags, int count, bool match_opposite)
 {
 	struct xe_eudebug_session **s;
 	int i;
@@ -458,7 +550,7 @@ static void test_basic_sessions(int fd, unsigned int flags, int count)
 		xe_eudebug_session_run(s[i]);
 
 	for (i = 0; i < count; i++)
-		xe_eudebug_session_check(s[i], true, 0);
+		xe_eudebug_session_check(s[i], match_opposite, 0);
 
 	for (i = 0; i < count; i++)
 		xe_eudebug_session_destroy(s[i]);
@@ -903,19 +995,28 @@ igt_main
 		test_read_event(fd);
 
 	igt_subtest("basic-client")
-		test_basic_sessions(fd, 0, 1);
+		test_basic_sessions(fd, 0, 1, true);
 
 	igt_subtest("basic-vm-access")
 		test_vm_access(fd, 0, 1);
 
 	igt_subtest("multiple-sessions")
-		test_basic_sessions(fd, CREATE_VMS | CREATE_EXEC_QUEUES, 4);
+		test_basic_sessions(fd, CREATE_VMS | CREATE_EXEC_QUEUES, 4, true);
 
 	igt_subtest("basic-vms")
-		test_basic_sessions(fd, CREATE_VMS, 1);
+		test_basic_sessions(fd, CREATE_VMS, 1, true);
 
 	igt_subtest("basic-exec-queues")
-		test_basic_sessions(fd, CREATE_EXEC_QUEUES, 1);
+		test_basic_sessions(fd, CREATE_EXEC_QUEUES, 1, true);
+
+	igt_subtest("basic-vm-bind")
+		test_basic_sessions(fd, VM_BIND, 1, true);
+
+	igt_subtest("basic-vm-bind-vm-destroy")
+		test_basic_sessions(fd, VM_BIND_VM_DESTROY, 1, false);
+
+	igt_subtest("basic-vm-bind-extended")
+		test_basic_sessions(fd, VM_BIND_EXTENDED, 1, true);
 
 	igt_subtest("discovery-race")
 		test_race_discovery(fd, 0, 4);
-- 
2.34.1

