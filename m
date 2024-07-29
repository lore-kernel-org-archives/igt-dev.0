Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DA5C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:04:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998E610E432;
	Mon, 29 Jul 2024 16:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j4msc4Dx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D3F10E432
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269040; x=1753805040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bnlcIUP23+F7ZMcPigK46fUhM6Dch1NyJsQC6VyKuTo=;
 b=j4msc4DxDuZdt8XBWlzk6QzjCdWQSxyDSV2gkxp2BCWxAez7DhCNZ8Sn
 S8dmmsQrjF4N5LGlTDBqG5qIjha8zDRy+qyZee0d5L6rR9Y58XUUOJRUX
 6FHrS6XWNC8bexoou4ur0qpUJcHZ4Mcbt8NCIQjM2SH7pcFdD8KGyZE1U
 1oOT71Wtu+F8cnc+qcKQlbOTmUEX+vR/ymLZX5VKlqyRDO3kh9UEItLKE
 jSCde/tpOsUXN9CdWrsATEaIIDRfodJXntioqyKttJ2Xmj7Jx6nxDLcji
 cJO/AwmIMDZxDz/d0GXssH4ioEOOS+pDJ84xWeb7OGR4x/AkEOKbuStny A==;
X-CSE-ConnectionGUID: Tqx/GO3+SGiNatezt5LQdA==
X-CSE-MsgGUID: eIfEszcATR2Wsu5AsBMyEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427168"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427168"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:04:00 -0700
X-CSE-ConnectionGUID: cEfuzQoXS7qndtR+BQj39g==
X-CSE-MsgGUID: q013MUzoQBaE+lhwanhRCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53738269"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:57 -0700
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
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH 31/66] tests/xe_eudebug: Add userptr variant of
 basic-vm-access test
Date: Mon, 29 Jul 2024 18:01:24 +0200
Message-Id: <20240729160159.37036-32-christoph.manszewski@intel.com>
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

From: Andrzej Hajda <andrzej.hajda@intel.com>

The variant uses DRM_XE_VM_BIND_OP_MAP_USERPTR to bind memory
from userspace.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug.c | 103 ++++++++++++++++++++++++++++++---------
 1 file changed, 80 insertions(+), 23 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index c368e30e7..1e9f16765 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -60,6 +60,7 @@ static void test_sysfs_toggle(int fd)
 #define VM_BIND_EXTENDED (1 << 4)
 #define VM_METADATA (1 << 5)
 #define VM_BIND_METADATA (1 << 6)
+#define VM_BIND_OP_MAP_USERPTR (1 << 7)
 #define TEST_DISCOVERY (1 << 31)
 
 #define PAGE_SIZE 4096
@@ -166,54 +167,82 @@ static void basic_vm_bind_vm_destroy_client(int fd, struct xe_eudebug_client *c)
 #define BO_ITEMS 4096
 #define MIN_BO_SIZE (BO_ITEMS * sizeof(uint64_t))
 
+union buf_id {
+	uint32_t fd;
+	void *userptr;
+};
+
 struct bind_list {
 	int fd;
 	uint32_t vm;
-	uint32_t *bo;
+	union buf_id *bo;
 	struct drm_xe_vm_bind_op *bind_ops;
 	unsigned int n;
 };
 
-static void bo_prime(int fd, uint32_t bo, const uint64_t addr, const uint64_t size)
+static void *bo_get_ptr(int fd, struct drm_xe_vm_bind_op *o)
+{
+	void *ptr;
+
+	if (o->op != DRM_XE_VM_BIND_OP_MAP_USERPTR)
+		ptr = xe_bo_map(fd, o->obj, o->range);
+	else
+		ptr = (void *)(uintptr_t)o->userptr;
+
+	igt_assert(ptr);
+
+	return ptr;
+}
+
+static void bo_put_ptr(int fd, struct drm_xe_vm_bind_op *o, void *ptr)
+{
+	if (o->op != DRM_XE_VM_BIND_OP_MAP_USERPTR)
+		munmap(ptr, o->range);
+}
+
+static void bo_prime(int fd, struct drm_xe_vm_bind_op *o)
 {
 	uint64_t *d;
 	uint64_t i;
 
-	d = xe_bo_map(fd, bo, size);
-	igt_assert(d);
+	d = bo_get_ptr(fd, o);
 
-	for (i = 0; i < size/sizeof(*d); i++)
-		d[i] = addr + i;
+	for (i = 0; i < o->range / sizeof(*d); i++)
+		d[i] = o->addr + i;
 
-	munmap(d, size);
+	bo_put_ptr(fd, o, d);
 }
 
-static void bo_check(int fd, uint32_t bo, const uint64_t addr, const uint64_t size)
+static void bo_check(int fd, struct drm_xe_vm_bind_op *o)
 {
 	uint64_t *d;
 	uint64_t i;
 
-	d = xe_bo_map(fd, bo, size);
-	igt_assert(d);
+	d = bo_get_ptr(fd, o);
 
-	for (i = 0; i < size/sizeof(*d); i++)
-		igt_assert_eq(d[i], addr + i + 1);
+	for (i = 0; i < o->range / sizeof(*d); i++)
+		igt_assert_eq(d[i], o->addr + i + 1);
 
-	munmap(d, size);
+	bo_put_ptr(fd, o, d);
 }
 
-static uint32_t *vm_create_objects(int fd, uint32_t bo_placement, uint32_t vm, unsigned int size,
+static union buf_id *vm_create_objects(int fd, uint32_t bo_placement, uint32_t vm, unsigned int size,
 				   unsigned int n)
 {
-	uint32_t *bo;
+	union buf_id *bo;
 	unsigned int i;
 
 	bo = calloc(n, sizeof(*bo));
 	igt_assert(bo);
 
 	for (i = 0; i < n; i++) {
-		bo[i] = xe_bo_create(fd, vm, size, bo_placement, 0);
-		igt_assert(bo[i]);
+		if (bo_placement) {
+			bo[i].fd = xe_bo_create(fd, vm, size, bo_placement, 0);
+			igt_assert(bo[i].fd);
+		} else {
+			bo[i].userptr = aligned_alloc(PAGE_SIZE, size);
+			igt_assert(bo[i].userptr);
+		}
 	}
 
 	return bo;
@@ -223,6 +252,7 @@ static struct bind_list *create_bind_list(int fd, uint32_t bo_placement,
 					  uint32_t vm, unsigned int n)
 {
 	const unsigned int bo_size = max_t(bo_size, xe_get_default_alignment(fd), MIN_BO_SIZE);
+	bool is_userptr = !bo_placement;
 	struct bind_list *bl;
 	unsigned int i;
 
@@ -237,6 +267,16 @@ static struct bind_list *create_bind_list(int fd, uint32_t bo_placement,
 	for (i = 0; i < n; i++) {
 		struct drm_xe_vm_bind_op *o = &bl->bind_ops[i];
 
+		if (is_userptr) {
+			o->obj = 0;
+			o->userptr = (uintptr_t)bl->bo[i].userptr;
+			o->op = DRM_XE_VM_BIND_OP_MAP_USERPTR;
+		} else {
+			o->obj = bl->bo[i].fd;
+			o->obj_offset = 0;
+			o->op = DRM_XE_VM_BIND_OP_MAP;
+		}
+
 		o->range = bo_size;
 		o->addr = BO_ADDR + 2 * i * bo_size;
 		o->flags = 0;
@@ -250,7 +290,7 @@ static struct bind_list *create_bind_list(int fd, uint32_t bo_placement,
 		struct drm_xe_vm_bind_op *o = &bl->bind_ops[i];
 
 		igt_debug("bo %d: addr 0x%llx, range 0x%llx\n", i, o->addr, o->range);
-		bo_prime(fd, bl->bo[i], o->addr, o->range);
+		bo_prime(fd, o);
 	}
 
 	return bl;
@@ -277,16 +317,21 @@ static void do_bind_list(struct xe_eudebug_client *c,
 		igt_assert(syncobj_wait(bl->fd, &sync->handle, 1, INT64_MAX, 0, NULL));
 }
 
-static void check_bind_list(struct bind_list *bl)
+static void free_bind_list(struct bind_list *bl)
 {
 	unsigned int i;
 
 	for (i = 0; i < bl->n; i++) {
 		igt_debug("%d: checking 0x%llx (%lld)\n",
 			  i, bl->bind_ops[i].addr, bl->bind_ops[i].addr);
-		bo_check(bl->fd, bl->bo[i], bl->bind_ops[i].addr,
-			 bl->bind_ops[i].range);
+		bo_check(bl->fd, &bl->bind_ops[i]);
+		if (bl->bind_ops[i].op == DRM_XE_VM_BIND_OP_MAP_USERPTR)
+			free(bl->bo[i].userptr);
 	}
+
+	free(bl->bind_ops);
+	free(bl->bo);
+	free(bl);
 }
 
 static void vm_bind_client(int fd, struct xe_eudebug_client *c)
@@ -1321,6 +1366,7 @@ static void vm_access_client(struct xe_eudebug_client *c)
 	struct drm_xe_sync sync = {
 		.flags = DRM_XE_SYNC_TYPE_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, };
 	struct drm_xe_engine_class_instance *hwe = c->ptr;
+	uint32_t bo_placement;
 	struct bind_list *bl;
 	uint32_t vm;
 	int fd, i;
@@ -1332,7 +1378,11 @@ static void vm_access_client(struct xe_eudebug_client *c)
 
 	vm = xe_eudebug_client_vm_create(c, fd, 0, 0);
 
-	bl = create_bind_list(fd, vram_if_possible(fd, hwe->gt_id), vm, 4);
+	if (c->flags & VM_BIND_OP_MAP_USERPTR)
+		bo_placement = 0;
+	else
+		bo_placement = vram_if_possible(fd, hwe->gt_id);
+	bl = create_bind_list(fd, bo_placement, vm, 4);
 	sync.handle = syncobj_create(bl->fd, 0);
 	do_bind_list(c, bl, &sync);
 	syncobj_destroy(bl->fd, sync.handle);
@@ -1340,7 +1390,7 @@ static void vm_access_client(struct xe_eudebug_client *c)
 	for (i = 0; i < bl->n; i++)
 		xe_eudebug_client_wait_stage(c, bl->bind_ops[i].addr);
 
-	check_bind_list(bl);
+	free_bind_list(bl);
 
 	xe_eudebug_client_vm_destroy(c, fd, vm);
 
@@ -1414,6 +1464,10 @@ static void vm_trigger(struct xe_eudebug_debugger *d,
  * SUBTEST: basic-vm-access
  * Description:
  *      Exercise XE_EUDEBG_VM_OPEN with pread and pwrite into the vm fd
+ *
+ * SUBTEST: basic-vm-access-userptr
+ * Description:
+ *      Exercise XE_EUDEBG_VM_OPEN with pread and pwrite into the vm fd, but backed by userptr
  */
 static void test_vm_access(int fd, unsigned int flags, int num_clients)
 {
@@ -1737,6 +1791,9 @@ igt_main
 	igt_subtest("basic-vm-access")
 		test_vm_access(fd, 0, 1);
 
+	igt_subtest("basic-vm-access-userptr")
+		test_vm_access(fd, VM_BIND_OP_MAP_USERPTR, 1);
+
 	igt_subtest("basic-vm-access-parameters")
 		test_vm_access_parameters(fd, 0, 1);
 
-- 
2.34.1

