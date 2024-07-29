Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645A7C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:03:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2740610E420;
	Mon, 29 Jul 2024 16:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bOCY+B27";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89BE10E42F
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269002; x=1753805002;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q3fksSIniIotMwSe4e2+vC1lkn0ogzl+9L44Z0k9uc4=;
 b=bOCY+B27IG5qzBh7fTkhJS13dQOkH4ubRjisNpGyAelLnI+tEXMnSHVf
 cRihbw/3GPc2Lv732A25o7iQesxlcTqABPiA0xWlBeS/j0oyWpjNCKqWf
 VZb3mYsaALfVa/Wk+Ek4bP5yzmyiQwWRMKX0nQfM+/bxfCksa2o/sioe8
 GX8PEE3FWsix1Zq9TCMN9u4pxrw/doSu3JQo5adc0zAbfslGTbnjjsqKe
 R09yIclxU3r/seWwGdO0dLYih+DFSoNRLKX0Amo22xlhSCXc1OYFh+MsL
 l+u3b678R+ZXEUsPkUCPLdUIiXHqLFxolrGVAw+XQuR1aA0YMLDa2U3FD g==;
X-CSE-ConnectionGUID: z2STbhsBTFO97C37Ls8RBQ==
X-CSE-MsgGUID: tX6uYKdoTYCAjdMiAUPcHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427001"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427001"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:20 -0700
X-CSE-ConnectionGUID: BqmlSivHRk6a/e3MdgFZuA==
X-CSE-MsgGUID: Mdw7Y4lCSL6QV6kCNpwbUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53737713"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:17 -0700
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
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 18/66] tests/xe_eudebug: Add vm open/pread/pwrite basic tests
Date: Mon, 29 Jul 2024 18:01:11 +0200
Message-Id: <20240729160159.37036-19-christoph.manszewski@intel.com>
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

From: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Add basic tests for opening, writing and reading into
client's vm.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug.c | 276 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 276 insertions(+)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index d16bc9c19..0951129da 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -16,9 +16,139 @@
 #include <sys/ioctl.h>
 
 #include "igt.h"
+#include "intel_pat.h"
+#include "lib/igt_syncobj.h"
 #include "xe/xe_eudebug.h"
+#include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+#define BO_ADDR 0x1a0000
+#define BO_ITEMS 4096
+#define MIN_BO_SIZE (BO_ITEMS * sizeof(uint64_t))
+
+struct bind_list {
+	int fd;
+	uint32_t vm;
+	uint32_t *bo;
+	struct drm_xe_vm_bind_op *bind_ops;
+	unsigned int n;
+};
+
+static void bo_prime(int fd, uint32_t bo, const uint64_t addr, const uint64_t size)
+{
+	uint64_t *d;
+	uint64_t i;
+
+	d = xe_bo_map(fd, bo, size);
+	igt_assert(d);
+
+	for (i = 0; i < size/sizeof(*d); i++)
+		d[i] = addr + i;
+
+	munmap(d, size);
+}
+
+static void bo_check(int fd, uint32_t bo, const uint64_t addr, const uint64_t size)
+{
+	uint64_t *d;
+	uint64_t i;
+
+	d = xe_bo_map(fd, bo, size);
+	igt_assert(d);
+
+	for (i = 0; i < size/sizeof(*d); i++)
+		igt_assert_eq(d[i], addr + i + 1);
+
+	munmap(d, size);
+}
+
+static uint32_t *vm_create_objects(int fd, uint32_t bo_placement, uint32_t vm, unsigned int size,
+				   unsigned int n)
+{
+	uint32_t *bo;
+	unsigned int i;
+
+	bo = calloc(n, sizeof(*bo));
+	igt_assert(bo);
+
+	for (i = 0; i < n; i++) {
+		bo[i] = xe_bo_create(fd, vm, size, bo_placement, 0);
+		igt_assert(bo[i]);
+	}
+
+	return bo;
+}
+
+static struct bind_list *create_bind_list(int fd, uint32_t bo_placement,
+					  uint32_t vm, unsigned int n)
+{
+	const unsigned int bo_size = max_t(bo_size, xe_get_default_alignment(fd), MIN_BO_SIZE);
+	struct bind_list *bl;
+	unsigned int i;
+
+	bl = malloc(sizeof(*bl));
+	bl->fd = fd;
+	bl->vm = vm;
+	bl->bo = vm_create_objects(fd, bo_placement, vm, bo_size, n);
+	bl->n = n;
+	bl->bind_ops = calloc(n, sizeof(*bl->bind_ops));
+	igt_assert(bl->bind_ops);
+
+	for (i = 0; i < n; i++) {
+		struct drm_xe_vm_bind_op *o = &bl->bind_ops[i];
+
+		o->range = bo_size;
+		o->addr = BO_ADDR + 2 * i * bo_size;
+		o->flags = 0;
+		o->pat_index = intel_get_pat_idx_wb(fd);
+		o->prefetch_mem_region_instance = 0;
+		o->reserved[0] = 0;
+		o->reserved[1] = 0;
+	}
+
+	for (i = 0; i < bl->n; i++) {
+		struct drm_xe_vm_bind_op *o = &bl->bind_ops[i];
+
+		igt_debug("bo %d: addr 0x%llx, range 0x%llx\n", i, o->addr, o->range);
+		bo_prime(fd, bl->bo[i], o->addr, o->range);
+	}
+
+	return bl;
+}
+
+static void do_bind_list(struct xe_eudebug_client *c,
+			 struct bind_list *bl, struct drm_xe_sync *sync)
+{
+	int i;
+	uint64_t ref_seqno = 0, op_ref_seqno = 0;
+
+	xe_vm_bind_array(bl->fd, bl->vm, 0, bl->bind_ops, bl->n, sync, sync ? 1 : 0);
+	xe_eudebug_client_vm_bind_event(c, DRM_XE_EUDEBUG_EVENT_STATE_CHANGE,
+					bl->fd, bl->vm, 0, bl->n, &ref_seqno);
+	for (i = 0; i < bl->n; i++)
+		xe_eudebug_client_vm_bind_op_event(c, DRM_XE_EUDEBUG_EVENT_CREATE,
+						   ref_seqno,
+						   &op_ref_seqno,
+						   bl->bind_ops[i].addr,
+						   bl->bind_ops[i].range,
+						   0);
+
+	if (sync)
+		igt_assert(syncobj_wait(bl->fd, &sync->handle, 1, INT64_MAX, 0, NULL));
+}
+
+static void check_bind_list(struct bind_list *bl)
+{
+	unsigned int i;
+
+	for (i = 0; i < bl->n; i++) {
+		igt_debug("%d: checking 0x%llx (%lld)\n",
+			  i, bl->bind_ops[i].addr, bl->bind_ops[i].addr);
+		bo_check(bl->fd, bl->bo[i], bl->bind_ops[i].addr,
+			 bl->bind_ops[i].range);
+	}
+}
+
 #define CREATE_VMS	(1 << 0)
 #define CREATE_EXEC_QUEUES	(1 << 1)
 static void run_basic_client(struct xe_eudebug_client *c)
@@ -612,6 +742,149 @@ static void test_empty_discovery(int fd, unsigned int flags, int clients)
 	}
 }
 
+typedef void (*client_run_t)(struct xe_eudebug_client *);
+
+static void test_client_with_trigger(int fd, unsigned int flags, int count,
+				     client_run_t client_fn, int type,
+				     xe_eudebug_trigger_fn trigger_fn,
+				     struct drm_xe_engine_class_instance *hwe,
+				     bool match_opposite, uint32_t event_filter)
+{
+	struct xe_eudebug_session **s;
+	int i;
+
+	s = calloc(count, sizeof(*s));
+
+	igt_assert(s);
+
+	for (i = 0; i < count; i++)
+		s[i] = xe_eudebug_session_create(fd, client_fn, flags, hwe);
+
+	if (trigger_fn)
+		for (i = 0; i < count; i++)
+			xe_eudebug_debugger_add_trigger(s[i]->d, type, trigger_fn);
+
+	for (i = 0; i < count; i++)
+		xe_eudebug_session_run(s[i]);
+
+	for (i = 0; i < count; i++)
+		xe_eudebug_session_check(s[i], match_opposite, event_filter);
+
+	for (i = 0; i < count; i++)
+		xe_eudebug_session_destroy(s[i]);
+}
+
+static void vm_access_client(struct xe_eudebug_client *c)
+{
+	struct drm_xe_sync sync = {
+		.flags = DRM_XE_SYNC_TYPE_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL, };
+	struct drm_xe_engine_class_instance *hwe = c->ptr;
+	struct bind_list *bl;
+	uint32_t vm;
+	int fd, i;
+
+	igt_debug("Using %s\n", xe_engine_class_string(hwe->engine_class));
+
+	fd = xe_eudebug_client_open_driver(c);
+	xe_device_get(fd);
+
+	vm = xe_eudebug_client_vm_create(c, fd, 0, 0);
+
+	bl = create_bind_list(fd, vram_if_possible(fd, hwe->gt_id), vm, 4);
+	sync.handle = syncobj_create(bl->fd, 0);
+	do_bind_list(c, bl, &sync);
+	syncobj_destroy(bl->fd, sync.handle);
+
+	for (i = 0; i < bl->n; i++)
+		xe_eudebug_client_wait_stage(c, bl->bind_ops[i].addr);
+
+	check_bind_list(bl);
+
+	xe_eudebug_client_vm_destroy(c, fd, vm);
+
+	xe_device_put(fd);
+	xe_eudebug_client_close_driver(c, fd);
+}
+
+static void debugger_test_vma(struct xe_eudebug_debugger *d,
+			      uint64_t client_handle,
+			      uint64_t vm_handle,
+			      uint64_t va_start,
+			      uint64_t va_length)
+{
+	struct drm_xe_eudebug_vm_open vo = { 0, };
+	uint64_t *v;
+	uint64_t items = va_length / sizeof(uint64_t);
+	int fd;
+	int r, i;
+
+	v = malloc(va_length);
+	igt_assert(v);
+
+	vo.client_handle = client_handle;
+	vo.vm_handle = vm_handle;
+
+	fd = igt_ioctl(d->fd, DRM_XE_EUDEBUG_IOCTL_VM_OPEN, &vo);
+	igt_assert_lte(0, fd);
+
+	r = pread(fd, v, va_length, va_start);
+	igt_assert_eq(r, va_length);
+
+	for (i = 0; i < items; i++)
+		igt_assert_eq(v[i], va_start + i);
+
+	for (i = 0; i < items; i++)
+		v[i] = va_start + i + 1;
+
+	r = pwrite(fd, v, va_length, va_start);
+	igt_assert_eq(r, va_length);
+
+	fsync(fd);
+
+	close(fd);
+	free(v);
+}
+
+static void vm_trigger(struct xe_eudebug_debugger *d,
+		       struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_vm_bind_op *eo = (void *)e;
+
+	if (e->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
+		struct drm_xe_eudebug_event_vm_bind *eb;
+
+		igt_debug("vm bind op event received with ref %lld, addr 0x%llx, range 0x%llx\n",
+			  eo->vm_bind_ref_seqno,
+			  eo->addr,
+			  eo->range);
+
+		eb = (struct drm_xe_eudebug_event_vm_bind *)
+			xe_eudebug_event_log_find_seqno(d->log, eo->vm_bind_ref_seqno);
+		igt_assert(eb);
+
+		debugger_test_vma(d, eb->client_handle, eb->vm_handle,
+				  eo->addr, eo->range);
+		xe_eudebug_debugger_signal_stage(d, eo->addr);
+	}
+}
+
+/**
+ * SUBTEST: basic-vm-access
+ * Description:
+ *      Exercise XE_EUDEBG_VM_OPEN with pread and pwrite into the vm fd
+ */
+static void test_vm_access(int fd, unsigned int flags, int num_clients)
+{
+	struct drm_xe_engine_class_instance *hwe;
+
+	xe_for_each_engine(fd, hwe)
+		test_client_with_trigger(fd, flags, num_clients,
+					 vm_access_client,
+					 DRM_XE_EUDEBUG_EVENT_VM_BIND_OP,
+					 vm_trigger, hwe,
+					 false, XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP);
+}
+
 igt_main
 {
 	int fd;
@@ -632,6 +905,9 @@ igt_main
 	igt_subtest("basic-client")
 		test_basic_sessions(fd, 0, 1);
 
+	igt_subtest("basic-vm-access")
+		test_vm_access(fd, 0, 1);
+
 	igt_subtest("multiple-sessions")
 		test_basic_sessions(fd, CREATE_VMS | CREATE_EXEC_QUEUES, 4);
 
-- 
2.34.1

