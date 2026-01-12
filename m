Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EFDC9EC88
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 13:01:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A8010E3CE;
	Mon, 12 Jan 2026 13:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLlQ7iKy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ACF210E3C8
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 13:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768222866; x=1799758866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VJfeSd+BFdp7JwawJfzT/tCrfLriZfwJ/VkIzorGzG4=;
 b=iLlQ7iKy3NjWmmZBACvT9m5KMNRevoZiBdsUIQisJISw8a/RvTum18Xz
 vTJAPZPYirBhfU+eC85K4dU5JPjdVnNDtt6TevQGR89LGUeCw0t+eqyG3
 jTTcdjF/pHLLkxABRPvpXwimeXCMMVLboLYoBGRoS4NpWQuG7L76NQ3hK
 EH/ddGbzF5C4aQ/C8B1l5ZfWfZWZUX4/XU6FJXSTiX5/l7j8pEqLGa/3z
 MBOTDaGHIdAgAr2ie0/qoRPYpY0XGmJnQPISlLX+BDVGKumXzCdCtWqBo
 IzsfUZKEOvA8UWjRYj7hl5J/N65HEvxBk0Mn1Y0BielOQAIPpZZdHaESX w==;
X-CSE-ConnectionGUID: LQ3ARMXrT9mztvhnmG72tw==
X-CSE-MsgGUID: fCSRznDDT9GqSimBDpiLQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69545600"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69545600"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:01:05 -0800
X-CSE-ConnectionGUID: aFBO0+jxRTmRMVO6lxOSwg==
X-CSE-MsgGUID: 2VUNGMyRRriNk4uHgkCl6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204095076"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:01:03 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 17/21] tests/xe_eudebug_online: Adapt set-breakpoint
 test to work with new vm bind event interface
Date: Mon, 12 Jan 2026 15:00:03 +0200
Message-ID: <20260112130008.1649357-18-mika.kuoppala@linux.intel.com>
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

Metadata used to be a standalone kernel resource created with a dedicated
ioctl and carried a binary blob as payload. The set-breakpoint testcase
relies on metadata resource creation events for bb ppgtt address and size
passing.

After rework the (now called) debug data can only be passed to the debugger
by mapping it to a vm. Convert the test to use this new interface.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 tests/intel/xe_eudebug_online.c | 37 +++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 34a8ff26e9..a9fa150114 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -875,6 +875,32 @@ static void vm_open_trigger(struct xe_eudebug_debugger *d,
 	pthread_mutex_unlock(&data->mutex);
 }
 
+static void online_debug_data_trigger(struct xe_eudebug_debugger *d, struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_vm_bind_op_debug_data *ed = (void *)e;
+	struct online_debug_data *data = d->ptr;
+
+	if (!(e->flags & DRM_XE_EUDEBUG_EVENT_CREATE))
+		return;
+
+	igt_assert(ed->flags & DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO);
+
+	pthread_mutex_lock(&data->mutex);
+	switch (ed->pseudopath) {
+	case DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_SBA_AREA:
+		data->bb_offset = ed->addr;
+		data->bb_size = ed->range;
+		break;
+	case DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_MODULE_AREA:
+		data->target_offset = ed->addr;
+		data->target_size = ed->range;
+		break;
+	default:
+		break;
+	}
+	pthread_mutex_unlock(&data->mutex);
+}
+
 static void overwrite_immediate_value_in_common_target_write(int vm_fd, uint64_t offset,
 							     uint32_t old_val, uint32_t new_val)
 {
@@ -1081,6 +1107,13 @@ static void run_online_client(struct xe_eudebug_client *c)
 
 	create.vm_id = xe_eudebug_client_vm_create(c, vm_flags, 0);
 
+	xe_eudebug_client_vm_bind_debug_data_add(c, create.vm_id, 0, bb_offset, bb_size,
+						 DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_SBA_AREA,
+						 NULL, NULL, 0);
+	xe_eudebug_client_vm_bind_debug_data_add(c, create.vm_id, 0, target_offset, buf->size,
+						 DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_MODULE_AREA,
+						 NULL, NULL, 0);
+
 	xe_eudebug_client_exec_queue_create(c, &create);
 
 	ibb = xe_bb_create_on_offset(c->fd,
@@ -1126,6 +1159,8 @@ static void run_online_client(struct xe_eudebug_client *c)
 	intel_bb_destroy(ibb);
 
 	xe_eudebug_client_exec_queue_destroy(c, &create);
+	xe_eudebug_client_vm_bind_debug_data_remove(c, create.vm_id, bb_offset, bb_size);
+	xe_eudebug_client_vm_bind_debug_data_remove(c, create.vm_id, target_offset, buf->size);
 	xe_eudebug_client_vm_destroy(c, create.vm_id);
 
 	intel_buf_destroy(buf);
@@ -1493,6 +1528,8 @@ static void test_set_breakpoint_online(int fd, struct drm_xe_engine_class_instan
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 					exec_queue_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
+	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA,
+					online_debug_data_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_set_bp_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
-- 
2.43.0

