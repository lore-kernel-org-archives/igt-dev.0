Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901DCCD5BA0
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 09:29:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5162D10E816;
	Thu,  5 Sep 2024 09:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FVvsDd3G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C4D10E813
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 09:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725528546; x=1757064546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7+B7kX9wxrMd1BJGWB5zOEaZfN4PzqbNYrWKkEtynJ4=;
 b=FVvsDd3GFY2kJdqDPV7/at6kwnPtvJ0p+czKmjQO9/vRS+EmhJdHaAst
 +pDYn3q8M/g5RjMuP+/t7L9/CCdDvtuAEFcswO3AHvcSibBychR3b09qW
 CiioTM1UGhXiSzXnFn/gh5uRkQeNqEyT78gUy7p8V0wifrTEYh6eluFv9
 4gO+QYpgkQ0xGJfMA9Pzqy3FTMjyKEDih4ME2lY9t8kztdkwFgzQWZGOS
 CEAnKgHkHDntYyYb8j5JxwpstUoRAbGHq72pgK+LwhFifs5rlfVflVOAU
 N73rWA1Nsq16jh/5iZJrF2Obu8A4Uw/wCDOXn2Kv7c4N4Fyq2h7mmxEP7 w==;
X-CSE-ConnectionGUID: Y+x6KATpR7eL1yBWFqzuoA==
X-CSE-MsgGUID: oSTYYLOvSdeUWPSS5YJ7Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="35590277"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="35590277"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 02:29:06 -0700
X-CSE-ConnectionGUID: euPRHENoQXG3NIPR+L2JBA==
X-CSE-MsgGUID: VNlJ6KbSQ6a22Rm2n0N18g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="65404858"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.144])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 02:29:01 -0700
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
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v6 10/17] drm-uapi/xe: Sync with eudebug uapi
Date: Thu,  5 Sep 2024 11:28:05 +0200
Message-Id: <20240905092812.94553-11-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240905092812.94553-1-christoph.manszewski@intel.com>
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Align with kernel commit 09411c6ecbef ("drm/xe/eudebug: Add debug
metadata support for xe_eudebug") from:

https://gitlab.freedesktop.org/miku/kernel.git

which introduces most recent changes to the eudebug uapi.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 include/drm-uapi/xe_drm_eudebug.h | 341 ++++++++++++++++++++++++++++++
 1 file changed, 341 insertions(+)
 create mode 100644 include/drm-uapi/xe_drm_eudebug.h

diff --git a/include/drm-uapi/xe_drm_eudebug.h b/include/drm-uapi/xe_drm_eudebug.h
new file mode 100644
index 000000000..13c069e00
--- /dev/null
+++ b/include/drm-uapi/xe_drm_eudebug.h
@@ -0,0 +1,341 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_DRM_EUDEBUG_H_
+#define _XE_DRM_EUDEBUG_H_
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+/*
+ * The Xe EU debugger extends the uapi by both extending the api for the Xe device as well as
+ * adding an api to use with a separate debugger handle. Currently the KMD part adds the former to
+ * 'xe_drm.h' and the latter to 'xe_drm_eudebug.h'. Since the KMD part is not yet merged upstream,
+ * let's put all eudebug specific uapi here to keep the 'xe_drm.h' file synced with the upstream
+ * kernel.
+ */
+
+/* XXX: BEGIN section moved from xe_drm.h as temporary solution */
+#define DRM_XE_EUDEBUG_CONNECT		0x0c
+#define DRM_XE_DEBUG_METADATA_CREATE	0x0d
+#define DRM_XE_DEBUG_METADATA_DESTROY	0x0e
+
+/* ... */
+
+#define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect)
+#define DRM_IOCTL_XE_DEBUG_METADATA_CREATE	 DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEBUG_METADATA_CREATE, struct drm_xe_debug_metadata_create)
+#define DRM_IOCTL_XE_DEBUG_METADATA_DESTROY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_DEBUG_METADATA_DESTROY, struct drm_xe_debug_metadata_destroy)
+
+/* ... */
+
+struct drm_xe_vm_bind_op_ext_attach_debug {
+	/** @base: base user extension */
+	struct drm_xe_user_extension base;
+
+	/** @id: Debug object id from create metadata */
+	__u64 metadata_id;
+
+	/** @flags: Flags */
+	__u64 flags;
+
+	/** @cookie: Cookie */
+	__u64 cookie;
+
+	/** @reserved: Reserved */
+	__u64 reserved;
+};
+
+/* ... */
+
+#define XE_VM_BIND_OP_EXTENSIONS_ATTACH_DEBUG 0
+
+/* ... */
+
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		2
+#define     DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE		(1 << 0)
+
+/* ... */
+
+/*
+ * Debugger ABI (ioctl and events) Version History:
+ * 0 - No debugger available
+ * 1 - Initial version
+ */
+#define DRM_XE_EUDEBUG_VERSION 1
+
+struct drm_xe_eudebug_connect {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	__u64 pid; /* input: Target process ID */
+	__u32 flags; /* MBZ */
+
+	__u32 version; /* output: current ABI (ioctl / events) version */
+};
+
+/*
+ * struct drm_xe_debug_metadata_create - Create debug metadata
+ *
+ * Add a region of user memory to be marked as debug metadata.
+ * When the debugger attaches, the metadata regions will be delivered
+ * for debugger. Debugger can then map these regions to help decode
+ * the program state.
+ *
+ * Returns handle to created metadata entry.
+ */
+struct drm_xe_debug_metadata_create {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+#define DRM_XE_DEBUG_METADATA_ELF_BINARY     0
+#define DRM_XE_DEBUG_METADATA_PROGRAM_MODULE 1
+#define WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_MODULE_AREA 2
+#define WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_SBA_AREA 3
+#define WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_SIP_AREA 4
+#define WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM (1 + \
+	  WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_SIP_AREA)
+
+	/** @type: Type of metadata */
+	__u64 type;
+
+	/** @user_addr: pointer to start of the metadata */
+	__u64 user_addr;
+
+	/** @len: length, in bytes of the medata */
+	__u64 len;
+
+	/** @metadata_id: created metadata handle (out) */
+	__u32 metadata_id;
+};
+
+/**
+ * struct drm_xe_debug_metadata_destroy - Destroy debug metadata
+ *
+ * Destroy debug metadata.
+ */
+struct drm_xe_debug_metadata_destroy {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @metadata_id: metadata handle to destroy */
+	__u32 metadata_id;
+};
+
+/* XXX: END section moved from xe_drm.h as temporary solution */
+
+/**
+ * Do a eudebug event read for a debugger connection.
+ *
+ * This ioctl is available in debug version 1.
+ */
+#define DRM_XE_EUDEBUG_IOCTL_READ_EVENT		_IO('j', 0x0)
+#define DRM_XE_EUDEBUG_IOCTL_EU_CONTROL		_IOWR('j', 0x2, struct drm_xe_eudebug_eu_control)
+#define DRM_XE_EUDEBUG_IOCTL_ACK_EVENT		_IOW('j', 0x4, struct drm_xe_eudebug_ack_event)
+#define DRM_XE_EUDEBUG_IOCTL_VM_OPEN		_IOW('j', 0x1, struct drm_xe_eudebug_vm_open)
+#define DRM_XE_EUDEBUG_IOCTL_READ_METADATA	_IOWR('j', 0x3, struct drm_xe_eudebug_read_metadata)
+
+/* XXX: Document events to match their internal counterparts when moved to xe_drm.h */
+struct drm_xe_eudebug_event {
+	__u32 len;
+
+	__u16 type;
+#define DRM_XE_EUDEBUG_EVENT_NONE		0
+#define DRM_XE_EUDEBUG_EVENT_READ		1
+#define DRM_XE_EUDEBUG_EVENT_OPEN		2
+#define DRM_XE_EUDEBUG_EVENT_VM			3
+#define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		4
+#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	5
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND		6
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP		7
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	8
+#define DRM_XE_EUDEBUG_EVENT_METADATA		9
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA 10
+
+	__u16 flags;
+#define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
+#define DRM_XE_EUDEBUG_EVENT_DESTROY		(1 << 1)
+#define DRM_XE_EUDEBUG_EVENT_STATE_CHANGE	(1 << 2)
+#define DRM_XE_EUDEBUG_EVENT_NEED_ACK		(1 << 3)
+
+	__u64 seqno;
+	__u64 reserved;
+};
+
+struct drm_xe_eudebug_event_client {
+	struct drm_xe_eudebug_event base;
+
+	__u64 client_handle; /* This is unique per debug connection */
+};
+
+struct drm_xe_eudebug_event_vm {
+	struct drm_xe_eudebug_event base;
+
+	__u64 client_handle;
+	__u64 vm_handle;
+};
+
+struct drm_xe_eudebug_event_exec_queue {
+	struct drm_xe_eudebug_event base;
+
+	__u64 client_handle;
+	__u64 vm_handle;
+	__u64 exec_queue_handle;
+	__u32 engine_class;
+	__u32 width;
+	__u64 lrc_handle[];
+};
+
+struct drm_xe_eudebug_event_eu_attention {
+	struct drm_xe_eudebug_event base;
+
+	__u64 client_handle;
+	__u64 exec_queue_handle;
+	__u64 lrc_handle;
+	__u32 flags;
+	__u32 bitmask_size;
+	__u8 bitmask[];
+};
+
+struct drm_xe_eudebug_eu_control {
+	__u64 client_handle;
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
+/*
+ *  When client (debuggee) does vm_bind_ioctl() following event
+ *  sequence will be created (for the debugger):
+ *
+ *  ┌───────────────────────┐
+ *  │  EVENT_VM_BIND        ├───────┬─┬─┐
+ *  └───────────────────────┘       │ │ │
+ *      ┌───────────────────────┐   │ │ │
+ *      │ EVENT_VM_BIND_OP #1   ├───┘ │ │
+ *      └───────────────────────┘     │ │
+ *                 ...                │ │
+ *      ┌───────────────────────┐     │ │
+ *      │ EVENT_VM_BIND_OP #n   ├─────┘ │
+ *      └───────────────────────┘       │
+ *                                      │
+ *      ┌───────────────────────┐       │
+ *      │ EVENT_UFENCE          ├───────┘
+ *      └───────────────────────┘
+ *
+ * All the events below VM_BIND will reference the VM_BIND
+ * they associate with, by field .vm_bind_ref_seqno.
+ * event_ufence will only be included if the client did
+ * attach sync of type UFENCE into its vm_bind_ioctl().
+ *
+ * When EVENT_UFENCE is sent by the driver, all the OPs of
+ * the original VM_BIND are completed and the [addr,range]
+ * contained in them are present and modifiable through the
+ * vm accessors. Accessing [addr, range] before related ufence
+ * event will lead to undefined results as the actual bind
+ * operations are async and the backing storage might not
+ * be there on a moment of receiving the event.
+ *
+ * Client's UFENCE sync will be held by the driver: client's
+ * drm_xe_wait_ufence will not complete and the value of the ufence
+ * won't appear until ufence is acked by the debugger process calling
+ * DRM_XE_EUDEBUG_IOCTL_ACK_EVENT with the event_ufence.base.seqno.
+ * This will signal the fence, .value will update and the wait will
+ * complete allowing the client to continue.
+ *
+ */
+
+struct drm_xe_eudebug_event_vm_bind {
+	struct drm_xe_eudebug_event base;
+
+	__u64 client_handle;
+	__u64 vm_handle;
+
+	__u32 flags;
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_FLAG_UFENCE (1 << 0)
+
+	__u32 num_binds;
+};
+
+struct drm_xe_eudebug_event_vm_bind_op {
+	struct drm_xe_eudebug_event base;
+	__u64 vm_bind_ref_seqno; /* *_event_vm_bind.base.seqno */
+	__u64 num_extensions;
+
+	__u64 addr; /* XXX: Zero for unmap all? */
+	__u64 range; /* XXX: Zero for unmap all? */
+};
+
+struct drm_xe_eudebug_event_vm_bind_ufence {
+	struct drm_xe_eudebug_event base;
+	__u64 vm_bind_ref_seqno; /* *_event_vm_bind.base.seqno */
+};
+
+struct drm_xe_eudebug_ack_event {
+	__u32 type;
+	__u32 flags; /* MBZ */
+	__u64 seqno;
+};
+
+struct drm_xe_eudebug_vm_open {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @client_handle: id of client */
+	__u64 client_handle;
+
+	/** @vm_handle: id of vm */
+	__u64 vm_handle;
+
+	/** @flags: flags */
+	__u64 flags;
+
+	/** @timeout_ns: Timeout value in nanoseconds operations (fsync) */
+	__u64 timeout_ns;
+};
+
+struct drm_xe_eudebug_read_metadata {
+	__u64 client_handle;
+	__u64 metadata_handle;
+	__u32 flags;
+	__u32 reserved;
+	__u64 ptr;
+	__u64 size;
+};
+
+struct drm_xe_eudebug_event_metadata {
+	struct drm_xe_eudebug_event base;
+
+	__u64 client_handle;
+	__u64 metadata_handle;
+	/* XXX: Refer to xe_drm.h for fields */
+	__u64 type;
+	__u64 len;
+};
+
+struct drm_xe_eudebug_event_vm_bind_op_metadata {
+	struct drm_xe_eudebug_event base;
+	__u64 vm_bind_op_ref_seqno; /* *_event_vm_bind_op.base.seqno */
+
+	__u64 metadata_handle;
+	__u64 metadata_cookie;
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif
-- 
2.34.1

