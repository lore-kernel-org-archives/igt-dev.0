Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459C3C9EC88
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 13:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC2C10E3C5;
	Mon, 12 Jan 2026 13:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fIinhRxc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD09210E3C5
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 13:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768222853; x=1799758853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GrF0uPXEmS0OBd7HIuAaVO0/kNxu014FRMlnQnysMS0=;
 b=fIinhRxcSJtGqysEZPy+vwUAgvKM8qB34JQHrr7Hymx1RT9VjncWnP2I
 sSSWACP+f5dDERz1KhJ4PEzJ9gYiie0pTi5C4PMzAGwBed4RVMHjyxeh6
 L6hRLbxBDVvq4NWuGu4gCyBvYz/awJEgwEN/3PmCqTF5GkbFuft4pXe0A
 YUxm1aO4WCN60YV0V0Bt6obxtkIrq2nZKZZxE2bIE5kX2e5EpCMI6JPN2
 56Z+8hKw9SAxRgjH0xZWteQpE986f8KuMQ+igpT12VrifR7vHJXhQKnvH
 tX1QfbpyNw4epeFdcCTpqIVYhS3hXcWlPiXkD/UDscJ+XbaEq1XUsDTCi A==;
X-CSE-ConnectionGUID: Uj7nHqckTWW6m8VMf4d5WA==
X-CSE-MsgGUID: kaHan429TxaA8P9vUZ4KQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69545555"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69545555"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:53 -0800
X-CSE-ConnectionGUID: xU0Yo4rlSV6FPtrXlEugWQ==
X-CSE-MsgGUID: qbFMoDFKSeaC1sObnACpZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204095010"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:50 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 12/21] tests/xe_eudebug: Adapt some ufence reliant tests
 to new vm_bind event interface
Date: Mon, 12 Jan 2026 14:59:58 +0200
Message-ID: <20260112130008.1649357-13-mika.kuoppala@linux.intel.com>
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

EU debug no longer relays events for VM_BIND_OP_[MAP|UNMAP] operations,
this includes ufence events for binds that perorm only these operations.
Instead it reports newly added 'VM_BIND_OP_DEBUG_DATA_[ADD|REMOVE]'
operations through the event interface and ufence events if a ufence for
these operations was provided.

Perform neccessary debug data operations to enable the following subtests:
- basic-vm-bind-ufence*
- vma-ufence*
- basic-vm-acccess*

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 tests/intel/xe_eudebug.c | 96 +++++++++++++++++++++++++---------------
 1 file changed, 60 insertions(+), 36 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index e9efb47da8..fed9a47405 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -236,27 +236,40 @@ static struct bind_list *create_bind_list(int fd, uint32_t bo_placement,
 	bl->vm = vm;
 	bl->bo = vm_create_objects(fd, bo_placement, vm, bo_size, n);
 	bl->n = n;
-	bl->bind_ops = calloc(n, sizeof(*bl->bind_ops));
+	bl->bind_ops = calloc(n * 2, sizeof(*bl->bind_ops));
 	igt_assert(bl->bind_ops);
 
 	for (i = 0; i < n; i++) {
-		struct drm_xe_vm_bind_op *o = &bl->bind_ops[i];
+		struct drm_xe_vm_bind_op *om = &bl->bind_ops[i * 2], *od = &bl->bind_ops[i * 2 + 1];
+		struct drm_xe_vm_bind_op_ext_debug_data *op_ext;
 
 		if (is_userptr) {
-			o->userptr = (uintptr_t)bl->bo[i].userptr;
-			o->op = DRM_XE_VM_BIND_OP_MAP_USERPTR;
+			om->userptr = (uintptr_t)bl->bo[i].userptr;
+			om->op = DRM_XE_VM_BIND_OP_MAP_USERPTR;
 		} else {
-			o->obj = bl->bo[i].fd;
-			o->op = DRM_XE_VM_BIND_OP_MAP;
+			om->obj = bl->bo[i].fd;
+			om->op = DRM_XE_VM_BIND_OP_MAP;
 		}
 
-		o->range = bo_size;
-		o->addr = BO_ADDR + 2 * i * bo_size;
-		o->pat_index = intel_get_pat_idx_wb(fd);
+		om->range = bo_size;
+		om->addr = BO_ADDR + 2 * i * bo_size;
+		om->pat_index = intel_get_pat_idx_wb(fd);
+
+		/* debug data */
+		op_ext = calloc(1, sizeof(*op_ext));
+		op_ext->base.name = XE_VM_BIND_OP_EXTENSIONS_DEBUG_DATA;
+		op_ext->flags = DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO;
+		op_ext->pseudopath = DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_MODULE_AREA;
+		op_ext->addr = om->addr;
+		op_ext->range = om->range;
+
+		od->extensions = to_user_pointer(op_ext);
+		od->op = DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA;
+		od->pat_index = intel_get_pat_idx_wb(fd);
 	}
 
 	for (i = 0; i < bl->n; i++) {
-		struct drm_xe_vm_bind_op *o = &bl->bind_ops[i];
+		struct drm_xe_vm_bind_op *o = &bl->bind_ops[i * 2];
 
 		igt_debug("bo %d: addr 0x%llx, range 0x%llx\n", i, o->addr, o->range);
 		bo_prime(fd, o);
@@ -273,9 +286,7 @@ static void do_bind_list(struct xe_eudebug_client *c,
 		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
 		.timeline_value = 1337,
 	};
-	uint64_t ref_seqno = 0, op_ref_seqno = 0;
 	uint64_t *fence_data;
-	int i;
 
 	if (sync) {
 		fence_data = aligned_alloc(xe_get_default_alignment(c->fd),
@@ -285,16 +296,8 @@ static void do_bind_list(struct xe_eudebug_client *c,
 		memset(fence_data, 0, sizeof(*fence_data));
 	}
 
-	xe_vm_bind_array(c->fd, bl->vm, 0, bl->bind_ops, bl->n, &uf_sync, sync ? 1 : 0);
-	xe_eudebug_client_vm_bind_event(c, DRM_XE_EUDEBUG_EVENT_STATE_CHANGE,
-					bl->vm, 0, bl->n, &ref_seqno);
-	for (i = 0; i < bl->n; i++)
-		xe_eudebug_client_vm_bind_op_event(c, DRM_XE_EUDEBUG_EVENT_CREATE,
-						   ref_seqno,
-						   &op_ref_seqno,
-						   bl->bind_ops[i].addr,
-						   bl->bind_ops[i].range,
-						   0);
+	xe_eudebug_client_vm_bind_array(c, bl->vm, 0, bl->bind_ops, bl->n * 2, &uf_sync,
+					sync ? 1 : 0);
 
 	if (sync) {
 		xe_wait_ufence(c->fd, fence_data, uf_sync.timeline_value, 0,
@@ -308,14 +311,33 @@ static void free_bind_list(struct xe_eudebug_client *c, struct bind_list *bl)
 	unsigned int i;
 
 	for (i = 0; i < bl->n; i++) {
-		igt_debug("%d: checking 0x%llx (%lld)\n",
-			  i, bl->bind_ops[i].addr, bl->bind_ops[i].addr);
-		bo_check(c->fd, &bl->bind_ops[i]);
-		if (bl->bind_ops[i].op == DRM_XE_VM_BIND_OP_MAP_USERPTR)
+		struct drm_xe_vm_bind_op *om = &bl->bind_ops[i * 2], *od = &bl->bind_ops[i * 2 + 1];
+		struct drm_xe_vm_bind_op_ext_debug_data *op_ext;
+		igt_debug("%d: checking 0x%llx (%lld)\n", i, om->addr, om->addr);
+
+		bo_check(c->fd, om);
+
+		om->op = DRM_XE_VM_BIND_OP_UNMAP;
+		om->obj = 0;
+		od->op = DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA;
+
+		op_ext = from_user_pointer(od->extensions);
+		op_ext->offset = 0;
+		op_ext->flags = 0;
+		memset(op_ext->pathname, 0, sizeof(op_ext->pathname));
+	}
+
+	xe_eudebug_client_vm_bind_array(c, bl->vm, 0, bl->bind_ops, bl->n * 2, NULL, 0);
+
+	for (i = 0; i < bl->n; i++) {
+		struct drm_xe_vm_bind_op *om = &bl->bind_ops[i * 2], *od = &bl->bind_ops[i * 2 + 1];
+		struct drm_xe_vm_bind_op_ext_debug_data *op_ext;
+
+		if (om->op == DRM_XE_VM_BIND_OP_MAP_USERPTR)
 			free(bl->bo[i].userptr);
-		xe_eudebug_client_vm_unbind(c, bl->vm, 0,
-					    bl->bind_ops[i].addr,
-					    bl->bind_ops[i].range);
+
+		op_ext = from_user_pointer(od->extensions);
+		free(op_ext);
 	}
 
 	free(bl->bind_ops);
@@ -1353,7 +1375,7 @@ static void vm_access_client(struct xe_eudebug_client *c)
 		do_bind_list(c, bl, true);
 
 		for (i = 0; i < bl->n; i++)
-			xe_eudebug_client_wait_stage(c, bl->bind_ops[i].addr);
+			xe_eudebug_client_wait_stage(c, bl->bind_ops[i * 2].addr);
 
 		free_bind_list(c, bl);
 	}
@@ -1734,8 +1756,9 @@ static void basic_ufence_client(struct xe_eudebug_client *c)
 	for (int i = 0; i < n; i++) {
 		struct ufence_bind *b = &binds[i];
 
-		xe_eudebug_client_vm_bind_flags(c, vm, bo, 0, b->addr, b->range, 0,
-						&b->f, 1, 0);
+		xe_eudebug_client_vm_bind_map_with_debug_data(c, vm, b->addr, b->range, bo, 0, NULL,
+							      DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_MODULE_AREA,
+							      0, &b->f, 1);
 	}
 
 	client_wait_ufences(c, binds, n);
@@ -1743,7 +1766,7 @@ static void basic_ufence_client(struct xe_eudebug_client *c)
 	for (int i = 0; i < n; i++) {
 		struct ufence_bind *b = &binds[i];
 
-		xe_eudebug_client_vm_unbind(c, vm, 0, b->addr, b->range);
+		xe_eudebug_client_vm_bind_unmap_with_debug_data(c, vm, b->addr, b->range);
 	}
 
 	destroy_binds_with_ufence(binds, n);
@@ -2231,8 +2254,9 @@ static void vma_ufence_client(struct xe_eudebug_client *c)
 	for (int i = 0; i < n; i++) {
 		struct ufence_bind *b = &binds[i];
 
-		xe_eudebug_client_vm_bind_flags(c, vm, bo[i], 0, b->addr, b->range, 0,
-						&b->f, 1, 0);
+		xe_eudebug_client_vm_bind_map_with_debug_data(c, vm, b->addr, b->range, bo[i], 0, NULL,
+							      DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_MODULE_AREA,
+							      0, &b->f, 1);
 	}
 
 	/* Wait for acks on ufences */
@@ -2256,7 +2280,7 @@ static void vma_ufence_client(struct xe_eudebug_client *c)
 	for (int i = 0; i < n; i++) {
 		struct ufence_bind *b = &binds[i];
 
-		xe_eudebug_client_vm_unbind(c, vm, 0, b->addr, b->range);
+		xe_eudebug_client_vm_bind_unmap_with_debug_data(c, vm, b->addr, b->range);
 	}
 
 	destroy_binds_with_ufence(binds, n);
-- 
2.43.0

