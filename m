Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC8EC3DA7E
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:47:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E59C10E514;
	Tue, 30 Jul 2024 11:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iwx5I7yu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0461710E513
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340026; x=1753876026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I4G9TchFogZIRRBCkf9kbiDmLRglF8HxHIw8RL9hs5M=;
 b=Iwx5I7yu77fErpudB8A6FrUdhDhpMqdsjzIuu2cKHstMxw7sTtnJrg6D
 cHTZjH2DuGUhrn7q63fxNRf8cBVkygA6p0A5VTPoKmeNEn24+Lsu1Er6h
 +IGGJTVc8eF6ruQVsCvNGe99op3CJ99I5IOpeYbpkPmdtZgSNK+da7MAi
 uKGN6IqRfZhnLNRgZGlFNOjdErLK78o6dzlsGcm95AXTAkwnFtTQvWjCy
 JGgBCQd1w88od7+P7CNmpOEJkUi6SGGlvb6CqL31rc16rnIHaJln+N//C
 XdqyvTH1pA90oNanxdWP12TkkxleGc9VUtRLltjl+2HnNVHqP7TbK0PoC w==;
X-CSE-ConnectionGUID: Y+2tb+UIT3ezDFOOVxWs7g==
X-CSE-MsgGUID: DnfQgx/0TsWRE3yfyJwKug==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937169"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937169"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:06 -0700
X-CSE-ConnectionGUID: f3fnmOB3ScymgaMKU9m8ww==
X-CSE-MsgGUID: DhWqPhP5RMiu8FNyBSeQhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54216479"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:02 -0700
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
Subject: [PATCH i-g-t v2 08/66] lib/xe_eudebug: Add support for vm_bind events
Date: Tue, 30 Jul 2024 13:44:25 +0200
Message-Id: <20240730114523.334156-9-christoph.manszewski@intel.com>
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

Add support for logging and filtering vm_bind events.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/xe/xe_eudebug.c | 488 +++++++++++++++++++++++++++++++++++++++++---
 lib/xe/xe_eudebug.h |  45 +++-
 2 files changed, 507 insertions(+), 26 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 8a57aaae3..2d1a7092c 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -11,6 +11,7 @@
 #include <sys/wait.h>
 
 #include "igt.h"
+#include "intel_pat.h"
 #include "xe_eudebug.h"
 #include "xe_ioctl.h"
 
@@ -29,6 +30,12 @@ struct match_dto {
 	struct drm_xe_eudebug_event *target;
 	struct igt_list_head *seqno_list;
 	uint64_t client_handle;
+	uint32_t filter;
+
+	/* store latest 'EVENT_VM_BIND' seqno */
+	uint64_t *bind_seqno;
+	/* latest vm_bind_op seqno matching bind_seqno */
+	uint64_t *bind_op_seqno;
 };
 
 #define CLIENT_PID  1
@@ -56,6 +63,12 @@ static const char *type_to_str(unsigned int type)
 		return "exec_queue";
 	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION:
 		return "attention";
+	case DRM_XE_EUDEBUG_EVENT_VM_BIND:
+		return "vm_bind";
+	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP:
+		return "vm_bind_op";
+	case DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE:
+		return "vm_bind_ufence";
 	}
 
 	return "UNKNOWN";
@@ -70,15 +83,20 @@ static const char *event_type_to_str(struct drm_xe_eudebug_event *e, char *buf)
 
 static const char *flags_to_str(unsigned int flags)
 {
-	if (flags & DRM_XE_EUDEBUG_EVENT_CREATE)
-		return "create";
-
+	if (flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
+		if (flags & DRM_XE_EUDEBUG_EVENT_NEED_ACK)
+			return "create|ack";
+		else
+			return "create";
+	}
 	if (flags & DRM_XE_EUDEBUG_EVENT_DESTROY)
 		return "destroy";
 
 	if (flags & DRM_XE_EUDEBUG_EVENT_STATE_CHANGE)
 		return "state-change";
 
+	igt_assert(!(flags & DRM_XE_EUDEBUG_EVENT_NEED_ACK));
+
 	return "flags unknown";
 }
 
@@ -116,6 +134,26 @@ static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *b)
 			ea->lrc_handle, ea->bitmask_size);
 		break;
 	}
+	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
+		struct drm_xe_eudebug_event_vm_bind *evmb = (void *)e;
+
+		sprintf(b, "client_handle=%llu, vm_handle=%llu, flags=0x%x, num_binds=%u",
+			evmb->client_handle, evmb->vm_handle, evmb->flags, evmb->num_binds);
+		break;
+	}
+	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
+		struct drm_xe_eudebug_event_vm_bind_op *op = (void *)e;
+
+		sprintf(b, "vm_bind_ref_seqno=%lld, addr=%016llx, range=%llu num_extensions=%llu",
+			op->vm_bind_ref_seqno, op->addr, op->range, op->num_extensions);
+		break;
+	}
+	case DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE: {
+		struct drm_xe_eudebug_event_vm_bind_ufence *f = (void *)e;
+
+		sprintf(b, "vm_bind_ref_seqno=%lld", f->vm_bind_ref_seqno);
+		break;
+	}
 	default:
 		strcpy(b, "<...>");
 	}
@@ -362,6 +400,23 @@ static int match_fields(struct drm_xe_eudebug_event *a, void *data)
 			ret = 1;
 		break;
 	}
+	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
+		struct drm_xe_eudebug_event_vm_bind *ea = (void *)a;
+		struct drm_xe_eudebug_event_vm_bind *eb = (void *)b;
+
+		if (ea->num_binds == eb->num_binds)
+			ret = 1;
+		break;
+	}
+	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
+		struct drm_xe_eudebug_event_vm_bind_op *ea = (void *)a;
+		struct drm_xe_eudebug_event_vm_bind_op *eb = (void *)b;
+
+		if (ea->addr == eb->addr && ea->range == eb->range &&
+		    ea->num_extensions == eb->num_extensions)
+			ret = 1;
+		break;
+	}
 	default:
 		ret = 1;
 		break;
@@ -372,7 +427,13 @@ static int match_fields(struct drm_xe_eudebug_event *a, void *data)
 
 static int match_client_handle(struct drm_xe_eudebug_event *e, void *data)
 {
-	uint64_t h = *(uint64_t *)data;
+	struct match_dto *md = (void *)data;
+	uint64_t *bind_seqno = md->bind_seqno;
+	uint64_t *bind_op_seqno = md->bind_op_seqno;
+	uint64_t h = md->client_handle;
+
+	if (XE_EUDEBUG_EVENT_IS_FILTERED(e->type, md->filter))
+		return 0;
 
 	switch (e->type) {
 	case DRM_XE_EUDEBUG_EVENT_OPEN: {
@@ -396,6 +457,32 @@ static int match_client_handle(struct drm_xe_eudebug_event *e, void *data)
 			return 1;
 		break;
 	}
+	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
+		struct drm_xe_eudebug_event_vm_bind *evmb = (struct drm_xe_eudebug_event_vm_bind *)e;
+
+		if (evmb->client_handle == h) {
+			*bind_seqno = evmb->base.seqno;
+			return 1;
+		}
+		break;
+	}
+	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
+		struct drm_xe_eudebug_event_vm_bind_op *eo = (struct drm_xe_eudebug_event_vm_bind_op *)e;
+
+		if (eo->vm_bind_ref_seqno == *bind_seqno) {
+			*bind_op_seqno = eo->base.seqno;
+			return 1;
+		}
+		break;
+	}
+	case DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE: {
+		struct drm_xe_eudebug_event_vm_bind_ufence *ef  = (struct drm_xe_eudebug_event_vm_bind_ufence *)e;
+
+		if (ef->vm_bind_ref_seqno == *bind_seqno)
+			return 1;
+
+		break;
+	}
 	default:
 		break;
 	}
@@ -410,6 +497,7 @@ static int match_opposite_resource(struct drm_xe_eudebug_event *e, void *data)
 	int ret;
 
 	d->flags ^= DRM_XE_EUDEBUG_EVENT_CREATE | DRM_XE_EUDEBUG_EVENT_DESTROY;
+	d->flags &= ~(DRM_XE_EUDEBUG_EVENT_NEED_ACK);
 	ret = match_type_and_flags(e, data);
 	d->flags ^= DRM_XE_EUDEBUG_EVENT_CREATE | DRM_XE_EUDEBUG_EVENT_DESTROY;
 
@@ -441,6 +529,24 @@ static int match_opposite_resource(struct drm_xe_eudebug_event *e, void *data)
 			return 1;
 		break;
 	}
+	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
+		struct drm_xe_eudebug_event_vm_bind *evmb = (void *)e;
+		struct drm_xe_eudebug_event_vm_bind *filter = (struct drm_xe_eudebug_event_vm_bind *)data;
+
+		if (evmb->vm_handle == filter->vm_handle &&
+		    evmb->num_binds == filter->num_binds)
+			return 1;
+		break;
+	}
+	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
+		struct drm_xe_eudebug_event_vm_bind_op *avmb = (void *)e;
+		struct drm_xe_eudebug_event_vm_bind_op *filter = (struct drm_xe_eudebug_event_vm_bind_op *)data;
+
+		if (avmb->addr == filter->addr &&
+		    avmb->range == filter->range)
+			return 1;
+		break;
+	}
 	default:
 		break;
 	}
@@ -454,7 +560,7 @@ static int match_full(struct drm_xe_eudebug_event *e, void *data)
 	struct match_dto *md = (void *)data;
 	int ret = 0;
 
-	ret = match_client_handle(e, &md->client_handle);
+	ret = match_client_handle(e, md);
 	if (!ret)
 		return 0;
 
@@ -472,51 +578,67 @@ static int match_full(struct drm_xe_eudebug_event *e, void *data)
 
 static struct drm_xe_eudebug_event *
 event_type_match(struct xe_eudebug_event_log *l,
-		 struct drm_xe_eudebug_event *filter,
+		 struct drm_xe_eudebug_event *target,
 		 struct drm_xe_eudebug_event *current)
 {
-	return event_cmp(l, current, match_type_and_flags, filter);
+	return event_cmp(l, current, match_type_and_flags, target);
 }
 
 static struct drm_xe_eudebug_event *
 client_match(struct xe_eudebug_event_log *l,
 	     uint64_t client_handle,
-	     struct drm_xe_eudebug_event *current)
+	     struct drm_xe_eudebug_event *current,
+	     uint32_t filter,
+	     uint64_t *bind_seqno,
+	     uint64_t *bind_op_seqno)
 {
-	return event_cmp(l, current, match_client_handle, &client_handle);
+	struct match_dto md = {
+		.client_handle = client_handle,
+		.filter = filter,
+		.bind_seqno = bind_seqno,
+		.bind_op_seqno = bind_op_seqno,
+	};
+
+	return event_cmp(l, current, match_client_handle, &md);
 }
 
 static struct drm_xe_eudebug_event *
 opposite_event_match(struct xe_eudebug_event_log *l,
-		    struct drm_xe_eudebug_event *filter,
+		    struct drm_xe_eudebug_event *target,
 		    struct drm_xe_eudebug_event *current)
 {
-	return event_cmp(l, current, match_opposite_resource, filter);
+	return event_cmp(l, current, match_opposite_resource, target);
 }
 
 static struct drm_xe_eudebug_event *
 event_match(struct xe_eudebug_event_log *l,
 	    struct drm_xe_eudebug_event *target,
 	    uint64_t client_handle,
-	    struct igt_list_head *seqno_list)
+	    struct igt_list_head *seqno_list,
+	    uint64_t *bind_seqno,
+	    uint64_t *bind_op_seqno)
 {
 	struct match_dto md = {
 		.target = target,
 		.client_handle = client_handle,
 		.seqno_list = seqno_list,
+		.bind_seqno = bind_seqno,
+		.bind_op_seqno = bind_op_seqno,
 	};
 
 	return event_cmp(l, NULL, match_full, &md);
 }
 
 static void compare_client(struct xe_eudebug_event_log *c, struct drm_xe_eudebug_event *_ce,
-			   struct xe_eudebug_event_log *d, struct drm_xe_eudebug_event *_de)
+			   struct xe_eudebug_event_log *d, struct drm_xe_eudebug_event *_de,
+			   uint32_t filter)
 {
 	struct drm_xe_eudebug_event_client *ce = (void *)_ce;
 	struct drm_xe_eudebug_event_client *de = (void *)_de;
-	struct drm_xe_eudebug_event *hc, *hd;
+	uint64_t cbs = 0, dbs = 0, cbso = 0, dbso = 0;
 
 	struct igt_list_head matched_seqno_list;
+	struct drm_xe_eudebug_event *hc, *hd;
 	struct seqno_list_entry *entry, *tmp;
 
 	igt_assert(ce);
@@ -529,11 +651,11 @@ static void compare_client(struct xe_eudebug_event_log *c, struct drm_xe_eudebug
 	IGT_INIT_LIST_HEAD(&matched_seqno_list);
 
 	do {
-		hc = client_match(c, ce->client_handle, hc);
+		hc = client_match(c, ce->client_handle, hc, filter, &cbs, &cbso);
 		if (!hc)
 			break;
 
-		hd = event_match(d, hc, de->client_handle, &matched_seqno_list);
+		hd = event_match(d, hc, de->client_handle, &matched_seqno_list, &dbs, &dbso);
 
 		igt_assert_f(hd, "%s (%llu): no matching event type %u found for client %llu\n",
 			     c->name,
@@ -720,11 +842,15 @@ xe_eudebug_event_log_print(struct xe_eudebug_event_log *l, bool debug)
  * xe_eudebug_event_log_compare:
  * @a: event log pointer
  * @b: event log pointer
+ * @filter: mask that represents events to be skipped during comparison, useful
+ * for events like 'VM_BIND' since they can be asymmetric. Note that
+ * 'DRM_XE_EUDEUBG_EVENT_OPEN' will always be matched.
  *
  * Compares and asserts event logs @a, @b if the event
  * sequence matches.
  */
-void xe_eudebug_event_log_compare(struct xe_eudebug_event_log *a, struct xe_eudebug_event_log *b)
+void xe_eudebug_event_log_compare(struct xe_eudebug_event_log *a, struct xe_eudebug_event_log *b,
+				  uint32_t filter)
 {
 	struct drm_xe_eudebug_event *ae = NULL;
 	struct drm_xe_eudebug_event *be = NULL;
@@ -734,8 +860,8 @@ void xe_eudebug_event_log_compare(struct xe_eudebug_event_log *a, struct xe_eude
 		    ae->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
 			be = event_type_match(b, ae, be);
 
-			compare_client(a, ae, b, be);
-			compare_client(b, be, a, ae);
+			compare_client(a, ae, b, be, filter);
+			compare_client(b, be, a, ae, filter);
 		}
 	}
 }
@@ -743,11 +869,13 @@ void xe_eudebug_event_log_compare(struct xe_eudebug_event_log *a, struct xe_eude
 /**
  * xe_eudebug_event_log_match_opposite:
  * @l: event log pointer
+ * @filter: mask that represents events to be skipped during comparison, useful
+ * for events like 'VM_BIND' since they can be asymmetric
  *
  * Matches and asserts content of all opposite events (create vs destroy).
  */
 void
-xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log *l)
+xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log *l, uint32_t filter)
 {
 	struct drm_xe_eudebug_event *ce = NULL;
 	struct drm_xe_eudebug_event *de = NULL;
@@ -757,6 +885,14 @@ xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log *l)
 			uint8_t offset = sizeof(struct drm_xe_eudebug_event);
 			int opposite_matching;
 
+			if (XE_EUDEBUG_EVENT_IS_FILTERED(ce->type, filter))
+				continue;
+
+			/* No opposite matching for binds */
+			if (ce->type >= DRM_XE_EUDEBUG_EVENT_VM_BIND &&
+			    ce->type <= DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE)
+				continue;
+
 			de = opposite_event_match(l, ce, ce);
 
 			igt_assert_f(de, "no opposite event of type %u found\n", ce->type);
@@ -1267,15 +1403,17 @@ void xe_eudebug_session_run(struct xe_eudebug_session *s)
  * @s: pointer to xe_eudebug_session structure
  * @match_opposite: indicates whether check should match all
  * create and destroy events.
+ * @filter: mask that represents events to be skipped during comparison, useful
+ * for events like 'VM_BIND' since they can be asymmetric
  *
  * Validate debugger's log against the log created by the client.
  */
-void xe_eudebug_session_check(struct xe_eudebug_session *s, bool match_opposite)
+void xe_eudebug_session_check(struct xe_eudebug_session *s, bool match_opposite, uint32_t filter)
 {
-	xe_eudebug_event_log_compare(s->c->log, s->d->log);
+	xe_eudebug_event_log_compare(s->c->log, s->d->log, filter);
 
 	if (match_opposite)
-		xe_eudebug_event_log_match_opposite(s->d->log);
+		xe_eudebug_event_log_match_opposite(s->d->log, filter);
 }
 
 /**
@@ -1467,3 +1605,307 @@ void xe_eudebug_client_exec_queue_destroy(struct xe_eudebug_client *c, int fd,
 
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, &destroy), 0);
 }
+
+/**
+ * xe_eudebug_client_vm_bind_event:
+ * @c: pointer to xe_eudebug_client structure
+ * @event_flags: base event flags
+ * @fd: xe client
+ * @vm: vm handle
+ * @bind_flags: bind flags of vm_bind_event
+ * @num_binds: number of bind (operations) for event
+ * @ref_seqno: base vm bind reference seqno
+ * Logs vm bind event in client's event log.
+ */
+void xe_eudebug_client_vm_bind_event(struct xe_eudebug_client *c,
+				     uint32_t event_flags, int fd,
+				     uint32_t vm, uint32_t bind_flags,
+				     uint32_t num_binds, u64 *ref_seqno)
+{
+	struct drm_xe_eudebug_event_vm_bind evmb;
+
+	base_event(c, to_base(evmb), DRM_XE_EUDEBUG_EVENT_VM_BIND,
+		   event_flags, sizeof(evmb));
+	evmb.client_handle = fd;
+	evmb.vm_handle = vm;
+	evmb.flags = bind_flags;
+	evmb.num_binds = num_binds;
+
+	*ref_seqno = evmb.base.seqno;
+
+	xe_eudebug_event_log_write(c->log, (void *)&evmb);
+}
+
+/**
+ * xe_eudebug_client_vm_bind_op_event:
+ * @c: pointer to xe_eudebug_client structure
+ * @event_flags: base event flags
+ * @bind_ref_seqno: base vm bind reference seqno
+ * @op_ref_seqno: output, the vm_bind_op event seqno
+ * @addr: ppgtt address
+ * @size: size of the binding
+ * @num_extensions: number of vm bind op extensions
+ *
+ * Logs vm bind op event in client's event log.
+ */
+void xe_eudebug_client_vm_bind_op_event(struct xe_eudebug_client *c, uint32_t event_flags,
+					uint64_t bind_ref_seqno, uint64_t *op_ref_seqno,
+					uint64_t addr, uint64_t range,
+					uint64_t num_extensions)
+{
+	struct drm_xe_eudebug_event_vm_bind_op op;
+
+	base_event(c, to_base(op), DRM_XE_EUDEBUG_EVENT_VM_BIND_OP,
+		   event_flags, sizeof(op));
+	op.vm_bind_ref_seqno = bind_ref_seqno;
+	op.addr = addr;
+	op.range = range;
+	op.num_extensions = num_extensions;
+
+	*op_ref_seqno = op.base.seqno;
+
+	xe_eudebug_event_log_write(c->log, (void *)&op);
+}
+
+/**
+ * xe_eudebug_client_vm_bind_op_metadata_event:
+ * @c: pointer to xe_eudebug_client structure
+ * @event_flags: base event flags
+ * @op_ref_seqno: base vm bind op reference seqno
+ * @metadata_handle: metadata handle
+ * @metadata_cookie: metadata cookie
+ *
+ * Logs vm bind op metadata event in client's event log.
+ */
+void xe_eudebug_client_vm_bind_op_metadata_event(struct xe_eudebug_client *c,
+						 uint32_t event_flags, uint64_t op_ref_seqno,
+						 uint64_t metadata_handle, uint64_t metadata_cookie)
+{
+	struct drm_xe_eudebug_event_vm_bind_op_metadata op;
+
+	base_event(c, to_base(op), DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA,
+		   event_flags, sizeof(op));
+	op.vm_bind_op_ref_seqno = op_ref_seqno;
+	op.metadata_handle = metadata_handle;
+	op.metadata_cookie = metadata_cookie;
+
+	xe_eudebug_event_log_write(c->log, (void *)&op);
+}
+
+/**
+ * xe_eudebug_client_vm_bind_ufence_event:
+ * @c: pointer to xe_eudebug_client structure
+ * @event_flags: base event flags
+ * @ref_seqno: base vm bind event seqno
+ *
+ * Logs vm bind ufence event in client's event log.
+ */
+void xe_eudebug_client_vm_bind_ufence_event(struct xe_eudebug_client *c, uint32_t event_flags,
+					    uint64_t ref_seqno)
+{
+	struct drm_xe_eudebug_event_vm_bind_ufence f;
+
+	base_event(c, to_base(f), DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+		   event_flags, sizeof(f));
+	f.vm_bind_ref_seqno = ref_seqno;
+
+	xe_eudebug_event_log_write(c->log, (void *)&f);
+}
+
+static bool has_user_fence(const struct drm_xe_sync *sync, uint32_t num_syncs)
+{
+	while (num_syncs--)
+		if (sync[num_syncs].type == DRM_XE_SYNC_TYPE_USER_FENCE)
+			return true;
+
+	return false;
+}
+
+#define for_each_metadata(__m, __ext)					\
+	for ((__m) = from_user_pointer(__ext);				\
+	     (__m);							\
+	     (__m) = from_user_pointer((__m)->base.next_extension))	\
+		if ((__m)->base.name == XE_VM_BIND_OP_EXTENSIONS_ATTACH_DEBUG)
+
+static int  __xe_eudebug_client_vm_bind(struct xe_eudebug_client *c,
+					int fd, uint32_t vm, uint32_t exec_queue,
+					uint32_t bo, uint64_t offset,
+					uint64_t addr, uint64_t size,
+					uint32_t op, uint32_t flags,
+					struct drm_xe_sync *sync,
+					uint32_t num_syncs,
+					uint32_t prefetch_region,
+					uint8_t pat_index, uint64_t op_ext)
+{
+	struct drm_xe_vm_bind_op_ext_attach_debug *metadata;
+	const bool ufence = has_user_fence(sync, num_syncs);
+	const uint32_t bind_flags = ufence ?
+		DRM_XE_EUDEBUG_EVENT_VM_BIND_FLAG_UFENCE : 0;
+	uint64_t seqno = 0, op_seqno = 0, num_metadata = 0;
+	uint32_t bind_base_flags = 0;
+	int ret;
+
+	for_each_metadata(metadata, op_ext)
+		num_metadata++;
+
+	switch (op) {
+	case DRM_XE_VM_BIND_OP_MAP:
+		bind_base_flags = DRM_XE_EUDEBUG_EVENT_CREATE;
+		break;
+	case DRM_XE_VM_BIND_OP_UNMAP:
+		bind_base_flags = DRM_XE_EUDEBUG_EVENT_DESTROY;
+		igt_assert_eq(num_metadata, 0);
+		igt_assert_eq(ufence, false);
+		break;
+	default:
+		/* XXX unmap all? */
+		igt_assert(op);
+		break;
+	}
+
+	ret = ___xe_vm_bind(fd, vm, exec_queue, bo, offset, addr, size,
+			    op, flags, sync, num_syncs, prefetch_region,
+			    pat_index, 0, op_ext);
+
+	if (ret)
+		return ret;
+
+	if (!bind_base_flags)
+		return -EINVAL;
+
+	xe_eudebug_client_vm_bind_event(c, DRM_XE_EUDEBUG_EVENT_STATE_CHANGE,
+					fd, vm, bind_flags, 1, &seqno);
+	xe_eudebug_client_vm_bind_op_event(c, bind_base_flags,
+					   seqno, &op_seqno, addr, size,
+					   num_metadata);
+
+	for_each_metadata(metadata, op_ext)
+		xe_eudebug_client_vm_bind_op_metadata_event(c,
+							    DRM_XE_EUDEBUG_EVENT_CREATE,
+							    op_seqno,
+							    metadata->metadata_id,
+							    metadata->cookie);
+	if (ufence)
+		xe_eudebug_client_vm_bind_ufence_event(c, DRM_XE_EUDEBUG_EVENT_CREATE |
+						       DRM_XE_EUDEBUG_EVENT_NEED_ACK,
+						       seqno);
+	return ret;
+}
+
+static void _xe_eudebug_client_vm_bind(struct xe_eudebug_client *c, int fd,
+				       uint32_t vm, uint32_t bo,
+				       uint64_t offset, uint64_t addr, uint64_t size,
+				       uint32_t op,
+				       uint32_t flags,
+				       struct drm_xe_sync *sync,
+				       uint32_t num_syncs,
+				       uint64_t op_ext)
+{
+	const uint32_t exec_queue_id = 0;
+	const uint32_t prefetch_region = 0;
+
+	igt_assert_eq(__xe_eudebug_client_vm_bind(c, fd, vm, exec_queue_id, bo, offset,
+						  addr, size, op, flags,
+						  sync, num_syncs, prefetch_region,
+						  DEFAULT_PAT_INDEX, op_ext),
+		      0);
+}
+
+/**
+ * xe_eudebug_client_vm_bind_flags
+ * @c: pointer to xe_eudebug_client structure
+ * @fd: xe client
+ * @vm: vm handle
+ * @bo: buffer object handle
+ * @offset: offset within buffer object
+ * @addr: ppgtt address
+ * @size: size of the binding
+ * @flags: vm_bind flags
+ * @sync: sync objects
+ * @num_syncs: number of sync objects
+ * @op_ext: BIND_OP extensions
+ *
+ * Calls xe vm_bind ioctl and logs the corresponding event in client's event log.
+ */
+void xe_eudebug_client_vm_bind_flags(struct xe_eudebug_client *c, int fd, uint32_t vm,
+				     uint32_t bo, uint64_t offset,
+				     uint64_t addr, uint64_t size, uint32_t flags,
+				     struct drm_xe_sync *sync, uint32_t num_syncs,
+				     uint64_t op_ext)
+{
+	_xe_eudebug_client_vm_bind(c, fd, vm, bo, offset, addr, size,
+				   DRM_XE_VM_BIND_OP_MAP, flags,
+				   sync, num_syncs, op_ext);
+}
+
+/**
+ * xe_eudebug_client_vm_bind
+ * @c: pointer to xe_eudebug_client structure
+ * @fd: xe client
+ * @vm: vm handle
+ * @bo: buffer object handle
+ * @offset: offset within buffer object
+ * @addr: ppgtt address
+ * @size: size of the binding
+ *
+ * Calls xe vm_bind ioctl and logs the corresponding event in client's event log.
+ */
+void xe_eudebug_client_vm_bind(struct xe_eudebug_client *c, int fd, uint32_t vm,
+			       uint32_t bo, uint64_t offset,
+			       uint64_t addr, uint64_t size)
+{
+	const uint32_t flags = 0;
+	struct drm_xe_sync *sync = NULL;
+	const uint32_t num_syncs = 0;
+	const uint64_t op_ext = 0;
+
+	xe_eudebug_client_vm_bind_flags(c, fd, vm, bo, offset, addr, size,
+					flags,
+					sync, num_syncs, op_ext);
+}
+
+/**
+ * xe_eudebug_client_vm_unbind_flags
+ * @c: pointer to xe_eudebug_client structure
+ * @fd: xe client
+ * @vm: vm handle
+ * @offset: offset
+ * @addr: ppgtt address
+ * @size: size of the binding
+ * @flags: vm_bind flags
+ * @sync: sync objects
+ * @num_syncs: number of sync objects
+ *
+ * Calls xe vm_unbind ioctl and logs the corresponding event in client's event log.
+ */
+void xe_eudebug_client_vm_unbind_flags(struct xe_eudebug_client *c, int fd,
+				       uint32_t vm, uint64_t offset,
+				       uint64_t addr, uint64_t size, uint32_t flags,
+				       struct drm_xe_sync *sync, uint32_t num_syncs)
+{
+	_xe_eudebug_client_vm_bind(c, fd, vm, 0, offset, addr, size,
+				   DRM_XE_VM_BIND_OP_UNMAP, flags,
+				   sync, num_syncs, 0);
+}
+
+/**
+ * xe_eudebug_client_vm_unbind
+ * @c: pointer to xe_eudebug_client structure
+ * @fd: xe client
+ * @vm: vm handle
+ * @offset: offset
+ * @addr: ppgtt address
+ * @size: size of the binding
+ *
+ * Calls xe vm_unbind ioctl and logs the corresponding event in client's event log.
+ */
+void xe_eudebug_client_vm_unbind(struct xe_eudebug_client *c, int fd, uint32_t vm,
+				 uint64_t offset, uint64_t addr, uint64_t size)
+{
+	const uint32_t flags = 0;
+	struct drm_xe_sync *sync = NULL;
+	const uint32_t num_syncs = 0;
+
+	xe_eudebug_client_vm_unbind_flags(c, fd, vm, offset, addr, size,
+					  flags, sync, num_syncs);
+}
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 8dc153d27..1592704ab 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -99,6 +99,18 @@ typedef void (*xe_eudebug_trigger_fn)(struct xe_eudebug_debugger *,
  */
 #define XE_EUDEBUG_DEFAULT_TIMEOUT_MS		25000ULL
 
+#define XE_EUDEBUG_FILTER_EVENT_NONE		BIT(DRM_XE_EUDEBUG_EVENT_NONE)
+#define XE_EUDEBUG_FILTER_EVENT_READ		BIT(DRM_XE_EUDEBUG_EVENT_READ)
+#define XE_EUDEBUG_FILTER_EVENT_OPEN		BIT(DRM_XE_EUDEBUG_EVENT_OPEN)
+#define XE_EUDEBUG_FILTER_EVENT_VM		BIT(DRM_XE_EUDEBUG_EVENT_VM)
+#define XE_EUDEBUG_FILTER_EVENT_EXEC_QUEUE	BIT(DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE)
+#define XE_EUDEBUG_FILTER_EVENT_EU_ATTENTION	BIT(DRM_XE_EUDEBUG_EVENT_EU_ATTENTION)
+#define XE_EUDEBUG_FILTER_EVENT_VM_BIND		BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND)
+#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP	BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_OP)
+#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE  BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE)
+#define XE_EUDEUBG_FILTER_ALL			GENMASK(DRM_XE_EUDEBUG_EVENT_MAX_EVENT, 0)
+#define XE_EUDEBUG_EVENT_IS_FILTERED(_e, _f)	((1UL << _e) & _f)
+
 const char *xe_eudebug_event_to_str(struct drm_xe_eudebug_event *e, char *buf, size_t len);
 struct drm_xe_eudebug_event *
 xe_eudebug_event_log_find_seqno(struct xe_eudebug_event_log *l, uint64_t seqno);
@@ -106,9 +118,10 @@ struct xe_eudebug_event_log *
 xe_eudebug_event_log_create(const char *name, unsigned int max_size);
 void xe_eudebug_event_log_destroy(struct xe_eudebug_event_log *l);
 void xe_eudebug_event_log_print(struct xe_eudebug_event_log *l, bool debug);
-void xe_eudebug_event_log_compare(struct xe_eudebug_event_log *c, struct xe_eudebug_event_log *d);
+void xe_eudebug_event_log_compare(struct xe_eudebug_event_log *c, struct xe_eudebug_event_log *d,
+				  uint32_t filter);
 void xe_eudebug_event_log_write(struct xe_eudebug_event_log *l, struct drm_xe_eudebug_event *e);
-void xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log *l);
+void xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log *l, uint32_t filter);
 
 struct xe_eudebug_debugger *
 xe_eudebug_debugger_create(int xe, uint64_t flags, void *data);
@@ -142,6 +155,32 @@ uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c, int fd
 					     struct drm_xe_exec_queue_create *create);
 void xe_eudebug_client_exec_queue_destroy(struct xe_eudebug_client *c, int fd,
 					  struct drm_xe_exec_queue_create *create);
+void xe_eudebug_client_vm_bind_event(struct xe_eudebug_client *c, uint32_t event_flags, int fd,
+				     uint32_t vm, uint32_t bind_flags,
+				     uint32_t num_ops, uint64_t *ref_seqno);
+void xe_eudebug_client_vm_bind_op_event(struct xe_eudebug_client *c, uint32_t event_flags,
+					uint64_t ref_seqno, uint64_t *op_ref_seqno,
+					uint64_t addr, uint64_t range,
+					uint64_t num_extensions);
+void xe_eudebug_client_vm_bind_op_metadata_event(struct xe_eudebug_client *c,
+						 uint32_t event_flags, uint64_t op_ref_seqno,
+						 uint64_t metadata_handle, uint64_t metadata_cookie);
+void xe_eudebug_client_vm_bind_ufence_event(struct xe_eudebug_client *c, uint32_t event_flags,
+					    uint64_t ref_seqno);
+void xe_eudebug_client_vm_bind_flags(struct xe_eudebug_client *c, int fd, uint32_t vm,
+				     uint32_t bo, uint64_t offset,
+				     uint64_t addr, uint64_t size, uint32_t flags,
+				     struct drm_xe_sync *sync, uint32_t num_syncs,
+				     uint64_t op_ext);
+void xe_eudebug_client_vm_bind(struct xe_eudebug_client *c, int fd, uint32_t vm,
+			       uint32_t bo, uint64_t offset,
+			       uint64_t addr, uint64_t size);
+void xe_eudebug_client_vm_unbind_flags(struct xe_eudebug_client *c, int fd,
+				       uint32_t vm, uint64_t offset,
+				       uint64_t addr, uint64_t size, uint32_t flags,
+				       struct drm_xe_sync *sync, uint32_t num_syncs);
+void xe_eudebug_client_vm_unbind(struct xe_eudebug_client *c, int fd, uint32_t vm,
+				 uint64_t offset, uint64_t addr, uint64_t size);
 
 struct xe_eudebug_session *xe_eudebug_session_create(int fd,
 						     xe_eudebug_client_work_fn work,
@@ -149,4 +188,4 @@ struct xe_eudebug_session *xe_eudebug_session_create(int fd,
 						     void *test_private);
 void xe_eudebug_session_destroy(struct xe_eudebug_session *s);
 void xe_eudebug_session_run(struct xe_eudebug_session *s);
-void xe_eudebug_session_check(struct xe_eudebug_session *s, bool match_opposite);
+void xe_eudebug_session_check(struct xe_eudebug_session *s, bool match_opposite, uint32_t filter);
-- 
2.34.1

