Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E353FC3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:47:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4EC110E514;
	Tue, 30 Jul 2024 11:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HIwfeFNQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7750210E510
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340062; x=1753876062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z5wGY1eA/XZA/oJXC5jZaEdBuWQZvaBd17iQHlhVewA=;
 b=HIwfeFNQv4OmT8DsKj2xaENqOjx7aKzBLetJRv3duwN1FRnNWgkBSb1u
 pvPrHHzSy7uSTDHz6+WPbZd1MpZgqgXKLkI+mvUswCFTblwzRKlnHAW5p
 bCWWT2/OM8HkD6eIE2sq4fyC8y+fmzxjmVB5JpouQ81HUJa/6fYTK0+uz
 p7Q9PUjM6d9mog0qrk3RXIxrsM72B9qCs/+Q2JSDK0+1iKrwXMYvnEOI/
 dZIjbOCYaNP7L6f5CwqBJ66Fn/Aano9TVPp35Gd4TkOTE3IXqxOm2zUdA
 BNEQcGAjfnZM0fGrueBqqKA51ioosAHOQ1czYpx3Qu+4rPBsgr5Fx4gCN w==;
X-CSE-ConnectionGUID: yFsQFs0nSze16H0E8QyRfg==
X-CSE-MsgGUID: stkIS1RFS1S6H439UAYStA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937288"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937288"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:42 -0700
X-CSE-ConnectionGUID: pYGNplcJRA6D/r/YDbrzaQ==
X-CSE-MsgGUID: yGt6yEosSjKlacS8xFGt6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54216720"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:38 -0700
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
Subject: [PATCH i-g-t v2 20/66] tests/xe_eudebug: Exercise debug metadata
 events sent to debugger
Date: Tue, 30 Jul 2024 13:44:37 +0200
Message-Id: <20240730114523.334156-21-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
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

From: Maciej Patelczyk <maciej.patelczyk@intel.com>

Add tests which exercise setting debug metadata and correctness
of events received by currently attached debugger.

Extended the attach-debug-metadata so that it has multimple metadatas per
bind. (Maciej)

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug.c | 164 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index ce6c37c6d..577985ba7 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -27,6 +27,7 @@
 #define VM_BIND (1 << 2)
 #define VM_BIND_VM_DESTROY (1 << 3)
 #define VM_BIND_EXTENDED (1 << 4)
+#define VM_METADATA (1 << 5)
 
 static void basic_vm_bind_client(int fd, struct xe_eudebug_client *c)
 {
@@ -978,6 +979,163 @@ static void test_vm_access(int fd, unsigned int flags, int num_clients)
 					 false, XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP);
 }
 
+#define PAGE_SIZE 4096
+#define MDATA_SIZE (WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM * PAGE_SIZE)
+static void metadata_access_client(struct xe_eudebug_client *c)
+{
+	const uint64_t addr = 0x1a0000;
+	struct drm_xe_vm_bind_op_ext_attach_debug *ext;
+	uint8_t *data;
+	size_t bo_size;
+	uint32_t bo, vm;
+	int fd, i;
+
+	fd = xe_eudebug_client_open_driver(c);
+	xe_device_get(fd);
+
+	bo_size = xe_get_default_alignment(fd);
+	vm = xe_eudebug_client_vm_create(c, fd, 0, 0);
+	bo = xe_bo_create(fd, vm, bo_size, system_memory(fd), 0);
+
+	data = calloc(MDATA_SIZE, sizeof(*data));
+	igt_assert(data);
+
+	for (i = 0; i < MDATA_SIZE; i++)
+		data[i] = 0xff & (i + (i > PAGE_SIZE));
+
+	ext = calloc(WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_SIP_AREA + 1, sizeof(*ext));
+	igt_assert(ext);
+
+	for (i = 0; i < WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_SIP_AREA + 1; i++) {
+		ext[i].base.name = XE_VM_BIND_OP_EXTENSIONS_ATTACH_DEBUG;
+		ext[i].metadata_id = xe_eudebug_client_metadata_create(c, fd, i,
+								       (i + 1) * PAGE_SIZE, data);
+		ext[i].cookie = i;
+
+		if (i < WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_SIP_AREA)
+			ext[i].base.next_extension = to_user_pointer(&ext[i+1]);
+	}
+
+	xe_eudebug_client_vm_bind_flags(c, fd, vm, bo, 0, addr,
+					bo_size, 0, NULL, 0, to_user_pointer(ext));
+
+	for (i = 0; i < WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM; i++)
+		xe_eudebug_client_wait_stage(c, i);
+
+	xe_eudebug_client_vm_unbind(c, fd, vm, 0, addr, bo_size);
+
+	for (i = 0; i < WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_SIP_AREA + 1; i++)
+		xe_eudebug_client_metadata_destroy(c, fd, ext[i].metadata_id, i, (i + 1) * PAGE_SIZE);
+
+	close(bo);
+	xe_eudebug_client_vm_destroy(c, fd, vm);
+
+	xe_device_put(fd);
+	xe_eudebug_client_close_driver(c, fd);
+
+	free(data);
+	free(ext);
+}
+
+static void debugger_test_metadata(struct xe_eudebug_debugger *d,
+				   uint64_t client_handle,
+				   uint64_t metadata_handle,
+				   uint64_t type,
+				   uint64_t len)
+{
+	struct drm_xe_eudebug_read_metadata rm = {
+		.client_handle = client_handle,
+		.metadata_handle = metadata_handle,
+		.size = len,
+	};
+	uint8_t *data;
+	int i;
+
+	data = malloc(len);
+	igt_assert(data);
+
+	rm.ptr = to_user_pointer(data);
+
+	igt_assert_eq(igt_ioctl(d->fd, DRM_XE_EUDEBUG_IOCTL_READ_METADATA, &rm), 0);
+
+	/* syntetic check, test sets different size per metadata type */
+	igt_assert_eq((type + 1) * PAGE_SIZE, rm.size);
+
+	for (i = 0; i < rm.size; i++)
+		igt_assert_eq(data[i], 0xff & (i + (i > PAGE_SIZE)));
+
+	free(data);
+}
+
+static void metadata_read_trigger(struct xe_eudebug_debugger *d,
+				  struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_metadata *em = (void *)e;
+
+	/* syntetic check, test sets different size per metadata type */
+	igt_assert_eq((em->type + 1) * PAGE_SIZE, em->len);
+
+	if (e->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
+		debugger_test_metadata(d, em->client_handle, em->metadata_handle,
+				       em->type, em->len);
+		xe_eudebug_debugger_signal_stage(d, em->type);
+	}
+}
+
+static void metadata_read_on_vm_bind_trigger(struct xe_eudebug_debugger *d,
+					     struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_vm_bind_op_metadata *em = (void *)e;
+	struct drm_xe_eudebug_event_vm_bind_op *eo = (void *)e;
+	struct drm_xe_eudebug_event_vm_bind *eb;
+
+	/* For testing purpose client sets metadata_cookie = type */
+
+	/*
+	 * Metadata event has a reference to vm-bind-op event which has a reference
+	 * to vm-bind event which contains proper client-handle.
+	 */
+	eo = (struct drm_xe_eudebug_event_vm_bind_op *)
+		xe_eudebug_event_log_find_seqno(d->log, em->vm_bind_op_ref_seqno);
+	igt_assert(eo);
+	eb = (struct drm_xe_eudebug_event_vm_bind *)
+		xe_eudebug_event_log_find_seqno(d->log, eo->vm_bind_ref_seqno);
+	igt_assert(eb);
+
+	debugger_test_metadata(d,
+			       eb->client_handle,
+			       em->metadata_handle,
+			       em->metadata_cookie,
+			       MDATA_SIZE); /* max size */
+
+	xe_eudebug_debugger_signal_stage(d, em->metadata_cookie);
+}
+
+/**
+ * SUBTEST: read-metadata
+ * Description:
+ *      Exercise DRM_XE_EUDEBUG_IOCTL_READ_METADATA and debug metadata create|destroy events.
+ */
+static void test_metadata_read(int fd, unsigned int flags, int num_clients)
+{
+	test_client_with_trigger(fd, flags, num_clients, metadata_access_client,
+				 DRM_XE_EUDEBUG_EVENT_METADATA, metadata_read_trigger,
+				 NULL, true, 0);
+}
+
+/**
+ * SUBTEST: attach-debug-metadata
+ * Description:
+ *      Read debug metadata when vm_bind has it attached.
+ */
+static void test_metadata_attach(int fd, unsigned int flags, int num_clients)
+{
+	test_client_with_trigger(fd, flags, num_clients, metadata_access_client,
+				 DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA,
+				 metadata_read_on_vm_bind_trigger,
+				 NULL, true, 0);
+}
+
 igt_main
 {
 	int fd;
@@ -1019,6 +1177,12 @@ igt_main
 	igt_subtest("basic-vm-bind-extended")
 		test_basic_sessions(fd, VM_BIND_EXTENDED, 1, true);
 
+	igt_subtest("read-metadata")
+		test_metadata_read(fd, 0, 1);
+
+	igt_subtest("attach-debug-metadata")
+		test_metadata_attach(fd, 0, 1);
+
 	igt_subtest("discovery-race")
 		test_race_discovery(fd, 0, 4);
 
-- 
2.34.1

