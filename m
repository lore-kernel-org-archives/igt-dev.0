Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B44C3DA7E
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:02:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C71910E42F;
	Mon, 29 Jul 2024 16:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PLQTRzQ0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855B510E42D
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722268970; x=1753804970;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jck68h0V0lgVNT4SSWhvA3rqI/pGHO8U6moNh3PmuEo=;
 b=PLQTRzQ0DvZyLQvLJ+WEfJhqSFA/c9UEafM2VzXUWGgDAB4msDgLD6Ql
 W6Ok5eWWQ78XMLmYPIjCij7tM/BDFZVO9OdgvEirNeICZG3Ppb2Ef+aNQ
 ZJiygQNWgeRte/MK+F2X4OuHjKKxZRfq7vZ1nfArMg57i7M7/EaZepuLy
 tITPxUdg4ptJZqQLiFS6WRDB4N5kCHu+tyI+4/C+UEmVkRSY3GhLnwFVg
 xyucLhU/fRytrZd3Qmp+UREO1wDH1GCgM5HOoDJOZimuRLP4Nk9hzqwCR
 qHmqj4XrqpXkk9FBZ0Tglt2rY2QqwE0FEg3P4azq3u4UDjTXuU7AL/86p A==;
X-CSE-ConnectionGUID: BSqmIIWVRkW8fIG5FyYurw==
X-CSE-MsgGUID: aS8wy8fbT7yOEgA5+Dq0Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31426842"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31426842"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:02:50 -0700
X-CSE-ConnectionGUID: eHE8G4b1RQmiIe29ZAc3fQ==
X-CSE-MsgGUID: WDL3BI0JRVOeXSsIqwHrSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53737352"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:02:44 -0700
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
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH 08/66] lib/xe_eudebug: Add metadata support
Date: Mon, 29 Jul 2024 18:01:01 +0200
Message-Id: <20240729160159.37036-9-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Support metadata events in debugger library by:
 - Adding metadata events to log checking functions.
 - Introducing eudebug vm_bind wrapper which allows to attach debug
   metadata and cookie
 - Implementing xe_eudebug_client_metadata_create|destroy wrappers.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 lib/xe/xe_eudebug.c | 136 ++++++++++++++++++++++++++++++++++++++++++--
 lib/xe/xe_eudebug.h |   6 ++
 2 files changed, 138 insertions(+), 4 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 97f847409..1cea77420 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -69,6 +69,10 @@ static const char *type_to_str(unsigned int type)
 		return "vm_bind_op";
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE:
 		return "vm_bind_ufence";
+	case DRM_XE_EUDEBUG_EVENT_METADATA:
+		return "metadata";
+	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA:
+		return "vm_bind_op_metadata";
 	}
 
 	return "UNKNOWN";
@@ -154,6 +158,20 @@ static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *b)
 		sprintf(b, "vm_bind_ref_seqno=%lld", f->vm_bind_ref_seqno);
 		break;
 	}
+	case DRM_XE_EUDEBUG_EVENT_METADATA: {
+		struct drm_xe_eudebug_event_metadata *em = (void *)e;
+
+		sprintf(b, "client_handle=%llu, metadata_handle=%llu, type=%llu, len=%llu",
+			em->client_handle, em->metadata_handle, em->type, em->len);
+		break;
+	}
+	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA: {
+		struct drm_xe_eudebug_event_vm_bind_op_metadata *op = (void *)e;
+
+		sprintf(b, "vm_bind_op_ref_seqno=%lld, metadata_handle=%llu, metadata_cookie=%llu",
+			op->vm_bind_op_ref_seqno, op->metadata_handle, op->metadata_cookie);
+		break;
+	}
 	default:
 		strcpy(b, "<...>");
 	}
@@ -417,6 +435,16 @@ static int match_fields(struct drm_xe_eudebug_event *a, void *data)
 			ret = 1;
 		break;
 	}
+	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA: {
+		struct drm_xe_eudebug_event_vm_bind_op_metadata *ea = (void *)a;
+		struct drm_xe_eudebug_event_vm_bind_op_metadata *eb = (void *)b;
+
+		if (ea->metadata_handle == eb->metadata_handle &&
+		    ea->metadata_cookie == eb->metadata_cookie)
+			ret = 1;
+		break;
+	}
+
 	default:
 		ret = 1;
 		break;
@@ -483,6 +511,20 @@ static int match_client_handle(struct drm_xe_eudebug_event *e, void *data)
 
 		break;
 	}
+	case DRM_XE_EUDEBUG_EVENT_METADATA: {
+		struct drm_xe_eudebug_event_metadata *em = (struct drm_xe_eudebug_event_metadata *)e;
+
+		if (em->client_handle == h)
+			return 1;
+		break;
+	}
+	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA: {
+		struct drm_xe_eudebug_event_vm_bind_op_metadata *eo = (struct drm_xe_eudebug_event_vm_bind_op_metadata *)e;
+
+		if (eo->vm_bind_op_ref_seqno == *bind_op_seqno)
+			return 1;
+		break;
+	}
 	default:
 		break;
 	}
@@ -547,6 +589,24 @@ static int match_opposite_resource(struct drm_xe_eudebug_event *e, void *data)
 			return 1;
 		break;
 	}
+	case DRM_XE_EUDEBUG_EVENT_METADATA: {
+		struct drm_xe_eudebug_event_metadata *em = (void *)e;
+		struct drm_xe_eudebug_event_metadata *filter = (struct drm_xe_eudebug_event_metadata *)data;
+
+		if (em->metadata_handle == filter->metadata_handle)
+			return 1;
+		break;
+	}
+	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA: {
+		struct drm_xe_eudebug_event_vm_bind_op_metadata *avmb = (void *)e;
+		struct drm_xe_eudebug_event_vm_bind_op_metadata *filter = (struct drm_xe_eudebug_event_vm_bind_op_metadata *)data;
+
+		if (avmb->metadata_handle == filter->metadata_handle &&
+		    avmb->metadata_cookie == filter->metadata_cookie)
+			return 1;
+		break;
+	}
+
 	default:
 		break;
 	}
@@ -883,8 +943,9 @@ xe_eudebug_event_log_match_opposite(struct xe_eudebug_event_log *l, uint32_t fil
 				continue;
 
 			/* No opposite matching for binds */
-			if (ce->type >= DRM_XE_EUDEBUG_EVENT_VM_BIND &&
-			    ce->type <= DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE)
+			if ((ce->type >= DRM_XE_EUDEBUG_EVENT_VM_BIND &&
+			     ce->type <= DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE) ||
+			    ce->type == DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA)
 				continue;
 
 			de = opposite_event_match(l, ce, ce);
@@ -1480,6 +1541,22 @@ static void exec_queue_event(struct xe_eudebug_client *c, uint32_t flags,
 	xe_eudebug_event_log_write(c->log, (void *)&ee);
 }
 
+static void metadata_event(struct xe_eudebug_client *c, uint32_t flags,
+			   int client_fd, uint32_t id, uint64_t type, uint64_t len)
+{
+	struct drm_xe_eudebug_event_metadata em;
+
+	base_event(c, to_base(em), DRM_XE_EUDEBUG_EVENT_METADATA,
+		   flags, sizeof(em));
+
+	em.client_handle = client_fd;
+	em.metadata_handle = id;
+	em.type = type;
+	em.len = len;
+
+	xe_eudebug_event_log_write(c->log, (void *)&em);
+}
+
 /* Eu debugger wrappers around resource creating xe ioctls. */
 
 /**
@@ -1522,8 +1599,8 @@ void xe_eudebug_client_close_driver(struct xe_eudebug_client *c, int fd)
  * @flags: vm bind flags
  * @ext: pointer to the first user extension
  *
- * Calls xe_vm_create() and logs the corresponding event in
- * client's event log.
+ * Calls xe_vm_create() and logs corresponding events
+ * (including vm set metadata events) in client's event log.
  *
  * Returns: valid vm handle
  */
@@ -1903,3 +1980,54 @@ void xe_eudebug_client_vm_unbind(struct xe_eudebug_client *c, int fd, uint32_t v
 	xe_eudebug_client_vm_unbind_flags(c, fd, vm, offset, addr, size,
 					  flags, sync, num_syncs);
 }
+
+/**
+ * xe_eudebug_client_metadata_create:
+ * @c: pointer to xe_eudebug_client structure
+ * @fd: xe client
+ * @type: debug metadata type
+ * @len: size of @data
+ * @data: debug metadata paylad
+ *
+ * Calls xe metadata create ioctl and logs the corresponding event in
+ * client's event log.
+ *
+ * Return: valid debug metadata id.
+ */
+uint32_t xe_eudebug_client_metadata_create(struct xe_eudebug_client *c, int fd,
+					   int type, size_t len, void *data)
+{
+	struct drm_xe_debug_metadata_create create = {
+		.type = type,
+		.user_addr = to_user_pointer(data),
+		.len = len
+	};
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEBUG_METADATA_CREATE, &create), 0);
+
+	metadata_event(c, DRM_XE_EUDEBUG_EVENT_CREATE, fd, create.metadata_id, type, len);
+
+	return create.metadata_id;
+}
+
+/**
+ * xe_eudebug_client_metadata_destroy:
+ * @c: pointer to xe_eudebug_client structure
+ * @fd: xe client
+ * @id: xe debug metadata handle
+ * @type: debug metadata type
+ * @len: size of debug metadata payload
+ *
+ * Calls xe metadata destroy ioctl and logs the corresponding event in
+ * client's event log.
+ */
+void xe_eudebug_client_metadata_destroy(struct xe_eudebug_client *c, int fd,
+					uint32_t id, int type, size_t len)
+{
+	struct drm_xe_debug_metadata_destroy destroy = { .metadata_id = id };
+
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEBUG_METADATA_DESTROY, &destroy), 0);
+
+	metadata_event(c, DRM_XE_EUDEBUG_EVENT_DESTROY, fd, id, type, len);
+}
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 1592704ab..24336981f 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -167,6 +167,7 @@ void xe_eudebug_client_vm_bind_op_metadata_event(struct xe_eudebug_client *c,
 						 uint64_t metadata_handle, uint64_t metadata_cookie);
 void xe_eudebug_client_vm_bind_ufence_event(struct xe_eudebug_client *c, uint32_t event_flags,
 					    uint64_t ref_seqno);
+
 void xe_eudebug_client_vm_bind_flags(struct xe_eudebug_client *c, int fd, uint32_t vm,
 				     uint32_t bo, uint64_t offset,
 				     uint64_t addr, uint64_t size, uint32_t flags,
@@ -182,6 +183,11 @@ void xe_eudebug_client_vm_unbind_flags(struct xe_eudebug_client *c, int fd,
 void xe_eudebug_client_vm_unbind(struct xe_eudebug_client *c, int fd, uint32_t vm,
 				 uint64_t offset, uint64_t addr, uint64_t size);
 
+uint32_t xe_eudebug_client_metadata_create(struct xe_eudebug_client *c, int fd,
+					   int type, size_t len, void *data);
+void xe_eudebug_client_metadata_destroy(struct xe_eudebug_client *c, int fd,
+					uint32_t id, int type, size_t len);
+
 struct xe_eudebug_session *xe_eudebug_session_create(int fd,
 						     xe_eudebug_client_work_fn work,
 						     unsigned int flags,
-- 
2.34.1

