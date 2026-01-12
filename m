Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C979C9EC88
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 13:01:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87D910E3C5;
	Mon, 12 Jan 2026 13:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eBU/SAQT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6520E10E3CB
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 13:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768222876; x=1799758876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WjWfkIOn+cwapkOJIKgB+/iIl1s2ysOi9dMywUgzobE=;
 b=eBU/SAQTX/0YBBh7sJjnQkB5Ps6sXNjwOO4tyn8RH6n8WxqH8XV/N7QQ
 EHQC53MXj+bj5t8z6Y2sJPWNR294pOCYXroz1sIbdOjH2o8Ol0dPqygKX
 gxeK0Q849tPAAc/Q6kPqDDIpR5bK765MLY5xZmy/1AspnrdkMUiOXNVPq
 6vK2Z8imeLjC7lA+g4qq/Gk69y9Jk9tbivS+ZbjPIlSRVTtVQ+h1MoqQr
 wqsMMkwJM+kklrKIYUWqPyRmYMFKnTnCA0Eq0jcvgzDk13/LMuBHN9hri
 W1t+aLYqFHOCjXxf9QpDdkOFAp2XDD3g54YysUsLWCFuA0Ae2IXtZ5q1O A==;
X-CSE-ConnectionGUID: 2E803TkiSISodSFk6r47SA==
X-CSE-MsgGUID: RAuZIstmQ3WJpJooznonpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69545628"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69545628"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:01:15 -0800
X-CSE-ConnectionGUID: aDIThbxnR4CdWnP0NZGPFA==
X-CSE-MsgGUID: HG3epLnmRymwzB9jPn7poQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204095114"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:01:13 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 21/21] eudebug: Update xe_drm_eudebug.h uapi
Date: Mon, 12 Jan 2026 15:00:07 +0200
Message-ID: <20260112130008.1649357-22-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
References: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Take into account bind event member naming change from
num_binds to num_bind_ops. Also documentation and ordering
changes for eudebug uapi.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 .../drm-uapi-experimental/xe_drm_eudebug.h    | 155 ++++++++++--------
 lib/xe/xe_eudebug.c                           |  14 +-
 2 files changed, 98 insertions(+), 71 deletions(-)

diff --git a/include/drm-uapi-experimental/xe_drm_eudebug.h b/include/drm-uapi-experimental/xe_drm_eudebug.h
index 43b8d12b47..56a2f6aac9 100644
--- a/include/drm-uapi-experimental/xe_drm_eudebug.h
+++ b/include/drm-uapi-experimental/xe_drm_eudebug.h
@@ -55,12 +55,34 @@ struct drm_xe_eudebug_connect {
  * This ioctl is available in debug version 1.
  */
 #define DRM_XE_EUDEBUG_IOCTL_READ_EVENT		_IO('j', 0x0)
-#define DRM_XE_EUDEBUG_IOCTL_EU_CONTROL		_IOWR('j', 0x2, struct drm_xe_eudebug_eu_control)
-#define DRM_XE_EUDEBUG_IOCTL_ACK_EVENT		_IOW('j', 0x4, struct drm_xe_eudebug_ack_event)
-#define DRM_XE_EUDEBUG_IOCTL_VM_OPEN		_IOW('j', 0x1, struct drm_xe_eudebug_vm_open)
-#define DRM_XE_EUDEBUG_IOCTL_READ_METADATA	_IOWR('j', 0x3, struct drm_xe_eudebug_read_metadata)
+#define DRM_XE_EUDEBUG_IOCTL_ACK_EVENT		_IOW('j', 0x1, struct drm_xe_eudebug_ack_event)
+#define DRM_XE_EUDEBUG_IOCTL_VM_OPEN		_IOW('j', 0x2, struct drm_xe_eudebug_vm_open)
+#define DRM_XE_EUDEBUG_IOCTL_EU_CONTROL		_IOWR('j', 0x3, struct drm_xe_eudebug_eu_control)
 
-/* XXX: Document events to match their internal counterparts when moved to xe_drm.h */
+/**
+ * struct drm_xe_eudebug_event - Base type of event delivered by xe_eudebug.
+ * @len: Length of event, including the base, of event.
+ * @type: Event type
+ * @flags: Flags for the event
+ * @seqno: Sequence number
+ * @reserved: MBZ
+ *
+ * Base event for xe_eudebug interface. To initiate a read, type
+ * needs to be set to DRM_XE_EUDEBUG_EVENT_READ and length
+ * need to be set by userspace to what has been allocated as max.
+ * On successful return the event len will be deliver or -EMSGSIZE
+ * if it does not fit. Seqno can be used to form a timeline
+ * as event delivery order does not guarantee event creation
+ * order.
+ *
+ * flags will indicate if resource was created, destroyed
+ * or its state changed.
+ *
+ * if DRM_XE_EUDEBUG_EVENT_NEED_ACK is set, the xe_eudebug
+ * will held the said resource until it is acked by userspace
+ * using another acking ioctl with the seqno of said event.
+ *
+ */
 struct drm_xe_eudebug_event {
 	__u32 len;
 
@@ -85,6 +107,12 @@ struct drm_xe_eudebug_event {
 	__u64 reserved;
 };
 
+/**
+ * struct drm_xe_eudebug_event_vm - VM resource event
+ * @vm_handle: Handle of a vm that was created/destroyed
+ *
+ * Resource creation/destruction event for a VM.
+ */
 struct drm_xe_eudebug_event_vm {
 	struct drm_xe_eudebug_event base;
 
@@ -101,55 +129,29 @@ struct drm_xe_eudebug_event_exec_queue {
 	__u64 lrc_handle[];
 };
 
-struct drm_xe_eudebug_event_eu_attention {
-	struct drm_xe_eudebug_event base;
-
-	__u64 exec_queue_handle;
-	__u64 lrc_handle;
-	__u32 flags;
-	__u32 bitmask_size;
-	__u8 bitmask[];
-};
-
-struct drm_xe_eudebug_eu_control {
-
-#define DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL	0
-#define DRM_XE_EUDEBUG_EU_CONTROL_CMD_STOPPED		1
-#define DRM_XE_EUDEBUG_EU_CONTROL_CMD_RESUME		2
-	__u32 cmd;
-	__u32 flags;
-
-	__u64 seqno;
-
-	__u64 exec_queue_handle;
-	__u64 lrc_handle;
-	__u32 reserved;
-	__u32 bitmask_size;
-	__u64 bitmask_ptr;
-};
-
 /*
- *  When client (debuggee) does vm_bind_ioctl() following event
- *  sequence will be created (for the debugger):
+ * When the client (debuggee) calls the vm_bind_ioctl with the
+ * DRM_XE_VM_BIND_OP_[ADD|REMOVE]_DEBUG_DATA operation, the following event
+ * sequence will be created (for the debugger):
  *
  *  ┌───────────────────────┐
- *  │  EVENT_VM_BIND        ├───────┬─┬─┐
- *  └───────────────────────┘       │ │ │
- *      ┌───────────────────────┐   │ │ │
- *      │ EVENT_VM_BIND_OP #1   ├───┘ │ │
- *      └───────────────────────┘     │ │
- *                 ...                │ │
- *      ┌───────────────────────┐     │ │
- *      │ EVENT_VM_BIND_OP #n   ├─────┘ │
- *      └───────────────────────┘       │
- *                                      │
- *      ┌───────────────────────┐       │
- *      │ EVENT_UFENCE          ├───────┘
- *      └───────────────────────┘
+ *  │  EVENT_VM_BIND        ├──────────────────┬─┬┄┐
+ *  └───────────────────────┘                  │ │ ┊
+ *      ┌──────────────────────────────────┐   │ │ ┊
+ *      │ EVENT_VM_BIND_OP_DEBUG_DATA #1   ├───┘ │ ┊
+ *      └──────────────────────────────────┘     │ ┊
+ *                      ...                      │ ┊
+ *      ┌──────────────────────────────────┐     │ ┊
+ *      │ EVENT_VM_BIND_OP_DEBUG_DATA #n   ├─────┘ ┊
+ *      └──────────────────────────────────┘       ┊
+ *                                                 ┊
+ *      ┌┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┐       ┊
+ *      ┊ EVENT_UFENCE                     ├┄┄┄┄┄┄┄┘
+ *      └┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┘
  *
  * All the events below VM_BIND will reference the VM_BIND
  * they associate with, by field .vm_bind_ref_seqno.
- * event_ufence will only be included if the client did
+ * EVENT_UFENCE will only be included if the client did
  * attach sync of type UFENCE into its vm_bind_ioctl().
  *
  * When EVENT_UFENCE is sent by the driver, all the OPs of
@@ -173,27 +175,26 @@ struct drm_xe_eudebug_event_vm_bind {
 	struct drm_xe_eudebug_event base;
 
 	__u64 vm_handle;
-
 	__u32 flags;
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_FLAG_UFENCE (1 << 0)
 
-	__u32 num_binds;
+	__u32 num_bind_ops;
 };
 
 struct drm_xe_eudebug_event_vm_bind_op_debug_data {
-        struct drm_xe_eudebug_event base;
-        __u64 vm_bind_ref_seqno; /* *_event_vm_bind.base.seqno */
-        __u64 num_extensions;
-
-        __u64 addr;
-        __u64 range;
-        __u64 flags;
-        __u32 offset;
-        __u32 reserved;
-        union {
-                __u64 pseudopath;
-                char pathname[PATH_MAX];
-        };
+	struct drm_xe_eudebug_event base;
+	__u64 vm_bind_ref_seqno; /* *_event_vm_bind.base.seqno */
+	__u64 num_extensions;
+
+	__u64 addr;
+	__u64 range;
+	__u64 flags;
+	__u32 offset;
+	__u32 reserved;
+	union {
+		__u64 pseudopath;
+		char pathname[PATH_MAX];
+	};
 };
 
 struct drm_xe_eudebug_event_vm_bind_ufence {
@@ -217,11 +218,37 @@ struct drm_xe_eudebug_vm_open {
 	/** @flags: flags */
 	__u64 flags;
 
-#define DRM_XE_EUDEBUG_VM_SYNC_MAX_TIMEOUT_NSECS (10ULL * NSEC_PER_SEC)
 	/** @timeout_ns: Timeout value in nanoseconds operations (fsync) */
 	__u64 timeout_ns;
 };
 
+struct drm_xe_eudebug_eu_control {
+
+#define DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL	0
+#define DRM_XE_EUDEBUG_EU_CONTROL_CMD_STOPPED		1
+#define DRM_XE_EUDEBUG_EU_CONTROL_CMD_RESUME		2
+	__u32 cmd;
+	__u32 flags;
+
+	__u64 seqno;
+
+	__u64 exec_queue_handle;
+	__u64 lrc_handle;
+	__u32 reserved;
+	__u32 bitmask_size;
+	__u64 bitmask_ptr;
+};
+
+struct drm_xe_eudebug_event_eu_attention {
+	struct drm_xe_eudebug_event base;
+
+	__u64 exec_queue_handle;
+	__u64 lrc_handle;
+	__u32 flags;
+	__u32 bitmask_size;
+	__u8 bitmask[];
+};
+
 struct drm_xe_eudebug_event_pagefault {
 	struct drm_xe_eudebug_event base;
 
diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 7c1ac38d9c..1e3cdfe048 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -146,8 +146,8 @@ static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *bu
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
 		struct drm_xe_eudebug_event_vm_bind *evmb = igt_container_of(e, evmb, base);
 
-		sprintf(buf, "vm_handle=%llu, flags=0x%x, num_binds=%u",
-			evmb->vm_handle, evmb->flags, evmb->num_binds);
+		sprintf(buf, "vm_handle=%llu, flags=0x%x, num_bind_ops=%u",
+			evmb->vm_handle, evmb->flags, evmb->num_bind_ops);
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA: {
@@ -596,7 +596,7 @@ static int match_fields(struct drm_xe_eudebug_event *a, void *data)
 		struct drm_xe_eudebug_event_vm_bind *ea = igt_container_of(a, ea, base);
 		struct drm_xe_eudebug_event_vm_bind *eb = igt_container_of(b, eb, base);
 
-		if (ea->num_binds == eb->num_binds)
+		if (ea->num_bind_ops == eb->num_bind_ops)
 			ret = 1;
 		break;
 	}
@@ -699,7 +699,7 @@ static int match_opposite_resource(struct drm_xe_eudebug_event *e, void *data)
 		struct drm_xe_eudebug_event_vm_bind *filter = data;
 
 		if (evmb->vm_handle == filter->vm_handle &&
-		    evmb->num_binds == filter->num_binds)
+		    evmb->num_bind_ops == filter->num_bind_ops)
 			return 1;
 		break;
 	}
@@ -2077,14 +2077,14 @@ void xe_eudebug_client_exec_queue_destroy(struct xe_eudebug_client *c,
  * @event_flags: base event flags
  * @vm: vm handle
  * @bind_flags: bind flags of vm_bind_event
- * @num_binds: number of bind (operations) for event
+ * @num_binds_ops: number of bind (operations) for event
  * @ref_seqno: base vm bind reference seqno
  * Logs vm bind event in client's event log.
  */
 void xe_eudebug_client_vm_bind_event(struct xe_eudebug_client *c,
 				     uint32_t event_flags,
 				     uint32_t vm, uint32_t bind_flags,
-				     uint32_t num_binds, u64 *ref_seqno)
+				     uint32_t num_bind_ops, u64 *ref_seqno)
 {
 	struct drm_xe_eudebug_event_vm_bind evmb;
 
@@ -2095,7 +2095,7 @@ void xe_eudebug_client_vm_bind_event(struct xe_eudebug_client *c,
 		   event_flags, sizeof(evmb));
 	evmb.vm_handle = vm;
 	evmb.flags = bind_flags;
-	evmb.num_binds = num_binds;
+	evmb.num_bind_ops = num_bind_ops;
 
 	*ref_seqno = evmb.base.seqno;
 
-- 
2.43.0

