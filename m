Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7ACC9EC82
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 13:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9608E10E3C7;
	Mon, 12 Jan 2026 13:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDIWh/6c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C171710E3CA
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 13:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768222848; x=1799758848;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cqxNsaznZ577zsDEsVqlIoLArN1VkRcSp3DGc+UwZVA=;
 b=QDIWh/6cV5JUWO7sgtyn98J/5k8YAvj1nta1S4WkYet02vkQbXJ7fAC2
 C19ljHhoHi570E+EhZHUT1moLFVUFjrjtkrw2zl3zS+8xLYt+CYvYPnfR
 OyAQWCuBYntA/h5XzxAqL5XZoxqjC4ktX4UmZIyn8rwV0OBYS2p1MN/ns
 XPjibZB7dRAGFA+hMwM5Wh06xwoEZQx7RuBkJe+yzV73E/w62iibB1v7m
 n2cLVy52Jk+4SjG37S2Gu0uzH3G525NaxLSS7uf2jGUYCuJhhOo058q7V
 2jL9sFmVJlI6y4A+57d58Vo4wCN7NSiOrcp0vhEEOhid6KchHxj6sPB1Z g==;
X-CSE-ConnectionGUID: MglgqYMQSD+dyd18RZ6AQw==
X-CSE-MsgGUID: JdW2QAQgQO2ayixlI4bgpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69545542"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69545542"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:48 -0800
X-CSE-ConnectionGUID: TD/RI6S6RgqVZD6+sD/Z+w==
X-CSE-MsgGUID: QnktzmFdT0C2Cv2ZUv5TRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204094990"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:45 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 10/21] lib/xe_eudebug: Adapt to vm_bind debug data
Date: Mon, 12 Jan 2026 14:59:56 +0200
Message-ID: <20260112130008.1649357-11-mika.kuoppala@linux.intel.com>
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
operations through the event interface. Add a wrapper for the newly
added vm bind operations and don't store OP_[MAP|UNMAP] events in the
client log.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 include/drm-uapi/xe_drm.h |  36 +++++
 lib/xe/xe_eudebug.c       | 287 ++++++++++++++++++++++++++++++++++++--
 lib/xe/xe_eudebug.h       |  20 +++
 3 files changed, 335 insertions(+), 8 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 077e66a682..13add4fb8d 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -6,6 +6,8 @@
 #ifndef _UAPI_XE_DRM_H_
 #define _UAPI_XE_DRM_H_
 
+#include <linux/limits.h>
+
 #include "drm.h"
 
 #if defined(__cplusplus)
@@ -1007,6 +1009,35 @@ struct drm_xe_vm_destroy {
 	__u64 reserved[2];
 };
 
+struct drm_xe_vm_bind_op_ext_debug_data {
+	/** @base: base user extension */
+	struct drm_xe_user_extension base;
+
+	/** @addr: Address of the metadata mapping */
+	__u64 addr;
+
+	/** @range: Range of the metadata mapping */
+	__u64 range;
+
+#define DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO (1 << 0)
+	/** @flags: Debug metadata flags */
+	__u64 flags;
+
+	/** @offset: Offset into the debug data file, MBZ for DEBUG_PSEUDO */
+	__u32 offset;
+
+	/** @reserved: Reserved */
+	__u32 reserved;
+
+	union {
+#define DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_MODULE_AREA	0x1
+#define DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_SBA_AREA	0x2
+#define DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_SIP_AREA	0x3
+		__u64 pseudopath;
+		char pathname[PATH_MAX];
+	};
+};
+
 /**
  * struct drm_xe_vm_bind_op - run bind operations
  *
@@ -1016,6 +1047,8 @@ struct drm_xe_vm_destroy {
  *  - %DRM_XE_VM_BIND_OP_MAP_USERPTR
  *  - %DRM_XE_VM_BIND_OP_UNMAP_ALL
  *  - %DRM_XE_VM_BIND_OP_PREFETCH
+ *  - %DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA
+ *  - %DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA
  *
  * and the @flags can be:
  *  - %DRM_XE_VM_BIND_FLAG_READONLY - Setup the page tables as read-only
@@ -1059,6 +1092,7 @@ struct drm_xe_vm_destroy {
  *    the memory region advised by madvise.
  */
 struct drm_xe_vm_bind_op {
+#define	XE_VM_BIND_OP_EXTENSIONS_DEBUG_DATA 0
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -1150,6 +1184,8 @@ struct drm_xe_vm_bind_op {
 #define DRM_XE_VM_BIND_OP_MAP_USERPTR	0x2
 #define DRM_XE_VM_BIND_OP_UNMAP_ALL	0x3
 #define DRM_XE_VM_BIND_OP_PREFETCH	0x4
+#define DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA	0x5
+#define DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA	0x6
 	/** @op: Bind operation to perform */
 	__u32 op;
 
diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 2f2e82a65c..7c4ef80e4c 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -2164,23 +2164,22 @@ static int  __xe_eudebug_client_vm_bind(struct xe_eudebug_client *c,
 					uint8_t pat_index, uint64_t op_ext)
 {
 	const bool ufence = has_user_fence(sync, num_syncs);
-	const uint32_t bind_flags = ufence ?
-		DRM_XE_EUDEBUG_EVENT_VM_BIND_FLAG_UFENCE : 0;
+	const uint32_t bind_flags = ufence ? DRM_XE_EUDEBUG_EVENT_VM_BIND_FLAG_UFENCE : 0;
 	uint64_t seqno = 0, op_seqno = 0;
 	uint32_t bind_base_flags = 0;
+	struct drm_xe_vm_bind_op_ext_debug_data *ext;
 	int ret;
 
 	switch (op) {
-	case DRM_XE_VM_BIND_OP_MAP:
+	case DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA:
 		bind_base_flags = DRM_XE_EUDEBUG_EVENT_CREATE;
 		break;
-	case DRM_XE_VM_BIND_OP_UNMAP:
+	case DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA:
 		bind_base_flags = DRM_XE_EUDEBUG_EVENT_DESTROY;
 		igt_assert_eq(ufence, false);
 		break;
 	default:
-		/* XXX unmap all? */
-		igt_assert(op);
+		/* Wrapper used for VM_BIND_OP that we are not tracking */
 		break;
 	}
 
@@ -2192,12 +2191,15 @@ static int  __xe_eudebug_client_vm_bind(struct xe_eudebug_client *c,
 		return ret;
 
 	if (!bind_base_flags)
-		return -EINVAL;
+		return 0; /* No events to log */
 
+	igt_assert(op_ext);
+
+	ext = from_user_pointer(op_ext);
 	xe_eudebug_client_vm_bind_event(c, DRM_XE_EUDEBUG_EVENT_STATE_CHANGE,
 					vm, bind_flags, 1, &seqno);
 	xe_eudebug_client_vm_bind_op_event(c, bind_base_flags,
-					   seqno, &op_seqno, addr, size, 0);
+					   seqno, &op_seqno, ext->addr, ext->range, 0);
 
 	if (ufence)
 		xe_eudebug_client_vm_bind_ufence_event(c, DRM_XE_EUDEBUG_EVENT_CREATE |
@@ -2321,6 +2323,275 @@ void xe_eudebug_client_vm_unbind(struct xe_eudebug_client *c, uint32_t vm,
 					  flags, sync, num_syncs);
 }
 
+/**
+ * xe_eudebug_client_vm_bind_debug_data_add
+ * @c: pointer to xe_eudebug_client structure
+ * @vm: vm handle
+ * @offset: offset into the debug data file
+ * @addr: ppgtt address
+ * @range: size of the binding
+ * @pseudopath: pseudopath of the metadata
+ * @path: path of the metadata file
+ * @sync: sync objects
+ * @num_syncs: number of sync objects
+ *
+ * Calls xe vm_bind ioctl and logs the corresponding event in client's event log.
+ */
+void xe_eudebug_client_vm_bind_debug_data_add(struct xe_eudebug_client *c, uint32_t vm,
+					      uint32_t offset, uint64_t addr, uint64_t range,
+					      uint64_t pseudopath, char *path,
+					      struct drm_xe_sync *sync, uint32_t num_syncs)
+{
+	struct drm_xe_vm_bind_op_ext_debug_data op_ext = { 0, };
+
+	igt_assert(!pseudopath || !path);
+
+	op_ext.base.name = XE_VM_BIND_OP_EXTENSIONS_DEBUG_DATA;
+	op_ext.base.next_extension = 0;
+	op_ext.base.pad = 0;
+
+	if (path) {
+		strncpy(op_ext.pathname, path, PATH_MAX - 1);
+		op_ext.flags = 0;
+	} else {
+		op_ext.pseudopath = pseudopath;
+		op_ext.flags = DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO;
+	}
+
+	op_ext.addr = addr;
+	op_ext.range = range;
+	op_ext.offset = offset;
+
+	_xe_eudebug_client_vm_bind(c, vm, 0, 0, 0, 0,
+				   DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA, 0,
+				   sync, num_syncs, to_user_pointer(&op_ext));
+}
+
+/**
+ * xe_eudebug_client_vm_bind_debug_data_remove
+ * @c: pointer to xe_eudebug_client structure
+ * @vm: vm handle
+ * @addr: ppgtt address
+ * @range: size of the binding
+ *
+ * Calls xe vm_bind ioctl and logs the corresponding event in client's event log.
+ */
+void xe_eudebug_client_vm_bind_debug_data_remove(struct xe_eudebug_client *c, uint32_t vm,
+						 uint64_t addr, uint64_t range)
+{
+	struct drm_xe_vm_bind_op_ext_debug_data op_ext = { 0, };
+
+	op_ext.base.name = XE_VM_BIND_OP_EXTENSIONS_DEBUG_DATA;
+	op_ext.base.next_extension = 0;
+	op_ext.base.pad = 0;
+
+	op_ext.addr = addr;
+	op_ext.range = range;
+
+	_xe_eudebug_client_vm_bind(c, vm, 0, 0, 0, 0,
+				   DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA, 0,
+				   NULL, 0, to_user_pointer(&op_ext));
+}
+
+/**
+ * xe_eudebug_client_vm_bind_array
+ * @c: pointer to xe_eudebug_client structure
+ * @vm: vm handle
+ * @exec_queue: exec queue handle
+ * @bind_ops: array of vm bind operations
+ * @num_binds: number of bind operations
+ * @sync: sync objects
+ * @num_syncs: number of sync objects
+ *
+ * Wrapper for xe vm_bind_array ioctl. Logs the relevant events (EVENT_VM_BIND,
+ * EVENT_VM_BIND_OP_DEBUG_DATA if debug data ops are present and EVENT_VM_BIND_UFENCE if debug data
+ * ops are present and ufence is provided) in client's event log.
+ */
+void xe_eudebug_client_vm_bind_array(struct xe_eudebug_client *c,
+				     uint32_t vm, uint32_t exec_queue,
+				     struct drm_xe_vm_bind_op *bind_ops,
+				     uint32_t num_binds, struct drm_xe_sync *sync,
+				     uint32_t num_syncs)
+{
+	uint64_t bind_seqno = 0, bind_op_seqno = 0;
+	bool ufence = has_user_fence(sync, num_syncs);
+	uint32_t event_flags = 0;
+	int dd_binds = 0;
+
+	xe_vm_bind_array(c->fd, vm, 0, bind_ops, num_binds, sync, num_syncs);
+
+	for (int i = 0; i < num_binds; i++)
+		if (bind_ops[i].op == DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA ||
+		    bind_ops[i].op == DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA)
+			dd_binds++;
+
+	if (!dd_binds)
+		return; /* No debug data ops, no events to log */
+
+	xe_eudebug_client_vm_bind_event(c, DRM_XE_EUDEBUG_EVENT_STATE_CHANGE,
+					vm, ufence ? DRM_XE_EUDEBUG_EVENT_VM_BIND_FLAG_UFENCE : 0,
+					dd_binds, &bind_seqno);
+
+	for (int i = 0; i < num_binds; i++) {
+		struct drm_xe_vm_bind_op_ext_debug_data *ext_dd = NULL;
+		struct drm_xe_user_extension *ext = NULL;
+		int ext_count = 0;
+
+		if (bind_ops[i].op != DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA &&
+		    bind_ops[i].op != DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA)
+		    continue;
+
+		ext = from_user_pointer(bind_ops[i].extensions);
+		while (ext) {
+			if (ext->name == XE_VM_BIND_OP_EXTENSIONS_DEBUG_DATA)
+				ext_dd = igt_container_of(ext, ext_dd, base);
+			ext_count++;
+			ext = from_user_pointer(ext->next_extension);
+		}
+
+		igt_assert(ext_dd);
+		event_flags = (bind_ops[i].op == DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA) ?
+			      DRM_XE_EUDEBUG_EVENT_CREATE : DRM_XE_EUDEBUG_EVENT_DESTROY;
+		xe_eudebug_client_vm_bind_op_event(c, event_flags,
+						   bind_seqno,
+						   &bind_op_seqno,
+						   ext_dd->addr,
+						   ext_dd->range,
+						   0); // XXX: KMD always sets num_extensions to 0?
+	}
+
+	if (ufence)
+		xe_eudebug_client_vm_bind_ufence_event(c, DRM_XE_EUDEBUG_EVENT_CREATE |
+						       DRM_XE_EUDEBUG_EVENT_NEED_ACK,
+						       bind_seqno);
+}
+
+/**
+ * xe_eudebug_client_vm_bind_map_with_debug_data
+ * @c: pointer to xe_eudebug_client structure
+ * @vm: vm handle
+ * @addr: ppgtt address to map to
+ * @range: size of the binding
+ * @bo: buffer object handle
+ * @bo_offset: offset within the buffer object
+ * @path: path of the metadata file
+ * @pseudopath: pseudopath of the metadata
+ * @offset: offset into the debug data file
+ * @sync: sync objects
+ * @num_syncs: number of sync objects
+ *
+ * Calls xe vm_bind_array ioctl with two ops: OP_MAP and OP_ADD_DEBUG_DATA. Logs the corresponding
+ * events (EVENT_VM_BIND, EVENT_VM_BIND_OP_DEBUG_DATA and if ufence provided, EVENT_VM_BIND_UFENCE)
+ * in client's event log.
+ */
+void xe_eudebug_client_vm_bind_map_with_debug_data(struct xe_eudebug_client *c, uint32_t vm,
+						   uint64_t addr, uint64_t range,
+						   uint32_t bo, uint64_t bo_offset,
+						   char *path, uint64_t pseudopath, uint32_t offset,
+						   struct drm_xe_sync *sync, uint32_t num_syncs)
+{
+	struct drm_xe_vm_bind_op_ext_debug_data op_ext = { 0, };
+	struct drm_xe_vm_bind_op *bind_ops, *op;
+	const int bind_cnt = 2;
+
+	igt_assert(!path || !pseudopath);
+
+	bind_ops = calloc(bind_cnt, sizeof(*bind_ops));
+
+	/* prepare map op */
+	op = &bind_ops[0];
+	op->extensions = 0;
+	op->obj = bo;
+	op->obj_offset = bo_offset;
+	op->range = range;
+	op->addr = addr;
+	op->op = DRM_XE_VM_BIND_OP_MAP;
+	op->flags = 0;
+	op->prefetch_mem_region_instance = 0;
+	op->pat_index = intel_get_pat_idx_wb(c->fd);
+
+	/* prepare debug data op */
+	op_ext.base.name = XE_VM_BIND_OP_EXTENSIONS_DEBUG_DATA;
+	op_ext.base.next_extension = 0;
+	op_ext.base.pad = 0;
+
+	if (path) {
+		strncpy(op_ext.pathname, path, PATH_MAX - 1);
+		op_ext.flags = 0;
+	} else {
+		op_ext.pseudopath = pseudopath;
+		op_ext.flags = DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO;
+	}
+
+	op_ext.addr = addr;
+	op_ext.range = range;
+	op_ext.offset = offset;
+
+	op = &bind_ops[1];
+	op->extensions = to_user_pointer(&op_ext);
+	op->obj = 0;
+	op->obj_offset = 0;
+	op->range = 0;
+	op->addr = 0;
+	op->op = DRM_XE_VM_BIND_OP_ADD_DEBUG_DATA;
+	op->flags = 0;
+	op->prefetch_mem_region_instance = 0;
+	op->pat_index = intel_get_pat_idx_wb(c->fd);
+
+	xe_eudebug_client_vm_bind_array(c, vm, 0, bind_ops, 2, sync, num_syncs);
+}
+
+/**
+ * xe_eudebug_client_vm_bind_unmap_with_debug_data
+ * @c: pointer to xe_eudebug_client structure
+ * @vm: vm handle
+ * @addr: ppgtt address to unmap
+ * @range: size of the binding
+ *
+ * Calls xe vm_bind_array ioctl with two ops: OP_UNMAP and OP_REMOVE_DEBUG_DATA. Logs
+ * the corresponding events (EVENT_VM_BIND and EVENT_VM_BIND_OP_DEBUG_DATA) in client's event log.
+ */
+void xe_eudebug_client_vm_bind_unmap_with_debug_data(struct xe_eudebug_client *c, uint32_t vm,
+						     uint64_t addr, uint64_t range)
+{
+	struct drm_xe_vm_bind_op_ext_debug_data op_ext = { 0, };
+	struct drm_xe_vm_bind_op *bind_ops, *op;
+	const int bind_cnt = 2;
+
+	bind_ops = calloc(bind_cnt, sizeof(*bind_ops));
+
+	/* prepare unmap op */
+	op = &bind_ops[0];
+	op->extensions = 0;
+	op->range = range;
+	op->addr = addr;
+	op->op = DRM_XE_VM_BIND_OP_UNMAP;
+	op->flags = 0;
+	op->prefetch_mem_region_instance = 0;
+	op->pat_index = intel_get_pat_idx_wb(c->fd);
+
+	/* prepare debug data op */
+	op_ext.base.name = XE_VM_BIND_OP_EXTENSIONS_DEBUG_DATA;
+	op_ext.base.next_extension = 0;
+	op_ext.base.pad = 0;
+
+	op_ext.addr = addr;
+	op_ext.range = range;
+
+	op = &bind_ops[1];
+	op->extensions = to_user_pointer(&op_ext),
+		op->obj = 0,
+		op->obj_offset = 0,
+		op->range = 0,
+		op->addr = 0,
+		op->op = DRM_XE_VM_BIND_OP_REMOVE_DEBUG_DATA,
+		op->flags = 0,
+		op->prefetch_mem_region_instance = 0,
+		op->pat_index = intel_get_pat_idx_wb(c->fd);
+
+	xe_eudebug_client_vm_bind_array(c, vm, 0, bind_ops, 2, NULL, 0);
+}
+
 void xe_eudebug_ack_ufence(int debugfd,
 			   const struct drm_xe_eudebug_event_vm_bind_ufence *f)
 {
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index ea7b320a27..a53bd99dc0 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -255,6 +255,26 @@ void xe_eudebug_client_vm_unbind_flags(struct xe_eudebug_client *c,
 void xe_eudebug_client_vm_unbind(struct xe_eudebug_client *c, uint32_t vm,
 				 uint64_t offset, uint64_t addr, uint64_t size);
 
+void xe_eudebug_client_vm_bind_debug_data_add(struct xe_eudebug_client *c, uint32_t vm,
+					      uint32_t offset, uint64_t addr, uint64_t range,
+					      uint64_t pseudopath, char *path,
+					      struct drm_xe_sync *sync, uint32_t num_syncs);
+void xe_eudebug_client_vm_bind_debug_data_remove(struct xe_eudebug_client *c, uint32_t vm,
+						 uint64_t addr, uint64_t range);
+
+void xe_eudebug_client_vm_bind_array(struct xe_eudebug_client *c,
+				     uint32_t vm, uint32_t exec_queue,
+				     struct drm_xe_vm_bind_op *bind_ops,
+				     uint32_t num_binds, struct drm_xe_sync *sync,
+				     uint32_t num_syncs);
+void xe_eudebug_client_vm_bind_map_with_debug_data(struct xe_eudebug_client *c, uint32_t vm,
+						   uint64_t addr, uint64_t range,
+						   uint32_t bo, uint64_t bo_offset,
+						   char *path, uint64_t pseudopath, uint32_t offset,
+						   struct drm_xe_sync *sync, uint32_t num_syncs);
+void xe_eudebug_client_vm_bind_unmap_with_debug_data(struct xe_eudebug_client *c, uint32_t vm,
+						     uint64_t addr, uint64_t range);
+
 struct xe_eudebug_session *xe_eudebug_session_create(int fd,
 						     xe_eudebug_client_work_fn work,
 						     unsigned int flags,
-- 
2.43.0

