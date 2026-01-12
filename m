Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEB2C9EC87
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 13:00:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC9210E3C5;
	Mon, 12 Jan 2026 13:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NbV0TeNy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8891610E3C9
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 13:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768222835; x=1799758835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+uoXpOyA6EtMGPjqq5HVQhQhZ8FIxMaNd4qbpWZHTXM=;
 b=NbV0TeNyos3ypCHSfuD96tHs78AwqSSVbsODf4ejE08dwje211lyQYc4
 saw9NygJZpWVS9cDdQZfi33glPHL6+WCcPN5YxIVLsSKGtIFSxH5gBUj8
 2gHm7rOR9x/0cY+5Zl5FvvmN8H31wkMUb9KmCnCQFV/5ax4m032HV9WcG
 xw1NWzXMSR6j+lQ4bmp5klvVipjDf2YJIuQH+/FgR2RRXcDLcEbxrRrg7
 nXprC4bOb7CERKojMiKkNh5Z6h3TPF0+G3aY+ysuVtAZsMF76GeiiLwpi
 e6iFhzDJK9SMmXua2sphl0srHO2b7w31ywu2nAzzWa3w6waYrc6j4EnEx A==;
X-CSE-ConnectionGUID: MRf/wxOxQ6uMrueIeOgr+w==
X-CSE-MsgGUID: KBXd36WPTdGAwNhlwggX6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69545525"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69545525"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:35 -0800
X-CSE-ConnectionGUID: xepbYklgQYyF67cqs3J35Q==
X-CSE-MsgGUID: TeBp+S0STRyaVOby3+/ySg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204094945"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:32 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 05/21] eudebug: Remove metadata tests
Date: Mon, 12 Jan 2026 14:59:51 +0200
Message-ID: <20260112130008.1649357-6-mika.kuoppala@linux.intel.com>
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

Metadata will be reworked. Remove.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 .../drm-uapi-experimental/xe_drm_eudebug.h    |  98 --------
 lib/xe/xe_eudebug.c                           | 184 +--------------
 lib/xe/xe_eudebug.h                           |  10 -
 tests/intel/xe_eudebug.c                      | 209 +-----------------
 tests/intel/xe_eudebug_online.c               |  87 --------
 5 files changed, 9 insertions(+), 579 deletions(-)

diff --git a/include/drm-uapi-experimental/xe_drm_eudebug.h b/include/drm-uapi-experimental/xe_drm_eudebug.h
index 5aeb6a7352..73e4f418f5 100644
--- a/include/drm-uapi-experimental/xe_drm_eudebug.h
+++ b/include/drm-uapi-experimental/xe_drm_eudebug.h
@@ -31,29 +31,6 @@ extern "C" {
 
 /* ... */
 
-struct drm_xe_vm_bind_op_ext_attach_debug {
-	/** @base: base user extension */
-	struct drm_xe_user_extension base;
-
-	/** @id: Debug object id from create metadata */
-	__u64 metadata_id;
-
-	/** @flags: Flags */
-	__u64 flags;
-
-	/** @cookie: Cookie */
-	__u64 cookie;
-
-	/** @reserved: Reserved */
-	__u64 reserved;
-};
-
-/* ... */
-
-#define XE_VM_BIND_OP_EXTENSIONS_ATTACH_DEBUG 0
-
-/* ... */
-
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		3
 #define     DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE		(1 << 0)
 
@@ -76,54 +53,6 @@ struct drm_xe_eudebug_connect {
 	__u32 version; /* output: current ABI (ioctl / events) version */
 };
 
-/*
- * struct drm_xe_debug_metadata_create - Create debug metadata
- *
- * Add a region of user memory to be marked as debug metadata.
- * When the debugger attaches, the metadata regions will be delivered
- * for debugger. Debugger can then map these regions to help decode
- * the program state.
- *
- * Returns handle to created metadata entry.
- */
-struct drm_xe_debug_metadata_create {
-	/** @extensions: Pointer to the first extension struct, if any */
-	__u64 extensions;
-
-#define DRM_XE_DEBUG_METADATA_ELF_BINARY     0
-#define DRM_XE_DEBUG_METADATA_PROGRAM_MODULE 1
-#define WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_MODULE_AREA 2
-#define WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_SBA_AREA 3
-#define WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_SIP_AREA 4
-#define WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM (1 + \
-	  WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_SIP_AREA)
-
-	/** @type: Type of metadata */
-	__u64 type;
-
-	/** @user_addr: pointer to start of the metadata */
-	__u64 user_addr;
-
-	/** @len: length, in bytes of the medata */
-	__u64 len;
-
-	/** @metadata_id: created metadata handle (out) */
-	__u32 metadata_id;
-};
-
-/**
- * struct drm_xe_debug_metadata_destroy - Destroy debug metadata
- *
- * Destroy debug metadata.
- */
-struct drm_xe_debug_metadata_destroy {
-	/** @extensions: Pointer to the first extension struct, if any */
-	__u64 extensions;
-
-	/** @metadata_id: metadata handle to destroy */
-	__u32 metadata_id;
-};
-
 /* XXX: END section moved from xe_drm.h as temporary solution */
 
 /**
@@ -309,33 +238,6 @@ struct drm_xe_eudebug_vm_open {
 	__u64 timeout_ns;
 };
 
-struct drm_xe_eudebug_read_metadata {
-	__u64 client_handle;
-	__u64 metadata_handle;
-	__u32 flags;
-	__u32 reserved;
-	__u64 ptr;
-	__u64 size;
-};
-
-struct drm_xe_eudebug_event_metadata {
-	struct drm_xe_eudebug_event base;
-
-	__u64 client_handle;
-	__u64 metadata_handle;
-	/* XXX: Refer to xe_drm.h for fields */
-	__u64 type;
-	__u64 len;
-};
-
-struct drm_xe_eudebug_event_vm_bind_op_metadata {
-	struct drm_xe_eudebug_event base;
-	__u64 vm_bind_op_ref_seqno; /* *_event_vm_bind_op.base.seqno */
-
-	__u64 metadata_handle;
-	__u64 metadata_cookie;
-};
-
 struct drm_xe_eudebug_event_pagefault {
 	struct drm_xe_eudebug_event base;
 
diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 31e4f9c486..0583ce8f31 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -92,10 +92,6 @@ static const char *type_to_str(unsigned int type)
 		return "vm_bind_op";
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE:
 		return "vm_bind_ufence";
-	case DRM_XE_EUDEBUG_EVENT_METADATA:
-		return "metadata";
-	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA:
-		return "vm_bind_op_metadata";
 	case DRM_XE_EUDEBUG_EVENT_PAGEFAULT:
 		return "pagefault";
 	}
@@ -183,20 +179,6 @@ static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *bu
 		sprintf(buf, "vm_bind_ref_seqno=%lld", f->vm_bind_ref_seqno);
 		break;
 	}
-	case DRM_XE_EUDEBUG_EVENT_METADATA: {
-		struct drm_xe_eudebug_event_metadata *em = igt_container_of(e, em, base);
-
-		sprintf(buf, "client_handle=%llu, metadata_handle=%llu, type=%llu, len=%llu",
-			em->client_handle, em->metadata_handle, em->type, em->len);
-		break;
-	}
-	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA: {
-		struct drm_xe_eudebug_event_vm_bind_op_metadata *op = igt_container_of(e, op, base);
-
-		sprintf(buf, "vm_bind_op_ref_seqno=%lld, metadata_handle=%llu, metadata_cookie=%llu",
-			op->vm_bind_op_ref_seqno, op->metadata_handle, op->metadata_cookie);
-		break;
-	}
 	case DRM_XE_EUDEBUG_EVENT_PAGEFAULT: {
 		struct drm_xe_eudebug_event_pagefault *pf = igt_container_of(e, pf, base);
 
@@ -505,16 +487,6 @@ static int match_fields(struct drm_xe_eudebug_event *a, void *data)
 			ret = 1;
 		break;
 	}
-	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA: {
-		struct drm_xe_eudebug_event_vm_bind_op_metadata *ea = igt_container_of(a, ea, base);
-		struct drm_xe_eudebug_event_vm_bind_op_metadata *eb = igt_container_of(b, eb, base);
-
-		if (ea->metadata_handle == eb->metadata_handle &&
-		    ea->metadata_cookie == eb->metadata_cookie)
-			ret = 1;
-		break;
-	}
-
 	default:
 		ret = 1;
 		break;
@@ -581,20 +553,6 @@ static int match_client_handle(struct drm_xe_eudebug_event *e, void *data)
 
 		break;
 	}
-	case DRM_XE_EUDEBUG_EVENT_METADATA: {
-		struct drm_xe_eudebug_event_metadata *em = igt_container_of(e, em, base);
-
-		if (em->client_handle == h)
-			return 1;
-		break;
-	}
-	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA: {
-		struct drm_xe_eudebug_event_vm_bind_op_metadata *eo = igt_container_of(e, eo, base);
-
-		if (eo->vm_bind_op_ref_seqno == *bind_op_seqno)
-			return 1;
-		break;
-	}
 	default:
 		break;
 	}
@@ -658,25 +616,6 @@ static int match_opposite_resource(struct drm_xe_eudebug_event *e, void *data)
 			return 1;
 		break;
 	}
-	case DRM_XE_EUDEBUG_EVENT_METADATA: {
-		struct drm_xe_eudebug_event_metadata *em = igt_container_of(e, em, base);
-		struct drm_xe_eudebug_event_metadata *filter = data;
-
-		if (em->metadata_handle == filter->metadata_handle)
-			return 1;
-		break;
-	}
-	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA: {
-		struct drm_xe_eudebug_event_vm_bind_op_metadata *avmb = igt_container_of(e, avmb,
-											 base);
-		struct drm_xe_eudebug_event_vm_bind_op_metadata *filter = data;
-
-		if (avmb->metadata_handle == filter->metadata_handle &&
-		    avmb->metadata_cookie == filter->metadata_cookie)
-			return 1;
-		break;
-	}
-
 	default:
 		break;
 	}
@@ -1071,8 +1010,7 @@ xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log *l, uint32_t fil
 
 			/* No opposite matching for binds */
 			if ((ev1->type >= DRM_XE_EUDEBUG_EVENT_VM_BIND &&
-			     ev1->type <= DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE) ||
-			    ev1->type == DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA)
+			     ev1->type <= DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE))
 				continue;
 
 			ev2 = opposite_event_match(l, ev1, ev1);
@@ -1850,22 +1788,6 @@ static void exec_queue_event(struct xe_eudebug_client *c, uint32_t flags,
 	xe_eudebug_event_log_write(c->log, (void *)&ee);
 }
 
-static void metadata_event(struct xe_eudebug_client *c, uint32_t flags,
-			   int client_fd, uint32_t id, uint64_t type, uint64_t len)
-{
-	struct drm_xe_eudebug_event_metadata em;
-
-	base_event(c, to_base(em), DRM_XE_EUDEBUG_EVENT_METADATA,
-		   flags, sizeof(em));
-
-	em.client_handle = client_fd;
-	em.metadata_handle = id;
-	em.type = type;
-	em.len = len;
-
-	xe_eudebug_event_log_write(c->log, (void *)&em);
-}
-
 /**
  * __xe_eudebug_enable_getset
  * @fd: xe client
@@ -1986,7 +1908,6 @@ void xe_eudebug_client_close_driver(struct xe_eudebug_client *c, int fd)
  * @ext: pointer to the first user extension
  *
  * Calls xe_vm_create() and logs corresponding events
- * (including vm set metadata events) in client's event log.
  *
  * Returns: valid vm handle
  */
@@ -2165,33 +2086,6 @@ void xe_eudebug_client_vm_bind_op_event(struct xe_eudebug_client *c, uint32_t ev
 	xe_eudebug_event_log_write(c->log, (void *)&op);
 }
 
-/**
- * xe_eudebug_client_vm_bind_op_metadata_event:
- * @c: pointer to xe_eudebug_client structure
- * @event_flags: base event flags
- * @op_ref_seqno: base vm bind op reference seqno
- * @metadata_handle: metadata handle
- * @metadata_cookie: metadata cookie
- *
- * Logs vm bind op metadata event in client's event log.
- */
-void xe_eudebug_client_vm_bind_op_metadata_event(struct xe_eudebug_client *c,
-						 uint32_t event_flags, uint64_t op_ref_seqno,
-						 uint64_t metadata_handle, uint64_t metadata_cookie)
-{
-	struct drm_xe_eudebug_event_vm_bind_op_metadata op;
-
-	igt_assert(c);
-
-	base_event(c, to_base(op), DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA,
-		   event_flags, sizeof(op));
-	op.vm_bind_op_ref_seqno = op_ref_seqno;
-	op.metadata_handle = metadata_handle;
-	op.metadata_cookie = metadata_cookie;
-
-	xe_eudebug_event_log_write(c->log, (void *)&op);
-}
-
 /**
  * xe_eudebug_client_vm_bind_ufence_event:
  * @c: pointer to xe_eudebug_client structure
@@ -2223,12 +2117,6 @@ static bool has_user_fence(const struct drm_xe_sync *sync, uint32_t num_syncs)
 	return false;
 }
 
-#define for_each_metadata(__m, __ext)					\
-	for ((__m) = from_user_pointer(__ext);				\
-	     (__m);							\
-	     (__m) = from_user_pointer((__m)->base.next_extension))	\
-		if ((__m)->base.name == XE_VM_BIND_OP_EXTENSIONS_ATTACH_DEBUG)
-
 static int  __xe_eudebug_client_vm_bind(struct xe_eudebug_client *c,
 					int fd, uint32_t vm, uint32_t exec_queue,
 					uint32_t bo, uint64_t offset,
@@ -2239,24 +2127,19 @@ static int  __xe_eudebug_client_vm_bind(struct xe_eudebug_client *c,
 					uint32_t prefetch_region,
 					uint8_t pat_index, uint64_t op_ext)
 {
-	struct drm_xe_vm_bind_op_ext_attach_debug *metadata;
 	const bool ufence = has_user_fence(sync, num_syncs);
 	const uint32_t bind_flags = ufence ?
 		DRM_XE_EUDEBUG_EVENT_VM_BIND_FLAG_UFENCE : 0;
-	uint64_t seqno = 0, op_seqno = 0, num_metadata = 0;
+	uint64_t seqno = 0, op_seqno = 0;
 	uint32_t bind_base_flags = 0;
 	int ret;
 
-	for_each_metadata(metadata, op_ext)
-		num_metadata++;
-
 	switch (op) {
 	case DRM_XE_VM_BIND_OP_MAP:
 		bind_base_flags = DRM_XE_EUDEBUG_EVENT_CREATE;
 		break;
 	case DRM_XE_VM_BIND_OP_UNMAP:
 		bind_base_flags = DRM_XE_EUDEBUG_EVENT_DESTROY;
-		igt_assert_eq(num_metadata, 0);
 		igt_assert_eq(ufence, false);
 		break;
 	default:
@@ -2278,15 +2161,8 @@ static int  __xe_eudebug_client_vm_bind(struct xe_eudebug_client *c,
 	xe_eudebug_client_vm_bind_event(c, DRM_XE_EUDEBUG_EVENT_STATE_CHANGE,
 					fd, vm, bind_flags, 1, &seqno);
 	xe_eudebug_client_vm_bind_op_event(c, bind_base_flags,
-					   seqno, &op_seqno, addr, size,
-					   num_metadata);
-
-	for_each_metadata(metadata, op_ext)
-		xe_eudebug_client_vm_bind_op_metadata_event(c,
-							    DRM_XE_EUDEBUG_EVENT_CREATE,
-							    op_seqno,
-							    metadata->metadata_id,
-							    metadata->cookie);
+					   seqno, &op_seqno, addr, size, 0);
+
 	if (ufence)
 		xe_eudebug_client_vm_bind_ufence_event(c, DRM_XE_EUDEBUG_EVENT_CREATE |
 						       DRM_XE_EUDEBUG_EVENT_NEED_ACK,
@@ -2413,58 +2289,6 @@ void xe_eudebug_client_vm_unbind(struct xe_eudebug_client *c, int fd, uint32_t v
 					  flags, sync, num_syncs);
 }
 
-/**
- * xe_eudebug_client_metadata_create:
- * @c: pointer to xe_eudebug_client structure
- * @fd: xe client
- * @type: debug metadata type
- * @len: size of @data
- * @data: debug metadata paylad
- *
- * Calls xe metadata create ioctl and logs the corresponding event in
- * client's event log.
- *
- * Return: valid debug metadata id.
- */
-uint32_t xe_eudebug_client_metadata_create(struct xe_eudebug_client *c, int fd,
-					   int type, size_t len, void *data)
-{
-	struct drm_xe_debug_metadata_create create = {
-		.type = type,
-		.user_addr = to_user_pointer(data),
-		.len = len
-	};
-
-	igt_assert(c);
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEBUG_METADATA_CREATE, &create), 0);
-
-	metadata_event(c, DRM_XE_EUDEBUG_EVENT_CREATE, fd, create.metadata_id, type, len);
-
-	return create.metadata_id;
-}
-
-/**
- * xe_eudebug_client_metadata_destroy:
- * @c: pointer to xe_eudebug_client structure
- * @fd: xe client
- * @id: xe debug metadata handle
- * @type: debug metadata type
- * @len: size of debug metadata payload
- *
- * Calls xe metadata destroy ioctl and logs the corresponding event in
- * client's event log.
- */
-void xe_eudebug_client_metadata_destroy(struct xe_eudebug_client *c, int fd,
-					uint32_t id, int type, size_t len)
-{
-	struct drm_xe_debug_metadata_destroy destroy = { .metadata_id = id };
-
-	igt_assert(c);
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEBUG_METADATA_DESTROY, &destroy), 0);
-
-	metadata_event(c, DRM_XE_EUDEBUG_EVENT_DESTROY, fd, id, type, len);
-}
-
 void xe_eudebug_ack_ufence(int debugfd,
 			   const struct drm_xe_eudebug_event_vm_bind_ufence *f)
 {
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index ef9dacf0d2..0706023121 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -170,8 +170,6 @@ next_event(struct drm_xe_eudebug_event *e, struct xe_eudebug_event_log *l)
 #define XE_EUDEBUG_FILTER_EVENT_VM_BIND			BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND)
 #define XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP		BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_OP)
 #define XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE		BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE)
-#define XE_EUDEBUG_FILTER_EVENT_METADATA		BIT(DRM_XE_EUDEBUG_EVENT_METADATA)
-#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP_METADATA	BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA)
 #define XE_EUDEBUG_FILTER_EVENT_PAGEFAULT		BIT(DRM_XE_EUDEBUG_EVENT_PAGEFAULT)
 #define XE_EUDEBUG_FILTER_ALL				GENMASK(DRM_XE_EUDEBUG_EVENT_PAGEFAULT, 0)
 #define XE_EUDEBUG_EVENT_IS_FILTERED(_e, _f)		((1UL << (_e)) & (_f))
@@ -237,9 +235,6 @@ void xe_eudebug_client_vm_bind_op_event(struct xe_eudebug_client *c, uint32_t ev
 					uint64_t ref_seqno, uint64_t *op_ref_seqno,
 					uint64_t addr, uint64_t range,
 					uint64_t num_extensions);
-void xe_eudebug_client_vm_bind_op_metadata_event(struct xe_eudebug_client *c,
-						 uint32_t event_flags, uint64_t op_ref_seqno,
-						 uint64_t metadata_handle, uint64_t metadata_cookie);
 void xe_eudebug_client_vm_bind_ufence_event(struct xe_eudebug_client *c, uint32_t event_flags,
 					    uint64_t ref_seqno);
 void xe_eudebug_ack_ufence(int debugfd,
@@ -260,11 +255,6 @@ void xe_eudebug_client_vm_unbind_flags(struct xe_eudebug_client *c, int fd,
 void xe_eudebug_client_vm_unbind(struct xe_eudebug_client *c, int fd, uint32_t vm,
 				 uint64_t offset, uint64_t addr, uint64_t size);
 
-uint32_t xe_eudebug_client_metadata_create(struct xe_eudebug_client *c, int fd,
-					   int type, size_t len, void *data);
-void xe_eudebug_client_metadata_destroy(struct xe_eudebug_client *c, int fd,
-					uint32_t id, int type, size_t len);
-
 struct xe_eudebug_session *xe_eudebug_session_create(int fd,
 						     xe_eudebug_client_work_fn work,
 						     unsigned int flags,
diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 134f317668..55539638f0 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -60,73 +60,26 @@ static void test_sysfs_toggle(int fd)
 #define VM_BIND				(1 << 2)
 #define VM_BIND_VM_DESTROY		(1 << 3)
 #define VM_BIND_EXTENDED		(1 << 4)
-#define VM_METADATA			(1 << 5)
-#define VM_BIND_METADATA		(1 << 6)
-#define VM_BIND_OP_MAP_USERPTR		(1 << 7)
-#define VM_BIND_DELAY_UFENCE_ACK	(1 << 8)
-#define VM_BIND_UFENCE_RECONNECT	(1 << 9)
-#define VM_BIND_UFENCE_SIGINT_CLIENT	(1 << 10)
+#define VM_BIND_OP_MAP_USERPTR		(1 << 5)
+#define VM_BIND_DELAY_UFENCE_ACK	(1 << 6)
+#define VM_BIND_UFENCE_RECONNECT	(1 << 7)
+#define VM_BIND_UFENCE_SIGINT_CLIENT	(1 << 8)
 #define TEST_FAULTABLE			(1 << 30)
 #define TEST_DISCOVERY			(1 << 31)
 
 #define PAGE_SIZE SZ_4K
-#define MDATA_SIZE (WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM * PAGE_SIZE)
 
 #define BO_ADDR 0x1a0000
 
-static struct drm_xe_vm_bind_op_ext_attach_debug *
-basic_vm_bind_metadata_ext_prepare(int fd, struct xe_eudebug_client *c, uint8_t **data)
-{
-	const uint32_t data_size = MDATA_SIZE;
-	struct drm_xe_vm_bind_op_ext_attach_debug *ext;
-	int i;
-
-	*data = calloc(data_size, sizeof(**data));
-	igt_assert(*data);
-
-	for (i = 0; i < data_size; i++)
-		(*data)[i] = (i + i / PAGE_SIZE) % 256;
-
-	ext = calloc(WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM, sizeof(*ext));
-	igt_assert(ext);
-
-	for (i = 0; i < WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM; i++) {
-		ext[i].base.name = XE_VM_BIND_OP_EXTENSIONS_ATTACH_DEBUG;
-		ext[i].metadata_id = xe_eudebug_client_metadata_create(c, fd, i,
-								       (i + 1) * PAGE_SIZE, *data);
-		ext[i].cookie = i;
-
-		if (i < WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM - 1)
-			ext[i].base.next_extension = to_user_pointer(&ext[i + 1]);
-	}
-	return ext;
-}
-
-static void basic_vm_bind_metadata_ext_del(int fd, struct xe_eudebug_client *c,
-					   struct drm_xe_vm_bind_op_ext_attach_debug *ext,
-					   uint8_t *data)
-{
-	for (int i = 0; i < WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM; i++)
-		xe_eudebug_client_metadata_destroy(c, fd, ext[i].metadata_id, i,
-						   (i + 1) * PAGE_SIZE);
-	free(ext);
-	free(data);
-}
-
 static void basic_vm_bind_client(int fd, struct xe_eudebug_client *c)
 {
 	struct drm_xe_vm_bind_op_ext_attach_debug *ext = NULL;
 	uint32_t vm = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	size_t bo_size = xe_get_default_alignment(fd);
 	bool test_discovery = c->flags & TEST_DISCOVERY;
-	bool test_metadata = c->flags & VM_BIND_METADATA;
 	uint32_t bo = xe_bo_create(fd, 0, bo_size,
 				   system_memory(fd), 0);
 	uint64_t addr = 0x1a0000;
-	uint8_t *data = NULL;
-
-	if (test_metadata)
-		ext = basic_vm_bind_metadata_ext_prepare(fd, c, &data);
 
 	xe_eudebug_client_vm_bind_flags(c, fd, vm, bo, 0, addr,
 					bo_size, 0, NULL, 0, to_user_pointer(ext));
@@ -138,9 +91,6 @@ static void basic_vm_bind_client(int fd, struct xe_eudebug_client *c)
 
 	xe_eudebug_client_vm_unbind(c, fd, vm, 0, addr, bo_size);
 
-	if (test_metadata)
-		basic_vm_bind_metadata_ext_del(fd, c, ext, data);
-
 	gem_close(fd, bo);
 	xe_eudebug_client_vm_destroy(c, fd, vm);
 }
@@ -477,7 +427,7 @@ static void run_basic_client(struct xe_eudebug_client *c)
 		xe_eudebug_client_vm_destroy(c, fd, vm);
 	}
 
-	if (c->flags & VM_BIND || c->flags & VM_BIND_METADATA)
+	if (c->flags & VM_BIND)
 		basic_vm_bind_client(fd, c);
 
 	if (c->flags & VM_BIND_EXTENDED)
@@ -974,12 +924,6 @@ static void test_basic_sessions(int fd, unsigned int flags, int count, bool matc
  *	Attach the debugger to a process that performs vm-bind before attaching
  *	and check if the discovery process reports it.
  *
- * SUBTEST: basic-vm-bind-metadata-discovery
- * Functionality: VM bind metadata
- * Description:
- *	Attach the debugger to a process that performs vm-bind with metadata attached
- *	before attaching and check if the discovery process reports it.
- *
  * SUBTEST: basic-vm-bind-vm-destroy-discovery
  * Functionality: VM bind event
  * Description:
@@ -1789,140 +1733,6 @@ static void test_vm_access_parameters(int fd, unsigned int flags, int num_client
 					 XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE);
 }
 
-static void metadata_access_client(struct xe_eudebug_client *c)
-{
-	const uint64_t addr = 0x1a0000;
-	struct drm_xe_vm_bind_op_ext_attach_debug *ext;
-	uint8_t *data;
-	size_t bo_size;
-	uint32_t bo, vm;
-	int fd, i;
-
-	fd = xe_eudebug_client_open_driver(c);
-
-	bo_size = xe_get_default_alignment(fd);
-	vm = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
-	bo = xe_bo_create(fd, vm, bo_size, system_memory(fd), 0);
-
-	ext = basic_vm_bind_metadata_ext_prepare(fd, c, &data);
-
-	xe_eudebug_client_vm_bind_flags(c, fd, vm, bo, 0, addr,
-					bo_size, 0, NULL, 0, to_user_pointer(ext));
-
-	for (i = 0; i < WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM; i++)
-		xe_eudebug_client_wait_stage(c, i);
-
-	xe_eudebug_client_vm_unbind(c, fd, vm, 0, addr, bo_size);
-
-	basic_vm_bind_metadata_ext_del(fd, c, ext, data);
-
-	close(bo);
-	xe_eudebug_client_vm_destroy(c, fd, vm);
-
-	xe_eudebug_client_close_driver(c, fd);
-}
-
-static void debugger_test_metadata(struct xe_eudebug_debugger *d,
-				   uint64_t client_handle,
-				   uint64_t metadata_handle,
-				   uint64_t type,
-				   uint64_t len)
-{
-	struct drm_xe_eudebug_read_metadata rm = {
-		.client_handle = client_handle,
-		.metadata_handle = metadata_handle,
-		.size = len,
-	};
-	uint8_t *data;
-	int i;
-
-	data = malloc(len);
-	igt_assert(data);
-
-	rm.ptr = to_user_pointer(data);
-
-	igt_assert_eq(igt_ioctl(d->fd, DRM_XE_EUDEBUG_IOCTL_READ_METADATA, &rm), 0);
-
-	/* syntetic check, test sets different size per metadata type */
-	igt_assert_eq((type + 1) * PAGE_SIZE, rm.size);
-
-	for (i = 0; i < rm.size; i++)
-		igt_assert_eq(data[i], (i + i / PAGE_SIZE) % 256);
-
-	free(data);
-}
-
-static void metadata_read_trigger(struct xe_eudebug_debugger *d,
-				  struct drm_xe_eudebug_event *e)
-{
-	struct drm_xe_eudebug_event_metadata *em = (void *)e;
-
-	/* syntetic check, test sets different size per metadata type */
-	igt_assert_eq((em->type + 1) * PAGE_SIZE, em->len);
-
-	if (e->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
-		debugger_test_metadata(d, em->client_handle, em->metadata_handle,
-				       em->type, em->len);
-		xe_eudebug_debugger_signal_stage(d, em->type);
-	}
-}
-
-static void metadata_read_on_vm_bind_trigger(struct xe_eudebug_debugger *d,
-					     struct drm_xe_eudebug_event *e)
-{
-	struct drm_xe_eudebug_event_vm_bind_op_metadata *em = (void *)e;
-	struct drm_xe_eudebug_event_vm_bind_op *eo = (void *)e;
-	struct drm_xe_eudebug_event_vm_bind *eb;
-
-	/* For testing purpose client sets metadata_cookie = type */
-
-	/*
-	 * Metadata event has a reference to vm-bind-op event which has a reference
-	 * to vm-bind event which contains proper client-handle.
-	 */
-	eo = (struct drm_xe_eudebug_event_vm_bind_op *)
-		xe_eudebug_event_log_find_seqno(d->log, em->vm_bind_op_ref_seqno);
-	igt_assert(eo);
-	eb = (struct drm_xe_eudebug_event_vm_bind *)
-		xe_eudebug_event_log_find_seqno(d->log, eo->vm_bind_ref_seqno);
-	igt_assert(eb);
-
-	debugger_test_metadata(d,
-			       eb->client_handle,
-			       em->metadata_handle,
-			       em->metadata_cookie,
-			       MDATA_SIZE); /* max size */
-
-	xe_eudebug_debugger_signal_stage(d, em->metadata_cookie);
-}
-
-/**
- * SUBTEST: read-metadata
- * Functionality: metadata
- * Description:
- *      Exercise DRM_XE_EUDEBUG_IOCTL_READ_METADATA and debug metadata create|destroy events.
- */
-static void test_metadata_read(int fd, unsigned int flags, int num_clients)
-{
-	test_client_with_trigger(fd, flags, num_clients, metadata_access_client,
-				 DRM_XE_EUDEBUG_EVENT_METADATA, metadata_read_trigger,
-				 NULL, true, 0);
-}
-
-/**
- * SUBTEST: attach-debug-metadata
- * Functionality: metadata
- * Description:
- *      Read debug metadata when vm_bind has it attached.
- */
-static void test_metadata_attach(int fd, unsigned int flags, int num_clients)
-{
-	test_client_with_trigger(fd, flags, num_clients, metadata_access_client,
-				 DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA,
-				 metadata_read_on_vm_bind_trigger,
-				 NULL, true, 0);
-}
-
 #define STAGE_CLIENT_WAIT_ON_UFENCE_DONE 1337
 
 #define UFENCE_EVENT_COUNT_EXPECTED 4
@@ -2885,9 +2695,6 @@ int igt_main()
 	igt_subtest("basic-vm-bind-discovery")
 		test_basic_discovery(fd, VM_BIND, true);
 
-	igt_subtest("basic-vm-bind-metadata-discovery")
-		test_basic_discovery(fd, VM_BIND_METADATA, true);
-
 	igt_subtest("basic-vm-bind-vm-destroy")
 		test_basic_sessions(fd, VM_BIND_VM_DESTROY, 1, false);
 
@@ -2900,12 +2707,6 @@ int igt_main()
 	igt_subtest("basic-vm-bind-extended-discovery")
 		test_basic_discovery(fd, VM_BIND_EXTENDED, true);
 
-	igt_subtest("read-metadata")
-		test_metadata_read(fd, 0, 1);
-
-	igt_subtest("attach-debug-metadata")
-		test_metadata_attach(fd, 0, 1);
-
 	igt_subtest("discovery-race")
 		test_race_discovery(fd, 0, 4);
 
diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index e59b99ee99..9b1e010d2a 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -891,52 +891,6 @@ static void vm_open_trigger(struct xe_eudebug_debugger *d,
 	pthread_mutex_unlock(&data->mutex);
 }
 
-static void read_metadata(struct xe_eudebug_debugger *d,
-			  uint64_t client_handle,
-			  uint64_t metadata_handle,
-			  uint64_t type,
-			  uint64_t len)
-{
-	struct drm_xe_eudebug_read_metadata rm = {
-		.client_handle = client_handle,
-		.metadata_handle = metadata_handle,
-		.size = len,
-	};
-	struct online_debug_data *data = d->ptr;
-	uint64_t *metadata;
-
-	metadata = malloc(len);
-	igt_assert(metadata);
-
-	rm.ptr = to_user_pointer(metadata);
-	igt_assert_eq(igt_ioctl(d->fd, DRM_XE_EUDEBUG_IOCTL_READ_METADATA, &rm), 0);
-
-	pthread_mutex_lock(&data->mutex);
-	switch (type) {
-	case DRM_XE_DEBUG_METADATA_ELF_BINARY:
-		data->bb_offset = metadata[0];
-		data->bb_size = metadata[1];
-		break;
-	case DRM_XE_DEBUG_METADATA_PROGRAM_MODULE:
-		data->target_offset = metadata[0];
-		data->target_size = metadata[1];
-		break;
-	default:
-		break;
-	}
-	pthread_mutex_unlock(&data->mutex);
-
-	free(metadata);
-}
-
-static void create_metadata_trigger(struct xe_eudebug_debugger *d, struct drm_xe_eudebug_event *e)
-{
-	struct drm_xe_eudebug_event_metadata *em = (void *)e;
-
-	if (e->flags & DRM_XE_EUDEBUG_EVENT_CREATE)
-		read_metadata(d, em->client_handle, em->metadata_handle, em->type, em->len);
-}
-
 static void overwrite_immediate_value_in_common_target_write(int vm_fd, uint64_t offset,
 							     uint32_t old_val, uint32_t new_val)
 {
@@ -1114,18 +1068,11 @@ static void run_online_client(struct xe_eudebug_client *c)
 	struct dim_t s_dim;
 	struct timespec ts = { };
 	struct gpgpu_shader *sip, *shader;
-	uint32_t metadata_id[2];
-	uint64_t *metadata[2];
 	struct intel_bb *ibb;
 	struct intel_buf *buf;
 	uint32_t *ptr;
 	int fd, vm_flags;
 
-	metadata[0] = calloc(2, sizeof(**metadata));
-	metadata[1] = calloc(2, sizeof(**metadata));
-	igt_assert(metadata[0]);
-	igt_assert(metadata[1]);
-
 	fd = xe_eudebug_client_open_driver(c);
 
 	threads = data->thread_count;
@@ -1146,16 +1093,6 @@ static void run_online_client(struct xe_eudebug_client *c)
 
 	buf->addr.offset = target_offset;
 
-	metadata[0][0] = bb_offset;
-	metadata[0][1] = bb_size;
-	metadata[1][0] = target_offset;
-	metadata[1][1] = buf->size;
-	metadata_id[0] = xe_eudebug_client_metadata_create(c, fd, DRM_XE_DEBUG_METADATA_ELF_BINARY,
-							   2 * sizeof(**metadata), metadata[0]);
-	metadata_id[1] = xe_eudebug_client_metadata_create(c, fd,
-							   DRM_XE_DEBUG_METADATA_PROGRAM_MODULE,
-							   2 * sizeof(**metadata), metadata[1]);
-
 	vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
 	vm_flags |= c->flags & (SHADER_PAGEFAULT | FAULTABLE_VM) ?
 			DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
@@ -1209,12 +1146,6 @@ static void run_online_client(struct xe_eudebug_client *c)
 	xe_eudebug_client_exec_queue_destroy(c, fd, &create);
 	xe_eudebug_client_vm_destroy(c, fd, create.vm_id);
 
-	xe_eudebug_client_metadata_destroy(c, fd, metadata_id[0], DRM_XE_DEBUG_METADATA_ELF_BINARY,
-					   2 * sizeof(**metadata));
-	xe_eudebug_client_metadata_destroy(c, fd, metadata_id[1],
-					   DRM_XE_DEBUG_METADATA_PROGRAM_MODULE,
-					   2 * sizeof(**metadata));
-
 	intel_buf_destroy(buf);
 
 	xe_eudebug_client_close_driver(c, fd);
@@ -1587,8 +1518,6 @@ static void test_set_breakpoint_online(int fd, struct drm_xe_engine_class_instan
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 					exec_queue_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
-					create_metadata_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_set_bp_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
@@ -1652,8 +1581,6 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 						exec_queue_trigger);
 		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM,
 						vm_open_trigger);
-		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
-						create_metadata_trigger);
 		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 						ufence_ack_set_bp_trigger);
 		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
@@ -1780,8 +1707,6 @@ static void test_pagefault_online(int fd, struct drm_xe_engine_class_instance *h
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_resume_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
-					create_metadata_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_PAGEFAULT,
@@ -1919,8 +1844,6 @@ static void test_interrupt_all(int fd, struct drm_xe_engine_class_instance *hwe,
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_resume_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
-					create_metadata_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
 
@@ -2005,8 +1928,6 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 					exec_queue_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
-					create_metadata_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
 
@@ -2101,8 +2022,6 @@ static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *h
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_resume_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
-					create_metadata_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
 
@@ -2251,8 +2170,6 @@ static void test_interrupt_reconnect(int fd, struct drm_xe_engine_class_instance
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_debugger_detach_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
-					create_metadata_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
 
@@ -2328,8 +2245,6 @@ static void test_single_step(int fd, struct drm_xe_engine_class_instance *hwe, i
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_resume_single_step_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
-					create_metadata_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
 
@@ -2429,8 +2344,6 @@ static void test_caching(int fd, struct drm_xe_engine_class_instance *hwe, int f
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_resume_caching_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
-					create_metadata_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
 
-- 
2.43.0

