Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6134FE7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 11:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B44910E3DE;
	Wed, 11 Dec 2024 11:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EIqn/6Ck";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58FA10E3DE
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 11:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733917269; x=1765453269;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EsyDaT6ZjMzDgl80x+T07oYK+Nt11sAAqLpWXXQ97Nk=;
 b=EIqn/6Ck9zeNjw2qVeFkRAPuW7fxnBQi6MMn0VYCnZo1cU3jETUjDMT3
 YcX2tZMLl/tZwciRIUqqZYuPOZTEF8JM6P7jc96ZHXmgXPH0lL06oymvw
 PJtfglnkgeeb7nimSPLkL4kxKcgZneizxkW4PkT8+KNfmH3BMMx1Bqxvd
 GayhwmEEMOZA4CWBt9kbuTPo87vCZRO1fouKWKxVeQnm0bKHNzu4Zj/+U
 RayRgejvp/SwXoi/qz6GbcySDkeKBGtvjy4vIKlxBBwIqQgGLaifuvKK6
 1WrPFf+WP28NiiQTBdJJ1/jT9oAiuvyQu16/7OfMzRLcRX2juQ7bpm5bZ A==;
X-CSE-ConnectionGUID: OYcuc+QaQT6Du52w6pqMQw==
X-CSE-MsgGUID: w2t/kbFKQbmC87FYq7yzug==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33625080"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="33625080"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 03:41:09 -0800
X-CSE-ConnectionGUID: 0trS7AohTl6eoQlOmHWJCA==
X-CSE-MsgGUID: pfceNo+WQe+anBiBun9CuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99856996"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO dgrzegor-mobl2..)
 ([10.245.244.142])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 03:40:58 -0800
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: andrzej.hajda@intel.com, Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 1/4] lib/xe_eudebug: Use igt_container_of instead of
 (void *) casting
Date: Wed, 11 Dec 2024 12:40:41 +0100
Message-Id: <20241211114044.210562-1-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
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

Replace all places in which we casted base to specific event via (void
*) casting with igt_container_of, as this is more errorless approach.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/xe/xe_eudebug.c | 81 ++++++++++++++++++++++++---------------------
 1 file changed, 43 insertions(+), 38 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 8f3bb2f1e..f2483028f 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -140,20 +140,20 @@ static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *bu
 {
 	switch (e->type) {
 	case DRM_XE_EUDEBUG_EVENT_OPEN: {
-		struct drm_xe_eudebug_event_client *ec = (void *)e;
+		struct drm_xe_eudebug_event_client *ec = igt_container_of(e, ec, base);
 
 		sprintf(buf, "handle=%llu", ec->client_handle);
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_VM: {
-		struct drm_xe_eudebug_event_vm *evm = (void *)e;
+		struct drm_xe_eudebug_event_vm *evm = igt_container_of(e, evm, base);
 
 		sprintf(buf, "client_handle=%llu, handle=%llu",
 			evm->client_handle, evm->vm_handle);
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE: {
-		struct drm_xe_eudebug_event_exec_queue *ee = (void *)e;
+		struct drm_xe_eudebug_event_exec_queue *ee = igt_container_of(e, ee, base);
 
 		sprintf(buf, "client_handle=%llu, vm_handle=%llu, "
 			"exec_queue_handle=%llu, engine_class=%d, exec_queue_width=%d",
@@ -162,7 +162,8 @@ static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *bu
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS: {
-		struct drm_xe_eudebug_event_exec_queue_placements *ee = (void *)e;
+		struct drm_xe_eudebug_event_exec_queue_placements *ee = igt_container_of(e, ee,
+											 base);
 		struct drm_xe_engine_class_instance *instances = (void *)(ee->instances);
 		int i, l;
 
@@ -182,7 +183,7 @@ static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *bu
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION: {
-		struct drm_xe_eudebug_event_eu_attention *ea = (void *)e;
+		struct drm_xe_eudebug_event_eu_attention *ea = igt_container_of(e, ea, base);
 
 		sprintf(buf, "client_handle=%llu, exec_queue_handle=%llu, "
 			"lrc_handle=%llu, bitmask_size=%d",
@@ -191,34 +192,34 @@ static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *bu
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
-		struct drm_xe_eudebug_event_vm_bind *evmb = (void *)e;
+		struct drm_xe_eudebug_event_vm_bind *evmb = igt_container_of(e, evmb, base);
 
 		sprintf(buf, "client_handle=%llu, vm_handle=%llu, flags=0x%x, num_binds=%u",
 			evmb->client_handle, evmb->vm_handle, evmb->flags, evmb->num_binds);
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
-		struct drm_xe_eudebug_event_vm_bind_op *op = (void *)e;
+		struct drm_xe_eudebug_event_vm_bind_op *op = igt_container_of(e, op, base);
 
 		sprintf(buf, "vm_bind_ref_seqno=%lld, addr=%016llx, range=%llu num_extensions=%llu",
 			op->vm_bind_ref_seqno, op->addr, op->range, op->num_extensions);
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE: {
-		struct drm_xe_eudebug_event_vm_bind_ufence *f = (void *)e;
+		struct drm_xe_eudebug_event_vm_bind_ufence *f = igt_container_of(e, f, base);
 
 		sprintf(buf, "vm_bind_ref_seqno=%lld", f->vm_bind_ref_seqno);
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_METADATA: {
-		struct drm_xe_eudebug_event_metadata *em = (void *)e;
+		struct drm_xe_eudebug_event_metadata *em = igt_container_of(e, em, base);
 
 		sprintf(buf, "client_handle=%llu, metadata_handle=%llu, type=%llu, len=%llu",
 			em->client_handle, em->metadata_handle, em->type, em->len);
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA: {
-		struct drm_xe_eudebug_event_vm_bind_op_metadata *op = (void *)e;
+		struct drm_xe_eudebug_event_vm_bind_op_metadata *op = igt_container_of(e, op, base);
 
 		sprintf(buf, "vm_bind_op_ref_seqno=%lld, metadata_handle=%llu, metadata_cookie=%llu",
 			op->vm_bind_op_ref_seqno, op->metadata_handle, op->metadata_cookie);
@@ -461,16 +462,18 @@ static int match_fields(struct drm_xe_eudebug_event *a, void *data)
 
 	switch (a->type) {
 	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE: {
-		struct drm_xe_eudebug_event_exec_queue *ae = (void *)a;
-		struct drm_xe_eudebug_event_exec_queue *be = (void *)b;
+		struct drm_xe_eudebug_event_exec_queue *ae = igt_container_of(a, ae, base);
+		struct drm_xe_eudebug_event_exec_queue *be = igt_container_of(b, be, base);
 
 		if (ae->engine_class == be->engine_class && ae->width == be->width)
 			ret = 1;
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS: {
-		struct drm_xe_eudebug_event_exec_queue_placements *ae = (void *)a;
-		struct drm_xe_eudebug_event_exec_queue_placements *be = (void *)b;
+		struct drm_xe_eudebug_event_exec_queue_placements *ae = igt_container_of(a, ae,
+											 base);
+		struct drm_xe_eudebug_event_exec_queue_placements *be = igt_container_of(b, be,
+											 base);
 
 		if (ae->num_placements == be->num_placements &&
 		    memcmp(ae->instances, be->instances,
@@ -480,16 +483,16 @@ static int match_fields(struct drm_xe_eudebug_event *a, void *data)
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
-		struct drm_xe_eudebug_event_vm_bind *ea = (void *)a;
-		struct drm_xe_eudebug_event_vm_bind *eb = (void *)b;
+		struct drm_xe_eudebug_event_vm_bind *ea = igt_container_of(a, ea, base);
+		struct drm_xe_eudebug_event_vm_bind *eb = igt_container_of(b, eb, base);
 
 		if (ea->num_binds == eb->num_binds)
 			ret = 1;
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
-		struct drm_xe_eudebug_event_vm_bind_op *ea = (void *)a;
-		struct drm_xe_eudebug_event_vm_bind_op *eb = (void *)b;
+		struct drm_xe_eudebug_event_vm_bind_op *ea = igt_container_of(a, ea, base);
+		struct drm_xe_eudebug_event_vm_bind_op *eb = igt_container_of(b, eb, base);
 
 		if (ea->addr == eb->addr && ea->range == eb->range &&
 		    ea->num_extensions == eb->num_extensions)
@@ -497,8 +500,8 @@ static int match_fields(struct drm_xe_eudebug_event *a, void *data)
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA: {
-		struct drm_xe_eudebug_event_vm_bind_op_metadata *ea = (void *)a;
-		struct drm_xe_eudebug_event_vm_bind_op_metadata *eb = (void *)b;
+		struct drm_xe_eudebug_event_vm_bind_op_metadata *ea = igt_container_of(a, ea, base);
+		struct drm_xe_eudebug_event_vm_bind_op_metadata *eb = igt_container_of(b, eb, base);
 
 		if (ea->metadata_handle == eb->metadata_handle &&
 		    ea->metadata_cookie == eb->metadata_cookie)
@@ -526,35 +529,36 @@ static int match_client_handle(struct drm_xe_eudebug_event *e, void *data)
 
 	switch (e->type) {
 	case DRM_XE_EUDEBUG_EVENT_OPEN: {
-		struct drm_xe_eudebug_event_client *client = (void *)e;
+		struct drm_xe_eudebug_event_client *client = igt_container_of(e, client, base);
 
 		if (client->client_handle == h)
 			return 1;
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_VM: {
-		struct drm_xe_eudebug_event_vm *vm = (void *)e;
+		struct drm_xe_eudebug_event_vm *vm = igt_container_of(e, vm, base);
 
 		if (vm->client_handle == h)
 			return 1;
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE: {
-		struct drm_xe_eudebug_event_exec_queue *ee = (void *)e;
+	struct drm_xe_eudebug_event_exec_queue *ee = igt_container_of(e, ee, base);
 
 		if (ee->client_handle == h)
 			return 1;
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS: {
-		struct drm_xe_eudebug_event_exec_queue_placements *ee = (void *)e;
+		struct drm_xe_eudebug_event_exec_queue_placements *ee = igt_container_of(e, ee,
+											 base);
 
 		if (ee->client_handle == h)
 			return 1;
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
-		struct drm_xe_eudebug_event_vm_bind *evmb = (void *)e;
+		struct drm_xe_eudebug_event_vm_bind *evmb = igt_container_of(e, evmb, base);
 
 		if (evmb->client_handle == h) {
 			*bind_seqno = evmb->base.seqno;
@@ -563,7 +567,7 @@ static int match_client_handle(struct drm_xe_eudebug_event *e, void *data)
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
-		struct drm_xe_eudebug_event_vm_bind_op *eo = (void *)e;
+		struct drm_xe_eudebug_event_vm_bind_op *eo = igt_container_of(e, eo, base);
 
 		if (eo->vm_bind_ref_seqno == *bind_seqno) {
 			*bind_op_seqno = eo->base.seqno;
@@ -572,7 +576,7 @@ static int match_client_handle(struct drm_xe_eudebug_event *e, void *data)
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE: {
-		struct drm_xe_eudebug_event_vm_bind_ufence *ef = (void *)e;
+		struct drm_xe_eudebug_event_vm_bind_ufence *ef = igt_container_of(e, ef, base);
 
 		if (ef->vm_bind_ref_seqno == *bind_seqno)
 			return 1;
@@ -580,14 +584,14 @@ static int match_client_handle(struct drm_xe_eudebug_event *e, void *data)
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_METADATA: {
-		struct drm_xe_eudebug_event_metadata *em = (void *)e;
+		struct drm_xe_eudebug_event_metadata *em = igt_container_of(e, em, base);
 
 		if (em->client_handle == h)
 			return 1;
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA: {
-		struct drm_xe_eudebug_event_vm_bind_op_metadata *eo = (void *)e;
+		struct drm_xe_eudebug_event_vm_bind_op_metadata *eo = igt_container_of(e, eo, base);
 
 		if (eo->vm_bind_op_ref_seqno == *bind_op_seqno)
 			return 1;
@@ -615,7 +619,7 @@ static int match_opposite_resource(struct drm_xe_eudebug_event *e, void *data)
 
 	switch (e->type) {
 	case DRM_XE_EUDEBUG_EVENT_OPEN: {
-		struct drm_xe_eudebug_event_client *client = (void *)e;
+		struct drm_xe_eudebug_event_client *client = igt_container_of(e, client, base);
 		struct drm_xe_eudebug_event_client *filter = data;
 
 		if (client->client_handle == filter->client_handle)
@@ -623,7 +627,7 @@ static int match_opposite_resource(struct drm_xe_eudebug_event *e, void *data)
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_VM: {
-		struct drm_xe_eudebug_event_vm *vm = (void *)e;
+		struct drm_xe_eudebug_event_vm *vm = igt_container_of(e, vm, base);
 		struct drm_xe_eudebug_event_vm *filter = data;
 
 		if (vm->vm_handle == filter->vm_handle)
@@ -631,7 +635,7 @@ static int match_opposite_resource(struct drm_xe_eudebug_event *e, void *data)
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE: {
-		struct drm_xe_eudebug_event_exec_queue *ee = (void *)e;
+		struct drm_xe_eudebug_event_exec_queue *ee = igt_container_of(e, ee, base);
 		struct drm_xe_eudebug_event_exec_queue *filter = data;
 
 		if (ee->exec_queue_handle == filter->exec_queue_handle)
@@ -639,7 +643,7 @@ static int match_opposite_resource(struct drm_xe_eudebug_event *e, void *data)
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
-		struct drm_xe_eudebug_event_vm_bind *evmb = (void *)e;
+		struct drm_xe_eudebug_event_vm_bind *evmb = igt_container_of(e, evmb, base);
 		struct drm_xe_eudebug_event_vm_bind *filter = data;
 
 		if (evmb->vm_handle == filter->vm_handle &&
@@ -648,7 +652,7 @@ static int match_opposite_resource(struct drm_xe_eudebug_event *e, void *data)
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
-		struct drm_xe_eudebug_event_vm_bind_op *avmb = (void *)e;
+		struct drm_xe_eudebug_event_vm_bind_op *avmb = igt_container_of(e, avmb, base);
 		struct drm_xe_eudebug_event_vm_bind_op *filter = data;
 
 		if (avmb->addr == filter->addr &&
@@ -657,7 +661,7 @@ static int match_opposite_resource(struct drm_xe_eudebug_event *e, void *data)
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_METADATA: {
-		struct drm_xe_eudebug_event_metadata *em = (void *)e;
+		struct drm_xe_eudebug_event_metadata *em = igt_container_of(e, em, base);
 		struct drm_xe_eudebug_event_metadata *filter = data;
 
 		if (em->metadata_handle == filter->metadata_handle)
@@ -665,7 +669,8 @@ static int match_opposite_resource(struct drm_xe_eudebug_event *e, void *data)
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA: {
-		struct drm_xe_eudebug_event_vm_bind_op_metadata *avmb = (void *)e;
+		struct drm_xe_eudebug_event_vm_bind_op_metadata *avmb = igt_container_of(e, avmb,
+											 base);
 		struct drm_xe_eudebug_event_vm_bind_op_metadata *filter = data;
 
 		if (avmb->metadata_handle == filter->metadata_handle &&
@@ -760,8 +765,8 @@ static void compare_client(struct xe_eudebug_event_log *log1, struct drm_xe_eude
 			   struct xe_eudebug_event_log *log2, struct drm_xe_eudebug_event *ev2,
 			   uint32_t filter)
 {
-	struct drm_xe_eudebug_event_client *ev1_client = (void *)ev1;
-	struct drm_xe_eudebug_event_client *ev2_client = (void *)ev2;
+	struct drm_xe_eudebug_event_client *ev1_client = igt_container_of(ev1, ev1_client, base);
+	struct drm_xe_eudebug_event_client *ev2_client = igt_container_of(ev2, ev2_client, base);
 	uint64_t cbs = 0, dbs = 0, cbso = 0, dbso = 0;
 
 	struct igt_list_head matched_seqno_list;
-- 
2.34.1

