Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D549AC9EC82
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 13:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A3210E3C8;
	Mon, 12 Jan 2026 13:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLA2J4O1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2B810E3CC
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 13:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768222863; x=1799758863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TeZ/mSNJXO0+S797I0pnhklkA2eA9tJIrWEDdm126t0=;
 b=nLA2J4O1PKRzOTz37WDpwykFcMel4ULCYvgJnYFriHQmnDxzmazWqJyr
 HgM8kUm7Y8StGI1GIRY1XAVLBsvBGdARmyL9g6p82bfsw5QMbQzXhVK0W
 ok9NiNM6ejXttaYjqPpI+w0A/aJEwKP9vN/Iwf6ZeWV7DOz8Bat2bvO3J
 3IkPJQJQkBzxsRhcU4WGz8XYoWM64cxPXjwyp0xKiQo60PW1WAg+B3inW
 Ug4jXVfZSOzeExLfn0H+t+Jvjqf+jcqIlMTaTlCX0DC5APgio/5SBvfhp
 it9TYBtC8GxvYW6DBjbJvC55Z8eP0+2Qu05u0+ceASvPg5BMvDQosKeOz Q==;
X-CSE-ConnectionGUID: fyA3MfSfTUCeKli81EzpIg==
X-CSE-MsgGUID: +BRXSlbmSIewLKb1hIWUAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69545596"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69545596"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:01:03 -0800
X-CSE-ConnectionGUID: DwQi/UdeQ7ujQIV1+23zlw==
X-CSE-MsgGUID: L1HZYDwnStuF6iJ+s6eRag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204095062"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:01:00 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 16/21] lib/intel_batchbuffer: Add dummy OP_DEBUG_DATA
 operation to __xe_alloc_bind_ops
Date: Mon, 12 Jan 2026 15:00:02 +0200
Message-ID: <20260112130008.1649357-17-mika.kuoppala@linux.intel.com>
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

xe_eudebug_online tests rely on ufence blocking/acking by the debugger
to set the breakpoint bit on a client shader instruction before
the workload is executed. Ufence events and debugger blocking/acking
is no longer present for binds that only contain 'OP_MAP' operations -
at least a single 'OP_ADD_DEBUG_DATA' has to be present to trigger this
functionality. Make it possible to inject a dummy debug data vm bind
operation to the list of bind operations during bb execution.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 lib/intel_batchbuffer.c | 82 +++++++++++++++++++++++++----------------
 1 file changed, 51 insertions(+), 31 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 3b25a385b7..5e5cf0b136 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1355,42 +1355,71 @@ void intel_bb_destroy(struct intel_bb *ibb)
 #define XE_OBJ_PXP_BIT (0x100)
 #define XE_OBJ_PXP(rsvd1) ((rsvd1) & (XE_OBJ_PXP_BIT))
 
-static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct intel_bb *ibb,
-						   uint32_t op, uint32_t flags,
-						   uint32_t prefetch_region)
+static struct drm_xe_vm_bind_op *__xe_alloc_bind_ops(struct intel_bb *ibb,
+						     uint32_t op, uint32_t flags,
+						     uint32_t prefetch_region,
+						     bool dummy_debug_data)
 {
 	struct drm_i915_gem_exec_object2 **objects = ibb->objects;
-	struct drm_xe_vm_bind_op *bind_ops, *ops;
+	struct drm_xe_vm_bind_op *bind_ops, *bind_op, *ret;
 	bool set_obj = (op & 0xffff) == DRM_XE_VM_BIND_OP_MAP;
 
-	bind_ops = calloc(ibb->num_objects, sizeof(*bind_ops));
+	ret = bind_ops = calloc(ibb->num_objects + (dummy_debug_data ? 1 : 0), sizeof(*bind_ops));
 	igt_assert(bind_ops);
 
+	if (dummy_debug_data) {
+		struct drm_xe_vm_bind_op_ext_debug_data *op_ext;
+
+		bind_op = &bind_ops[0];
+
+		op_ext = calloc(1, sizeof(*op_ext));
+		op_ext->base.name = XE_VM_BIND_OP_EXTENSIONS_DEBUG_DATA;
+		op_ext->flags = DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO;
+		op_ext->pseudopath = DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_SIP_AREA;
+		op_ext->addr = 0;
+		op_ext->range = 1;
+
+		bind_op->op = (op == DRM_XE_VM_BIND_OP_MAP ?
+			DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA :
+			DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA);
+		bind_op->extensions = to_user_pointer(op_ext);
+		bind_op->pat_index = intel_get_pat_idx_wb(ibb->fd);
+
+		bind_ops = &bind_ops[1];
+	}
+
 	igt_debug("bind_ops: %s\n", set_obj ? "MAP" : "UNMAP");
 	for (int i = 0; i < ibb->num_objects; i++) {
-		ops = &bind_ops[i];
+		bind_op = &bind_ops[i];
 
 		if (set_obj)
-			ops->obj = objects[i]->handle;
+			bind_op->obj = objects[i]->handle;
 
-		ops->op = op;
-		ops->flags = flags;
+		bind_op->op = op;
+		bind_op->flags = flags;
 
 		if (XE_OBJ_PXP(objects[i]->rsvd1))
-			ops->flags |= DRM_XE_VM_BIND_FLAG_CHECK_PXP;
-		ops->obj_offset = 0;
-		ops->addr = objects[i]->offset;
-		ops->range = XE_OBJ_SIZE(objects[i]->rsvd1);
-		ops->prefetch_mem_region_instance = prefetch_region;
+			bind_op->flags |= DRM_XE_VM_BIND_FLAG_CHECK_PXP;
+		bind_op->obj_offset = 0;
+		bind_op->addr = objects[i]->offset;
+		bind_op->range = XE_OBJ_SIZE(objects[i]->rsvd1);
+		bind_op->prefetch_mem_region_instance = prefetch_region;
 		if (set_obj)
-			ops->pat_index = XE_OBJ_PAT_IDX(objects[i]->rsvd1);
+			bind_op->pat_index = XE_OBJ_PAT_IDX(objects[i]->rsvd1);
 
 		igt_debug("  [%d]: handle: %u, offset: %llx, size: %llx pat_index: %u\n",
-			  i, ops->obj, (long long)ops->addr, (long long)ops->range,
-			  ops->pat_index);
+			  i, bind_op->obj, (long long)bind_op->addr, (long long)bind_op->range,
+			  bind_op->pat_index);
 	}
 
-	return bind_ops;
+	return ret;
+}
+
+static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct intel_bb *ibb,
+						   uint32_t op, uint32_t flags,
+						   uint32_t prefetch_region)
+{
+	return __xe_alloc_bind_ops(ibb, op, flags, prefetch_region, false);
 }
 
 static void __unbind_xe_objects(struct intel_bb *ibb)
@@ -2633,19 +2662,10 @@ __xe_lr_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 	syncs[0].addr = vm_sync_addr;
 	syncs[1].addr = exec_sync_addr;
 
-	if (ibb->num_objects > 1) {
-		bind_ops = xe_alloc_bind_ops(ibb, DRM_XE_VM_BIND_OP_MAP, 0, 0);
-		xe_vm_bind_array(ibb->fd, ibb->vm_id, 0, bind_ops,
-				 ibb->num_objects, syncs, 1);
-		free(bind_ops);
-	} else {
-		igt_debug("bind: MAP\n");
-		igt_debug("  handle: %u, offset: %llx, size: %llx\n",
-			  ibb->handle, (long long)ibb->batch_offset,
-			  (long long)ibb->size);
-		xe_vm_bind_async(ibb->fd, ibb->vm_id, 0, ibb->handle, 0,
-				 ibb->batch_offset, ibb->size, syncs, 1);
-	}
+	bind_ops = __xe_alloc_bind_ops(ibb, DRM_XE_VM_BIND_OP_MAP, 0, 0, true);
+	xe_vm_bind_array(ibb->fd, ibb->vm_id, 0, bind_ops, ibb->num_objects + 1, syncs, 1);
+	free(from_user_pointer(bind_ops[0].extensions));
+	free(bind_ops);
 
 	/* use default vm_bind_exec_queue */
 	xe_wait_ufence(ibb->fd, &sync_data->vm_sync, USER_FENCE_VALUE, 0, -1);
-- 
2.43.0

